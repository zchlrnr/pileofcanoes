      program test01
      implicit none
      integer len, i, j, k, l, m, n, largenum, counter
      parameter(len = 100)
      parameter(largenum = 1E+6)
      real a(len,2)
      counter = 0
      open(10,file='bx.txt')
      open(11,file='by.txt')
      do 10 i = 1, largenum
        read(10,*,end=11)
        counter = counter + 1
10    continue
11    continue
      print*,counter
C-----"BEARING SEAT (DIMS IN MM)"-------------------------------------C
C-----"THESE COORDINATE PAIRS ARE IN ORDER"---------------------------C

      end
