#include <iostream>

using namespace std;

int **nnlist(int L, int ndim, int ncoord, int vol){
  
  int i,imod;

  int**  nn = new int*[vol];
  for(i=0 ; i < vol ; i++) nn[i] = new int[ncoord];

  if(ndim == 2 ){
    
    if(ncoord == 4){
      
      for(i=0; i< vol; i++){

	nn[i][0] = (i+1) % L == 0 ? i-L+1 : i+1;
	nn[i][1] = (i < L) ? (vol-L)+i : i-L;
	nn[i][2] = ((i % L) == 0 || i == 0) ? i+L-1 : i-1;
	nn[i][3] = (i >= (vol-L)) ? i-(vol-L) : i+L;
      }

    }else if(ncoord == 6 ){
      
      for(i=0; i<vol; i++){

	nn[i][0]=i+1;
	nn[i][1]=i-L+1;
	nn[i][2]=i-L;
	nn[i][3]=i-1;
	nn[i][4]=i+L-1;
	nn[i][5]=i+L;
	
	if( nn[i][1] <  0  )  nn[i][1]=nn[i][1] + vol;
	if( nn[i][2] <  0  )  nn[i][2]=nn[i][2] + vol;
	if( nn[i][4] >= vol ) nn[i][4]=nn[i][4] - vol;
	if( nn[i][5] >= vol ) nn[i][5]=nn[i][5] - vol; 
	
	imod=(i+1) % L;
	if(imod == 0){
	  nn[i][0]=nn[i][0]-L;
	  nn[i][1]=nn[i][1]-L;
	  if(i == L-1)nn[i][1]=nn[i][1]+vol;
	}
	if(i % L == 0){
	  nn[i][3]=i+L-1;
	  nn[i][4]=nn[i][4]+L;
	  if(i >= vol -L)nn[i][4]=nn[i][4]-vol;
	}
	
      }
      
      
    }
  }
  return nn;
}
