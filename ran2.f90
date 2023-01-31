FUNCTION RAN2(idum)

  IMPLICIT NONE
  INTEGER, PARAMETER :: im1=2147483563,im2=2147483399,imm1=im1-1,&
       ia1=40014,ia2=40692,iq1=53668,iq2=52774,ir1=12211,&
       ir2=3791,ntab=32,ndiv=1+imm1/ntab
  DOUBLE PRECISION , PARAMETER ::   am=1.d0/im1,eps=1.d-14,rnmx=1.d0-eps
  DOUBLE PRECISION :: ran2
  INTEGER, DIMENSION(ntab) :: iv
  INTEGER :: idum,idum2,j,k,iy

  save iv,iy,idum2
  data idum2/123456789/,iv /ntab*0/,iy /0/

  if(idum.le.0) then
     idum=max(-idum,1)
     idum2=idum
     do j=ntab+8,1,-1
        k=idum/iq1
        idum=ia1*(idum-k*iq1)-ir1*k
        if(idum.lt.0) idum=idum+im1
        if(j.le.ntab) iv(j)=idum
     end do
     iy=iv(1)
  endif

  k=idum/iq1
  idum=ia1*(idum-k*iq1)-ir1*k
  if(idum.lt.0) idum=idum+im1
  k=idum2/iq2
  idum2=ia2*(idum2-k*iq2)-ir2*k

  if(idum2.lt.0) idum2=idum2+im2

  j=1+iy/ndiv
  iy=iv(j)-idum2
  iv(j)=idum
  if (iy.lt.1)iy=iy+imm1
  ran2=min(am*iy,rnmx)

END FUNCTION RAN2
