// Agent-ID: codex-a7c4. #431. Rigorous two-harmonic source integrals.
// Compile: clang++ -O2 -std=c++17 -frounding-math -ffp-contract=off
// -fno-fast-math joint_integral.cpp -o joint_integral
#include "inherited_secant.hpp"
#if defined(NDEBUG) || defined(__FAST_MATH__)
#error Acceptance requires assertions
#endif
bool quiet_integrals=false;
struct Cx { I x,y; };
I mag(Cx z){return sqrtI(sq(z.x)+sq(z.y));}
struct JP { I w,ar,ai,br,bi; };
std::vector<std::pair<I,I>> angle_nodes;
void angles(int n){
 angle_nodes.clear();
 for(int j=0;j<n;j++){
  I t=piS*I(2*(j-n/2))/I(n),tt=sq(t),ct(1),st=t,co=ct,si=st;
  assert(ab(t)<4);
  for(int k=1;k<=25;k++){
   ct=-ct*tt/I((2*k-1)*(2*k)); st=-st*tt/I((2*k)*(2*k+1));co=co+ct;si=si+st;
  }
  I rem(1);for(int k=1;k<=52;k++)rem=rem*I(ab(t))/I(k);
  assert(rem.h<1e-30);
  angle_nodes.push_back({co+I(-1e-30,1e-30),si+I(-1e-30,1e-30)});
 }
}
I jcircle(const JP&p,I t,I ell){
 Cx c{p.w+(t-d)*p.ar+rat(15159,50000)*p.br,
                (t-d)*p.ai+rat(15159,50000)*p.bi};
 I rt=sqrtI(I(2));Cx z{t*p.br/rt,-t*p.bi/rt};
 I total(0);
 for(auto [co,si]:angle_nodes){
  Cx v{ell+(c.x+z.x)*co+(c.y-z.y)*si,
                   (c.y+z.y)*co+(z.x-c.x)*si};
  total=total+mag(v);
 }
 total=total/I(angle_nodes.size());
 // f(theta)=|ell+c exp(-i theta)+z exp(i theta)| has f'' >= -M
 // distributionally, M=|c|+|z|. Periodic Peano kernel gives these sides.
 I er=(mag(c)+mag(z))*sq(piS)/I(6*angle_nodes.size()*angle_nodes.size());
 return {std::max(0.0,dnsub(total.l,er.h)),(total+I(2)*er).h};
}
SourceCell jcell(const JP&p,double lo,double hi){
 I l(lo),h(hi),width=h-l,el=expneg(l),eh=expneg(h),mass=el-eh;
 assert(mass.l>0);I mu=((l+1)*el-(h+1)*eh)/mass;
 mu.l=std::max(lo,mu.l);mu.h=std::min(hi,mu.h);
 I th=(mu-l)/width;th.l=std::max(0.0,th.l);th.h=std::min(1.0,th.h);
 I ll=ellAt(l),lh=ellAt(h),lm=ellAt(mu),chord=(I(1)-th)*ll+th*lh;
 I low,up;
 if((I(3)*b*h-a).h<=0){
  low=jcircle(p,mu,chord);I slope=(a+I(3)*b*mu)/(I(2)*sqrtI(mu));
  up=(I(1)-th)*jcircle(p,l,lm+slope*(l-mu))+th*jcircle(p,h,lm+slope*(h-mu));
 }else if((I(3)*b*l-a).l>=0){
  low=jcircle(p,mu,lm);up=(I(1)-th)*jcircle(p,l,ll)+th*jcircle(p,h,lh);
 }else{
  I er=(a+I(3)*b*h)/(I(4)*l*sqrtI(l))*sq(width)/I(8);
  low=jcircle(p,mu,chord)-er;up=(I(1)-th)*jcircle(p,l,ll)+th*jcircle(p,h,lh)+er;
 }
 I v=mass*I(std::max(0.0,low.l),up.h);return {lo,hi,v,v.h-v.l};
}
I jint(const JP&p,double tol){
 I an=mag({p.ar,p.ai}),bn=mag({p.br,p.bi});
 I avgM=I(ab(p.w))+rat(3,4)*an+rat(253,250)*bn;
 int n=32;while((avgM*sq(piS)/I(2*n*n)).h>tol/4)n*=2;
 assert(n<=16384);angles(n);
 const double eps=1.0/1048576;I mass=I(1)-expneg(I(eps));
 I anchor=mag({p.w-d*p.ar+rat(15159,50000)*p.br,-d*p.ai+rat(15159,50000)*p.bi});
 I er=rat(2,3)*a*I(eps)*sqrtI(I(eps))+rat(2,5)*b*sq(I(eps))*sqrtI(I(eps))
       +(an+bn/sqrtI(I(2)))*sq(I(eps))/I(2);
 I sum=mass*anchor+I(-er.h,er.h);double lower=sum.l,upper=sum.h;
 std::priority_queue<SourceCell,std::vector<SourceCell>,Wider> todo;
 long cells=0;
 auto add=[&](double l,double h){auto c=jcell(p,l,h);lower=dnadd(lower,c.val.l);upper+=c.val.h;todo.push(c);cells++;};
 double ed[]={eps,1.0/1024,1.0/256,1.0/64,1.0/16,.25,.5,1,2,4,8,16,32,36};
 for(int k=0;k<13;k++)add(ed[k],ed[k+1]);
 I tail=expneg(I(36))*(a*37+b*1370+I(ab(p.w))+d*an+rat(15159,50000)*bn+I(37)*(an+bn/sqrtI(I(2))));
 upper+=tail.h;
 while(upper-lower>tol){
  assert(cells<40000);auto c=todo.top();todo.pop();double mid=(c.l+c.h)/2;
  assert(mid>c.l&&mid<c.h);lower=dnsub(lower,c.val.l);upper=upper-c.val.h;
  add(c.l,mid);add(mid,c.h);
 }
 if(!quiet_integrals)std::fprintf(stderr,"source cells=%ld angular=%d width=%.8g\n",cells,n,upper-lower);
 return {lower,upper};
}
int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();
 if(argc==3&&std::string(argv[1])=="--critical-box"){
  std::ifstream in(argv[2]);assert(in);I beta[2];
  for(int j=0;j<2;j++){
   long wn,wd,lo,hi,scale;in>>wn>>wd>>lo>>hi>>scale;
   assert(in&&wn==(j?79:75)&&wd==128&&scale==1000000000&&lo<=hi);
   beta[j]=I(rat(lo,scale).l,rat(hi,scale).h);
  }
  std::string extra;assert(!(in>>extra));
  I rho=rat(5053,10000),p=rat(2500,1891),c=rat(463,5000);
  double ws[]={75.0/128,79.0/128},ars[]={43.0/128,47.0/128},bs[]={24.0/128,28.0/128};
  double ims[]={-1.0/64,1.0/64};double maxg=-INFINITY;int count=0;
  for(int j=0;j<2;j++){
   I f0=fpoint({0,ws[j],0},.00002);
   for(double ar:ars)for(double ai:ims)for(double br:bs)for(double bi:ims){
    JP q{I(ws[j]),I(ar),I(ai),I(br),I(bi)};I f1=jint(q,.0001);
    I S=sq(q.ar)+sq(q.ai)+sq(q.br)+sq(q.bi);
    I R2=sq(q.ar+rho*q.br)+sq(q.ai+rho*q.bi);
    I U2=sq(q.br-rho*q.ar)+sq(q.bi-rho*q.ai);
    I target=(p-c)*S-rat(67,100)*R2-rat(2,25)*U2+(sq(q.w)/I(2)+S)*S;
    // All B real parts are nonnegative. 0<=kB-rho*kA<=.007.
    I g=I(2)*(f1-f0-beta[j]*(q.ar+rho*q.br))+rat(7,500)*q.w*q.br-target;
    maxg=std::max(maxg,g.h);count++;
    std::printf("corner=%d G_upper=%.17g\n",count,g.h);std::fflush(stdout);
   }
  }
  I wh(ws[1]),ah(ars[1]),bh(bs[1]),ih(ims[1]);
  I Smax=sq(ah)+sq(bh)+I(2)*sq(ih),Rmax=ah+rho*bh;
  I Mw=I(2)*rat(179,125)+I(2)*Rmax+Smax;
  I ma=p-c-rat(67,100)-rat(2,25)*sq(rho);
  I mb=p-c-rat(67,100)*sq(rho)-rat(2,25);
  I common=sq(wh)+I(4)*Smax;
  I sumM=Mw+I(4)*ma+I(4)*mb+I(4)*common+I(8)*Smax;
  I error=sumM*sq(rat(1,32))/I(8);
  I conclusion=I(maxg)+error;
  std::printf("max_corner=%.17g interpolation_error_upper=%.17g defect_upper=%.17g\n",maxg,error.h,conclusion.h);
  assert(count==32&&conclusion.h<0);
  std::puts("PASS CRITICAL FIVE-PARAMETER BOX; inherited profile curvature and kernel comparison required");return 0;
 }
 if(argc==7){
  JP p{I(std::atof(argv[1])),I(std::atof(argv[2])),I(std::atof(argv[3])),I(std::atof(argv[4])),I(std::atof(argv[5]))};
  double tol=std::atof(argv[6]);assert(tol>0);I v=jint(p,tol);
  std::printf("[%.17g, %.17g]\n",v.l,v.h);return 0;
 }
 std::fprintf(stderr,"usage: w A_re A_im B_re B_im tolerance (binary input centers)\n");return 2;
}
