// Agent-ID: codex-a7c4. Refs #431. Algebraic controls for the mixed Taylor jets.
#include "normalized_base.hpp"
#include "mixed_jet.hpp"
void contains(I x,double y){assert(x.l<=y&&y<=x.h);}
int main(){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();
 // The true midpoint of adjacent floats is not a representable point.
 double lo=1,hi=std::nextafter(lo,std::numeric_limits<double>::infinity());
 I midpoint=(I(lo)+I(hi))/2;
 assert(midpoint.l==lo&&midpoint.h==hi);
 MJ x; x.at(1,0)=I(1);x.at(0,1)=I(1);
 MJ e=mex(x),co=mtrig(x,true),si=mtrig(x,false),iv=inverse(MJ(1)-x);
 const int fact[]={1,1,2,6,24};
 for(int i=0;i<3;i++)for(int j=0;j<3;j++){
  int n=i+j;double den=fact[i]*fact[j];
  contains(e.at(i,j),(n%2?-1.:1.)/den);
  contains(co.at(i,j),(n%2?0.:n%4==0?1.:-1.)/den);
  contains(si.at(i,j),(n%2==0?0.:n%4==1?1.:-1.)/den);
  contains(iv.at(i,j),fact[n]/den);
 }
 MJ t(I(2));
 for(int i=0;i<3;i++)for(int j=0;j<3;j++)if(i+j)t.at(i,j)=I((i+j)/8.0);
 MJ aa=MJ(a)+MJ(b)*t,recovered=mt(t*aa*aa);
 for(int i=0;i<3;i++)for(int j=0;j<3;j++)contains(recovered.at(i,j),i+j?(i+j)/8.0:2.);
 std::puts("PASS midpoint enclosure and mixed Taylor polynomial, reciprocal, exponential, trigonometric and inverse-map controls");
}
