FUNCTION ENERGY(l,WTstat,Nstate,Ncoord,i,j,k,s,tau,&
     instat,nni,nnj,nnk)

  IMPLICIT NONE

  INTEGER::in,jn,kn,nst,nn,prodtau
  INTEGER,INTENT(IN)::l,WTstat,Nstate,Ncoord,i,j,k,instat

  INTEGER,DIMENSION(0:Nstate,Ncoord),INTENT(IN)::tau
  INTEGER,DIMENSION(l,l,l),INTENT(IN)::s
  INTEGER,DIMENSION(l,l,l,Ncoord),INTENT(IN)::nni,nnj,nnk
  INTEGER,EXTERNAL::F

  DOUBLE PRECISION::energy
  DOUBLE PRECISION,PARAMETER::epsilon=1.00,lambdaM=0.25,lambdaW=-0.25

  energy=0.d0
  DO nn=1,Ncoord
     in=nni(i,j,k,nn)
     jn=nnj(i,j,k,nn)
     kn=nnk(i,j,k,nn)

     nst=s(in,jn,kn)
     prodtau=tau(instat,nn)*tau(nst,F(nn))

     IF(instat*nst.NE.0)THEN
        IF(prodtau.EQ.-1) energy=energy-epsilon

        IF(prodtau.EQ.1.OR.  &
             prodtau.EQ.0.OR.&
             prodtau.EQ.2.OR.&
             prodtau.EQ.4) energy=energy+epsilon

        IF(prodtau.EQ.-2)THEN
           IF(tau(instat,nn).EQ.-1.AND.instat.LE.Wtstat)THEN
              energy=energy-lambdaW*epsilon
           ELSE IF(tau(instat,nn).EQ.-1.AND.instat.GT.Wtstat)THEN
              energy=energy-lambdaM*epsilon
           ELSE IF(tau(instat,nn).EQ.2)THEN
              energy=energy-lambdaW*epsilon
           END IF
        END IF

     END IF

  END DO

END FUNCTION ENERGY
