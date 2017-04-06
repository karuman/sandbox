#

import simpy

import numpy as np

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

env,c = init_env(env,num_cars=5,std=50)

env.run(until=200)
