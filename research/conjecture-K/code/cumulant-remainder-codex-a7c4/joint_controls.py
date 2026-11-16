#!/usr/bin/env python3
"""Exact finite-dimensional controls of NP Theorem 8.2.5 (Agent-ID codex-a7c4).

Joint cumulants are computed independently from moments and from all ordered
Malliavin recursions. This tests conventions and examples, not a universal
analytic theorem. All polynomials are in two independent N(0,1) variables.
"""
from fractions import Fraction as Q
from functools import lru_cache
from itertools import combinations, permutations, product
from math import factorial, comb, prod
import json


def check(condition, message):
    if not condition:
        raise AssertionError(message)


def add(*polys):
    out = {}
    for p in polys:
        for powers, coefficient in p.items():
            out[powers] = out.get(powers, Q(0))+coefficient
    return {k:v for k,v in out.items() if v}


def scale(p, c):
    return {k:c*v for k,v in p.items() if c*v}


def mul(p, q):
    out = {}
    for a, x in p.items():
        for b, y in q.items():
            k = tuple(i+j for i,j in zip(a,b))
            out[k] = out.get(k,Q(0))+x*y
    return {k:v for k,v in out.items() if v}


def derivative(p, j):
    return {tuple(n-(i==j) for i,n in enumerate(k)):v*k[j]
            for k,v in p.items() if k[j]}


def moment(p):
    def normal(n):
        return Q(0) if n%2 else Q(factorial(n),2**(n//2)*factorial(n//2))
    return sum(v*prod(normal(n) for n in k) for k,v in p.items())


@lru_cache(None)
def hermite(n):
    return tuple((n-2*j,Q((-1)**j*factorial(n),2**j*factorial(j)*factorial(n-2*j)))
                 for j in range(n//2+1))


def to_hermite(p):
    out = {}
    for powers,c in p.items():
        for js in product(*(range(n//2+1) for n in powers)):
            degrees = tuple(n-2*j for n,j in zip(powers,js))
            value = c*prod(Q(factorial(n),2**j*factorial(j)*factorial(n-2*j))
                           for n,j in zip(powers,js))
            out[degrees] = out.get(degrees,Q(0))+value
    return {k:v for k,v in out.items() if v}


def from_hermite(p):
    out = {}
    for powers,c in p.items():
        for terms in product(*(hermite(n) for n in powers)):
            k = tuple(n for n,v in terms)
            out[k] = out.get(k,Q(0))+c*prod(v for n,v in terms)
    return {k:v for k,v in out.items() if v}


def project(p, order):
    return from_hermite({k:v for k,v in to_hermite(p).items() if sum(k)==order})


def minus_inverse_ou(p):
    # The constant is killed; centering must not be omitted at later stages.
    return from_hermite({k:v/sum(k) for k,v in to_hermite(p).items() if sum(k)})


class Joint:
    def __init__(self, fields):
        self.fields=fields

    @lru_cache(None)
    def raw(self, word):
        p={(0,0):Q(1)}
        for j in word:
            p=mul(p,self.fields[j])
        return moment(p)

    @lru_cache(None)
    def cumulant(self, word):
        # Partition by the block containing the first labelled entry. This
        # uses only moments, independently of OU operators and derivatives.
        if len(word)==1:
            return self.raw(word)
        answer=self.raw(word)
        tail=range(1,len(word))
        for size in range(len(word)-1):
            for selected in combinations(tail,size):
                block=(word[0],)+tuple(word[j] for j in selected)
                rest=tuple(word[j] for j in tail if j not in selected)
                answer-=self.cumulant(tuple(sorted(block)))*self.raw(tuple(sorted(rest)))
        return answer

    @lru_cache(None)
    def gamma(self, word):
        if len(word)==1:
            return self.fields[word[0]]
        inverse=minus_inverse_ou(self.gamma(word[:-1]))
        return add(*(mul(derivative(self.fields[word[-1]],i),derivative(inverse,i))
                     for i in range(2)))

    def book_cumulant(self, word):
        # Repetitions remain labelled in the permutation sum in Thm 8.2.5.
        return sum(moment(self.gamma((word[0],)+p)) for p in permutations(word[1:]))


def main():
    f={(3,0):Q(1),(1,2):Q(1),(1,0):Q(-4)}
    x={(1,0):Q(1)}
    q={(2,0):Q(1),(0,0):Q(-1),(1,1):Q(1)}
    joint=Joint((f,x,q))
    words=[(0,)*j for j in range(2,7)] + [(0,1,2),(0,1,1,1),
            (0,0,1,1),(0,0,2,2),(0,1,1,2,2),(0,0,1,1,2,2)]
    cumulants={}
    for word in words:
        a,b=joint.cumulant(word),joint.book_cumulant(word)
        check(a==b, f'joint cumulant mismatch {word}')
        cumulants[','.join(map(str,word))]=str(a)
    check(joint.cumulant((0,1,2))==6, 'mixed third cumulant must survive')
    check(joint.cumulant((0,1,1,1))==6, 'mixed fourth cumulant must survive')
    check(joint.raw((0,1))==0 and joint.raw((0,2))==0, 'chaos orthogonality')
    reverse=Joint((f,x,scale(q,-1)))
    check(reverse.book_cumulant((0,1,2))==-6, 'retain the mixed sign')
    check(joint.raw((0,0))==8, 'variance normalization')

    # U=||D(F0/sqrt(8))||²-3. This avoids irrational coefficients.
    u=add(scale(add(*(mul(derivative(f,i),derivative(f,i)) for i in range(2))),Q(1,8)),
          {(0,0):Q(-3)})
    u2,u4=project(u,2),project(u,4)
    check(add(u2,u4)==u, 'U has exactly orders 2 and 4')
    a2,b2=moment(mul(u2,u2)),moment(mul(u4,u4))
    k4=joint.cumulant((0,)*4)/64
    check(a2/2+b2==k4 and b2<=Q(3,4)*a2, 'variance-ratio identity')
    ujoint=Joint((u2,u4))
    joint_fourths={}
    for n in range(5):
        word=(0,)*(4-n)+(1,)*n
        c=ujoint.cumulant(word)
        check(c==ujoint.book_cumulant(word),'U joint fourth cumulant')
        joint_fourths[','.join(map(str,word))]=str(c)
    projections={}
    for j,uj in [(2,u2),(4,u4)]:
        for k,uk in [(2,u2),(4,u4)]:
            squares=[]
            for ell in range(0,9,2):
                pl=project(mul(uj,uk),ell)
                norm2=moment(mul(pl,pl))
                r=(j+k-ell)//2
                c2=(Q(factorial(r)**2*comb(j,r)**2*comb(k,r)**2*factorial(ell),
                      factorial(j)*factorial(k)) if 0<=r<=min(j,k) else Q(0))
                check(norm2<=c2*moment(mul(uj,uj))*moment(mul(uk,uk)),
                      'spectral product bound')
                squares.append(norm2)
            check(sum(squares)==moment(mul(mul(uj,uj),mul(uk,uk))), 'orthogonal norm sum')
            projections[f'{j},{k}']=[str(t) for t in squares]

    # Gaussian variables have all these higher cumulants zero, so replacing
    # just the covariance matrix cannot reproduce the nonzero mixed terms.
    normal=Joint((x,{(0,1):Q(1)}))
    check(normal.book_cumulant((0,0,1,1))==0,'Gaussian fourth control')
    result={'agent_id':'codex-a7c4','status':'PASS exact finite polynomial controls; not a general proof',
            'raw_cubic':'x^3+x*y^2-4*x, variance 8',
            'joint_cumulants':cumulants,'U_joint_fourth_cumulants':joint_fourths,
            'projection_norm_squares':projections,
            'U2_norm_square':str(a2),'U4_norm_square':str(b2),
            'fourth_cumulant_unit_variance':str(k4),
            'rejection_controls':['dropping mixed third','dropping mixed fourth',
                                  'dropping signs','equating orthogonality with independence']}
    print(json.dumps(result,indent=2))


if __name__=='__main__':
    main()
