// /workspace/scratch/f307e93b3610/codex-c7e2-research/joint/radial_new.cpp
// Agent-ID: codex-a7c4. Refs #431. Amplitude-bounded matrix majorant.
#include "potential_base.hpp"
I slow,shigh,reserve;
std::array<J2,12> kernels(I w,I r0,I u0,int mode){
 J2 r(r0,I(mode==1)),u(u0,I(mode==2)),ww(w),theta=J2(piS)*u;
 J2 co=jc(theta),si=js(theta),x=r*co-ww,y=r*si;
 J2 T=invT(jsq(x)+jsq(y)),aa=J2(a)+J2(b)*T,D=aa*(J2(a)+J2(3*b)*T);
 J2 z=T-J2(rat(2,5)),zr=(jsq(x)-jsq(y))/(J2(sqrtI(I(2)))*jsq(aa)),zi=J2(sqrtI(I(2)))*x*y/jsq(aa),c=J2(rat(15159,50000));
 J2 ar=-z*si,br=zi*co-(c+zr)*si,ai=z*co,bi=(c-zr)*co-zi*si;
 J2 wt=J2(2)*je(T)/D;
 return {wt*jsq(z),wt*z*(c+zr),wt*(jsq(c+zr)+jsq(zi)),wt*jsq(z),wt*z*(c-zr),wt*(jsq(c-zr)+jsq(zi)),wt*jsq(ar),wt*ar*br,wt*jsq(br),wt*jsq(ai),wt*ai*bi,wt*jsq(bi)};
}
I eta(I w,I r,I u){
 if(shigh.h==0)return I(0);
 I theta=piS*u,xx=r*trig(theta,true)-w,yy=r*trig(theta,false);
 I v=sq(xx)+sq(yy),t(tpoint(std::max(0.,v.l)).l,tpoint(v.h).h);
 I M=sqrtI(sq(t-rat(2,5))+sq(rat(15159,50000)+t/sqrtI(I(2))));
 I sM=shigh*M;
 if(r.h==0)return I(1);
 I lo=sM/I(r.h);
 if(lo.l>=1)return I(1);
 if(r.l==0)return I(std::max(0.,lo.l),1);
 I v2=sM/r;return I(std::max(0.,v2.l),std::min(1.,v2.h));
}
I alpha(I t){return 9*t/sq(2+t);}
I beta(I t){return 4*(1-t)/sq(2+t);}
struct MC{double rl,rh,ul,uh;std::array<I,6> val;double err,rs,us;};
struct MW{bool operator()(const MC&a,const MC&b)const{return a.err<b.err;}};
MC mcell(I w,double rl,double rh,double ul,double uh){
 I rr(rl,rh),uu(ul,uh),dr=I(rh)-I(rl),du=I(uh)-I(ul),rm((rl+rh)/2),um((ul+uh)/2);
 auto center=kernels(w,rm,um,0),rad=kernels(w,rr,uu,1),ang=kernels(w,rr,uu,2);
 I et=eta(w,rr,uu),erange=eta(w,rr,um),urange=eta(w,rm,uu);
 // Alpha increases and beta decreases on [0,1]. Each multiplies a PSD matrix.
 I A(alpha(I(et.h)).h),B(beta(I(et.l)).h);
 // codex-c7e2 sharp cubic alternative; selection only chooses valid upper forms.
 if(et.h<1){
   I An=(rat(16,27)*I(et.h)).h,Bn(1);double po=0,ho=0;
   for(int j:{0,2,3,5}){po+=center[j].v.h;ho+=center[j+6].v.h;}
   if(An.h*po+ho < A.h*po+B.h*ho){A=An;B=Bn;}
 }
 MC c{rl,rh,ul,uh,{},0,0,0};
 double tr=0;
 for(int j:{0,2,3,5})tr+=(center[j].v.h+center[j+6].v.h)*dr.h*du.h;
 c.rs=tr*(erange.h-erange.l)*3;c.us=tr*(urange.h-urange.l)*3;
 c.err=tr*(et.h-et.l)*3;
 for(int j=0;j<6;j++){
  I er=(A*I(ab(rad[j].dd))+B*I(ab(rad[j+6].dd)))*sq(dr)/24;
  I eu=(A*I(ab(ang[j].dd))+B*I(ab(ang[j+6].dd)))*sq(du)/24;
  I error=er+eu;
  c.val[j]=(A*center[j].v+B*center[j+6].v+I(-error.h,error.h))*dr*du;
  c.err=std::max(c.err,((er+eu)*dr*du).h);c.rs+= (er*dr*du).h;c.us+=(eu*dr*du).h;
 }
 return c;
}
bool positive(I w,const std::array<I,6>&H){
 I rho=rat(5053,10000),pc=rat(2500,1891)-rat(463,5000);
 I qa=pc-rat(67,100)-rat(2,25)*sq(rho)+sq(w)/2+sq(slow)-reserve;
 I qb=pc-rat(67,100)*sq(rho)-rat(2,25)+sq(w)/2+sq(slow)-reserve;
 I cross=-rat(59,100)*rho;
 for(int j:{0,3}){I A=qa-H[j],B=qb-H[j+2],C=cross-H[j+1];if(!(A.l>0&&B.l>0&&(A*B-sq(C)).l>0))return false;}
 return true;
}
bool bound(I w,int limit){
 std::priority_queue<MC,std::vector<MC>,MW> todo;std::array<I,6>sum{};int count=0;
 auto add=[&](double rl,double rh,double ul,double uh){auto c=mcell(w,rl,rh,ul,uh);todo.push(c);count++;for(int j=0;j<6;j++)sum[j]=sum[j]+c.val[j];};
 double rs[]={0,.015625,.0625,.125,.25,.5,1,2,4,8,16,24,32,40};
 for(int i=0;i<13;i++)for(int j=0;j<8;j++)add(rs[i],rs[i+1],j/8.,(j+1)/8.);
 for(auto&x:sum)x=x+I(-1e-10,1e-10);
 while(count<limit&&(count%100!=0||!positive(w,sum))){
  auto c=todo.top();todo.pop();for(int j=0;j<6;j++)sum[j]=I(dnsub(sum[j].l,c.val[j].l),sum[j].h-c.val[j].h);
  if(c.rs>=c.us){double m=(c.rl+c.rh)/2;assert(c.rl<m&&m<c.rh);add(c.rl,m,c.ul,c.uh);add(m,c.rh,c.ul,c.uh);}
  else{double m=(c.ul+c.uh)/2;assert(c.ul<m&&m<c.uh);add(c.rl,c.rh,c.ul,m);add(c.rl,c.rh,m,c.uh);}
  if(count%100==0){sum={};auto cp=todo;while(!cp.empty()){for(int j=0;j<6;j++)sum[j]=sum[j]+cp.top().val[j];cp.pop();}for(auto&x:sum)x=x+I(-1e-10,1e-10);}
 }
 bool ok=positive(w,sum);
 std::printf("%s MATRIX w=[%a,%a] s=[%a,%a] reserve=%a cells=%d",ok?"PASS":"UNRESOLVED",w.l,w.h,slow.l,shigh.h,reserve.h,count);
 for(auto x:sum)std::printf(" [%a,%a]",x.l,x.h);std::puts("");std::fflush(stdout);return ok;
}
int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();if(argc!=7)return 2;
 I w(std::stod(argv[1]),std::stod(argv[2]));slow=I(std::stod(argv[3]));shigh=I(std::stod(argv[4]));reserve=I(std::stod(argv[5]));
 assert(0<=w.l&&w.l<=w.h&&w.h<=2&&0<=slow.l&&slow.h<=shigh.l&&shigh.h<=1);
 int limit=std::stoi(argv[6]);assert(reserve.l>=0&&limit>=104&&limit<=300000);
 return bound(w,limit)?0:1;
}
