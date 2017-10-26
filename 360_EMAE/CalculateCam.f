      program calculatecam
      integer itsteps
      real pi, rootradius, lm
      real tbo, tfo, tbc, tfc
      real r, t, counter
      real A(2800), B(2800), tempa, tempb
      parameter(itsteps=700)
      parameter(pi = 3.1415926535)
      parameter(rootradius=1) !IN INCHES
      parameter(lm=0.75) !IN INCHES
      open(12,file='intcams.out')      
      open(15,file='sorted.out')
C-----"splitting up domains of 360 degrees of cam angle"--------------C
C     "Valve Begins Opening (tbo)"
      tbo = 350 * (pi / 180)
C     "Valve Is Fully Opened (tfo)"
      tfo = tbo + 30*(pi / 180)
C     "Valve Begins To Close (tbc)"
      tbc = 110 * (pi / 180)
C     "Valve Is Fully Closed (tfc)"
      tfc = tbc + 30*(pi/180) 
C-----"(1) Dwell at Valve Closed"---C
      counter = 0.0
      do 10 i = 1,itsteps
C     "range is from tfc to tbo"
        t = tfc + (tbo-tfc)*(counter/itsteps)
        r = rootradius
        counter = counter + 1
        write(12,*) t," ",r
        a(i) = r
        b(i) = t
10    continue
C-----"(2) Valve Opening"---C
      counter = 0.0
      do 11 i = 1,itsteps
C     "range is from tbo to tfo"
        t = tbo + (tfo-tbo)*(counter/itsteps)
        r = rootradius+lm*s(counter/itsteps)
        counter = counter + 1
        write(12,*)t," ",r
        a(itsteps+i) = r
        b(itsteps+i) = t
11    continue
C-----"(3) Dwell at Valve Opened "---C
      counter = 0.0
      do 12 i = 1,itsteps
C     "range is from tfo to tbc"
        t = tfo + ((tbc + 2*pi)-tfo)*(counter/itsteps)
        if(t.gt.(2*pi)) then
          t = t - (2*pi)
        endif
        r = rootradius + lm
        counter = counter + 1
        write(12,*)t," ",r
        a(2*itsteps+i) = r
        b(2*itsteps+i) = t
12    continue
C-----"(4) Valve Closing"---C
      counter = 0.0
      do 13 i = 1,itsteps
C     "range is from tbc to tfc"
        t = tbc + (tfc-tbc)*(counter/itsteps)
        r = rootradius+lm*s(1-counter/itsteps)
        counter = counter + 1
        write(12,*)t," ",r
        a(3*itsteps+i) = r
        b(3*itsteps+i) = t
13    continue
      do 14 k = 1,4*itsteps-1
        do 15 l = K+1,4*itsteps
          if (b(k).gt.b(L)) then
            tempa = a(k)
            tempb = b(k)
            a(k) = a(L)
            b(k) = b(L)
            a(L) = tempa
            b(L) = tempb
          endif
15      continue
14    continue
      do 16 i = 1,4*itsteps
        write(15,*)b(i)," ",a(i)
16    continue

      end

      function s(x)
        real s, x
        s = (10*(x**3))-(15*(x**4))+(6*(x**5)) 
        return
      end function
