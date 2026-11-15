// Agent-ID: codex-6e2b. Global function-value secant certificate.
// Requires strict directed-rounding flags from theta_verify.cpp.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreturn-type"
#define main theta_unused_main
#include "theta_verify.cpp"
#undef main
#pragma clang diagnostic pop
#include "localization_circle.hpp"
#include <map>
#include <queue>
#include <tuple>

I piS,secS,remC;
std::array<I,64> cc;
void setup_secant(){
 a=rat(699,1250);b=rat(179,1250);d=rat(2,5);
 piS=I(rat(3141592653589793.0,1e15).l,rat(3141592653589794.0,1e15).h);
 secS=rat(13,20);setup_circle_improved();I total(1);
 for(int k=1;k<=64;k++){cc[k-1]=localization_circle_a[k-1]/I(2*k);total=total+cc[k-1];}
 remC=I(4)/piS-total;assert(remC.l>0);
}
I circleC(double x){
 assert(x>=0&&x<=1);if(x==1)return I(4)/piS;
 I z=sq(I(x)),sum=cc.back();
 for(int k=62;k>=0;k--)sum=sum*z+cc[k];
 I low=I(1)+z*sum,high=low+remC*localization_circle_pow(z,65);
 return {low.l,high.h};
}
I meanNorm(I ell,I v){
 ell.l=std::max(0.0,ell.l);v.l=std::max(0.0,v.l);
 I large(std::max(ell.l,v.l),std::max(ell.h,v.h));
 I small(std::min(ell.l,v.l),std::min(ell.h,v.h));
 if(large.h==0)return I(0);
 if(large.l<=0)return I(0,(ell+v).h);
 I ratio=small/large;ratio.l=std::max(0.0,ratio.l);ratio.h=std::min(1.0,ratio.h);
 return large*I(circleC(ratio.l).l,circleC(ratio.h).h);
}
I ellAt(I t){return sqrtI(t)*(a+b*t);}
struct Point{double rho,x,y;};
I vAt(const Point &p,I t){return sqrtI(sq(I(p.x)+(t-d)*I(p.rho))+sq(I(p.y)));}
I normAt(const Point&p,I t,I ell){return meanNorm(ell,vAt(p,t));}

struct SourceCell{double l,h;I val;double gap;};
struct Wider{bool operator()(const SourceCell&a,const SourceCell&b)const{return a.gap<b.gap;}};
SourceCell sourceCell(const Point&p,double lo,double hi){
 I l(lo),h(hi),width=h-l,el=expneg(l),eh=expneg(h);
 I mass=el-eh;assert(mass.l>0);
 I mu=((l+1)*el-(h+1)*eh)/mass;
 mu.l=std::max(lo,mu.l);mu.h=std::min(hi,mu.h);assert(mu.l<=mu.h);
 I theta=(mu-l)/width;theta.l=std::max(0.0,theta.l);theta.h=std::min(1.0,theta.h);
 I ell_l=ellAt(l),ell_h=ellAt(h),ell_mu=ellAt(mu);
 I chord=(I(1)-theta)*ell_l+theta*ell_h;
 I low,up;
 if((I(3)*b*h-a).h<=0){
  low=normAt(p,mu,chord);
  I slope=(a+I(3)*b*mu)/(I(2)*sqrtI(mu));
  I tan_l=ell_mu+slope*(l-mu),tan_h=ell_mu+slope*(h-mu);
  up=(I(1)-theta)*normAt(p,l,tan_l)+theta*normAt(p,h,tan_h);
 }else if((I(3)*b*l-a).l>=0){
  low=normAt(p,mu,ell_mu);
  up=(I(1)-theta)*normAt(p,l,ell_l)+theta*normAt(p,h,ell_h);
 }else{
  I err=(a+I(3)*b*h)/(I(4)*l*sqrtI(l))*sq(width)/I(8);
  low=normAt(p,mu,chord)-err;
  up=(I(1)-theta)*normAt(p,l,ell_l)+theta*normAt(p,h,ell_h)+err;
 }
 I value(mass.l*0,0); // lower endpoint below is rounded downward explicitly
 value=mass*I(std::max(0.0,low.l),up.h);
 assert(value.l<=value.h);
 return {lo,hi,value,value.h-value.l};
}

long f_calls=0,source_cells=0;
I fpoint(const Point&p,double tol){
 f_calls++;
 const double eps=1.0/1048576;
 I mass=I(1)-expneg(I(eps));
 I anchor=sqrtI(sq(I(p.x)-d*I(p.rho))+sq(I(p.y)));
 I er=rat(2,3)*a*I(eps)*sqrtI(I(eps))+rat(2,5)*b*sq(I(eps))*sqrtI(I(eps))
       +I(p.rho)*sq(I(eps))/I(2);
 I sum=mass*anchor+I(-er.h,er.h);
 double lower=sum.l,upper=sum.h;
 std::priority_queue<SourceCell,std::vector<SourceCell>,Wider> todo;
 auto add=[&](double l,double h){auto cell=sourceCell(p,l,h);lower=dnadd(lower,cell.val.l);upper+=cell.val.h;todo.push(cell);source_cells++;};
 double edges[]={eps,1.0/1024,1.0/256,1.0/64,1.0/16,.25,.5,1,2,4,8,16,32,36};
 for(int k=0;k<13;k++)add(edges[k],edges[k+1]);
 I R=sqrtI(sq(I(p.x))+sq(I(p.y)));
 I tail=expneg(I(36))*(a*37+b*1370+R+I(p.rho)*(I(37)+d));
 upper+=tail.h;
 long count=13;
 while(upper-lower>tol){
  assert(count<20000);
  auto cell=todo.top();todo.pop();double mid=(cell.l+cell.h)/2;
  assert(cell.l<mid&&mid<cell.h);
  lower=dnsub(lower,cell.val.l);upper=upper-cell.val.h;
  add(cell.l,mid);add(mid,cell.h);count++;
 }
 return {lower,upper};
}

struct RadialNode{int numerator;I R,field;};std::vector<RadialNode> radial;
void read_profile(const char*path){
 std::ifstream in(path);assert(in);std::string line;
 int n=0;double scale=0;bool header=false;
 while(std::getline(in,line)){
  if(line.empty()||line[0]=='#')continue;
  std::istringstream stream(line);
  if(!header){stream>>n>>scale;assert(n==602&&scale==1e8);header=true;continue;}
  int idx,r;double lo,hi;stream>>idx>>r>>lo>>hi;assert(stream&&idx==int(radial.size())&&lo<=hi);
  radial.push_back({r,rat(r,scale),I(rat(lo,scale).l,rat(hi,scale).h)});
 }
 assert(radial.size()==602&&radial.front().numerator==0&&radial.back().numerator==600000000);
 for(int k=1;k<602;k++)assert(radial[k-1].numerator<radial[k].numerator);
}
I bzero(double x,double y){
 I R=sqrtI(sq(I(x))+sq(I(y)));if(R.h==0||x==0)return I(0);
 assert(R.h<=6);
 I field;bool init=false;
 for(int k=1;k<int(radial.size());k++){
  auto L=radial[k-1],H=radial[k];
  if(R.h<L.R.l||R.l>H.R.h)continue;
  I clamped(std::max(R.l,L.R.l),std::min(R.h,H.R.h));
  I rrL=L.R,rrH=H.R;
  I theta=(clamped-rrL)/(rrH-rrL);theta.l=std::max(0.0,theta.l);theta.h=std::min(1.0,theta.h);
  I value=(I(1)-theta)*L.field+theta*H.field;
  I err=sq(rrH-rrL)/I(8);value=value+I(-err.h,err.h);
  field=init?hull(field,value):value;init=true;
 }
 assert(init);return I(x)/R*field;
}

using WKey=std::pair<double,double>;using Key=std::tuple<double,double,double>;
std::map<WKey,std::pair<I,I>> base_cache;
std::map<Key,I> point_cache;
I atPoint(const Point&p){
 Key key{p.rho,p.x,p.y};auto found=point_cache.find(key);if(found!=point_cache.end())return found->second;
 I r2=sq(I(p.x))+sq(I(p.y)),value;
 if(r2.l>=36){value=(rat(3603551,5604000)-secS)*sq(I(p.rho));}
 else{
  WKey wk{p.x,p.y};auto base=base_cache.find(wk);
  if(base==base_cache.end()){
   I f0=fpoint({0,p.x,p.y},.00002),b0=bzero(p.x,p.y);
   base=base_cache.emplace(wk,std::make_pair(f0,b0)).first;
  }
  I f1=fpoint(p,.001* p.rho*p.rho);
  value=I(2)*(f1-base->second.first-I(p.rho)*base->second.second)-secS*sq(I(p.rho));
 }
 point_cache.emplace(key,value);return value;
}
struct ParamBox{I rho,x,y;int depth;};
void certify_secant(){
 // The supplied table must be regenerated from certified integrals in this
 // replay chain. All exterior and Hessian prerequisites are in secant_proof.md.
 std::vector<ParamBox> todo{{I(rat(33,200).l,5),I(-6,6),I(0,6),0}};
 long accepted=0,visited=0,pruned=0;int maxdepth=0;
 auto start=std::chrono::steady_clock::now();
 while(!todo.empty()){
  auto box=todo.back();todo.pop_back();visited++;maxdepth=std::max(maxdepth,box.depth);
  if((sq(box.x)+sq(box.y)).l>=36||box.rho.l>=rat(60,13).h){accepted++;pruned++;continue;}
  double dx=box.x.h-box.x.l,dy=box.y.h-box.y.l,dr=box.rho.h-box.rho.l;
  bool pass=false;
  if(dx<=1&&dy<=1&&dr<=1){
   double maxcorner=-INFINITY;
   for(double rr:{box.rho.l,box.rho.h})for(double xx:{box.x.l,box.x.h})for(double yy:{box.y.l,box.y.h})
     maxcorner=std::max(maxcorner,atPoint({rr,xx,yy}).h);
   I error=(rat(179,125)+I(box.rho.h))*(sq(I(dx))+sq(I(dy)))/I(4)+secS*sq(I(dr))/I(4);
   pass=(I(maxcorner)+error).h<=0;
  }
  if(pass){accepted++;continue;}
  assert(box.depth<50);
  double scores[3]={dr*.65,dx*(1.432+box.rho.h),dy*(1.432+box.rho.h)};
  int axis=int(std::max_element(scores,scores+3)-scores);
  auto left=box,right=box;left.depth++;right.depth++;
  I* lo=axis==0?&left.rho:axis==1?&left.x:&left.y;
  I* hi=axis==0?&right.rho:axis==1?&right.x:&right.y;
  double mid=(lo->l+lo->h)/2;lo->h=mid;hi->l=mid;
  todo.push_back(right);todo.push_back(left);
  if(visited%1000==0){std::printf("progress visited=%ld accepted=%ld pruned=%ld pending=%zu depth=%d points=%zu f_calls=%ld source_cells=%ld sec=%.1f\n",visited,accepted,pruned,todo.size(),maxdepth,point_cache.size(),f_calls,source_cells,std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count());std::fflush(stdout);}
 }
 std::printf("PASS GLOBAL SECANT CORE: accepted=%ld visited=%ld pruned=%ld depth=%d points=%zu f_calls=%ld seconds=%.2f\n",accepted,visited,pruned,maxdepth,point_cache.size(),f_calls,std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count());
}
int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();
 if(argc==6&&std::string(argv[1])=="--fpoint"){
  Point p{std::atof(argv[2]),std::atof(argv[3]),std::atof(argv[4])};
  assert(p.rho>=0&&std::atof(argv[5])>0);
  I v=fpoint(p,std::atof(argv[5]));std::printf("C f enclosure [%.17g,%.17g], cells=%ld\n",v.l,v.h,source_cells);return 0;
 }
 if(argc==3&&std::string(argv[1])=="--certify"){read_profile(argv[2]);certify_secant();return 0;}
 std::fprintf(stderr,"usage: --fpoint rho wx wy tolerance, or --certify profile.txt\n");return 2;
}
