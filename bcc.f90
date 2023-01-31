SUBROUTINE BCC(l,Ncoord,nni,nnj,nnk)

  IMPLICIT NONE

  INTEGER::i,j,k,s,ii,jj,kk
  INTEGER,INTENT(IN)::l,Ncoord
  INTEGER,DIMENSION(l,l,l,Ncoord),INTENT(OUT)::nni,nnj,nnk


  DO i=1,l
     DO j=1,l
        DO k=1,l
           DO s=1,Ncoord                                              !(1)

              IF(MOD(k,2).EQ.0)THEN                                   !(2*)

                 IF(s.EQ.1)THEN
                    ii=i+1
                    IF(i.EQ.l)ii=1
                    jj=j
                    kk=k-1

                 ELSE IF(s.EQ.2)THEN
                    ii=i+1
                    IF(i.EQ.l)ii=1
                    jj=j+1
                    IF(j.EQ.l)jj=1
                    kk=k-1

                 ELSE IF(s.EQ.3)THEN
                    ii=i
                    jj=j+1
                    IF(j.EQ.l)jj=1
                    kk=k-1

                 ELSE IF(s.EQ.4)THEN
                    ii=i
                    jj=j
                    kk=k-1

                 ELSE IF(s.EQ.5)THEN
                    ii=i+1
                    IF(i.EQ.l)ii=1
                    jj=j
                    kk=k+1
                    IF(k.EQ.l)kk=1

                 ELSE IF(s.EQ.6)THEN
                    ii=i+1
                    IF(i.EQ.l)ii=1
                    jj=j+1
                    IF(j.EQ.l)jj=1
                    kk=k+1
                    IF(k.EQ.l)kk=1

                 ELSE IF(s.EQ.7)THEN
                    ii=i
                    jj=j+1
                    IF(j.EQ.l)jj=1
                    kk=k+1
                    IF(k.EQ.l)kk=1

                 ELSE IF(s.EQ.8)THEN
                    ii=i
                    jj=j
                    kk=k+1
                    IF(k.EQ.l)kk=1
                 END IF
              ELSE
                 IF(s.EQ.1)THEN
                    ii=i
                    jj=j-1
                    IF(j.EQ.1)jj=l
                    kk=k-1
                    IF(k.EQ.1)kk=l

                 ELSE IF(s.EQ.2)THEN
                    ii=i
                    jj=j
                    kk=k-1
                    IF(k.EQ.1)kk=l

                 ELSE IF(s.EQ.3)THEN
                    ii=i-1
                    IF(i.EQ.1)ii=l
                    jj=j
                    kk=k-1
                    IF(k.EQ.1)kk=l

                 ELSE IF(s.EQ.4)THEN
                    ii=i-1
                    IF(i.EQ.1)ii=l
                    jj=j-1
                    IF(j.EQ.1)jj=l
                    kk=k-1
                    IF(k.EQ.1)kk=l

                 ELSE IF(s.EQ.5)THEN
                    ii=i
                    jj=j-1
                    IF(j.EQ.1)jj=l
                    kk=k+1

                 ELSE IF(s.EQ.6)THEN
                    ii=i
                    jj=j
                    kk=k+1

                 ELSE IF(s.EQ.7)THEN
                    ii=i-1
                    IF(i.EQ.1)ii=l
                    jj=j
                    kk=k+1

                 ELSE IF(s.EQ.8)THEN
                    ii=i-1
                    IF(i.EQ.1)ii=l
                    jj=j-1
                    IF(j.EQ.1)jj=l
                    kk=k+1

                 END IF
              END IF

              nni(i,j,k,s)=ii
              nnj(i,j,k,s)=jj
              nnk(i,j,k,s)=kk
           END DO

        END DO
     END DO
  END DO

END SUBROUTINE BCC
