// codex-c7e2-round2/root/check_two_coordinate_radius.mjs — Agent-ID: codex-c7e2.
import assert from 'node:assert/strict';
const gcd=(a,b)=>{a=a<0n?-a:a;b=b<0n?-b:b;while(b){[a,b]=[b,a%b];}return a;};
class Q {
  constructor(n,d=1n){n=BigInt(n);d=BigInt(d);assert(d!==0n);if(d<0n){n=-n;d=-d;}const g=gcd(n,d);this.n=n/g;this.d=d/g;}
  add(x){x=asQ(x);return new Q(this.n*x.d+x.n*this.d,this.d*x.d);}
  sub(x){x=asQ(x);return new Q(this.n*x.d-x.n*this.d,this.d*x.d);}
  mul(x){x=asQ(x);return new Q(this.n*x.n,this.d*x.d);}
  div(x){x=asQ(x);return new Q(this.n*x.d,this.d*x.n);}
  eq(x){x=asQ(x);return this.n===x.n&&this.d===x.d;}
  positive(){return this.n>0n;}
  toString(){return `${this.n}/${this.d}`;}
}
const asQ=x=>x instanceof Q?x:new Q(x);
const choose=(n,k)=>{let a=1n;for(let j=1;j<=k;j++)a=a*BigInt(n-j+1)/BigInt(j);return a;};
const J=[];
for(let k=0;k<=3;k++){
  let total=new Q(0);
  for(let j=0;j<=k;j++) total=total.add(new Q(
    choose(k,j)*((k-j)%2?-1n:1n)*(2n**BigInt(2*j+1)-1n),BigInt(2*j+1)));
  J.push(total.mul(new Q(4,3n**BigInt(k+1))));
}
const expectedJ=[new Q(4,3),new Q(16,27),new Q(152,405),new Q(776,2835)];
J.forEach((x,i)=>assert(x.eq(expectedJ[i])));
const I=p=>p.reduce((sum,c,k)=>sum.add(J[k].mul(c)),new Q(0));
const R=new Q(7,12),g1=new Q(3,4),g2=new Q(15,8),g3=new Q(105,16);
const aa=R.mul(g3.mul(I([0,0,0,1])).sub(g2.mul(I([0,0,4]))).add(g1.mul(I([0,4])))).div(2);
const bb=R.mul(g3.mul(I([0,1,-2,1])).sub(g2.mul(I([0,2,-2]))).add(g1.mul(I([0,1]))));
// The off-diagonal entry is sqrt(2)*ab, so its square is 2*ab^2.
const ab=R.mul(g3.mul(I([0,0,1,-1])).sub(g2.mul(I([0,2,-1]))).add(g1.mul(I([0,2])))).div(2);
const cc=R.mul(g3).mul(I([1,-7,15,-9])).div(6);
const bdiag=R.mul(g3).mul(I([0,0,1,-1])).div(2);
const pdiag=R.mul(g3).mul(I([0,1,-2,1])).div(2);
assert(aa.eq(new Q(287,1296)));assert(bb.eq(new Q(49,216)));
assert(ab.eq(new Q(7,648)));assert(cc.eq(new Q(581,2592)));
assert(bdiag.eq(new Q(7,36)));assert(pdiag.eq(new Q(287,1296)));
const target=new Q(6,25),da=target.sub(aa),db=target.sub(bb);
const determinant=da.mul(db).sub(ab.mul(ab).mul(2));
assert(da.eq(new Q(601,32400)));assert(db.eq(new Q(71,5400)));
assert(determinant.eq(new Q(5513,524880000)));
assert(da.positive()&&db.positive()&&determinant.positive());
for(const d of [cc,bdiag,pdiag])assert(target.sub(d).positive());
assert(new Q(1,4).sub(target).positive());
console.log(JSON.stringify({agent_id:'codex-c7e2',status:'PASS',
  radius_squared_bound:'6*pi/25',J:J.map(String),determinant:String(determinant)}));
