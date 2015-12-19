===========
Description
===========

Colomb's Law describes the repulsion force for two electrically charged particles.
In very general terms, 
it describes the rate at which particles move away from each-other based on each particle's mass
and distance from one another.

Your goal is to compute the repulsion force for two electrons in 2D space. 
Assume that the two particles have the same mass and charge.
The function that computes force is as follows:

Force = (Particle 1's mass x Particle 2's mass) / Distance^2


========
Solution
========

import math

class Particle():

    def __init__ (self,mass,x,y):
        self.mass = mass
        self.x = x
        self.y = y

    def find_repulsion (self,particle_mass,particle_x,particle_y):

        delta_x = self.x - particle_x
        delta_y = self.y - particle_y
        distance = math.sqrt(delta_x**2 + delta_y**2)
        force = (self.mass*particle_mass) / distance**2

        return force
