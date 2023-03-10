program vote_model

  implicit none

  integer::ncoord,L,vol,mcterm,mcsteps,ndim,nnsum,k

  integer::idum,mc,mctotal,count,j,i,sx,ivol,nn
 
  integer,dimension(:,:,:),allocatable::s
  INTEGER,DIMENSION(:,:,:,:),ALLOCATABLE::nni,nnj,nnk
  
  double precision,dimension(:),allocatable::mag

  double precision::avgmag,wx,ran,gamma,p,dgamma,ff,avgM,avgM2,avgM4

  double precision,external::ran2

  CHARACTER(len=50)::fmt,fmt2,filename,x1,x3

  read(*,*)L

  ncoord=8 ; mcterm=5000 ; mcsteps=100
  ndim=3 ; vol=L**ndim ; dgamma=0.005

  mctotal=mcterm+mcsteps
  idum=908988987

  allocate(s(L,L,L),nni(L,L,L,ncoord),nnj(L,L,L,ncoord), & 
       nnk(L,L,L,ncoord),mag(mcsteps))
  
  call  bcc(L,Ncoord,nni,nnj,nnk)
  call nnlist(L,ndim,vol,Ncoord,nn)
  
  fmt='(f5.3)'
  fmt2='(i2)'
  write(x3,fmt2)l
  x1=adjustl(x1)
  x3=adjustl(x3)

  filename ='outvars_L_'//trim(x3)//'.dat'
  open(unit=1,file=filename,action='write')
  write(1,'(a6,2x,5(a5,6x))')'#count','prob','mag','susce','binder'
  write(1,'(a55)')'#-------------------------------------------------&
       &-------------------------------------------------------------------&
       &-------'
  
  s(:,:,:)=1 ; p=0


  do while(p <= .2)

     ff=1-2.*p
     avgM=0. 
     avgM2=0. 
     avgM4=0.

     do mc=1,mctotal
       
        do ivol=1,vol

           i=INT(ran2(idum)*L)+1 
           j=INT(ran2(idum)*L)+1 
           k=INT(ran2(idum)*L)+1 

           nnsum=0
           do nn=1,ncoord
              nnsum=nnsum+s(nni(i,j,k,nn),nnj(i,j,k,nn),nnk(i,j,k,nn))
           end do
           sx=sign(1,nnsum)
           if(nnsum==0)sx=0
           
           wx=0.5*(1.-ff*dble(s(i,j,k))*dble(sx))
              
           if(wx >= ran2(idum) )s(i,j,k)=-s(i,j,k)
           
           end do
 
           if(mc > mcterm)then
           
              avgM=avgM+abs(dble(sum(s))/dble(vol))
              avgM2=avgM2+abs(dble(sum(s))/dble(vol))*abs(dble(sum(s))/dble(vol))
              avgM4=avgM4+abs(dble(sum(s))/dble(vol))*abs(dble(sum(s))/dble(vol))* & 
                   abs(dble(sum(s))/dble(vol))*abs(dble(sum(s))/dble(vol))

           end if
           
        end do

        avgM=avgM/dble(mcsteps)
        avgM2=avgM2/dble(mcsteps)
        avgM4=avgM4/dble(mcsteps)

     write(*,'(2(f10.5,1X))')p,avgM
     write(1,'(i3,1x,4(g18.8,1X))')count,p,avgM,(avgM2-avgM*avgM),1.-avgM4/(3*(avgM2*avgM2))
     
     p=p+dgamma
     count=count+1
  END DO

  CLOSE(1)
end program vote_model


