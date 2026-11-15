// Agent-ID: codex-a7c4. Refs #431. Experimental normalized remainder verifier.
// Pointwise source bounds are rigorous interval bounds; no global parameter cover yet.
#include "normalized_base.hpp"
struct NP { I w,ar,ai,br,bi,rho; };
struct NK { J2 kr,ki,weight; };
I normI(I x,I y){return sqrtI(sq(x)+sq(y));}
NK kernel(const NP&p,I rr,I uu,int mode){
 J2 r(rr,I(mode==1)),u(uu,I(mode==2)),w(p.w,I(mode==3));
 J2 theta=J2(2*piS)*(u-J2(rat(1,2))),co=jc(theta),si=js(theta);
 J2 x=r*co-w,y=r*si,T=invT(jsq(x)+jsq(y)),aa=J2(a)+J2(b)*T;
 J2 zx=x/aa,zy=y/aa,zr=(jsq(zx)-jsq(zy))/J2(sqrtI(I(2))),zi=J2(sqrtI(I(2)))*zx*zy;
 J2 hr=(T-J2(rat(2,5)))*J2(p.ar)+(J2(rat(15159,50000))+zr)*J2(p.br)+zi*J2(p.bi);
 J2 hi=(T-J2(rat(2,5)))*J2(p.ai)+(J2(rat(15159,50000))-zr)*J2(p.bi)+zi*J2(p.br);
 J2 D=aa*(J2(a)+J2(3*b)*T),weight=J2(4)*r*je(T)/D;
 return {hr*co+hi*si,hi*co-hr*si,weight};
}
I value(const NP&p,I r,I u){
 auto k=kernel(p,r,u,0);I kr=k.kr.v,ki=k.ki.v;
 I upper=(sq(kr)+sq(ki))/(2*r),g;
 if(p.rho.h==0) g=sq(ki)/(2*r);
 else {
  I x=r+p.rho*kr,y=p.rho*ki,den=normI(x,y)+x;
  g=I(0,upper.h);
  if(den.l>0){I v=sq(ki)/den;g.l=std::max(g.l,v.l);g.h=std::min(g.h,v.h);}
  if(p.rho.l>0){I v=(normI(x,y)-x)/sq(p.rho);g.l=std::max(g.l,v.l);g.h=std::min(g.h,v.h);}
 }
 g.l=std::max(0.0,g.l);g.h=std::min(upper.h,g.h);assert(g.l<=g.h);
 return k.weight.v*g;
}
I negative_curvature(const NP&p,I r,I u,int mode){
 auto k=kernel(p,r,u,mode);
 I k0=normI(k.kr.v,k.ki.v),k1=normI(k.kr.d,k.ki.d),k2=normI(k.kr.dd,k.ki.dd);
 I gmax=sq(k0)/(2*r),gprime=2*k0*k1/r;
 if(mode==1)gprime=gprime+2*sq(k0)/sq(r);
 return k.weight.v*2*k0*k2/r+2*I(ab(k.weight.d))*gprime+I(ab(k.weight.dd))*gmax;
}
struct NC{double rl,rh,ul,uh,upper,score,rs,us;};
struct NW{bool operator()(const NC&a,const NC&b)const{return a.score<b.score;}};
NC cell(const NP&p,double rl,double rh,double ul,double uh){
 I r(rl,rh),u(ul,uh),dr=I(rh)-I(rl),du=I(uh)-I(ul);
 I avg=(value(p,I(rl),I(ul))+value(p,I(rl),I(uh))+value(p,I(rh),I(ul))+value(p,I(rh),I(uh)))/4;
 I er=negative_curvature(p,r,u,1)*sq(dr)/12,eu=negative_curvature(p,r,u,2)*sq(du)/12;
 I v=(avg+er+eu)*dr*du;
 // Numerical priority only; every acceptance uses v.h and outward summation.
 I mid=value(p,I((rl+rh)/2),I((ul+uh)/2))*dr*du;
 double priority=std::max(v.h-mid.l,1e-30);
 return {rl,rh,ul,uh,v.h,priority,(er*dr*du).h,(eu*dr*du).h};
}
bool bound(const NP&p,int limit,I reserve){
 I S=sq(p.ar)+sq(p.ai)+sq(p.br)+sq(p.bi),rho=rat(5053,10000);
 I R=sq(p.ar+rho*p.br)+sq(p.ai+rho*p.bi),U=sq(p.br-rho*p.ar)+sq(p.bi-rho*p.ai);
 I target=(rat(2500,1891)-rat(463,5000)+sq(p.w)/2+sq(p.rho)*S)*S-rat(67,100)*R-rat(2,25)*U;
 target=target-reserve;
 // The existing source density bound gives Rem/(amplitude^2) on r<eps <=1.62 eps S.
 // The inherited potential tail gives 1e-10 S on r>40, for w<=2.
 const double eps=1.0/65536;
 I rest=(rat(81,50)*I(eps)+I(1e-10))*S;
 std::priority_queue<NC,std::vector<NC>,NW>todo;double total=rest.h;long count=0;
 auto add=[&](double rl,double rh,double ul,double uh){auto c=cell(p,rl,rh,ul,uh);todo.push(c);total+=c.upper;count++;};
 double rs[]={eps,.0001,.001,.01,.0625,.125,.25,.5,1,2,4,8,16,24,32,40};
 for(int i=0;i<15;i++)for(int j=0;j<16;j++)add(rs[i],rs[i+1],j/16.0,(j+1)/16.0);
 while(count<limit&&total>=target.l){
  auto c=todo.top();todo.pop();total=total-c.upper;
  if(c.rs>=c.us){double m=(c.rl+c.rh)/2;assert(c.rl<m&&m<c.rh);add(c.rl,m,c.ul,c.uh);add(m,c.rh,c.ul,c.uh);}
  else{double m=(c.ul+c.uh)/2;assert(c.ul<m&&m<c.uh);add(c.rl,c.rh,c.ul,m);add(c.rl,c.rh,m,c.uh);}
  if(count%1000==0){total=rest.h;auto cp=todo;while(!cp.empty()){total+=cp.top().upper;cp.pop();}}
 }
 std::printf("%s NORMALIZED w=%.9g rho=%.9g Sdir=%.9g upper=%.17g target_lower=%.17g cells=%ld\n",total<target.l?"PASS":"UNRESOLVED",p.w.l,p.rho.l,S.l,total,target.l,count);
 return total<target.l;
}
int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();
 if(argc!=9&&argc!=15)return 2;
 auto number=[](const std::string&s){
  size_t slash=s.find('/'),n=0;double num=std::stod(s.substr(0,slash),&n);
  assert(n==(slash==std::string::npos?s.size():slash)&&std::isfinite(num));
  if(slash==std::string::npos)return I(num);
  size_t nd=0;double den=std::stod(s.substr(slash+1),&nd);
  assert(nd==s.size()-slash-1&&den>0&&std::isfinite(den));
  assert(std::floor(num)==num&&std::floor(den)==den&&std::abs(num)<9007199254740992.0&&den<9007199254740992.0);
  return rat(num,den);
 };
 auto arg=[&](int j){if(argc==9)return number(argv[j+1]);I l=number(argv[2*j+1]),h=number(argv[2*j+2]);return I(l.l,h.h);};
 NP p{arg(0),arg(1),arg(2),arg(3),arg(4),arg(5)};
 assert(p.w.l>=0&&p.w.h<=2&&p.rho.l>=0&&p.rho.h<=1);
 I reserve=number(argv[argc-2]);assert(reserve.l>=0);
 int limit=std::stoi(argv[argc-1]);assert(limit>=240&&limit<=1000000);
 return bound(p,limit,reserve)?0:1;
}
