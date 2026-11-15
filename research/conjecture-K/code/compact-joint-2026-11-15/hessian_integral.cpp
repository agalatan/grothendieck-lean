// Agent-ID codex-a7c4. #431. Nonsingular origin-in-amplitude Hessian.
#include "inherited_secant.hpp"
#if defined(NDEBUG) || defined(__FAST_MATH__)
#error Strict rounding and assertions are required
#endif
struct J2 { I v,d,dd; J2(I x=0,I dx=0,I dxx=0):v(x),d(dx),dd(dxx){} };
J2 operator+(J2 x,J2 y){return {x.v+y.v,x.d+y.d,x.dd+y.dd};}
J2 operator-(J2 x){return {-x.v,-x.d,-x.dd};}
J2 operator-(J2 x,J2 y){return x+(-y);}
J2 operator*(J2 x,J2 y){return {x.v*y.v,x.d*y.v+x.v*y.d,x.dd*y.v+I(2)*x.d*y.d+x.v*y.dd};}
J2 ji(J2 x){return {I(1)/x.v,-x.d/sq(x.v),I(2)*sq(x.d)/(sq(x.v)*x.v)-x.dd/sq(x.v)};}
J2 operator/(J2 x,J2 y){return x*ji(y);}
J2 jsq(J2 x){return {sq(x.v),I(2)*x.v*x.d,I(2)*(sq(x.d)+x.v*x.dd)};}
J2 je(J2 x){I e=expneg(x.v);return {e,-e*x.d,e*(sq(x.d)-x.dd)};}
J2 jc(J2 x){I co=trig(x.v,true),si=trig(x.v,false);return {co,-si*x.d,-co*sq(x.d)-si*x.dd};}
J2 js(J2 x){I co=trig(x.v,true),si=trig(x.v,false);return {si,co*x.d,-si*sq(x.d)+co*x.dd};}
I tpoint(double v){
 assert(v>=0);if(v==0)return I(0);
 double aa=(a.l+a.h)/2,bb=(b.l+b.h)/2,t=std::cbrt(v/(bb*bb));
 for(int j=0;j<35;j++){
  double f=t*(aa+bb*t)*(aa+bb*t)-v,D=(aa+bb*t)*(aa+3*bb*t);
  t=std::max(0.0,t-f/D);
 }
 double er=1e-12*(1+t);
 for(int j=0;j<50;j++){
  double lo=std::max(0.0,dnsub(t,er)),hi=t+er;
  if((I(lo)*sq(a+b*I(lo))).h<=v&&(I(hi)*sq(a+b*I(hi))).l>=v)return {lo,hi};
  er*=2;
 }
 std::abort();
}
J2 invT(J2 v){
 v.v.l=std::max(0.0,v.v.l);I tt(tpoint(v.v.l).l,tpoint(v.v.h).h);
 I D=(a+b*tt)*(a+I(3)*b*tt),Dp=I(4)*a*b+I(6)*sq(b)*tt;
 return {tt,v.d/D,v.dd/D-Dp*sq(v.d)/(sq(D)*D)};
}
std::array<J2,6> hk(I w,I r0,I u0,int mode){
 J2 r(r0,I(mode==1)),u(u0,I(mode==2)),ww(w),theta=J2(piS)*u;
 J2 co=jc(theta),si=js(theta),xx=r*co-ww,yy=r*si;
 J2 T=invT(jsq(xx)+jsq(yy)),aa=J2(a)+J2(b)*T;
 J2 D=aa*(J2(a)+J2(I(3)*b)*T),den=J2(sqrtI(I(2)))*jsq(aa);
 J2 z=T-J2(rat(2,5)),v0=-z*si,v1=z*co;
 J2 v2=((jsq(r)-jsq(ww))/den-J2(rat(15159,50000)))*si;
 J2 v3=J2(rat(15159,50000))*co-((jsq(r)+jsq(ww))*co-J2(2)*r*ww)/den;
 J2 weight=J2(2)*je(T)/D;
 return {weight*jsq(v0),weight*v0*v2,weight*jsq(v2),weight*jsq(v1),weight*v1*v3,weight*jsq(v3)};
}
struct HC{double rl,rh,ul,uh;std::array<I,6> val;double err,rs,us;};
struct HW{bool operator()(const HC&a,const HC&b)const{return a.err<b.err;}};
HC hcell(I w,double rl,double rh,double ul,double uh){
 I rr(rl,rh),uu(ul,uh),dr=I(rh)-I(rl),du=I(uh)-I(ul);
 auto center=hk(w,I((rl+rh)/2),I((ul+uh)/2),0),rad=hk(w,rr,uu,1),ang=hk(w,rr,uu,2);
 HC c{rl,rh,ul,uh,{},0,0,0};
 for(int j=0;j<6;j++){
  I er=I(ab(rad[j].dd))*sq(dr)/I(24),eu=I(ab(ang[j].dd))*sq(du)/I(24);
  I total=(er+eu)*dr*du;
  c.val[j]=(center[j].v+I(-(er+eu).h,(er+eu).h))*dr*du;
  c.err=std::max(c.err,total.h);c.rs=std::max(c.rs,(er*dr*du).h);c.us=std::max(c.us,(eu*dr*du).h);
 }
 return c;
}
bool positive_gap(I w,const std::array<I,6>&H){
 I rho=rat(5053,10000),pc=rat(2500,1891)-rat(463,5000),reserve=rat(1,100);
 I qa=pc-rat(67,100)-rat(2,25)*sq(rho)+sq(w)/I(2)-reserve;
 I qb=pc-rat(67,100)*sq(rho)-rat(2,25)+sq(w)/I(2)-reserve;
 I cross=-rat(59,100)*rho;
 for(int j:{0,3}){
  I A=qa-H[j],B=qb-H[j+2],C=cross-H[j+1];
  if(!(A.l>0&&B.l>0&&(A*B-sq(C)).l>0))return false;
 }
 return true;
}
bool hbound(I w,int limit){
 std::priority_queue<HC,std::vector<HC>,HW>todo;std::array<I,6>sum{};int cells=0;
 auto add=[&](double rl,double rh,double ul,double uh){HC c=hcell(w,rl,rh,ul,uh);todo.push(c);cells++;for(int j=0;j<6;j++)sum[j]=sum[j]+c.val[j];};
 double rs[]={0,.125,.25,.5,1,2,4,8,16,24,32,40};
 for(int k=0;k<11;k++)for(int j=0;j<8;j++)add(rs[k],rs[k+1],j/8.0,(j+1)/8.0);
 for(int j=0;j<6;j++)sum[j]=sum[j]+I(-1e-10,1e-10);
 while(cells<limit&&!positive_gap(w,sum)){
  if(cells%100==0){sum={}; auto cp=todo; while(!cp.empty()){for(int j=0;j<6;j++)sum[j]=sum[j]+cp.top().val[j];cp.pop();} for(auto &v:sum)v=v+I(-1e-10,1e-10);}
  auto c=todo.top();todo.pop();for(int j=0;j<6;j++)sum[j]=I(dnsub(sum[j].l,c.val[j].l),sum[j].h-c.val[j].h);
  if(c.rs>=c.us){double m=(c.rl+c.rh)/2;add(c.rl,m,c.ul,c.uh);add(m,c.rh,c.ul,c.uh);}
  else{double m=(c.ul+c.uh)/2;add(c.rl,c.rh,c.ul,m);add(c.rl,c.rh,m,c.uh);}
 }
 bool pass=positive_gap(w,sum);
 std::printf("%s HESSIAN w=[%.17g,%.17g] cells=%d",pass?"PASS":"UNRESOLVED",w.l,w.h,cells);
 for(auto x:sum)std::printf(" [%.9g,%.9g]",x.l,x.h);std::puts("");std::fflush(stdout);
 return pass;
}
int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();
 if(argc==2&&std::string(argv[1])=="--cover-w"){
  std::vector<I> ws{I(0,2)};int passed=0;
  while(!ws.empty()){
   I w=ws.back();ws.pop_back();
   if(hbound(w,30000)){passed++;continue;}
   assert(w.h-w.l>1.0/65536);double mid=(w.l+w.h)/2;
   ws.push_back(I(mid,w.h));ws.push_back(I(w.l,mid));
  }
  std::printf("PASS ALL SHIFTS [0,2]: %d intervals; gap > .01\n",passed);return 0;
 }
 if(argc==4){double l=std::atof(argv[1]),h=std::atof(argv[2]);assert(0<=l&&l<=h&&h<=2);return hbound(I(l,h),std::atoi(argv[3]))?0:1;}
 return 2;
}
