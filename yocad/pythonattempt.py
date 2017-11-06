#This is an attempt at getting the last few points
def fun(x1,y1,x4,y4,m):
    y2p = ((((((m)**2)+1)*((x1-x4)**2))**0.5)+(x1)+(y1*m)-(x4))/(m)
    y2m = (-(((((m)**2)+1)*((x1-x4)**2))**0.5)+(x1)+(y1*m)-(x4))/(m)
    print("plus  ",y2p,"  minus  ",y2m)
