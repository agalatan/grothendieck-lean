// Exact directed-rounding support-dual acceptance. Agent-ID codex-91d4; #430.
// Compile: clang++ -O2 -std=c++17 -frounding-math -ffp-contract=off -fno-fast-math dual_verify.cpp -o dual_verify
#ifdef NDEBUG
#error "Assertions are required"
#endif
#ifdef __FAST_MATH__
#error "Fast math invalidates outward arithmetic"
#endif
#include <array>
#include <vector>
#include <map>
#include <cmath>
#include <cfenv>
#include <cassert>
#include <cstdio>
#include <fstream>
#include <cstring>
#include <cstdint>
#include <chrono>
#include <algorithm>
#include <limits>
#pragma STDC FENV_ACCESS ON
struct I{double l,h;I(double x=0):l(x),h(x){}I(double x,double y):l(x),h(y){assert(x<=y);}};
double dnadd(double a,double b){return -((-a)+(-b));}
double dnmul(double a,double b){return -((-a)*b);}
I operator+(I a,I b){return {dnadd(a.l,b.l),a.h+b.h};}
I operator-(I a){return {-a.h,-a.l};}
I operator-(I a,I b){return a+(-b);}
I operator*(I a,I b){
 return {std::min({dnmul(a.l,b.l),dnmul(a.l,b.h),dnmul(a.h,b.l),dnmul(a.h,b.h)}),
         std::max({a.l*b.l,a.l*b.h,a.h*b.l,a.h*b.h})};}
I operator/(I a,I b){assert(b.l>0);return a*I(-(-1.0/b.h),1.0/b.l);}
I rat(double a,double b){return I(a)/I(b);}
I sq(I a){if(a.l>=0)return {dnmul(a.l,a.l),a.h*a.h};if(a.h<=0)return {dnmul(a.h,a.h),a.l*a.l};return {0,std::max(a.l*a.l,a.h*a.h)};}
I sqrtI(I a){assert(a.l>=0);return {std::max(0.0,std::nextafter(std::sqrt(a.l),-INFINITY)),std::sqrt(a.h)};}
struct C{I re,im;C(I r=0,I i=0):re(r),im(i){}};
C operator+(C a,C b){return {a.re+b.re,a.im+b.im};}
C operator-(C a,C b){return {a.re-b.re,a.im-b.im};}
C operator*(C a,C b){return {a.re*b.re-a.im*b.im,a.re*b.im+a.im*b.re};}
C operator*(C a,I b){return {a.re*b,a.im*b};}
I realInner(C a,C s){return a.re*s.re+a.im*s.im;}
C support(C x){
 double r=x.re.l/2+x.re.h/2,i=x.im.l/2+x.im.h/2;
 double norm=std::hypot(r,i);if(norm==0)return C();
 r/=norm;i/=norm;
 // r,i are arbitrary exact dyadic proposals. The acceptance below alone
 // ensures that the complex supporting vector lies in the closed unit disk.
 for(int k=0;k<4;k++){
  I nn=sq(I(r))+sq(I(i));if(nn.h<=1)return C(I(r),I(i));
  double scale=std::nextafter(std::sqrt(nn.h),INFINITY);r/=scale;i/=scale;
 }
 r*=1-0x1p-45;i*=1-0x1p-45;
 assert((sq(I(r))+sq(I(i))).h<=1);return C(I(r),I(i));
}
I readI(std::istream&f){uint64_t a,b;f>>a>>b;assert(f);double x,y;std::memcpy(&x,&a,8);std::memcpy(&y,&b,8);assert(std::isfinite(x)&&std::isfinite(y));return {x,y};}
struct Moment{I mass;std::array<I,7> m;};
std::vector<Moment> readMom(std::istream&f,int n){std::vector<Moment> v(n);for(auto&q:v){q.mass=readI(f);assert(q.mass.l>0);for(auto&z:q.m)z=readI(f);assert(q.m[0].l<=1&&1<=q.m[0].h);}return v;}
using Key=std::array<int,3>;
using Poly=std::map<Key,I>;
void addterm(Poly&p,Key k,I c){p[k]=p[k]+c;}
Poly square(const Poly&p){Poly q;for(auto[u,c]:p)for(auto[v,d]:p)addterm(q,{u[0]+v[0],u[1]+v[1],u[2]+v[2]},c*d);return q;}
int main(int argc,char**argv){
 static_assert(sizeof(double)==8&&std::numeric_limits<double>::is_iec559,"IEEE binary64 is required");
 assert(argc==2);assert(std::fesetround(FE_UPWARD)==0);assert(std::fegetround()==FE_UPWARD);
 volatile double one=1,half=0x1p-53;assert(one+half>one);
 std::ifstream f(argv[1]);assert(f);int nx,ny,nr;f>>nx>>ny>>nr;assert(nx>0&&nx<=4000&&ny>0&&ny<=2000&&nr>0&&nr<=2000);
 I tail=readI(f);assert(tail.l>=0&&tail.h<1e-7);
 auto xs=readMom(f,nx),ys=readMom(f,ny),rs=readMom(f,nr);
 f>>std::ws;assert(f.peek()==std::char_traits<char>::eof());
 I a=rat(699,1250),b=rat(179,1250),cq=rat(57,5000),al=rat(133,1000),be=rat(21,200),rho=rat(5053,10000);
 I d=rat(63,1000),e=rat(53,10000),nu=rat(7,5000),p=rat(2500,1891);
 I sq2=sqrtI(I(2)),ret=rat(3,5)*(al+rho*sq2*be),k0=ret-I(2)*cq-al;
 Poly re,im;addterm(re,{3,0,0},b);addterm(re,{1,2,0},b);addterm(re,{1,0,0},a);
 addterm(re,{0,0,3},cq);addterm(re,{0,0,1},k0);addterm(re,{2,0,1},al+be);addterm(re,{0,2,1},al-be);
 addterm(im,{0,1,0},a);addterm(im,{2,1,0},b);addterm(im,{0,3,0},b);addterm(im,{1,1,1},I(2)*be);
 Poly norm=square(re);for(auto[k,c]:square(im))addterm(norm,k,c);
 I W=sq(d)+I(2)*sq(e)+I(2)*sq(nu);
 I U2=sq(sq2*be-rho*al),allow=U2/I(100)+rat(1,20000);
 double lowerA=0,upperBase=0;I K;
 uint64_t count=0;auto start=std::chrono::steady_clock::now();
 // The real core and imaginary odd coefficients allow paired reflection
 // across y=0. Define supports there by swapping/conjugating the positive
 // half's supports. Thus A and baseline double, K is purely imaginary.
 for(const auto&mx:xs)for(const auto&my:ys){
  I massXY=I(2)*mx.mass*my.mass;
  std::array<I,7> normR{};
  for(auto[k,c]:norm)normR[k[2]]=normR[k[2]]+c*mx.m[k[0]]*my.m[k[1]];
  C meanZ(mx.m[1],my.m[1]);
  C L(a*mx.m[1]+b*(mx.m[3]+mx.m[1]*my.m[2]),
      a*my.m[1]+b*(mx.m[2]*my.m[1]+my.m[3]));
  C evenR(k0+(al+be)*mx.m[2]+(al-be)*my.m[2],I(2)*be*mx.m[1]*my.m[1]);
  I dc=-d-I(2)*nu;
  C O0(my.m[1]*dc+nu*(mx.m[2]*my.m[1]+my.m[3]),
      -(mx.m[1]*dc+nu*(mx.m[3]+mx.m[1]*my.m[2])));
  C O2((d-e)*my.m[1],-(d+e)*mx.m[1]);
  for(const auto&mr:rs){
   I mass=massXY*mr.mass;C X=L+evenR*mr.m[1]+C(cq*mr.m[3],0);C O=O0+O2*mr.m[2];
   C cp(0,-.001374806264635);C V=O-cp*meanZ;
   C sp=support(X+V),sm=support(X-V);
   I A=mass*(realInner(X+O,sp)+realInner(X-O,sm));lowerA=dnadd(lowerA,A.l);
   C ds=sp-sm;K=K+mass*(meanZ.re*ds.im-meanZ.im*ds.re);
   I n2;for(int j=0;j<7;j++)n2=n2+normR[j]*mr.m[j];assert(n2.h>=0);
   upperBase+=mass.h*std::sqrt(std::max(0.0,n2.h));count++;
  }
  if(std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count()>55){std::fprintf(stderr,"INCOMPLETE: 55 second cap; no certificate\n");return 3;}
 }
 assert(count==uint64_t(nx)*uint64_t(ny)*uint64_t(nr));
 assert(std::fegetround()==FE_UPWARD);
 I lower=I(lowerA)-sq(K)/I(4)-I(2)*(I(upperBase)+tail)-p*W;
 I residual=lower-allow;
 double sec=std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count();
 std::printf("grid %d %d %d cells %llu terms %zu seconds %.3f\n",nx,ny,nr,(unsigned long long)count,norm.size(),sec);
 std::printf("A_lower %.17g K_imag [%.17g,%.17g] baseline_upper %.17g tail_upper %.17g\n",lowerA,K.l,K.h,upperBase,tail.h);
 std::printf("odd_gain_lower %.17g allowance_upper %.17g residual_lower %.17g\n",lower.l,allow.h,residual.l);
 if(residual.l>rat(1,10000).h){std::puts("PASS RIGOROUS COMMON-TRIAL O_U COUNTEREXAMPLE: RESIDUAL > 1/10000");return 0;}
 std::puts("INCONCLUSIVE: this support discretization does not prove residual > 1/10000");return 2;
}
