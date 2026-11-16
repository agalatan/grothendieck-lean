<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-cumulant-remainder/handoff/codex-a7c4-cumulant-remainder/PROOF.md, 16 November 2026. Only this line was added. -->
# A sharper signed Edgeworth deficit from joint chaos products

Agent-ID: codex-a7c4. Refs #467; continuation of merged PR #465. 16 November 2026.
**P, author only**, with exact arithmetic and finite polynomial controls.
Independent mathematical review of this strengthening is pending. The
two-step expansion it sharpens was independently reviewed by claude-b9ee
in #445; its frozen proof is `sources/edgeworth-codex-a7c4/PROOF.md`.
No Lean theorem or Grothendieck endpoint changes here.

## 1. Statement

Let q be any remote circular H₂,₁ cubic, in any finite dimension, and put

    u=E|q|², δ=E|q|⁴−2u², χ=δ/u²,
    κ₆ᶜ=E|q|⁶−6u³−9uδ,
    L=Z(a+b|Z|²), a=699/1250, b=179/1250,
    B(u)=2E|L+√u W|, D(q)=B(u)−2E|L+q|.

Z,W are independent standard proper complex Gaussians, independent of q.
For every u>0 the same finite expansion is valid:

    2E|L+q|=B(u)+(δ/4)B″(u)+(κ₆ᶜ/36)B‴(u)+R.       (1)

The following bounds hold (the application uses u≤463/10000):

    |R|≤5700√u δ^(3/2)                              (all shapes),
    |R|≤2700√u δ^(3/2)                              (χ≤1/100). (2)

In particular, uniformly over all dimensions and all remote cubics:

| energy | shape condition | signed conclusion |
|---|---|---|
| 0<u≤463/10000 | χ≤1/12000 | D(q)≥(7/50)δ |
| 0<u≤463/10000 | χ≤1/10000 | D(q)≥δ/8 |
| 0<u≤463/10000 | χ≤1/5000 | D(q)≥δ/1000 |
| 0≤u≤1/4000 | every shape, 0≤χ≤42 when u>0 | D(q)≥(9/50)δ |

The last line includes q=0 separately, with D=δ=0. Nothing here proves
the universal sign at larger energy and larger χ, or the unbuffered
sharp radius bound. The A-shell and remote-plus-odd corollaries in §7
are separate subclasses; they do not prove an odd-over-A/B inequality.

## 2. What the book contributes

Nourdin–Peccati, *Normal Approximations with Malliavin Calculus* (2012),
Theorem 8.2.5, pp. 151–152, expresses a joint cumulant by an ordered
Malliavin recursion. For Gaussian polynomials X₁,…,X_d define

    Λ_(i)=X_i,
    Λ_(i₁,…,i_m)=⟨DX_(i_m),−D L₀⁻¹Λ_(i₁,…,i_(m−1))⟩.

The pseudoinverse kills constants. With labelled, possibly repeated
indices, the joint cumulant is

    cum(X_(i₁),…,X_(i_m))
      =Σ_(π∈S_{m−1}) E Λ_(i₁,i_(π(2)),…,i_(π(m))).    (3)

In the scalar case this is (m−1)!EΛ_m (Theorem 8.4.3). The product
formula (Theorem 2.7.10) and its iterated contraction form in Theorem
8.3.1 make the needed quantities finite tensor calculations.

Here the useful joint vector is the two nonconstant chaos components
of the Malliavin variance. Keeping them separate avoids charging both
by the worst fourth-chaos hypercontractive factor. For centered X,Y,

    E[X²Y²]=cum(X,X,Y,Y)+E[X²]E[Y²]+2(E[XY])².        (4)

For a given tensor, (3) and (4) compute exact mixed moments and the
spectral product norms below. For a theorem uniform over all tensors,
we bound these products by their degree-specific contraction constants.
This is a sharper finite remainder estimate, not an assumption that
all higher or mixed cumulants have a favorable sign. The sixth
cumulant in (1) remains signed.

`joint_controls.py` implements (3), including repeated-index
multiplicities, and compares it with an independent moment-partition
recursion through order six. Its genuine complex-cubic projection
F₀=x³+xy²−4x has variance 8. With X=x and Q=x²−1+xy it verifies

    E F₀X=E F₀Q=0,
    cum(F₀,X,Q)=6,
    cum(F₀,X,X,X)=6.

Replacing Q by −Q reverses the first mixed sign. These controls
explicitly reject dropping mixed cumulants or inferring independence
from chaos orthogonality. They also check the joint fourth cumulants
and every product projection used below. They are finite examples,
not a proof for every tensor. Formula (3) also appears in
[Nourdin–Peccati, Cumulants on the Wiener Space](https://arxiv.org/abs/0910.1996).

## 3. Retain the spectral product information

Let F be a real third-chaos variable with EF²=1, and use the
**unnormalized** carré du champ in this section:

    U=‖DF‖²−3=U₂+U₄, A=‖U₂‖₂, C=‖U₄‖₂,
    κ=EF⁴−3, β=‖F‖₄.

This U is three times the centered normalized factor Γ−1 in #465.
The third-chaos product formula gives, with F=I₃(f),

    U₂=36 I₂(f⊗₂f), U₄=9 I₄(Sym(f⊗₁f)),
    A²=2592‖f⊗₂f‖²,
    C²=1944‖Sym(f⊗₁f)‖²,
    κ=A²/2+C².                                    (5)

Renaming indices gives ‖f⊗₁f‖=‖f⊗₂f‖, and symmetrization contracts
the Hilbert norm. Thus

    C²≤(3/4)A².                                   (6)

No complex-specific tensor inequality is needed for (5)–(6).

For X_j in real chaos j and Y_k in real chaos k, write Π_l for
orthogonal projection to chaos l. The product formula and contraction
inequality give

    ‖Π_l(X_jY_k)‖₂≤c_(j,k,l)‖X_j‖₂‖Y_k‖₂,
    c_(j,k,l)=r! binom(j,r) binom(k,r)√(l!/(j!k!)),
    r=(j+k−l)/2,                                 (7)

with coefficient zero for inadmissible r. Indeed the relevant term is
r!binom(j,r)binom(k,r)I_l(Sym(f⊗_r g)); its kernel norm is at most
‖f‖‖g‖. The squared coefficients needed here are exactly:

| (j,k) \ l | 0 | 2 | 4 | 6 | 8 |
|---|---:|---:|---:|---:|---:|
| (2,2) | 1 | 8 | 6 | 0 | 0 |
| (2,4) | 0 | 6 | 32 | 15 | 0 |
| (4,4) | 1 | 32 | 216 | 320 | 70 |

Taking X_j=Y_j and summing orthogonal squared norms proves

    ‖U₂‖₄≤15^(1/4)A <(197/100)A,
    ‖U₄‖₄≤639^(1/4)C <(503/100)C.                 (8)

Let h be an even smooth payoff of at most linear growth, with the
derivative bounds of the reviewed scalar proof, and let φ_h solve
φ'_h−xφ_h=h−Eh(N). Put M=‖h⁽⁷⁾‖∞/7. The exact two-step
spectral resolvent identity from that proof gives

    |R_h| ≤ (M/27)[β‖U‖₄+E|N|‖U‖₂]
          ·Σ_(k=2,4) Σ_(l=0,2,4,6,8)
             ‖Π_l(UU_k)‖₂ / [(3−l/3)(5−k/3)],     (9)

where R_h is the residual after the fourth and sixth Hermite terms.
For clarity, if ψ is φ'_h with its Gaussian Hermite components of
orders 0,2,4 subtracted, then v=ψ⁽⁴⁾ is centered and M-Lipschitz.
The exact remainder is −(1/27)Σ E[(R_(2−l/3)R_(4−k/3)v)(F)
U Π_l(UU_k)]. The centered Lipschitz resolvent bound is

    |R_(2−l/3)R_(4−k/3)v(x)|
       ≤M(|x|+E|N|)/[(3−l/3)(5−k/3)].

Hölder gives ‖FU‖₂≤β‖U‖₄, followed by Cauchy–Schwarz against
Π_l(UU_k), proving (9). The Hermite ranks, resolvent existence and
smoothing limit are exactly those of the reviewed proof; none are
weakened. In particular all final parameters exceed −1.

Equation (9) can be used with actual tensor product norms. For a
universal bound use (7), (8), E|N|<1 and (6). If A>0 set y=C/A,
so 0≤y≤√(3/4)<7/8. Replace each square root in (7) by the rational
upper bound in `verify.py`. Their weighted sum is

    Σ_(j,k=2,4) Σ_l c_(j,k,l) a_j a_k /
                       [(3−l/3)(5−k/3)] ≤ A² P(y),
    P(y)=3167/4550 +(74934/17875)y +(114637/7700)y²,
    a₂=A, a₄=C.                                   (10)

Since √(1+y²)≤1+y²/2, (5) and (9) imply

    |R_h|≤M κ^(3/2) K_β(y),
    K_β(y)=[β(197/100+(503/100)y)+1+y²/2]P(y)
                              /[27(1/2+y²)^(3/2)]. (11)

`verify.py` proves on the entire rational interval [0,7/8]

    K_(33/25) < 81/20,      K_3 < 17/2.             (12)

It squares the positive numerator and denominator and expresses the
difference in the Bernstein basis. Every coefficient is strictly
positive on this single interval for each of the two polynomials;
there are no sampled acceptance points. The coefficients and their
minimum are in `constants.json`. If A=0, (6) forces C=0 and (9)
is zero, so no division by zero is needed.

## 4. Apply the bound to the visible payoff

Set F=√(2/u)Re q. Circularity gives

    κ=3δ/(2u²), EF⁴=3+3χ/2.

Thus β<3 for every shape (χ≤42), and β<33/25 when χ≤1/100.
For s=√(u/2), X=Re L, the projection payoff is h(x)=πE|X+sx|.
The reviewed visible-mixture identity L =_law √V W gives

    m₁=E V⁻¹=a⁻²,
    m₂=E V⁻²=a⁻⁴+4ba⁻⁵<21,
    m₃=E V⁻³=a⁻⁶+12ba⁻⁷+42b²a⁻⁸<224.             (13)

The density/Fourier argument already used in the reviewed proof gives
‖h⁽⁷⁾‖∞≤128s⁷m₃, hence M≤4096s⁷. Consequently

    M κ^(3/2) ≤384√3 √u δ^(3/2).

The rational comparisons 384√3(81/20)<2700 and
384√3(17/2)<5700 prove (2). The fourth and sixth Hermite correction
coefficients in (1) are unchanged; (3) or ordinary cumulant identities
give EH₄(F)=3δ/(2u²) and EH₆(F)=5κ₆ᶜ/(2u³).

## 5. A stronger positive leading coefficient

It is wasteful here to apply Jensen to E V alone. Put X=V⁻¹>0.
Cauchy–Schwarz applied to √(X/(1+uX)) and √(X(1+uX)) gives

    E(V+u)⁻¹=E[X/(1+uX)]≥m₁²/(m₁+u m₂).

Jensen with the convex power 3/2 then gives

    −B″(u)/4=(√π/16)E(V+u)^(−3/2)
       ≥(√π/16)[m₁²/(m₁+u m₂)]^(3/2).             (14)

For 0≤u≤463/10000 the bracket exceeds 49/20 using (13).
The elementary bounds π>25/8, √π>44/25 and
√(49/20)>25/16 show that (14) is strictly greater than 21/50.
Every rational comparison is checked in `verify.py`, including fresh
π bounds from Machin's identity and alternating arctangent sums.

The reviewed sixth-moment theorem gives κ₆ᶜ≤(4045313/100000)δ^(3/2).
Also B‴(u)>0 and B‴(u)<47, by (13) and Cauchy–Schwarz as in the
reviewed proof. We use the one-sided cumulant bound, preserving the
favorable sign when κ₆ᶜ is negative. Equations (1)–(2) give

    D(q)≥[21/50−(5700√u+53)u√χ]δ                  (all shapes),
    D(q)≥[21/50−(2700√u+53)u√χ]δ                  (χ≤1/100). (15)

The four regions in §1 follow from (15) by exact rational upper
bounds on the square roots. For example, √u<27/125 on the application
range, and at χ≤1/10000,

    21/50−(2700·27/125+53)(463/10000)/100 > 1/8.

For all shapes at u≤1/4000, √u<1/63 and √χ≤√42<13/2,
giving a coefficient greater than 9/50. These are analytic
consequences of finite certified inequalities, not numerical fits.

## 6. Verification and provenance

Run with standard Python 3, without third-party packages:

    python3 verify.py
    python3 joint_controls.py

The first checks the projection constants, two whole-interval
Bernstein certificates, inverse-moment bounds and every stated
threshold/corollary. The second computes joint cumulants independently
in two ways, tests their signs and multiplicities, and checks the
spectral products on an actual H₂,₁ projection with shared lower
fields. Its exact output is `joint_controls.json`. Neither program
proves the dimension-uniform analytic argument or is run by repo CI.

The retained expansion is the two-step spectral method in the
reviewed scalar note and
[Mansanarez–Poly–Swan](https://arxiv.org/abs/2510.14002). We import
neither an unstated asymptotic constant nor a third-order remainder.
The book identifies the joint objects and their normalization;
(7)–(15) supply the explicit stronger constants in this note.

## 7. Consequences and the remaining joint inequality

On 3/100≤u≤463/10000 the reviewed content theorem is
‖c_(3/5)(q)‖²≤(3/80)δ. With χ≤1/10000, the second line of §1 gives

    ‖c_(3/5)(q)‖²≤(3/10)D(q).

The reviewed tilted A-shell remainder, k=59009/189100, then gives

    Λ̂(q+(T−1)r)≤S−δ/250                         (χ≤1/10000),
    Λ̂(q+(T−1)r)≤S−(19/1000)δ                    (χ≤1/12000),

for every remote linear r, with arbitrary sharing and amplitude,
on that central energy interval. The exact gaps are
1/8−(3/80)/k>1/250 and 7/50−(3/80)/k>19/1000.

Separately, ledger 7.2.10 gives for genuine odd sectors O, with no
A/B shell, arbitrary sharing and amplitude,

    Λ(q+O)≤S−δ/8−(1988/47275)‖O‖²                (χ≤1/10000),

on 0<u≤463/10000. Use 7δ/50 when χ≤1/12000, δ/1000 when
χ≤1/5000, or 9δ/50 for every shape at u≤1/4000.

For the full retained trial with A/B and odd sectors, the odd-sector
owner's exact interface is Δ_full=−D(q)+R_shared. The subtraction
leaves both a shifted self-kernel difference and a mixed derivative
term, including both real ν channels. The scalar theorem controls
only D, not R_shared. `JOINT_INTERFACE.md` records the interface and
why an unweighted derivative supremum at the interpolation endpoint
would diverge. The larger-χ sign and the full shared residual remain
open. No all-sector K_η, compact-(P) closure or new lower endpoint
is claimed by this packet.
