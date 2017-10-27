      program getflength
C-----"THIS PROGRAM CAN READ THE LENGTH OF A FILE OF UNKNOWN LENGTH"--C
        implicit none
        integer i, j, k, arbitrarilylargenumber, counter
        open(10, file='samplefile.txt')
        arbitrarilylargenumber = 1E+7 !longest possible file
        counter = 0
        do 10 i = 1,arbitrarilylargenumber 
          read(10,*,end=11)
          counter = counter+1
10      continue
11      continue
        print*,"The number of rows in the file is ", counter
      end
