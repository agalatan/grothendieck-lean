# cubic_l1_gram_certificate/verify_identities.py
"""Exact Gaussian-integer polynomial checks. No numerical quadrature or dependencies."""
from fractions import Fraction as Q
from math import factorial
from itertools import product

class Z:
    def __init__(self,r=0,i=0):
        if isinstance(r,Z):self.r,self.i=r.r,r.i
        else:self.r,self.i=Q(r),Q(i)
    def __add__(self,b):
        b=Z(b);return Z(self.r+b.r,self.i+b.i)
    __radd__=__add__
    def __neg__(self):return Z(-self.r,-self.i)
    def __sub__(self,b):return self+-Z(b)
    def __rsub__(self,b):return Z(b)+-self
    def __mul__(self,b):
        b=Z(b);return Z(self.r*b.r-self.i*b.i,self.r*b.i+self.i*b.r)
    __rmul__=__mul__
    def __truediv__(self,b):
        b=Z(b);t=b.r*b.r+b.i*b.i;return self*Z(b.r/t,-b.i/t)
    def conj(self):return Z(self.r,-self.i)
    def __bool__(self):return bool(self.r or self.i)
    def __eq__(self,b):b=Z(b);return self.r==b.r and self.i==b.i
    def real(self):assert self.i==0;return self.r

def add(*ps):
    r={}
    for p in ps:
        for a,c in p.items():r[a]=r.get(a,Z())+c
    return {a:c for a,c in r.items() if c}
def scale(p,c):return {a:c*v for a,v in p.items() if c*v}
def mul(p,q):
    r={}
    for a,c in p.items():
        for b,d in q.items():
            k=tuple(x+y for x,y in zip(a,b));r[k]=r.get(k,Z())+c*d
    return {a:c for a,c in r.items() if c}
def der(p,j):
    r={}
    for a,c in p.items():
        if a[j]:b=list(a);b[j]-=1;r[tuple(b)]=c*a[j]
    return r
def conj(p):
    return {a[len(a)//2:]+a[:len(a)//2]:c.conj() for a,c in p.items()}
def moment(p):
    z=Z()
    for a,c in p.items():
        n=len(a)//2
        if a[:n]==a[n:]:
            for k in a[:n]:c=c*factorial(k)
            z=z+c
    return z
def norm(p):return moment(mul(p,conj(p))).real()
def inner(p,q):return moment(mul(p,conj(q)))
def const(n,c):return {(0,)*(2*n):Z(c)} if c else {}
def var(n,j):
    a=[0]*(2*n);a[j]=1;return {tuple(a):Z(1)}

def check(n,terms,name):
    # terms = (holomorphic index i, index j, antiholomorphic output k, coefficient)
    T=[[[Z() for k in range(n)] for j in range(n)] for i in range(n)]
    for i,j,k,c in terms:
        if i==j:T[i][j][k]=T[i][j][k]+c
        else:T[i][j][k]=T[i][j][k]+Z(c)/2;T[j][i][k]=T[j][i][k]+Z(c)/2
    y=[var(n,j) for j in range(n)];yb=[conj(p) for p in y]
    F=[add(*(scale(mul(y[i],y[j]),T[i][j][k]) for i,j in product(range(n),repeat=2))) for k in range(n)]
    q=add(*(add(mul(yb[k],F[k]),scale(der(F[k],k),-1)) for k in range(n)))
    C=add(*(mul(p,conj(p)) for p in F));c1=add(*(mul(der(q,k),conj(der(q,k))) for k in range(n)))
    V=mul(q,conj(q));u=norm(q);a=add(*(mul(der(q,k),F[k]) for k in range(n)))
    H=[add(*(mul(F[k],der(F[j],k)) for k in range(n))) for j in range(n)]
    K=add(*(mul(der(F[k],j),der(F[j],k)) for j,k in product(range(n),repeat=2)))
    A=norm(K);B=4*sum(norm(p) for p in H);t=norm(C)-u*u
    U=[[sum((4*T[a][j][k]*T[b][j][k].conj() for j,k in product(range(n),repeat=2)),Z()) for b in range(n)] for a in range(n)]
    J=[[sum((2*T[i][j][b]*T[i][j][a].conj() for i,j in product(range(n),repeat=2)),Z()) for b in range(n)] for a in range(n)]
    P=sum((U[i][j]*U[j][i] for i,j in product(range(n),repeat=2)),Z()).real()
    QJ=sum((J[i][j]*J[j][i] for i,j in product(range(n),repeat=2)),Z()).real()
    R=sum((U[i][j]*J[j][i] for i,j in product(range(n),repeat=2)),Z()).real()
    form=lambda M:add(*(scale(add(mul(y[i],yb[j]),const(n,-int(i==j))),M[i][j]) for i,j in product(range(n),repeat=2)))
    C2=form(U);M=form([[U[i][j]+J[i][j] for j in range(n)] for i in range(n)])
    C4=add(C,const(n,-u),scale(C2,-1));N=add(c1,C,const(n,-3*u),scale(M,-2))
    assert moment(C)==u and moment(c1)==2*u
    for i,j in product(range(n),repeat=2):
        assert moment(der(der(V,i),n+j))==U[i][j]+J[i][j]
    delta=norm(V)-2*u*u
    assert delta==A+B+2*t
    assert norm(a)==A+B/4
    assert inner(mul(q,q),a)==A+B/2
    assert inner(C,V).real()-u*u==t+B/4
    assert t==P+QJ and norm(C4)==QJ
    assert norm(M)==P+QJ+2*R
    assert inner(c1,C).real()-2*u*u==P+R+B/4
    assert norm(N)==A/2+B+t-4*R
    assert inner(N,C4)==QJ+B/4-R
    Y=add(c1,scale(C,-1),const(n,-u))
    assert norm(Y)==P+5*QJ+A/2
    D=scale(add(c1,C),Q(1,3));dcov=inner(add(D,const(n,-u)),add(C,const(n,-u))).real()
    assert dcov==(2*P+QJ+R+B/4)/3
    assert norm(add(D,const(n,-u)))==(5*t+4*R+A/2+B)/9
    assert A<=2*P and B<=12*R and QJ<=u*u and P<=4*u*u
    for alpha in [Q(1,4),Q(1,2),Q(1),Q(2),Q(4),Q(8),Q(16),Q(32)]:
        assert R<=(1+alpha)*B/4+(5+3/alpha)*(u*u-QJ)
    print('PASS:',name,'u,A,B,P,Q,R =',u,A,B,P,QJ,R)
    return dict(u=u,A=A,B=B,P=P,Q=QJ,R=R,topcov=inner(add(N,scale(C4,-1)),C4).real())

if __name__=='__main__':
    check(1,[(0,0,0,Z(1,1))],'one-dimensional complex coefficient')
    check(2,[(0,0,0,1),(1,1,0,Z(1,-1)),(0,1,1,Z(-2,1)),(0,0,1,Z(0,1))],'mixed complex coefficients')
    check(3,[(0,1,2,1),(1,2,0,Z(1,1)),(2,2,1,Z(0,1)),(0,0,0,2)],'three-dimensional sparse tensor')
    x=check(2,[(0,0,0,1),(1,1,0,1),(0,1,1,-2)],'counterexample to stronger A bounds')
    assert [x[k]/x['u']**2 for k in ['A','B','P','Q','R']]==[Q(4),Q(4),Q(2),Q(1,2),Q(1)]
    assert x['A']>2*x['u']**2+x['B']/4
    assert x['A']+2*x['Q']>2*x['u']**2+x['B']/3
    z=check(6,[(0,0,2,1),(0,1,3,1),(1,1,4,1),(1,2,5,1),(0,3,5,-1)],'negative fourth-chaos covariance')
    assert [z[k] for k in ['u','A','B','P','Q','R','topcov']]==[7,0,0,74,13,3,-3]
    print('PASS: both failed strengthenings have exact cubic counterexamples.')
