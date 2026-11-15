// Agent-ID: codex-6e2b. Angular metric bound from an absolute OU barrier.
// Strict directed-rounding flags are mandatory, as in theta_verify.cpp.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreturn-type"
#define main theta_unused_main
#include "theta_verify.cpp"
#undef main
#pragma clang diagnostic pop

std::vector<std::array<I,4>> barrier;
I capA=rat(3,5),tailA=rat(9,25);
void read_barrier(const char*path){
 std::ifstream in(path);assert(in);std::string line;int n=0;double scale=0;bool header=false;
 while(std::getline(in,line)){
  if(line.empty()||line[0]=='#')continue;
  std::istringstream stream(line);
  if(!header){double cn,cd;stream>>n>>scale>>cn>>cd;assert(stream&&n==500&&scale==1e15&&cn>0&&cd>0);capA=rat(cn,cd);assert(capA.h<=rat(13,20).h);header=true;continue;}
  int idx;stream>>idx;assert(idx==int(barrier.size()));std::array<I,4> c;
  for(int k=0;k<4;k++){double lo,hi;stream>>lo>>hi;assert(stream&&lo<=hi);c[k]=I(rat(lo,scale).l,rat(hi,scale).h);}
  barrier.push_back(c);
 }
 assert(barrier.size()==500);
}

I W(I x){
 assert(x.l>=0);
 if(x.l>=1)return tailA;
 I answer;bool init=false;
 int first=std::max(0,int(std::floor(x.l*500))-1);
 int last=std::min(499,int(std::floor(std::min(1.0,x.h)*500))+1);
 for(int j=first;j<=last;j++){
  I lo=rat(j,500),hi=rat(j+1,500);
  if(x.h<lo.l||x.l>hi.h)continue;
  I arg(std::max(x.l,lo.l),std::min(x.h,hi.h));
  I z=(arg-lo)*500;z.l=std::max(0.0,z.l);z.h=std::min(1.0,z.h);
  assert(z.l<=z.h);
  auto c=barrier[j];I value=((c[3]*z+c[2])*z+c[1])*z+c[0];
  answer=init?hull(answer,value):value;init=true;
 }
 if(x.h>=1){answer=init?hull(answer,tailA):tailA;init=true;}
 assert(init);
 // Nonnegativity and the cap are certified by the differential barrier.
 answer.l=std::max(0.0,answer.l);answer.h=std::min(capA.h,answer.h);
 assert(answer.l<=answer.h);return answer;
}

struct AngleCell{I c,wa,wb;};std::vector<AngleCell> angular;
void setup_angles(int n){
 I pi(rat(3141592653589793.0,1e15).l,rat(3141592653589794.0,1e15).h);
 I step=pi/I(2*n);
 for(int i=0;i<n;i++){
  I l=pi*rat(i,2*n),h=pi*rat(i+1,2*n);
  I cl=trig(l,true),ch=trig(h,true),sl=trig(l,false),sh=trig(h,false);
  I c(std::max(0.0,ch.l),std::min(1.0,cl.h));
  I s(std::max(0.0,sl.l),std::min(1.0,sh.h));
  angular.push_back({c,step*c*sq(c),step*c*sq(s)});
 }
}

double angular_bound(I R){
 int n=int(angular.size());std::vector<I> va(n),vb(n),sa(n+1),sb(n+1);
 for(int j=0;j<n;j++){
  I v=W(R*angular[j].c);va[j]=angular[j].wa*v;vb[j]=angular[j].wb*v;
 }
 for(int j=n-1;j>=0;j--){sa[j]=sa[j+1]+va[j];sb[j]=sb[j+1]+vb[j];}
 double upper=(rat(2,3)*sq(sb[0])).h;
 I pa(0),pb(0);
 for(int j=0;j<n;j++){
  // Every one-switch sign pattern with switch in this angular cell:
  // complete prefix - complete suffix + an unknown signed cell integral.
  I A=pa-sa[j+1]+I(-va[j].h,va[j].h);
  I B=pb-sb[j+1]+I(-vb[j].h,vb[j].h);
  I metric=(I(3)*sq(A)-I(2)*A*B+I(3)*sq(B))/I(12);
  upper=std::max(upper,metric.h);
  pa=pa+va[j];pb=pb+vb[j];
 }
 return upper;
}

void tail_check(I goal){
 // R>=2: W(R cos(theta)) <= .36+(.65-.36) 1_{cos(theta)<=1/2}.
 I s=sqrtI(rat(3,4));
 I ca=rat(2,3)-s+sq(s)*s/I(3);
 I cb=(I(1)-sq(s)*s)/I(3);
 I aa=tailA*rat(2,3)+(capA-tailA)*ca;
 I bb=tailA/I(3)+(capA-tailA)*cb;
 assert(aa.h<rat(49,200).l&&bb.h<rat(31,200).l);
 I coarse=(I(3)*sq(aa)+I(2)*aa*bb+I(3)*sq(bb))/I(12);
 assert(coarse.h<rat(3,100).l&&coarse.h<goal.l);
 assert((rat(2,3)*sq(bb)).h<goal.l);
 std::printf("C angular tail R>=2: coefficient upper %.17g\n",coarse.h);
}

int main(int argc,char**argv){
 assert(argc==4||argc==5);assert(std::fesetround(FE_UPWARD)==0);
 capA=rat(3,5);tailA=rat(9,25);
 read_barrier(argv[1]);I goal=rat(std::atof(argv[2]),std::atof(argv[3]));
 int n=argc==5?std::atoi(argv[4]):8192;assert(n>=1024);
 setup_angles(n);tail_check(goal);
 struct Cell{I R;int depth;};std::vector<Cell> pending;
 for(int j=0;j<400;j++)pending.push_back({I(rat(j,200).l,rat(j+1,200).h),0});
 long accepted=0,visited=0;int maxdepth=0;double worst=0;
 auto start=std::chrono::steady_clock::now();
 while(!pending.empty()){
  Cell cell=pending.back();pending.pop_back();visited++;
  double bound=angular_bound(cell.R);
  if(bound<=goal.l){accepted++;worst=std::max(worst,bound);continue;}
  if(cell.depth>=16){std::fprintf(stderr,"FAIL angular R [%.17g,%.17g] upper %.17g\n",cell.R.l,cell.R.h,bound);return 1;}
  double mid=(cell.R.l+cell.R.h)/2;assert(cell.R.l<mid&&mid<cell.R.h);
  pending.push_back({I(cell.R.l,mid),cell.depth+1});pending.push_back({I(mid,cell.R.h),cell.depth+1});
  maxdepth=std::max(maxdepth,cell.depth+1);
 }
 std::printf("PASS ANGULAR METRIC: coefficient<=%.17g accepted=%ld visited=%ld angular_cells=%d maxdepth=%d largest_accepted=%.17g seconds=%.2f\n",goal.h,accepted,visited,n,maxdepth,worst,std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count());
}
