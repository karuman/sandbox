#

import simpy

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

class Car(object):
    step = 5

    def __init__(self,env,mean,std):
        self.env = env

        self.mean = mean

        self.std =std

        self.velocity = 0.0
        self.location = 0.0
        self.prev_location = 0.0

    def update_velocity(self):
        v = np.random.normal(self.mean,self.std)
        if v < 0:
            v =0
        return v

    def update_location(self):
        self.prev_location=self.location
        self.location += self.velocity * 1000 / 3600
        return self.location

    def run(self):
        while True:
            if env.now % self.step == 0:
                self.velocity = self.update_velocity()

            form ='Time {0:2d} pos:{1:.1f} m Vel {2:.1f} km'
            print(form.format(self.env.now,self.location,self.velocity))
            self.update_location()
            yield self.env.timeout(1)



class Car2(Car):
    def __init__(self,env,number,mean,std,fdist=20,ahead=None):
        super(Car2,self).__init__(env,mean,std)
        self.number = number
        self.ahead = ahead
        self.location = -number * fdist

    def run(self):
        while True:
            if env.now % self.step == 0:
                self.velocity = self.update_velocity()
            form ='Time {0:2d} Num {1} pos:{2:.1f} m Vel {3:.1f} km'
            message =form.format(self.env.now,self.number,self.location,self.velocity)
            self.update_location()

            if self.ahead is not None:
               if self.location > self.ahead.location -1:
                   self.location = self.ahead.location -1
                   message += ' *'
            print(message)

            yield self.env.timeout(1)
        
    @property
    def actual_velocity(self):
        v = (self.location -self.prev_location) * 3600 /1000
        return v

def init_env(env,num_cars=5,mean=72,std=10,fdist=20):
    cars =[]
    prev = None

    for i in range(num_cars):
        c =Car2(env,number=i,mean=mean,std=std,fdist=fdist,ahead=prev)
        env.process(c.run())
        prev =c
        cars.append(c)
    return env,cars

        
np.random.seed(1)

env = simpy.Environment()

env,cars1 = init_env(env,num_cars=5,fdist=20)

env,cars2 = init_env(env,num_cars=5,fdist=60)

fig, (ax1, ax2) = plt.subplots(2,1,figsize=(7,4))
ax1.set_ylim(0,80)
ax2.set_xlim(-1000,2000)
ax2.xaxis.set_visible(False)
ax2.yaxis.set_visible(False)

objs = []

velocities1 = []
velocities2 = []

for i in range(200 *40):
    if i % 40 ==0:
        velocities1.append(np.mean([c.actual_velocity for c in cars1]))
        velocities2.append(np.mean([c.actual_velocity for c in cars2]))

        l1 = ax1.plot(range(len(velocities1)),velocities1,color='#c92b2b')
        l2 = ax1.plot(range(len(velocities2)),velocities2,color='#005ec4')

        pt1 = ax2.scatter([c.location for c in cars1],[2] * len(cars1),color='#c92b2b')
        pt2 = ax2.scatter([c.location for c in cars2],[1] * len(cars2),color='#005ec4')
        objs.append(tuple(l1)+tuple(l2)+(pt1,pt2))
    env.step()

ax1.legend([l1[0],l2[0]],['dist20','dist60'],loc=4)

ani = animation.ArtistAnimation(fig,objs,interval=1,repeat=True)
plt.show()
