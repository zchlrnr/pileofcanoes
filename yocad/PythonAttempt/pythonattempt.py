#Perhaps a good way to do this is to use nump and scipy
#First, construct the coordinate pairs of the bearing seat
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.path import Path
import matplotlib.patches as patches
from scipy.special import binom
Bdata = np.loadtxt('BearingSeatCoords_C.txt')
Sdata = np.genfromtxt('specs.txt', usecols = 0, delimiter = ',', dtype = None)
Pdata = np.loadtxt('profile.txt',delimiter = ',')
l = len(Bdata) + len(Pdata)
counter = 0
x1=[]
y1=[]
x2=[]
y2=[]
x3=[]
y3=[]

for i in range(0,len(Bdata)):
    x1=np.append(x1,Bdata[i,0])
    y1=np.append(y1,Bdata[i,1])
for i in range(0,len(Pdata)):
    x2=np.append(x2,Pdata[i,0])
    y2=np.append(y2,Pdata[i,1])
#-----THIS IS THE IMPLEMENTATION OF THE BEZIER CURVE SUBROUTINE-------#
def Bernstein(n, k):
    #Bernstein polynomial.
    coeff = binom(n, k)
    def _bpoly(x):
        return coeff * x ** k * (1 - x) ** (n - k)
    return _bpoly
def Bezier(points, num=200):
    #Build Bézier curve from points.
    N = len(points)
    t = np.linspace(0, 1, num=num)
    curve = np.zeros((num, 2))
    for ii in range(N):
        curve += np.outer(Bernstein(N - 1, ii)(t), points[ii])
    return curve
#-----END BEZIER SUBROUTINE-------------------------------------------#
x, y = Bezier(list(zip(x2,y2))).T
plt.plot(x,y)
plt.axis('equal')
plt.plot(x2,y2,"ro")
plt.plot(x2,y2,"b--")
plt.show()
