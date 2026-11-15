// Agent-ID: codex-a7c4. Bivariate Taylor coefficients, degree <=2 per variable.
// The variables are shift and one source coordinate. Coefficients include factorials.
struct MJ {
 std::array<I,9> c{};
 MJ(I v=0){c[0]=v;}
 I& at(int i,int j){return c[3*i+j];}
 I at(int i,int j)const{return c[3*i+j];}
};
MJ operator+(MJ x,MJ y){for(int i=0;i<9;i++)x.c[i]=x.c[i]+y.c[i];return x;}
MJ operator-(MJ x){for(auto&c:x.c)c=-c;return x;}
MJ operator-(MJ x,MJ y){return x+(-y);}
MJ operator*(MJ x,MJ y){
 MJ z;
 for(int i=0;i<3;i++)for(int j=0;j<3;j++)
  for(int k=0;k<=i;k++)for(int l=0;l<=j;l++)z.at(i,j)=z.at(i,j)+x.at(k,l)*y.at(i-k,j-l);
 return z;
}
MJ inverse(MJ x){
 MJ z;z.c[0]=1/x.c[0];
 for(int n=1;n<=4;n++)for(int i=0;i<3;i++)for(int j=0;j<3;j++)if(i+j==n){
  I v(0);for(int k=0;k<=i;k++)for(int l=0;l<=j;l++)if(k+l>0)v=v+x.at(k,l)*z.at(i-k,j-l);
  z.at(i,j)=-v/x.c[0];
 }
 return z;
}
MJ operator/(MJ x,MJ y){return x*inverse(y);}
MJ mex(MJ x){
 MJ d=x;d.c[0]=I(0);MJ power(I(1)),ans;I factorial(1);
 for(int n=0;n<=4;n++){if(n){power=power*(-d);factorial=factorial*n;}ans=ans+power*MJ(1/factorial);}
 return ans*MJ(expneg(x.c[0]));
}
MJ mtrig(MJ x,bool cosine){
 MJ d=x;d.c[0]=I(0);MJ power(I(1)),ans;I factorial(1),co=trig(x.c[0],true),si=trig(x.c[0],false);
 for(int n=0;n<=4;n++){
  if(n){power=power*d;factorial=factorial*n;}
  I deriv=cosine?(n%4==0?co:n%4==1?-si:n%4==2?-co:si):(n%4==0?si:n%4==1?co:n%4==2?-si:-co);
  ans=ans+power*MJ(deriv/factorial);
 }
 return ans;
}
MJ mt(MJ v){
 I val=v.c[0];val.l=std::max(0.,val.l);MJ t(I(tpoint(val.l).l,tpoint(val.h).h));
 I deriv=(a+b*t.c[0])*(a+3*b*t.c[0]);
 for(int n=1;n<=4;n++)for(int i=0;i<3;i++)for(int j=0;j<3;j++)if(i+j==n){
  MJ aa=MJ(a)+MJ(b)*t;MJ f=t*aa*aa;
  t.at(i,j)=(v.at(i,j)-f.at(i,j))/deriv;
 }
 return t;
}
