// Agent-ID: codex-a7c4. Refs #431. All-amplitude directional cone.
#include "potential_base.hpp"
int last_lambda=-1;
bool positive_gap(I w,const std::array<I,6>& H){
 I rho=rat(5053,10000),pc=rat(2500,1891)-rat(463,5000);
 I qa=pc-rat(67,100)-rat(2,25)*sq(rho)+sq(w)/2;
 I qb=pc-rat(67,100)*sq(rho)-rat(2,25)+sq(w)/2;
 I cross=-rat(59,100)*rho;
 for(int n=1;n<=48;n++){
  I lam=rat(n,128);bool pass=true;
  for(int j:{0,3}){
   I A=qa-H[j]+rat(7,2)*lam,B=qb-H[j+2]+lam/2,C=cross-H[j+1]+2*lam;
   if(!(A.l>0&&B.l>0&&(A*B-sq(C)).l>0)){pass=false;break;}
  }
  if(pass){last_lambda=n;return true;}
 }
 return false;
}
bool hbound(I w,int limit){
 std::priority_queue<HC,std::vector<HC>,HW>todo;std::array<I,6>sum{};int cells=0;
 auto add=[&](double rl,double rh,double ul,double uh){HC c=hcell(w,rl,rh,ul,uh);todo.push(c);cells++;for(int j=0;j<6;j++)sum[j]=sum[j]+c.val[j];};
 double rs[]={0,.125,.25,.5,1,2,4,8,16,24,32,40};
 for(int k=0;k<11;k++)for(int j=0;j<8;j++)add(rs[k],rs[k+1],j/8.0,(j+1)/8.0);
 for(int j=0;j<6;j++)sum[j]=sum[j]+I(-1e-10,1e-10);
 while(cells<limit&&(cells%100!=0||!positive_gap(w,sum))){
  if(cells%100==0){sum={}; auto cp=todo; while(!cp.empty()){for(int j=0;j<6;j++)sum[j]=sum[j]+cp.top().val[j];cp.pop();} for(auto &v:sum)v=v+I(-1e-10,1e-10);}
  auto c=todo.top();todo.pop();for(int j=0;j<6;j++)sum[j]=I(dnsub(sum[j].l,c.val[j].l),sum[j].h-c.val[j].h);
  if(c.rs>=c.us){double m=(c.rl+c.rh)/2;add(c.rl,m,c.ul,c.uh);add(m,c.rh,c.ul,c.uh);}
  else{double m=(c.ul+c.uh)/2;add(c.rl,c.rh,c.ul,m);add(c.rl,c.rh,m,c.uh);}
 }
 bool pass=positive_gap(w,sum);
 std::printf("%s CONE w=[%a,%a] cells=%d",pass?"PASS":"UNRESOLVED",w.l,w.h,cells);
 for(auto x:sum)std::printf(" [%a,%a]",x.l,x.h);std::printf(" lambda=%d/128\n",last_lambda);std::fflush(stdout);
 return pass;
}

int main(int argc,char**argv){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();
 if(argc==4){double lo=std::stod(argv[1]),hi=std::stod(argv[2]);assert(0<=lo&&lo<=hi&&hi<=11.0/8);int limit=std::stoi(argv[3]);assert(limit>=88&&limit<=300000);return hbound(I(lo,hi),limit)?0:1;}
 return 2;
}
