<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# B-shell: a certified global cost bound and a correction to the content pairing

Research result, 5 November 2026. This note proves B-cost, with a corrected
first-order pairing, at all three requested rows and at every amplitude.
It does **not** prove B-content, the joint finite-amplitude A/B bound, or
monotonicity under adding the even sectors. Those remain necessary for sector assembly.

## 1. Correct pairing

Put a=l-2b>0, p=1/eps, T=|z|^2, L=z(a+bT), and

    F_B(x) = E_z[(z^2/sqrt(2)) conj(ph(L+x))].

For h=z^2 conj(r)/sqrt(2), the correct derivative is

    d/dt Lambda(q+t h)|_{t=0} = 2 Re E_w[conj(r) F_B(q)].             (1)

Indeed, replacing z by -z shows that the two norm terms in Lambda are equal
for q+t h; the penalty has zero derivative at zero because E_z z^2=0.
The derivative of a complex norm is Re[h conj(ph(L+q))].

Thus the corrected content is

    C_B^corr(q) = sup_{r holomorphic linear, ||r||_2=1}
                    Re E[conj(r) F_B(q)]
                = ||Pi_{1,0} F_B(q)||_2.                           (2)

The pairing E[r F_B(q)] in the question is identically zero. To see this,
F_B(e^{i phi}x)=e^{i phi}F_B(x), by rotating z, and q(e^{i phi}w)=e^{i phi}q(w).
Consequently r(w)F_B(q(w)) has charge two. Its Gaussian expectation vanishes.
This applies to every q in H_{2,1} and every holomorphic linear r.

This is substantive: the actual first variation need not vanish. Let
H(w)=w(|w|^2-2) and q_delta=delta H, delta>0. At x=0,

    F_B(x) = -A x + B x|x|^2 + O(|x|^4),
    A = (1/(2 sqrt(2))) integral_0^infty t^{1/2}e^{-t}/(a+bt) dt,
    B = (3/(16 sqrt(2))) integral_0^infty t^{-1/2}e^{-t}/(a+bt)^3 dt > 0.

The angular coefficient calculation is explicit: writing R=sqrt(t)(a+bt),
expand

    conj(ph(R e^{i theta}+x))
      = e^{-i theta}(1+conj(x)e^{i theta}/R)^{1/2}
                       (1+x e^{-i theta}/R)^{-1/2}.

After multiplication by e^{2i theta}, the first two surviving coefficients
are -x/(2R) and 3x|x|^2/(16R^3).

For rigor, split at R=2|x|. The inner region contributes O(|x|^4), including
the integrated linear and cubic terms: R is comparable to sqrt(t) near zero
and the B-profile weight is t. On the outer region the angular series
remainder is O(|x|^5 t/R^5); its t-integral is O(|x|^4).
This gives the displayed remainder near zero. Since |F_B(x)|<=1/sqrt(2),
the remainder is bounded by a constant times |x|^4 globally as well.
It can therefore be integrated against |w| with x=delta H(w).

The exact Gaussian moments are

    E[conj(w) H]=0,
    E[conj(w) H|H|^2]
      = E[T^2(T-2)^3] = 120-144+72-16 = 32.

Hence E[conj(w)F_B(q_delta)]=32 B delta^3+O(delta^4)>0 for small delta.
The derivative in (1), with r=w, is positive. For any positive proposed
amplitude bound w_B, taking a sufficiently small positive shell amplitude
violates the B-cost statement **as written** (whose linear term is zero),
even if its quadratic cost were set to zero. Also ||q_delta||_2^2=2delta^2,
so this counterexample lies within the requested remote-energy cap.

## 2. Exact radial/angular reduction

Define the explicit angular mean

    H(R,x,y) = (1/(2pi)) integral_0^{2pi}
                         |R e^{i theta}+x+y e^{2i theta}| dtheta.

For arbitrary remote q,r in L^2, independent of z,

    Lambda(q+z^2 conj(r)/sqrt(2))
      = 2 E_w integral_0^infty e^{-t}
           H(sqrt(t)(a+bt), q(w), t conj(r(w))/sqrt(2)) dt
        - p (||q||_2^2+||r||_2^2).                                (3)

The equality of the two norm terms follows from z -> -z. The cross term
in the energy vanishes by angular integration, and E[T^2]/2=1. In particular

    E[|q+z^2 conj(r)/sqrt(2)|^2 | T=t]
       = ||q||_2^2 + (t^2/2)||r||_2^2.

Equation (3) retains the joint law of (q,r); the conditional second moment
alone does not determine its angular mean.

## 3. Global cost theorem

At the three rows, for all remote q,r in L^2,

    Lambda(q+z^2 conj(r)/sqrt(2))
      <= Lambda(q) + 2 Re E[conj(r)F_B(q)] - kappa_B ||r||_2^2,     (4)

with the following certified constants:

| Row | eps | l | b | kappa_B | Amplitude restriction |
|---|---:|---:|---:|---:|---|
| peak | 1891/2500 | 1057/1250 | 179/1250 | 13/50 | none |
| flank | 149/200 | 4267/5000 | 1467/10000 | 29/100 | none |
| upper | 1891/2500 | 877/1000 | 19/125 | 3/10 | none |

No chaos, orthogonality, energy cap, dimension bound, or independence between
q and r is needed in (4). Only their independence from z is used.

### Norm majorant

For X!=0 and any h,

    |X+h| <= |X| + Re[h conj(ph(X))] + |h|^2/(2|X|),               (5)

by sqrt(1+s)<=1+s/2, s>=-1. Apply this with X=L+q(w), integrate,
and use the equality of the two norm terms. The nonlinear remainder is at most

    E_w[ |r(w)|^2 J(q(w)) ],
    J(x) = E_z[T^2/(2|L+x|)].                                    (6)

It suffices to bound J uniformly by p-kappa_B.

### Density and potential bound

Let mu be the pushforward under z -> L of the measure
(|z|^4/2) exp(-|z|^2) dz/pi. It has mass one. The radial map
R=sqrt(t)(a+bt) has Jacobian (a+bt)(a+3bt), so its density is

    rho(L(z)) = t^2 e^{-t}/[2pi(a+bt)(a+3bt)].                    (7)

If rho<=M/pi, then for every x,

    J(x)=integral rho(y)/|y+x| dy <= 2 sqrt(M).                    (8)

Here is a direct proof requiring no rearrangement theorem. For any R>0,
split 1/r into 1/R+(1/r-1/R)_+ plus its nonpositive correction outside
the radius-R disk. The mass-one condition and density bound give

    J(x) <= 1/R + (M/pi) integral_{|y+x|<R}(1/|y+x|-1/R)dy
          = 1/R + M R.

Choose R=1/sqrt(M). The translation x does not affect this estimate.

### Exactly certified scalar inequalities

The checker verifies, on the entire half-line t>=0,

    t^2 e^{-t}/[2(a+bt)(a+3bt)] <= M,
    4M <= (p-kappa_B)^2,  p-kappa_B>0,

using

| Row | M |
|---|---:|
| peak | 7/25 |
| flank | 11/40 |
| upper | 13/50 |

It partitions [0,2] into 2000 rational intervals. The numerator t^2 e^{-t}
is increasing on this interval, while both denominator factors increase.
At the right endpoint h it bounds e^{-h} above by the reciprocal of
sum_{j=0}^{16} h^j/j!. Every comparison is performed with reduced BigInt
rationals. On [2,infinity), the numerator decreases and the denominator
increases, so the last interval bound also controls the whole tail.

Equations (5)--(8) prove (4). Replay:

    node verify_b_cost.mjs

All three rows passed. The checker also verifies the two exact Wick moments
used in Section 1. It does not purport to mechanically verify the analytic
arguments in this note.

## 4. Joint Hessian: an exact formula at q=0

This calculation confirms a nonzero mixed term; it is not a uniform bound
at nonzero q or finite amplitude. Put

    R(t)=sqrt(t)(a+bt), A(t)=t-1, D(t)=t/sqrt(2),
    h=A(T)r_A + D(T)e^{2i theta}conj(r_B).

Writing all scalar expectations below against e^{-t}dt,

    Lambda(s h) = Lambda(0)
       - s^2 [k_A^0 ||r_A||_2^2 + k_B^0 ||r_B||_2^2
                + 2m^0 Re E[r_A conj(r_B)]] + o(s^2),

    k_A^0 = p - (1/2) E[A(T)^2/R(T)],
    k_B^0 = p - (1/2) E[D(T)^2/R(T)],
    m^0   = (1/2) E[A(T)D(T)/R(T)].                               (9)

Indeed, the quadratic term of 2|L+s h| is
(|h|^2-Re(h e^{-i theta})^2)/R. Its angular average is
(A^2|r_A|^2+D^2|r_B|^2)/(2R)-AD Re(r_A conj(r_B))/R.
The mixed energy term in E|h|^2 vanishes, but this Hessian term survives.

Exploratory ordinary quadrature gives the following, **not interval-certified**:

| Row | k_A^0 | k_B^0 | m^0 |
|---|---:|---:|---:|
| peak | 0.32005450 | 0.94020220 | 0.11798882 |
| flank | 0.34412697 | 0.96382044 | 0.11591997 |
| upper | 0.34784881 | 0.95371665 | 0.11226404 |

The worst relative phase chooses the negative mixed sign, giving the matrix
with off-diagonal entries -|m^0|. Separate linear contents do not imply a
diagonal second-order cost.

## 5. What is and is not closed

Proved: corrected B-cost, at all three rows, without an amplitude cutoff,
with arbitrary sharing; exact radial/angular reduction; exact local mixed
Hessian formula; and a refutation of the uncorrected first-order statement.

Not proved: for the corrected content (2),

    (C_B^corr(q))^2 <= kappa_B [B(u)-F(q)],

or its residual variant, even for all the classes already certified for A.
The constants in (4) are smaller than the expected local 0.9-scale constants;
one must test content against these actual constants or sharpen the cost.
The original content defined with E[r F_B] is zero and cannot control the
actual B-shell gain.

Also not proved: a finite-amplitude joint A/B cost, a universal comparison
of corrected B-content with A-content, or pure cost for the even sectors
over a nonzero core. Neither (4) nor the local matrix (9) implies these.
In particular, this note does not establish Conjecture K_eta for general
adversaries containing B-shells.
