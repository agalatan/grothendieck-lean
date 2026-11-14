// Fused evaluation of a fixed-sample, control-variate objective.
// Agent-ID: codex-a713. IEEE double arithmetic; no fast-math.
#include <cmath>
#include <complex>
#include <vector>
#include <algorithm>
using cd=std::complex<double>;
extern "C" int content_eval(long N,int n,const cd* z,const cd* q,
 const double* co,int intervals,double dx,double scale,double vmax,
 double g0,double phi0,double slope,double benchmark,double u,
 cd* w,double* scratch,double* stats,cd* content) {
  double F=0.;
  for(int j=0;j<n;++j)content[j]=0.;
  for(long s=0;s<N;++s){
    double v=std::norm(q[s]);
    if(v>vmax||!std::isfinite(v))return 1;
    double x=std::log1p(v/scale);
    int k=std::min(int(x/dx),intervals-1);
    double d=x-k*dx;
    double vals[2],ders[2];
    for(int f=0;f<2;++f){
      double c0=co[f*intervals+k],c1=co[(2+f)*intervals+k];
      double c2=co[(4+f)*intervals+k],c3=co[(6+f)*intervals+k];
      vals[f]=((c0*d+c1)*d+c2)*d+c3;
      ders[f]=((3*c0*d+2*c1)*d+c2)/(v+scale);
    }
    double h=vals[1]-g0;
    scratch[s]=h;scratch[N+s]=ders[0]-slope;scratch[2*N+s]=ders[1];
    F+=vals[0]-phi0-slope*v;
    cd fq=q[s]*h;
    for(int j=0;j<n;++j)content[j]+=std::conj(z[s*n+j])*fq;
  }
  double numerator=0.;
  for(int j=0;j<n;++j){content[j]/=double(N);numerator+=std::norm(content[j]);}
  double D=benchmark-phi0-slope*u-F/N,R=numerator/D;
  stats[0]=R;stats[1]=D;stats[2]=numerator;
  for(long s=0;s<N;++s){
    cd p=0.;for(int j=0;j<n;++j)p+=z[s*n+j]*content[j];
    w[s]=scratch[s]*p+(2*scratch[2*N+s]*std::real(std::conj(p)*q[s])+R*scratch[N+s])*q[s];
  }
  return 0;
}
