// Agent-ID: codex-a7c4. Refs #431. Uniform normalized shift curvature.
#include "normalized_base.hpp"
I envelope(I t){
 I aa=a+b*t,cc=a+3*b*t,D=aa*cc,M=rat(503,1000)+rat(613,500)*t,q=rat(5,2);
 I m=1+b/aa+3*b/cc;
 return 2*M*q/sq(aa)*(1+6*b*t/aa)+8*m*q*t*M/(aa*cc)
  +rat(1,2)*((sq(m)+sq(b/aa)+9*sq(b/cc))*4*t/sq(cc)+2*m/D)*sq(M);
}
int main(){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();
 double cap=0,mass=0;
 for(int j=0;j<36*256;j++){
  I t(j/256.0,(j+1)/256.0),B=envelope(t),e=expneg(t),D=(a+b*t)*(a+3*b*t);
  cap=std::max(cap,(e*B/D).h);mass+=(e*B/256).h;
 }
 // On T>=36, B(T)<=T/b^2. See the exact coefficient inequality below.
 I q=rat(5,2),m=rat(19,18),tt(36);
 I coeff=rat(35,2)*q/sq(tt)+rat(10,3)*m*q/tt+rat(25,72)*(sq(m)+2/sq(tt))+rat(25,48)*m/tt;
 assert(coeff.h<1);
 I tail=37*expneg(I(36))/sq(b);
 mass+=tail.h;
 // Tail density <= exp(-36)/(108 b^4), and both envelopes decrease thereafter.
 cap=std::max(cap,(expneg(I(36))/(108*sq(sq(b)))).h);
 assert(cap<100&&mass<140);
 assert((16*I(100)*I(140)).h<480.0*480.0);
 std::printf("PASS SHIFT CURVATURE cap=%.17g mass=%.17g tail=%.17g constant=480\n",cap,mass,tail.h);
}
