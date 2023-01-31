SUBROUTINE INIT(L,s,Ndim,Nstate,inist)

  IMPLICIT NONE

  INTEGER::i,j,k,seed,ri,rj,rk,state
  INTEGER,INTENT(IN)::L,Ndim,Nstate
  INTEGER,DIMENSION(L,L,L),INTENT(INOUT)::s

  CHARACTER(len=4),INTENT(IN)::inist

  DOUBLE PRECISION,EXTERNAL::RAN2

!  INTEGER::ri,rj,rk,oldsig,oldstat,kk,seed,st,NMeOH,i
!  INTEGER,INTENT(IN)::l,Nstate,Ncoord
!  INTEGER,DIMENSION(l,l,l),INTENT(INOUT)::sigma,stat
!  INTEGER,DIMENSION(Nstate,Ncoord),INTENT(IN)::tau
!  INTEGER,DIMENSION(l,l,l,Ncoord),INTENT(IN)::nni,nnj,nnk

!  DOUBLE PRECISION,EXTERNAL::ran2
  seed=908988987

  IF(inist.EQ.'full')THEN

     s(:,:,:)=1

  ELSE IF(inist.EQ.'empt')THEN

     s(:,:,:)=0

  ELSE IF(inist.EQ.'rand')THEN

     DO i=1,L
        do j=1,L
           do k=1,L
              if(RAN2(seed) < .5)then
                 s(i,j,k)=1
              else
                 s(i,j,k)=-1   
              end if
           end do
        end do
     end do
     
  END IF
END SUBROUTINE INIT
