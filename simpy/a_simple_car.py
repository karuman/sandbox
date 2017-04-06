#

import simpy

import numpy as np

env = simpy.Environment()

def car(env):
    # 72km/h  = 20m/sec
    velocity =  72 * 1000 / 3600
    # current location
    location =0.0
    
    #
    while True:
        print('cur time {0:2d} pos:{1}m'.format(env.now,location))
        location += velocity
        yield env.timeout(1)

#instance a car
car(env)


env.process(car(env))

env.run(until=15)
