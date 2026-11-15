<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/analytic/AVERAGED_CLOSURE_ATTEMPT.md, 2026-11-15 13:00; Agent-ID: codex-91d4. -->
# Focused moment and small-ball closure attempt

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P, author only** for the analytic statements below. The accompanying
standard-library check verifies only rational size comparisons, not
an averaged norm inequality. No numerical search or integral cover was
run for this attempt.

**Outcome:** the available moments prove a very small uniform odd-energy
strip. A concrete cutoff/moment proof route is quantitatively too weak
on a near-peak admissible energy tuple, even after using the exact bounded
visible density in its favorable zero-shell subcase. This does not
refute the averaged Psi premise. It identifies what the proposed proof
route still lacks: control of the weighted joint law, not more accurate
scalar completion or visible quadrature.

## 1. A genuine, but very small, closed strip

Use c=0, W=||O||², and the zero-safe Psi of P_ALL_REDUCTION.md. Since

```
0<=Psi(X,O)<=2|O|,
sigma-D_minus=min(sigma,S-Lambda(q))>-.36e-6,
```

the second inequality following from the inherited uniform remote cap,
the proposed allocation holds for every genuine core and arbitrary
sharing whenever

```
W <= [(50e-6-.36e-6)/2]²
   = (1241/50000000)² = 6.160324e-10.                (1)
```

Indeed `E Psi-pW<=2sqrt(W)<=49.64e-6`, while the required right side
`.01||U||²+sigma-D_minus+50e-6` is strictly larger than 49.64e-6.
This proves P_Psi in that strip without (P), a Hessian, or a small-ball
estimate. It leaves almost all of the relevant odd-energy range open.
It is not evidence that the strip endpoint is optimal.

## 2. The concrete regularized moment route tested

The proved cutoff comparison is

```
E Psi(X,O)
 <= E[|O|²/max(|X|,tau)]
    -E[(Re(X conjugate(O)))²/(|X|²+|O|²)^(3/2)]
    +tau Pr(|X|<tau).                               (2)
```

Using only the energy of O on the first term and discarding the
nonpositive directional term gives the valid sufficient estimate

```
E Psi <= W/tau+tau b_tau,
b_tau any proved upper bound for Pr(|X|<tau).         (3)
```

This is the specific recipe tested here; its failure is not a theorem
that all moment-dual or small-ball arguments fail. It loses the
correlation of |O|² with |X| and the directional correction in (2).

Consider the admissible energy tuple

```
u=50431/1250000=.0403448, V=0,
E_Q=E_P=1/200=.005, |nu|²=0, W=1/100=.01.            (4)
```

It is realized, for example, by a normalized genuine remote Wick
cubic and normalized Q,P on a disjoint remote coordinate. The total
energy is .0503448<.080051 and the ellipsoid energy is .0301724,
well inside the stated response cut. These are admissible polynomial
energies, not a claim of bounded-response realization.

## 3. Even the favorable bounded-density small-ball input is insufficient

At V=0, X=L+q. The visible law has plane density

```
f_L(R)=exp(-r²)/[pi(a+br²)(a+3br²)],
R=r(a+br²),       sup f_L=1/(pi a²).
```

Conditioning on any remote q merely translates this density. Hence,
without a moment estimate for q and with arbitrary dependence of Q,P
on q,

```
Pr(|X|<tau) <= min(1,tau²/a²).                     (5)
```

This exact input is stronger than the elementary triangle/Markov
small-ball bound. Substitution in (3), followed by optimizing tau,
gives for the energy (4)

```
inf_(tau>0) [W/tau+tau min(1,tau²/a²)]
 = 4 W^(3/4)/(3^(3/4)sqrt(a))
 = .07420539290118...,
tau_opt=(a²W/3)^(1/4)=.17968145995924....             (6)
```

The optimizer lies below a. On tau>=a the expression is W/tau+tau,
whose minimum on that range is at a because a²>W, and is larger.
The fourth power of the minimum in (6) is the exact rational
`256W³/(27a²)`.

Near the benchmark optimum, the required right side for E Psi at (4)
is numerically approximately `pW+50e-6=.0132705182443`; the numerical
sigma at this energy is negligible on this scale. No numerical
benchmark evaluation is needed to prove the recipe fails. Convexity
of the norm gives B(u)>=B(0), so

```
sigma <= S-B(0)+pu,
S<1.374, B(0)=sqrt(pi)(a+1.5b)>1.37.
```

Thus, even allowing the generous upper budget

```
pW+sigma-D_minus+50e-6
 <p(u+W)+.004+50e-6
 =.07060843469064... <.071,                         (7)
```

the best upper estimate (6) is greater than .074. The inequalities
`.074 < (6)` and `(7) < .071` are checked by exact rational fourth
powers and fractions in closure_budget_sizes.py.

This lower bound on the **best estimate produced by (3)** is not a
lower bound for E Psi. In fact the disjoint zero-shell class in the
example is already controlled by the inherited weighted odd-potential
theorem. That theorem preserves the weighted structure discarded by
(3). The example diagnoses the loss in this proposed proof recipe.

## 4. Sharp shared moments improve the exterior charge, but not enough

Let `K=|q|²/2+S_r`, and use the inherited exterior threshold
`k0=891/500`. The proved moments in SHARED_ODD_MOMENTS.md yield

```
b_ext := min(1,(u/2+V)/k0,
                    (11u²+4uV+2V²)/k0²),

E[|O|² 1_(K>=k0)] <= min(W,
  [(u/2)(17E_Q+12E_P+|nu|²)
          +V(3E_Q+3E_P+|nu|²)]/k0).                (8)
```

The second inequality is weighted Markov, using K>=k0 on the event.
It retains the sharp 17,12,3 constants, rather than bounding the odd
tail from its fourth moment alone. Since Psi<=2|O|, Cauchy-Schwarz gives

```
E[Psi 1_(K>=k0)] <=2sqrt(b_ext * right_side_of_(8)). (9)
```

At (4), the second-moment term in b_ext is the minimum. The exact
values and the resulting upper estimate are

```
b_ext=2543285761/451068750000=.00563835504233...,
odd tail-energy upper=.00164141301908...,
right side of (9)=.00608436335952....                (10)
```

Using only the sharp odd fourth-moment envelope gives the weaker bound
`.00886143232886...`. Thus the new shared moments do improve this
concrete exterior allocation, but the improved positive tail charge
is still about 122 times 50e-6. Charging it solely to the additive
allowance cannot close the proof. This does not disprove a joint
exterior argument that retains energy price, directional terms, or
signed deficits within that region.

The same calculation quantifies the small-ball precision needed if
an exceptional set is to use only the additive allowance. At (4),
the sharp fourth-moment envelope is exactly

```
M4=43/20000=.00215.
```

The bound `2M4^(1/4)b^(3/4)<=50e-6` requires

```
b³<=1/5504000000000000.
```

Its threshold lies strictly between `5.66e-6` and `5.67e-6`.
For comparison, b=1e-5 gives an upper tail charge about `76.5843e-6`.
This is a requirement of that Hölder error allocation, not a necessary
condition for the true all-sector target: the true secant can be much
smaller than 2|O|, and other negative budget terms can help.

## 5. Why the available positive moments do not repair this estimate

The missing useful quantity in (2) is a weighted joint-law bound for
`|O|²/max(|X|,tau)`, together with the directional subtraction. The
sharp product moments are upper bounds for polynomial weights such as
`|q|²|O|²` and `S_r|O|²`. They do not furnish a sharp upper bound for
that reciprocal weight, or a lower bound for the directional term.

A uniform positive directional subtraction cannot simply be assumed:
at q=A=B=P=nu=0 and `Q=i alpha(|Y|²-1)` with real alpha,
`Re(L conjugate(O))=0` pointwise. The directional term vanishes even
for a genuine odd sector. This does not threaten the target, since
the energy slack at u=0 is large; it prevents an unjustified universal
lower bound for the directional term by a fixed positive multiple of W.

At nonzero A/B cores, the conditional quadratic-zero obstruction also
means that (5) cannot be reused as if X remained a translate of L.
The Jacobian can vanish and its conditional density need not obey
the same uniform disk bound. Any improved proof has to use the genuine
sharing, the A/B costs and the local geometry together.

## 6. Precise remaining obligation

The exact scalar assembly and the odd-safe visible quadrature primitive
are valid, and (1) closes a tiny uniform energy strip. Neither (3) nor
the tail estimates (8)-(10) close P_Psi on the remaining domain.
No counterexample to P_Psi or to the user's trial cap was found by
this analytic attempt.

A viable continuation must retain more structure than a global inverse
cutoff plus separate positive tail charges: for example a signed
moment dual for the actual directional kernel and Phi(q), or a joint
exterior estimate that spends the available negative A/B and odd costs
before integrating. Such a dual or estimate is not supplied here.
The uniform averaged P_Psi premise remains the precise Phase-B gap.
