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

np.random.seed(1)

env = simpy.Environment()

c = Car(env,mean=72,std=10)

env.process(c.run())

env.run(until=15)
