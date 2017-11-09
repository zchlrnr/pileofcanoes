#Perhaps a good way to do this is to use nump and scipy
#First, construct the coordinate pairs of the bearing seat
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.path import Path
import matplotlib.patches as patches
Bdata = np.loadtxt('BearingSeatCoords_C.txt')
Sdata = np.genfromtxt('specs.txt', usecols = 0, delimiter = ',', dtype = None)

#plt.plot(x1,y1)
#plt.axis('equal')
#plt.show()
