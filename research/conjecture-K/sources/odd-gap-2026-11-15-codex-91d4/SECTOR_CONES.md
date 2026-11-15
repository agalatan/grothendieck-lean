<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/odd-gap-continuation/SECTOR_CONES.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Intermediate odd energies in sector-dominant cones

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P, author only; rational comparisons C.** These are sufficient regions
under the unchanged task caps and arbitrary sharing. They do not cover
the remaining odd-energy gap. The two scalar remote-potential bounds
are inherited from reviewed STATUS 7.2.6 / ODD_CONTROL, not proved anew.

## A finite perturbation estimate across the A/B shells

Keep the fixed trial and set

```
Y=L+q, X=Y+K,
K=(T-2/5)r_A+(3/5)rho r_B+Z² conjugate(r_B)/sqrt(2),
rho=5053/10000, V=E|r_A|²+E|r_B|²,
F(X,O)=2(sqrt(|X|²+|O|²)-|X|).
```

As a function of |X|, F has derivative in [-2,0]. Consequently

```
Psi(X,O)<=F(X,O)<=F(Y,O)+2|K|.                    (1)
```

This is finite at all zeros and at every odd amplitude. No inverse
potential at the A/B core or conditional Hessian is used.

Conditional on Z, K is a centered real Gaussian vector in the plane,
even when the two holomorphic drivers share all coordinates. If its
second moment is v, then E|K|<=sqrt(pi)/2 sqrt(v). To see this,
diagonalize the real covariance: E sqrt(lambda1 N1²+lambda2 N2²)
is concave and symmetric in the two eigenvalues, so is maximized at
equal eigenvalues of fixed sum v. The resulting circular Gaussian
has mean norm sqrt(pi v)/2. Jensen over Z then gives

```
2E|K|<=sqrt(pi E|K|²).
```

Writing zeta=E[r_A conjugate(r_B)], visible angular averaging yields

```
E|K|²=(34/25)E_A+(1+9rho²/25)E_B+(18rho/25)Re(zeta).
```

The Hermitian coefficient matrix has off-diagonal entry9rho/25.
Its difference from (3/2)I is positive definite, by exact diagonal
and determinant comparisons. Thus, using pi<22/7,

```
2E|K|<sqrt((33/7)V)     if V>0,                  (2)
```

with zero on both sides if V=0. This estimate uses the actual Gaussian
drivers, but needs no independence between them and q,Q,P.

## The simultaneous remote bound with all cross terms charged

Let x=||Q||², y=||P||², n=|nu|², W=x+y+n, and p=2500/1891.
The inherited uniform inverse-potential bounds give

```
k1=p-1/100, kn=p-11/50,
E[|ZQ|²/|Y|]<=k1 x,
E[|conjugate(Z)P|²/|Y|]<=k1 y,
E[|nu Z(T-2)/sqrt(2)|²/|Y|]<=kn n.
```

They hold with arbitrary sharing between q and each odd field.
Minkowski in the weighted L2 space with measure dgamma/|Y| gives

```
E F(Y,O)<=E[|O|²/|Y|]
 <=(sqrt(k1 x)+sqrt(k1 y)+sqrt(kn n))².
```

Hence the following dimension-free coupled bound holds:

```
J_Psi(0) <= (sqrt(k1 x)+sqrt(k1 y)+sqrt(kn n))²
             -pW+sqrt((33/7)V).                   (3)
```

Every off-diagonal term is charged positively in (3); none is set to
zero by a conditional-independence assumption. Formula (3) is useful
when one sector dominates, but is too expensive for balanced sectors.

## Explicit cones allowing all three odd sectors

The following rational simplifications are checked by
`verify_sector_cones.py`:

```
If x+y<=n/1000:
  J_Psi(0)<=-n/10+sqrt((33/7)V).                   (4)

If y+n<=x/1000000:
  J_Psi(0)<=-x/200+sqrt((33/7)V).                  (5)
```

The symmetric version of (5) interchanges x and y. For (4), use
sqrt(x)+sqrt(y)<=sqrt(2(x+y)), discard the favorable -p(x+y),
and verify

```
2k1/1000+2sqrt(2k1 kn/1000) <11/50-1/10.
```

For (5), kn<=k1 bounds the combined subordinate contribution by
sqrt(2k1(y+n)); discard its favorable penalty and verify

```
2k1/10^6+2k1 sqrt(2/10^6)<1/100-1/200.
```

Thus pure nonincrease J_Psi(0)<=0 holds in the explicit regions

```
x+y<=n/1000,       V<=7n²/3300;                   (6)
y+n<=x/1000000,    V<=7x²/1320000,                (7)
```

and the symmetric P-dominant region. These regions can have nonzero
A and B and all three odd sectors, with arbitrary sharing. Their
intersection with the task's W<1/50 lane gives new sufficient regions
at intermediate odd energies, outside the old tiny-W rectangles.

For example the rational energies u=.04, n=.01, x=y=.000005,
E_A=E_B=.00000005 obey both response caps and lie outside the old
regional theorem and all ten small-energy rectangles. They satisfy
(6), so the new odd estimate applies. Such energy tuples are realized
by normalized genuine Hermite sectors on shared or disjoint blocks.

More generally it suffices to replace the zero budget in (6)-(7) by
the available odd allowance: e.g.

```
sqrt((33/7)V) <= n/10 + 49.64e-6
```

in the nu-dominant cone proves P_Psi using the inherited
sigma-D_minus>-.36e-6. The stronger energy-dependent signed slack in
the companion budget lane can be inserted in the same way.

These are author-level analytic consequences of the inherited scalar
potential theorem. The checker verifies only the rational PSD/cone
comparisons and the displayed admissible witness energies. It does
not re-certify the inherited integrals or prove a uniform all-sector
bound. In particular (3) is not proposed as a global replacement for
the directional averaged premise in the balanced-sector gap.
