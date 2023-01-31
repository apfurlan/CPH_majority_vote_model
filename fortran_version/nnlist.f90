subroutine nnlist(l,ndim,vol,ncoord,nn)

  implicit none

  integer,intent(in)::l,ndim,vol,ncoord
  integer,intent(out),dimension(ncoord,vol)::nn

  integer::i,lm1
  integer::imod

  if(ncoord == 4 .and. ndim == 2)then

     do i=1,vol
        
        nn(1,i)=i+1 !1
        if(mod(i,L) == 0) nn(1,i)=i-L+1
        nn(2,i)=i+L !3
        if(nn(2,i)>vol) nn(2,i)=i-vol+L
        nn(3,i)=i-1 
        if(i == 1 .or. mod(i,L)==1)nn(3,i)=i+(L-1)
        nn(4,i)=i-L !4
        if(i <= L)nn(4,i)=i+vol-L
        
     end do


  else if(ncoord == 6 .and. ndim == 2)then
    
     do i=1,vol
        nn(1,I)=i+1
        nn(2,I)=i+LM1
        nn(3,I)=i+L
        nn(4,I)=i-1
        nn(5,I)=i-LM1
        nn(6,I)=i-L
        
        imod=mod(i,L)   
        if(nn(3,I) > vol)  nn(3,i)=nn(3,i)-vol
        if(nn(2,I) > vol)  nn(2,i)=nn(2,i)-vol
        if(nn(5,I) < 0)   nn(5,i)=nn(5,i)+vol
        if(nn(6,I) < 1)   nn(6,i)=nn(6,i)+vol
        
        if(imod == 1)  then
           nn(4,I)=i+L-1
           nn(5,I)=i-1
        end if


        if(imod == 0) then
           nn(2,I)=I+1
           nn(1,I)=I-L+1
        end if
        
        if(i == 1)  nn(5,i)=vol
        if(i == vol) nn(2,i)=1
        
     end do
     
  end if

end subroutine nnlist
