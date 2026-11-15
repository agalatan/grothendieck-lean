// Agent-ID: codex-6e2b. Directed-rounding interval certificate engine.
// Compile with clang++ -O2 -std=c++17 -frounding-math -ffp-contract=off
// -fno-fast-math theta_verify.cpp -o theta_verify (inside this folder).
#pragma STDC FENV_ACCESS ON
#include <algorithm>
#include <array>
#include <cassert>
#include <cfenv>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <chrono>
#include <limits>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

struct I { double l,h; I(double x=0):l(x),h(x){} I(double a,double b):l(a),h(b){assert(a<=b);} };
double dnadd(double a,double b){return -((-a)+(-b));}
double dnsub(double a,double b){return -((-a)+b);}
double dnmul(double a,double b){return -((-a)*b);}
double dndiv(double a,double b){return -((-a)/b);}
I operator+(I a,I b){return {dnadd(a.l,b.l),a.h+b.h};}
I operator-(I a){return {-a.h,-a.l};}
I operator-(I a,I b){return a+(-b);}
I operator*(I a,I b){
 double l=std::min({dnmul(a.l,b.l),dnmul(a.l,b.h),dnmul(a.h,b.l),dnmul(a.h,b.h)});
 double h=std::max({a.l*b.l,a.l*b.h,a.h*b.l,a.h*b.h}); return {l,h};
}
I operator/(I a,I b){assert(b.l>0||b.h<0); return a*I(dndiv(1,b.h),1/b.l);}
I sq(I a){if(a.l>=0)return {dnmul(a.l,a.l),a.h*a.h};if(a.h<=0)return {dnmul(a.h,a.h),a.l*a.l};return {0,std::max(a.l*a.l,a.h*a.h)};}
double ab(I a){return std::max(std::abs(a.l),std::abs(a.h));}
I hull(I a,I b){return {std::min(a.l,b.l),std::max(a.h,b.h)};}
I rat(double n,double d){return {dndiv(n,d),n/d};}
I sqrtI(I a){assert(a.l>=0); double lo=std::sqrt(a.l),hi=std::sqrt(a.h);return {std::nextafter(lo,-INFINITY),hi};}
I expPoint(double t){
 assert(t>=0&&t<=128); I x=I(t)/128,term(1),sum(1),lo;
 for(int j=1;j<=18;j++){term=term*x/I(j);if(j%2)sum=sum-term;else sum=sum+term;if(j==17)lo=sum;}
 I out(lo.l,sum.h);assert(out.l>0);for(int j=0;j<7;j++)out=sq(out);return out;
}
I expneg(I t){assert(t.l>=0);return {expPoint(t.h).l,expPoint(t.l).h};}
I a,b,d;
I poly(I x,I k,I z,I y){I t=sq(x)+sq(y);return x*(a+b*t)+k*(t-d)+z;}

// Floating Newton steps only propose a bracket; interval sign checks accept it.
I root(double k,double z,double y){
 double aa=(a.l+a.h)/2,bb=(b.l+b.h)/2,dd=(d.l+d.h)/2;
 double x=-(k*(y*y-dd)+z)/(aa+bb*y*y);
 for(int j=0;j<18;j++){
  double t=x*x+y*y;
  double v=x*(aa+bb*t)+k*(t-dd)+z;
  double den=aa+bb*(3*x*x+y*y)+2*k*x;
  double step=v/den; x-=step;
  if(std::abs(step)<2e-15*(1+std::abs(x)))break;
 }
 double e=1e-13*(1+std::abs(x));
 for(int j=0;j<60;j++){
  double lo=dnsub(x,e),hi=x+e;
  if(poly(I(lo),I(k),I(z),I(y)).h<=0 && poly(I(hi),I(k),I(z),I(y)).l>=0)return {lo,hi};
  e*=2;
 }
 std::fprintf(stderr,"root bracket failed %.17g %.17g %.17g\n",k,z,y);std::abort();
}

// Separate monotonicity of x in k,z,y puts its extrema at corners.
// t increases in y; its maximum is at a k,z corner at the upper y endpoint.
struct RX { I x,t,y,D; };
RX range(I k,I z,I y){
 I low=root(k.l,z.l,y.l),high=root(k.l,z.l,y.h);
 for(double kk:{k.l,k.h})for(double zz:{z.l,z.h}){
  low=hull(low,root(kk,zz,y.l));high=hull(high,root(kk,zz,y.h));
 }
 I xx=hull(low,high);
 I tl=sq(low)+sq(I(y.l)),th=sq(high)+sq(I(y.h));
 I t(tl.l,th.h);
 I den=a+b*(sq(y)+I(3)*sq(xx))+I(2)*k*xx;
 I dm=a+b*sq(y)-sq(k)/(I(3)*b);
 den.l=std::max(den.l,dm.l);assert(den.l>0);
 return {xx,t,y,den};
}
I value(I x,I y,I k){I t=sq(x)+sq(y);I D=a+b*(sq(y)+I(3)*sq(x))+I(2)*k*x;return sq(t-d)*expneg(t)/D;}
I second(RX r,I k){
 I x=r.x,t=r.t,y=r.y,D=r.D;
 I xy= -I(2)*y*(b*x+k)/D;
 I xyy= -((I(6)*b*x+I(2)*k)*sq(xy)+I(4)*b*y*xy+I(2)*(b*x+k))/D;
 I ty=I(2)*x*xy+I(2)*y;
 I tyy=I(2)*sq(xy)+I(2)*x*xyy+I(2);
 I Dy=I(2)*b*y+(I(6)*b*x+I(2)*k)*xy;
 I Dyy=I(2)*b+I(6)*b*sq(xy)+(I(6)*b*x+I(2)*k)*xyy;
 I e=expneg(t),td=t-d,N=sq(td)*e,N1=(I(2)*td-sq(td))*e,N2=(sq(td)-I(4)*td+I(2))*e;
 return (N2*sq(ty)+N1*tyy)/D-I(2)*N1*ty*Dy/sq(D)-N*Dyy/sq(D)+I(2)*N*sq(Dy)/(sq(D)*D);
}
std::array<I,2> gradient(RX r,I k){
 I x=r.x,t=r.t,D=r.D,td=t-d;
 I e=expneg(t),N=sq(td)*e,N1=(I(2)*td-sq(td))*e;
 I xk=-td/D,xz=-I(1)/D;
 I tk=I(2)*x*xk,tz=I(2)*x*xz;
 I Dk=I(2)*x+(I(6)*b*x+I(2)*k)*xk,Dz=(I(6)*b*x+I(2)*k)*xz;
 return {N1*tk/D-N*Dk/sq(D),N1*tz/D-N*Dz/sq(D)};
}
I zzderivative(RX r,I k){
 I x=r.x,t=r.t,D=r.D,td=t-d,E=I(6)*b*x+I(2)*k;
 I e=expneg(t),N=sq(td)*e,N1=(I(2)*td-sq(td))*e,N2=(sq(td)-I(4)*td+I(2))*e;
 I D2=sq(D),D3=D2*D,D4=sq(D2),D5=D4*D;
 return (I(2)*N1+I(4)*sq(x)*N2)/D3-(I(6)*x*E*N1+I(6)*b*N)/D4+I(3)*sq(E)*N/D5;
}
I integral(double k,double z,int n){
 assert(n>0&&(n&(n-1))==0); // 5/n and every partition endpoint are exact dyadics.
 I sum(0);double h=5.0/n;
 for(int j=0;j<n;j++){
  double yl=j*h,yh=(j+1)*h,ym=(yl+yh)/2;
  I xx=root(k,z,ym);
  I mid=value(xx,I(ym),I(k));
  RX r=range(I(k),I(z),I(yl,yh));
  double err=(I(ab(second(r,I(k))))*I(h)*I(h)*I(h)/24).h;
  sum=sum+mid*I(h)+I(-err,err);
 }
 // For y>=5, D>=b*y² and (t-d)^2 e^-t decreases in t>=25.
 // Tail <= (5/2+1/20)e^-25/b < 2.5e-10.
 return sum+I(0,2.5e-10);
}
std::array<I,2> grads(I k,I z,int n){
 assert(n>0&&(n&(n-1))==0);
 I gk(0),gz(0);double h=5.0/n;
 for(int j=0;j<n;j++){
  RX r=range(k,z,I(j*h,(j+1)*h));auto g=gradient(r,k);
  gk=gk+g[0]*I(h);gz=gz+g[1]*I(h);
 }
 // These enclose gradients on [0,5] only; no tail derivative is used.
 return {gk,gz};
}
I bound(I k,I z,int n=128,int ng=64){
 double kc=(k.l+k.h)/2,zc=(z.l+z.h)/2;
 I base=integral(kc,zc,n);auto g=grads(k,z,ng);
 I dk(dnsub(k.l,kc),k.h-kc);
 I dz(dnsub(z.l,zc),z.h-zc);
 // Integral at center contains tail [0,eps]; mean-value theorem applies
 // to truncated integral only, and one common [0,eps] handles every tail.
 return base+g[0]*dk+g[1]*dz;
}
I bound2(I k,I z,int n=128){
 assert(n>=2&&(n&(n-1))==0);
 double kc=(k.l+k.h)/2,zc=(z.l+z.h)/2;
 I base=integral(kc,zc,n),gk(0),gzz(0),gz(0);
 int ng=n/2;double h=5.0/ng;
 for(int j=0;j<ng;j++){
  RX rr=range(k,z,I(j*h,(j+1)*h));
  gk=gk+gradient(rr,k)[0]*I(h);
  gzz=gzz+zzderivative(rr,k)*I(h);
 }
 gz=grads(I(kc),I(zc),n)[1];
 I dk(dnsub(k.l,kc),k.h-kc),dz(dnsub(z.l,zc),z.h-zc);
 double err=(I(ab(gzz))*sq(dz)/2).h;
 return base+gk*dk+gz*dz+I(-err,err);
}

I trig(I x,bool cosine){
 I term=cosine?I(1):x,total=term;
 for(int j=1;j<=24;j++){
  int n=cosine?2*j:2*j+1;
  term=-term*sq(x)/I(n*(n-1));total=total+term;
 }
 int nn=cosine?50:51;
 I next=-term*sq(x)/I(nn*(nn-1));double rem=ab(next);
 return total+I(-rem,rem);
}
struct Query {I K,L,U,m,l,u;int ki,li,ui;};
struct Box {I k,z;int depth;};
void certify(const char*path){
 std::ifstream file(path);assert(file);
 std::string line;int bins=0,denom=0;std::vector<Query> queries;
 while(std::getline(file,line)){
  if(line.empty()||line[0]=='#')continue;
  std::istringstream in(line);
  if(!bins){in>>bins>>denom;assert(bins>0&&denom>0);continue;}
  int i,K,L,U,m,l,u;in>>i>>K>>L>>U>>m>>l>>u;
  assert(in&&i==(int)queries.size());
  queries.push_back({rat(K,denom),rat(L,denom),rat(U,denom),rat(m,denom),rat(l,denom),rat(u,denom),K,L,U});
 }
 assert((int)queries.size()==bins);
 // The containing rational decimal interval is certified by verify.py's
 // Machin-formula exact arithmetic (C2), not supplied by libm.
 I pi(rat(3141592653589793.0,1000000000000000.0).l,
      rat(3141592653589794.0,1000000000000000.0).h);
 I alpha=rat(137,200),rho=rat(3,10);
 std::array<I,3> ML{I(0),I(0),I(0)},MU=ML;
 double maxK=0;
 for(int j=0;j<bins;j++){
  I t0=pi*I(j)/I(2*bins),t1=pi*I(j+1)/I(2*bins);
  I c0=trig(t0,true),c1=trig(t1,true);
  Query q=queries[j];
  if(j==0){assert(10LL*q.ki>=3LL*denom);assert(200LL*q.li>=137LL*denom);}
  else {assert((rho*c0).h<=q.K.l);assert((alpha*c0).h<=q.L.l);}
  // Last cosine is exactly zero; its Taylor enclosure straddles zero.
  if(j+1==bins)assert(q.U.h<=0);else assert(q.U.h<=(alpha*c1).l);
  maxK=std::max(maxK,q.K.h);
  I delt=pi/I(2*bins),ss=trig(I(2)*t1,false)-trig(I(2)*t0,false);
  I cc=delt/2+ss/4,sn=delt/2-ss/4;
  I cs=(sq(trig(t1,false))-sq(trig(t0,false)))/2;
  cc.l=std::max(0.0,cc.l);sn.l=std::max(0.0,sn.l);cs.l=std::max(0.0,cs.l);
  ML[0]=ML[0]+cc*(q.m+q.l);ML[1]=ML[1]+sn*(q.m+q.l);ML[2]=ML[2]+cs*(q.m-q.l);
  MU[0]=MU[0]+cc*(q.u+q.m);MU[1]=MU[1]+sn*(q.u+q.m);MU[2]=MU[2]+cs*(q.u-q.m);
 }
 for(auto *matrix:{&ML,&MU}){
  for(I &v:*matrix)v=v*2/pi;
  I aa=rat(3,4)-(*matrix)[0],bb=rat(3,4)-(*matrix)[1];
  assert(aa.l>0&&bb.l>0&&(aa*bb-sq((*matrix)[2])).l>0);
 }
 std::puts("C: angular candidate inclusions and both matrix inequalities passed.");
 for(auto pair:{std::make_pair("left",ML),std::make_pair("right",MU)}){
  std::printf("%s matrix: ",pair.first);
  for(I v:pair.second)std::printf("[%.17g,%.17g] ",std::nextafter(v.l,-INFINITY),v.h);
  std::puts("");
 }
 assert(maxK<.301);
 assert((a-I(maxK*maxK)/(3*b)).l>0);
 // Analytic exterior |w|>=23/4, and scalar y>=5 tail.
 I exp4=1/expPoint(4);assert(exp4.l>54&&exp4.h<55);
 assert((rat(138500,1143603)-sq(rat(7,20))).h<0);
 assert(rat(197911,264660).h<rat(3,4).l);
 assert(((rat(5,2)+rat(1,20))*expPoint(25)/b).h<2.5e-10);
 std::puts("C: exterior |w|>=23/4 and all y>=5 tails passed.");
 auto start=std::chrono::steady_clock::now();
 std::vector<Box> pending{{I(0,maxK),I(-5.75,5.75),0}};
 long visited=0,accepted=0;int maxdepth=0;
 while(!pending.empty()){
  Box box=pending.back();pending.pop_back();visited++;
  double target=INFINITY;
  for(const Query &q:queries)if(box.k.l<=q.K.h){
   target=std::min(target,q.m.l);
   if(box.z.l<=q.L.h)target=std::min(target,q.l.l);
   if(box.z.h>=q.U.l)target=std::min(target,q.u.l);
  }
  assert(std::isfinite(target));
  I cap=bound2(box.k,box.z,128);
  if(cap.h<=target){accepted++;maxdepth=std::max(maxdepth,box.depth);continue;}
  double kw=box.k.h-box.k.l,zw=box.z.h-box.z.l;
  if(box.depth>=34){
   cap=bound2(box.k,box.z,512);
   if(cap.h<=target){accepted++;maxdepth=std::max(maxdepth,box.depth);continue;}
   std::fprintf(stderr,"UNVERIFIED box k=[%.17g,%.17g], z=[%.17g,%.17g], cap=%.17g target=%.17g\n",box.k.l,box.k.h,box.z.l,box.z.h,cap.h,target);std::exit(2);
  }
  if(kw*10>zw){double mid=(box.k.l+box.k.h)/2;
   pending.push_back({I(mid,box.k.h),box.z,box.depth+1});pending.push_back({I(box.k.l,mid),box.z,box.depth+1});
  }else{double mid=(box.z.l+box.z.h)/2;
   pending.push_back({box.k,I(mid,box.z.h),box.depth+1});pending.push_back({box.k,I(box.z.l,mid),box.depth+1});
  }
  if(visited%1000==0){std::printf("progress visited=%ld accepted=%ld pending=%zu sec=%.1f\n",visited,accepted,pending.size(),std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count());std::fflush(stdout);}
 }
 std::printf("PASS C: all %d scalar envelope triples certified; accepted=%ld visited=%ld maxdepth=%d time=%.2f sec\n",bins,accepted,visited,maxdepth,std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count());
 std::puts("P+C conclusion with the accompanying projection/envelope proof: Theta(3/10) <= 3/4 at s=3/5.");
}

int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0);assert(std::fegetround()==FE_UPWARD);
 volatile double one=1,half=0x1p-53;assert(one+half>one);
 a=rat(699,1250);b=rat(179,1250);d=rat(2,5);
 assert((a-rat(9,100)/(3*b)).l>0);
 if(argc==3&&std::string(argv[1])=="--certify"){certify(argv[2]);return 0;}
 if(argc>=4){
  double k=std::strtod(argv[1],nullptr),z=std::strtod(argv[2],nullptr);int n=std::atoi(argv[3]);
  double hk=argc>4?std::strtod(argv[4],nullptr):0,hz=argc>5?std::strtod(argv[5],nullptr):0;
  auto start=std::chrono::steady_clock::now();
  I v=bound2(I(dnsub(k,hk),k+hk),I(dnsub(z,hz),z+hz),n);
  std::printf("R enclosure [%.17g, %.17g], width %.9g; %.3f sec\n",v.l,v.h,v.h-v.l,std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count());
  return 0;
 }
 std::puts("Point-enclosure mode: theta_verify k z y_panels half_k half_z");
}
