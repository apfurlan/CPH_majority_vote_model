#include <iostream>
#include <cstdio>
#include <sstream>
#include <cstdlib>
#include <cmath>
#include <time.h>
#include <algorithm>
#include <numeric>
#include <string>

// Headers

#include "nnlist.hpp"
#include "ran2.hpp"
#include "mt.hpp"

using namespace std;

int main(int argc, char *argv[] ){
  
  unsigned int count=0   ; // counter for probabilites
  double wx   ;          // Majority-vote probability

  // Output file
  char fname[50];
  FILE * out_file;
  
  // Classes - Mersenne Twister random number
  MersenneTwister mt; // Random number class
                                   
  
  unsigned int L=atoi(argv[1]);
  
  unsigned int ndim=2;
  unsigned int ncoord=6;
  unsigned int vol=(unsigned int)pow((double)L,(int)ndim);
  unsigned int mcterm =50000  ; //essas coisas devem ser inputs
  unsigned int mcsteps=200000  ;
  unsigned int measure=50;
  
  double dq=0.005;
  
  unsigned int mctotal=mcterm+mcsteps;
  
  
  int *s = new int[vol] ; // array of sites
  for(unsigned int i=0; i<vol; i++) s[i]=1;
  
  int **nn  = new int*[vol]; // adjacency matrix
  for(unsigned int i=0 ; i < vol ; i++) nn[i] = new int[ncoord];
  
  nn=nnlist(L,ndim,ncoord,vol);
  
  sprintf(fname, "outvars_L_%d.dat",L);
  out_file=fopen(fname,"w");
  fputs("#count\tp\tM\tsuscet\tU4 \n",out_file);
  
  fputs("#",out_file);
  for(int i=0;i<75;i++) fputs("-",out_file);
  fputs("\n",out_file);
  

  double q=0.;
  double qmax=0.25;
  
  unsigned int meas_count = 0 ;
 
  while(q <= qmax){
    
    double avgM= 0. ;
    double avgM2=0. ;
    double avgM4=0. ;
    double ff=1.-2.*q;

    mt.init_genrand(time(NULL));
    
    unsigned int meas_count = 0 ;

    for(unsigned int mc=0;mc < mctotal; mc++){
      
      for(unsigned int k=0; k<vol; k++){
	
        unsigned int i =(int)(mt.random()*(vol-1));
	
	int nnsum=0.;
        for(unsigned int j=0; j<ncoord; j++) nnsum+=s[nn[i][j]];
	int sx = (nnsum == 0) ? 0 : copysign(1,nnsum);
	
	wx=.5*(1.-ff*s[i]*sx);
        if(wx >= mt.random()) s[i]=-s[i];
      }
      
      if(mc >= mcterm && mc % measure == 0){
	
	double M=0.;
        for(unsigned int i=0; i<vol; i++)M+=s[i];
	
        avgM +=(abs(M)/vol) ;
	avgM2+=(abs(M)/vol)*(abs(M)/vol) ;
        avgM4+=(abs(M)/vol)*(abs(M)/vol)*
          (abs(M)/vol)*(abs(M)/vol) ;
	
	meas_count++;
      }
    }
    
    avgM /=meas_count ;
    avgM2/=meas_count ;
    avgM4/=meas_count ;
    
    fprintf(out_file,"%3i\t%12.6f\t%12.6f\t%12.6f\t%12.6f\n",
            count,q,avgM,vol*(avgM2-avgM*avgM),
            1.-avgM4/(3*avgM2*avgM2));
    
    if(q >= 0.10 && q <= 0.12){
      q+=.0005;
    }else {
      q+=dq;
    }
    count++;
    printf("%lf\t%lf\n",q,avgM);
  }
  
  if(out_file!=stdout) fclose(out_file);
  
  return 0;
}
