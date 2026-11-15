// odd_sector_certificate/certify.cpp
#include <algorithm>
#include <array>
#include <cmath>
#include <cfenv>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <string>
#include <vector>
using namespace std;
// All elementary interval arithmetic is rounded outwards using nextafter.
// No transcendental library value is used without an arithmetic certificate.
static inline double dn(double x){return nextafter(x,-INFINITY);}
static inline double up(double x){return nextafter(x, INFINITY);}
struct I{double l,h; I():l(0),h(0){} I(double a):l(a),h(a){} I(double a,double b):l(a),h(b){} };
static inline I operator+(I x,I y){return {dn(x.l+y.l),up(x.h+y.h)};}
static inline I operator-(I x,I y){return {dn(x.l-y.h),up(x.h-y.l)};}
static inline I operator-(I x){return {-x.h,-x.l};}
static inline I operator*(I x,I y){double a=x.l*y.l,b=x.l*y.h,c=x.h*y.l,d=x.h*y.h;return {dn(min(min(a,b),min(c,d))),up(max(max(a,b),max(c,d)))};}
static inline I operator/(I x,I y){if(y.l<=0&&y.h>=0)throw runtime_error("zero denominator");return x*I(dn(1/y.h),up(1/y.l));}
static inline I sq(I x){if(x.l>=0)return {dn(x.l*x.l),up(x.h*x.h)};if(x.h<=0)return {dn(x.h*x.h),up(x.l*x.l)};return {0,up(max(x.l*x.l,x.h*x.h))};}
static inline double mag(I x){return max(abs(x.l),abs(x.h));}
static inline I sqrti(I x){
 if(x.l<0)throw runtime_error("negative sqrt");
 I r(dn(sqrt(x.l)),up(sqrt(x.h)));
 if(sq(I(r.l)).h>x.l || sq(I(r.h)).l<x.h)throw runtime_error("sqrt enclosure not verified");
 return r;
}
static const I a=I(699)/I(1250),b=I(179)/I(1250),sqrt2=sqrti(I(2));
static I phi(I t){I h=a+b*t;return t*sq(h);}
static I rootpoint(double s){
 if(s==0)return I(0);
 double ad=699./1250,bd=179./1250;
 // Library cbrt supplies an initial guess only. Final brackets are verified.
 double t=min(s/(ad*ad),cbrt(s/(bd*bd)));
 for(int j=0;j<15;j++)t-= (t*(ad+bd*t)*(ad+bd*t)-s)/((ad+bd*t)*(ad+3*bd*t));
 double eps=1e-12*(1+abs(t));
 for(int j=0;j<50;j++,eps*=2){
  double lo=max(0.,dn(t-eps)),hi=up(t+eps);
  if(phi(I(lo)).h<=s && phi(I(hi)).l>=s)return I(lo,hi);
 }
 throw runtime_error("root not bracketed");
}
static I root(I s){return {rootpoint(max(0.,s.l)).l,rootpoint(s.h).h};}
static I exppoint(double t){
 // Alternating Taylor series for exp(-t/64), with 22/23 terms,
 // then six squarings. All inputs in this certificate have 0 <= t < 64.
 if(t<0||t>=64)throw runtime_error("exp argument out of range");
 I x=I(t)/I(64),term(1),sum(1),even;
 for(int j=1;j<=23;j++){term=term*(-x)/I(j);sum=sum+term;if(j==22)even=sum;}
 I res(sum.l,even.h);
 if(res.l<=0)throw runtime_error("exp Taylor failed");
 for(int j=0;j<6;j++)res=sq(res);
 return res;
}
static I expneg(I t){return {exppoint(t.h).l,exppoint(max(0.,t.l)).h};}
struct J{I v,d,e;J(I v_=I(0),I d_=I(0),I e_=I(0)):v(v_),d(d_),e(e_){} };
static J operator+(J x,J y){return {x.v+y.v,x.d+y.d,x.e+y.e};}
static J operator-(J x,J y){return {x.v-y.v,x.d-y.d,x.e-y.e};}
static J operator*(J x,J y){return {x.v*y.v,x.d*y.v+x.v*y.d,x.e*y.v+I(2)*x.d*y.d+x.v*y.e};}
static J jsq(J x){return {sq(x.v),I(2)*x.v*x.d,I(2)*(sq(x.d)+x.v*x.e)};}
static array<J,6> polys(J rho,J c,J s,J w){
 J x=rho*c-w,y=rho*s,z2=jsq(x)+jsq(y);
 J v0=x*c+y*s,v1=x*c-y*s,v2=x*s-y*c,v3=x*s+y*c;
 J xy=jsq(x)-jsq(y),half(I(.5));
 return {z2-half*jsq(v0),xy-half*(v0*v1),z2-half*jsq(v1),z2-half*jsq(v2),xy-half*(v2*v3),z2-half*jsq(v3)};
}
static array<J,6> polynomials(J rho,J c,J s,J w){
 return polys(rho,c,s,w);
}
struct Den{array<I,3> f,fs,fss;};
static Den density(I s){
 I t=root(s),h=a+b*t,h3=a+I(3)*b*t,g=h*h3,gp=I(4)*a*b+I(6)*sq(b)*t;
 I f=expneg(t)/(h*h*h*h3),logd=-I(1)-I(3)*b/h-I(3)*b/h3;
 I ft=f*logd,ftt=f*(sq(logd)+I(3)*sq(b)/sq(h)+I(9)*sq(b)/sq(h3));
 I d=(t-I(2))/sqrt2;
 Den den;
 den.f={f,f*d,f*sq(d)};
 array<I,3> dt={ft,ft*d+f/sqrt2,ft*sq(d)+sqrt2*f*d};
 array<I,3> dtt={ftt,ftt*d+sqrt2*ft,ftt*sq(d)+I(2)*sqrt2*ft*d+f};
 for(int j=0;j<3;j++){den.fs[j]=dt[j]/g;den.fss[j]=(dtt[j]*g-dt[j]*gp)/(g*g*g);}
 return den;
}
struct Trig{I c,s,cm,sm;};
static vector<Trig> trigread(string path,int n){
 ifstream f(path);int nn;f>>nn;if(nn!=n)throw runtime_error("trig size mismatch");vector<Trig> ts(n);
 for(auto &t:ts)f>>t.c.l>>t.c.h>>t.s.l>>t.s.h>>t.cm.l>>t.cm.h>>t.sm.l>>t.sm.h;
 if(!f)throw runtime_error("bad trig table");return ts;
}
static const int polyid[6]={0,1,0,2,1,0};
static const int denid[6]={0,0,1,0,1,2};
static const int rowid[6]={0,0,0,1,1,2},colid[6]={0,1,2,1,2,2};
using Mat= array<array<I,3>,3>;
static bool pd(Mat m){
 for(int k=0;k<3;k++){
  if(m[k][k].l<=0)return false;
  for(int i=k+1;i<3;i++)for(int j=i;j<3;j++){
   m[i][j]=m[i][j]-m[i][k]*m[k][j]/m[k][k];m[j][i]=m[i][j];
  }
 }
 return true;
}
static double bound(Mat m,double extra){
 // C_{Q,nu}=-3/10 in the real block, -3/5 in the imaginary block
 // has already been subtracted from m by the caller.
 double lo=0,hi=5;
 for(int j=0;j<36;j++){
  double mid=(lo+hi)/2;Mat z;
  for(int k=0;k<3;k++)for(int l=0;l<3;l++)z[k][l]=(k==l?I(mid)-I(extra):I(0))-m[k][l];
  if(pd(z))hi=mid;else lo=mid;
 }
 return hi;
}
int main(int argc,char**argv){
 static_assert(numeric_limits<double>::is_iec559 && numeric_limits<double>::radix==2 && numeric_limits<double>::digits==53);
 if(fegetround()!=FE_TONEAREST)throw runtime_error("round-to-nearest mode required");
 if(argc<8){cerr<<"usage: certify NR NT NW start end trig_table output\n";return 2;}
 int nr=atoi(argv[1]),nt=atoi(argv[2]),nw=atoi(argv[3]),start=atoi(argv[4]),end=atoi(argv[5]);
 auto ts=trigread(argv[6],nt);ofstream out(argv[7]);out<<setprecision(17);
 I dr=I(24)/I(nr),dw=I(8)/I(nw),weight=I(2)*dr/I(nt);
 I pi=I(3.141592653589793,3.1415926535897936);
 I er=sq(dr)/I(24),et=sq(pi/I(nt))/I(24),ew=sq(dw)/I(8);
 // rho >=24 and w<=8 imply |L|>=16 > sqrt(20)(a+20b).
 I tail=I(3863)*expneg(I(20))/I(24);
 double global=0;
 for(int iw=start;iw<end;iw++){
  I wlo=I(8)*I(iw)/I(nw),whi=I(8)*I(iw+1)/I(nw),w(wlo.l,whi.h);
  array<array<array<I,6>,2>,2> sums{};
  array<array<I,6>,2> errors{};
  array<array<array<I,6>,2>,3> debug_errors{};
  for(int ir=0;ir<nr;ir++){
   I rlo=I(24)*I(ir)/I(nr),rhi=I(24)*I(ir+1)/I(nr),rho(rlo.l,rhi.h),rm=I(24)*I(2*ir+1)/I(2*nr);
   for(int it=0;it<nt;it++){
    auto tr=ts[it];
    I xx=rho*tr.c-w,yy=rho*tr.s;
    Den den=density(sq(xx)+sq(yy));
    array<array<J,6>,3> pol;
    array<J,3> sj;
    for(int dir=0;dir<3;dir++){
     J rj(rho,dir==0?I(1):I(0)),cj(tr.c,dir==1?-tr.s:I(0),dir==1?-tr.c:I(0)),ssj(tr.s,dir==1?tr.c:I(0),dir==1?-tr.s:I(0)),wj(w,dir==2?I(1):I(0));
     pol[dir]=polynomials(rj,cj,ssj,wj);
     sj[dir]=jsq(rj*cj-wj)+jsq(rj*ssj);
    }
    for(int bl=0;bl<2;bl++)for(int idx=0;idx<6;idx++){
     int ip=polyid[idx]+3*bl,j=denid[idx];I err(0);
     for(int dir=0;dir<3;dir++){
      J pp=pol[dir][ip],sp=sj[dir];
      I dd=den.fss[j]*sq(sp.d)*pp.v+den.fs[j]*sp.e*pp.v+I(2)*den.fs[j]*sp.d*pp.d+den.f[j]*pp.e;
      I ef=dir==0?er:(dir==1?et:ew);
      err=err+ef*I(mag(dd));
      debug_errors[dir][bl][idx]=debug_errors[dir][bl][idx]+weight*ef*I(mag(dd));
     }
     errors[bl][idx]=errors[bl][idx]+weight*err;
    }
    for(int ep=0;ep<2;ep++){
     I wp=ep==0?wlo:whi;
     I xp=rm*tr.cm-wp,yp=rm*tr.sm;
     Den dd=density(sq(xp)+sq(yp));
     auto polp=polynomials(J(rm),J(tr.cm),J(tr.sm),J(wp));
     for(int bl=0;bl<2;bl++)for(int idx=0;idx<6;idx++)sums[ep][bl][idx]=sums[ep][bl][idx]+weight*dd.f[denid[idx]]*polp[polyid[idx]+3*bl].v;
    }
   }
  }
  double cellmax=0,maxerr=0;
  for(int bl=0;bl<2;bl++){
   array<I,3> rows{};
   for(int idx=0;idx<6;idx++){
    int ri=rowid[idx],ci=colid[idx];rows[ri]=rows[ri]+errors[bl][idx];if(ri!=ci)rows[ci]=rows[ci]+errors[bl][idx];
   }
   double extra=up(max({rows[0].h,rows[1].h,rows[2].h})+tail.h);maxerr=max(maxerr,extra);
   for(int ep=0;ep<2;ep++){
    Mat m{};for(int idx=0;idx<6;idx++){int ri=rowid[idx],ci=colid[idx];m[ri][ci]=m[ci][ri]=sums[ep][bl][idx];}
    m[0][2]=m[0][2]+(bl==0?I(3)/I(10):I(3)/I(5));m[2][0]=m[0][2];
    cellmax=max(cellmax,bound(m,extra));
   }
  }
  global=max(global,cellmax);
  cout<<" error_directions";
  for(int dir=0;dir<3;dir++){double mx=0;for(int bl=0;bl<2;bl++){array<I,3> rr{};for(int ix=0;ix<6;ix++){int ri=rowid[ix],ci=colid[ix];rr[ri]=rr[ri]+debug_errors[dir][bl][ix];if(ri!=ci)rr[ci]=rr[ci]+debug_errors[dir][bl][ix];}mx=max(mx,max({rr[0].h,rr[1].h,rr[2].h}));}cout<<" "<<mx;}cout<<endl;
  out<<iw<<" "<<w.l<<" "<<w.h<<" "<<cellmax<<" "<<maxerr<<"\n";out.flush();
  cout<<setprecision(10)<<iw<<" r=["<<w.l<<","<<w.h<<"] bound="<<cellmax<<" error="<<maxerr<<" global="<<global<<endl;
 }
}
