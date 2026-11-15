// Agent-ID: codex-a7c4. Refs #431. Base norm and linear-content curvature.
#include "normalized_base.hpp"
#include "mixed_jet.hpp"
std::array<I,3> base_kernel(I shift,I rr,I uu){
 J2 r(rr),u(uu),w(shift,I(1)),theta=J2(2*piS)*(u-J2(rat(1,2)));
 J2 co=jc(theta),si=js(theta),x=r*co-w,y=r*si,T=invT(jsq(x)+jsq(y));
 J2 aa=J2(a)+J2(b)*T,f=je(T)/(aa*(J2(a)+J2(3*b)*T));
 J2 zr=(jsq(x)-jsq(y))/(J2(sqrtI(I(2)))*jsq(aa)),zi=J2(sqrtI(I(2)))*x*y/jsq(aa);
 J2 ca=f*(T-J2(rat(2,5)))*co,cb=f*((J2(rat(15159,50000))+zr)*co+zi*si);
 return {I(4)*f.v*sq(si.v),I(2)*rr*ca.dd,I(2)*rr*cb.dd};
}
std::array<MJ,3> base_mixed(I shift,I rr,I uu,int mode){
 MJ r(rr),u(uu),w(shift);w.at(1,0)=I(1);
 if(mode==1)r.at(0,1)=I(1);if(mode==2)u.at(0,1)=I(1);
 MJ theta=MJ(2*piS)*(u-MJ(rat(1,2))),co=mtrig(theta,true),si=mtrig(theta,false);
 MJ x=r*co-w,y=r*si,T=mt(x*x+y*y),aa=MJ(a)+MJ(b)*T;
 MJ f=mex(T)/(aa*(MJ(a)+MJ(3*b)*T));
 MJ zr=(x*x-y*y)/(MJ(sqrtI(I(2)))*aa*aa),zi=MJ(sqrtI(I(2)))*x*y/(aa*aa);
 return {MJ(4)*f*si*si,MJ(2)*r*f*(T-MJ(rat(2,5)))*co,
         MJ(2)*r*f*((MJ(rat(15159,50000))+zr)*co+zi*si)};
}
struct Cell{double rl,rh,ul,uh,err,rs,us;std::array<I,3> val;};
struct Worse{bool operator()(const Cell&a,const Cell&b)const{return a.err<b.err;}};
Cell cell(I w,double rl,double rh,double ul,double uh){
 I dr=I(rh)-I(rl),du=I(uh)-I(ul),r(rl,rh),u(ul,uh),rm((rl+rh)/2),um((ul+uh)/2);
 auto center=base_kernel(w,rm,um);
 auto rad=base_mixed(w,r,u,1),ang=base_mixed(w,r,u,2);
 Cell c{rl,rh,ul,uh,0,0,0,{}};
 for(int j=0;j<3;j++){
  I rdd=j==0?2*rad[j].at(0,2):4*rad[j].at(2,2);
  I udd=j==0?2*ang[j].at(0,2):4*ang[j].at(2,2);
  I er=I(ab(rdd))*sq(dr)/24,eu=I(ab(udd))*sq(du)/24,error=er+eu;
  c.val[j]=(center[j]+I(-error.h,error.h))*dr*du;
  c.err+=((er+eu)*dr*du).h;
  c.rs+=(er*dr*du).h;c.us+=(eu*dr*du).h;
 }
 return c;
}
int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();if(argc!=5)return 2;
 // For T>=36, the absolute second content derivative envelope is <=1/b^2.
 I m=rat(19,18),t(36);
 I coefficient=rat(335,18)/sq(t)+rat(25,6)*m/t+rat(5,9)*sq(m);
 assert(coefficient.h<1);
 assert((expneg(t)/sq(b)).h<0x1p-40);
 assert((expneg(t)/20).h<0x1p-40);
 // r>40 and w<=2 imply T>36, since |L| at T=36 is less than38.
 assert((6*(a+36*b)).h<38);
 I w(std::stod(argv[1]),std::stod(argv[2]));double tol=std::stod(argv[3]);int limit=std::stoi(argv[4]);
 assert(w.l>=0&&w.h<=2&&tol>0&&limit>=104&&limit<=1000000);
 std::priority_queue<Cell,std::vector<Cell>,Worse>q;std::array<I,3>sum{};int count=0;
 auto add=[&](double rl,double rh,double ul,double uh){auto c=cell(w,rl,rh,ul,uh);q.push(c);for(int j=0;j<3;j++)sum[j]=sum[j]+c.val[j];count++;};
 double rs[]={0,.015625,.0625,.125,.25,.5,1,2,4,8,16,24,32,40};
 for(int i=0;i<13;i++)for(int j=0;j<8;j++)add(rs[i],rs[i+1],j/8.0,(j+1)/8.0);
 for(auto&x:sum)x=x+I(-0x1p-40,0x1p-40);
 auto width=[&](){double ans=0;for(auto x:sum)ans+=x.h-x.l;return ans;};
 while(count<limit&&width()>tol){
  auto c=q.top();q.pop();for(int j=0;j<3;j++)sum[j]=I(dnsub(sum[j].l,c.val[j].l),sum[j].h-c.val[j].h);
  if(c.rs>=c.us){double m=(c.rl+c.rh)/2;assert(c.rl<m&&m<c.rh);add(c.rl,m,c.ul,c.uh);add(m,c.rh,c.ul,c.uh);}
  else{double m=(c.ul+c.uh)/2;assert(c.ul<m&&m<c.uh);add(c.rl,c.rh,c.ul,m);add(c.rl,c.rh,m,c.uh);}
  if(count%1000==0){sum={};auto copy=q;while(!copy.empty()){for(int j=0;j<3;j++)sum[j]=sum[j]+copy.top().val[j];copy.pop();}for(auto&x:sum)x=x+I(-0x1p-40,0x1p-40);}
 }
 std::printf("ENCLOSURE BASE_CURVATURE w=[%a,%a] cells=%d",w.l,w.h,count);
 for(auto x:sum)std::printf(" [%a,%a]",x.l,x.h);std::puts("");
 return 0;
}
