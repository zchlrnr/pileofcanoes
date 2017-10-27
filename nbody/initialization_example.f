      program initialization_example
        implicit none
        double precision planet1(7), sun_m
        double precision G, tf
        double precision m1, m2, r, f(4)
        open(10,file='output.out')
        open(11,file='forplot.out')
        G = 6.67408E-11
        tf = 3E+7
        planet1(1) = 3.285E+23 !mass in kilograms
        planet1(2) = 2.7E+15 !x position coordinate (helio)
        planet1(3) = 5.78944E+10 !y position coordinate (helio)
        planet1(4) = 0 !z position coordinate (helio)
        planet1(5) = 0 !x velocity @ ti
        planet1(6) = 0 !y velocity @ ti
        planet1(7) = 0 !z velocity @ ti
        sun_m = 1.989E+30 !mass in kilograms
        m2 = planet1(1)
        m1 = sun_m
        call time(m1,m2,tf,planet1)
      end

      subroutine  grav(m1,m2,r,f,planet1)
        double precision G, m1, m2, r, f(4), planet1(7)
        parameter(G = 6.67408E-11)
        f(1) = G*(m1*m2)/(r**2)
      end subroutine
            
      subroutine time(m1,m2,tf,planet1)
C-----"it is assumed that ti is zero"-----C
        integer steps
        double precision ti, tf, planet1(7)
        parameter(steps = 1E+5)
        double precision  m1, m2, r, f(4), v(3), dv(3)
        double precision xn, yn, zn, dt
        double precision m(7,steps), t
        dt = tf/steps
        dv(1) = 0
        dv(2) = 0
        dv(3) = 0
        v(1) = planet1(5)
        v(2) = planet1(6)
        v(3) = planet1(7)
        f(1) = 0 
        f(2) = 0
        f(3) = 0
        f(4) = 0
        t = 0
        do 10 i = 1,steps
          r = ((planet1(2)**2)+(planet1(3)**2)+(planet1(4)**2))**0.5
          xn = planet1(2)/r
          yn = planet1(3)/r
          zn = planet1(4)/r
          call grav(m1,m2,r,f,planet1)
          f(2) = f(1)*xn
          f(3) = f(1)*yn
          f(4) = f(1)*zn
          dv(1) = (f(2)/m2)*dt
          dv(2) = (f(3)/m2)*dt
          dv(3) = (f(4)/m2)*dt 
          planet1(5) = planet1(5) + dv(1)
          planet1(6) = planet1(6) + dv(2)
          planet1(7) = planet1(7) + dv(3)
          planet1(2) = planet1(2) + planet1(5)*dt
          planet1(3) = planet1(3) + planet1(6)*dt
          planet1(4) = planet1(4) + planet1(7)*dt
          m(1,i) = t
          t = t + dt
          print*,planet1(5)
10      continue
      end subroutine
