// Agent-ID: codex-6e2b. Directed-rounding radial-gradient majorant certificate.
// Compile using the same strict floating-point flags as theta_verify.cpp.
// This reuses only its interval primitives; no stored result is trusted.
// The renamed, unused standalone entry point loses C++'s special implicit
// return rule for main. Suppress only that inclusion's irrelevant warning.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreturn-type"
#define main theta_unused_main
#include "theta_verify.cpp"
#undef main
#pragma clang diagnostic pop
#include "localization_circle.hpp"

I cp;

struct GBox {I rho,x,y;int depth;};
I integrand(const GBox &box,I source){
 I t=sq(source),A=t-d,vx=box.x+A;
 I norm=sqrtI(sq(vx)+sq(box.y));
 I ell=source*(a+b*t), num=box.rho*norm,jj;
 if(box.rho.h==0)jj=I(.5);
 else if(ell.l<=0)jj=I(0,localization_circle_global_cap.h);
 else {I nu=num/ell;jj=jrange_improved(std::max(0.0,nu.l),nu.h);}
 return I(2)*expneg(t)*A*vx/(a+b*t)*jj;
}

I integrate(const GBox &box,int panels){
 assert(panels>0&&(panels&(panels-1))==0);
 I out(0);double h=4.0/panels;
 for(int k=0;k<panels;k++)out=out+integrand(box,I(k*h,(k+1)*h))*I(h);
 // |z_x|<=12, j<=1, y>=4: |integrand|<=2/b e^-y²(y²+12).
 I tail=I(2)/b*(I(2)+rat(1,16)+rat(12,8))*expneg(I(16));
 assert(tail.h<1e-5);
 return out+I(-tail.h,tail.h)-cp*box.x-rat(1,40)*(sq(box.x)+sq(box.y));
}

bool cheap(const GBox &box){
 I z2=sq(box.x)+sq(box.y),target=rat(4,5);
 // b(w,0)/rho - c*z_x = z_x(c0+h-c), using prior profile certificate.
 if(box.rho.h<=.3){
  I value=rat(3,4)+I(rat(-159,1000).l,rat(121,1000).h)*box.x-rat(1,40)*z2;
  if(value.h<=target.l)return true;
 }
 if(box.rho.l>0){
  I value=rat(3,4)/box.rho-cp*box.x-rat(1,40)*z2;
  if(value.h<=target.l)return true;
 }
 return false;
}

void global_check(){
 I target=rat(4,5),B=rat(1,40),P=rat(2500,1891)-rat(9,25);
 // Large rho, after completing the square in z.
 assert((rat(3,2)*(target-sq(cp)/(I(4)*B))).l>rat(3,4).h);
 // Large |z|: split rho<=.3 and rho>=.3. Both quadratics decrease for z>=12.
 assert((rat(3,4)+rat(159,1000)*12-B*144).h<target.l);
 assert((rat(5,2)+cp*12-B*144).h<target.l);
 assert((I(24)*B).l>cp.h&& (I(24)*B).l>rat(159,1000).h);
 assert((B*rat(463,10000)/(P-target)).h<sq(rat(17,200)).l);
 std::puts("C: algebraic exterior regions and .085 localization implication passed.");
 std::vector<GBox> todo{{I(0,1.5),I(-12,12),I(0,12),0}};
 long visited=0,accepted=0,pruned=0;int maxdepth=0;double worst=-1e9;
 auto started=std::chrono::steady_clock::now();
 while(!todo.empty()){
  GBox box=todo.back();todo.pop_back();visited++;maxdepth=std::max(maxdepth,box.depth);
  if(cheap(box)){accepted++;pruned++;continue;}
  double wr=box.rho.h-box.rho.l,wx=box.x.h-box.x.l,wy=box.y.h-box.y.l;
  bool pass=false;
  if(wr<=.10&&wx<=.40&&wy<=.40){
   for(int n:{64,256,1024,4096}){
    I val=integrate(box,n);
    if(val.h<=target.l){pass=true;worst=std::max(worst,val.h);break;}
    bool wide=(wr>.02||wx>.08||wy>.08);
    if(wide&&n==64&&val.h>target.h+.20)break;
    if(wide&&n==256&&val.h>target.h+.10)break;
   }
  }
  if(pass){accepted++;continue;}
  if(box.depth>=70){std::fprintf(stderr,"unresolved rho[%g,%g] x[%g,%g] y[%g,%g]\n",box.rho.l,box.rho.h,box.x.l,box.x.h,box.y.l,box.y.h);std::abort();}
  double scores[3]={wr/.15,wx/.6,wy/.6};
  int axis=int(std::max_element(scores,scores+3)-scores);
  GBox left=box,right=box;left.depth++;right.depth++;
  I *ll=axis==0?&left.rho:axis==1?&left.x:&left.y;
  I *rr=axis==0?&right.rho:axis==1?&right.x:&right.y;
  double mid=(ll->l+ll->h)/2;rr->l=mid;ll->h=mid;
  assert(left.rho.l<=left.rho.h&&left.x.l<=left.x.h&&left.y.l<=left.y.h);
  todo.push_back(right);todo.push_back(left);
  if(visited%1000==0){std::printf("progress visited=%ld accepted=%ld pruned=%ld pending=%zu depth=%d sec=%.1f\n",visited,accepted,pruned,todo.size(),maxdepth,std::chrono::duration<double>(std::chrono::steady_clock::now()-started).count());std::fflush(stdout);}
 }
 std::printf("PASS GLOBAL GRADIENT: m=4/5 c=63/400 B=1/40; accepted=%ld visited=%ld pruned=%ld depth=%d worst_integral_upper=%.17g sec=%.2f\n",accepted,visited,pruned,maxdepth,worst,std::chrono::duration<double>(std::chrono::steady_clock::now()-started).count());
}

int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0&&std::fegetround()==FE_UPWARD);
 a=rat(699,1250);b=rat(179,1250);d=rat(2,5);cp=rat(63,400);setup_circle_improved();
 if(argc==2&&std::string(argv[1])=="--certify"){global_check();return 0;}
 if(argc==6&&std::string(argv[1])=="--point"){
  GBox box{I(std::atof(argv[2])),I(std::atof(argv[3])),I(std::atof(argv[4])),0};
  assert(box.rho.l>=0&&ab(box.x)<=12&&box.y.l>=0&&box.y.h<=12);
  I val=integrate(box,std::atoi(argv[5]));std::printf("C point enclosure [%.17g,%.17g]\n",val.l,val.h);return 0;
 }
 std::fprintf(stderr,"usage --certify or --point rho zx zy power_of_two_panels\n");return 2;
}
