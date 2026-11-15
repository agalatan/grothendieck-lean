<!-- New fourth-audit note. Agent-ID: codex-a7c4. Refs #406. -->
# Remote equivalences, BNC, and the missing condition in SEI closure

Agent-ID: codex-a7c4. Initial baseline 2442792eab87cc48a71ba29dc74be7a250b4a03a;
resynced to 9a93fb47264f12c74840bc671a80154abc7eca28 after PR #408.
New arguments are **P by author, not externally reviewed**. The complex
Gaussian-buffer equivalence below re-derives an October result; the
single-profile formulation and the explicit SEI obstruction clarify its scope.
No sharp radius inequality, Conjecture K, or Grothendieck bound is proved.

## 1. Findings and the corrected implication chain

MON §3.3 calls BNC the real form of PVD; STATUS 3.5 repeats this shorthand
inside an equivalence row. In ch32 the actual proposition says **BNC implies
real PVD**. Real PVD is an absolute-moment comparison, whereas BNC is a
weighted Stein-kernel sign condition. The source proves no converse. Neither
does it prove that the complex radius conjecture implies the corresponding
inequality for every real third-chaos variable. The established chain is

    real BNC  ==>  real Gaussian-buffer PVD  ==>  complex PVD
                        <==>
                 real sharp L1 inequality,

and separately

    complex sharp L1 inequality  <==>  complex PVD
       <==>  same-variance remote domination for one fixed positive profile
       <==>  exact remote K for that profile at EVERY epsilon > 0.

The real equivalence uses a universal assertion over all finite-dimensional
real third-chaos variables. The complex equivalences use all finite-dimensional
H₂,₁ variables. They do not assert an equivalence between BNC and these
conjectures, nor a counterexample to BNC within third chaos.

A second issue occurs in ch32, the item “Interval form (SEI) and sums”:
it asserts closure on adding any independent variable with a symmetric
unimodal density. Section 4 gives a counterexample to that unrestricted
closure statement; section 5 supplies correct versions.

## 2. Re-deriving the complex radius equivalences

Let c=√π/2, and let q range over H₂,₁ on any finite number of independent
standard complex Gaussian coordinates. Fix L=Z(a+b|Z|²), with a>0,b≥0,
independent of q. Write

    u=E|q|²,  F_L(q)=2E|L+q|,
    B_L(v)=2E|L+√v W|,  S_L(p)=sup_{v≥0}[B_L(v)−pv],  p>0.

Circularity of L gives F_L(q)=E|L+q|+E|L−q|. Four universal assertions
are equivalent:

1. E|q|≤c√u for every q in every finite dimension.
2. E|q+√v W|≤c√(u+v) for every q and v≥0, with W independent.
3. F_L(q)≤B_L(u) for every q, for this **single fixed** L.
4. F_L(q)−pu≤S_L(p) for every q and **every** p>0, for this L.

**1 implies 2 (the old buffer-closure argument).** On fresh coordinates put
H(X)=X(|X|²−2)/√2 and W_N=N⁻¹/²Σ H(X_j). Then E|H|²=1,
EH=EH²=0, and the two-dimensional central limit theorem gives W_N⇒W.
The polynomial q+√v W_N stays in H₂,₁ and has squared norm u+v.
Uniform boundedness of its second moment makes its absolute values uniformly
integrable, so assertion 1 passes to the limit. Assertion 2 implies 1 at v=0.
The limit is over increasing dimensions; a fixed-dimensional assertion
would not justify this step. This is the proof in ch34, re-derived here.

**2 implies 3.** The reviewed scale-mixture representation gives
L equal in law to √V W₀, with V>0 independent of W₀. Conditional on V,
assertion 2 yields E|√V W₀+q|≤c√(V+u). After integration,

    F_L(q)≤√π E√(V+u)=B_L(u).

All integrals exist: E√V is finite because E|L| is finite. The mixture
can be realized independently of q because q and the original L are
independent. This argument does not replace the visible variable in a
coupled A/B adversary.

**3 implies 4** by the definition of S_L.

**4 implies 3.** B_L is concave. At u>0 its derivative

    p_u=(√π/2) E(V+u)⁻¹/²

is finite and strictly positive. The tangent inequality gives
S_L(p_u)=B_L(u)−p_u u. Use assertion 4 at exactly p_u to obtain assertion 3.
At u=0, q=0 almost surely and the conclusion is equality. The supremum
defining S_L(p) is finite since B_L(v)≤2E|L|+√π√v. Thus no duality theorem,
unattained slope, or price p=0 is needed. The EVERY-p quantifier is essential
to this proof; the known small-error cap at the single peak price is not
assertion 4 and supplies no same-variance domination.

**3 implies 1.** Apply assertion 3 to tq for t>0 and divide by 2t:

    E|q+L/t| ≤ E|√u W+L/t|.

Both sides converge in L1 to their values with L/t removed, because
the norm is 1-Lipschitz and E|L|/t→0. This proves assertion 1.

Consequently these four assertions also imply remote domination for every
other profile a>0,b≥0, through assertion 2 and that profile's scale mixture.
This upgrades the *equivalence argument*, not any conjecture in the list.
The fixed-profile strengthening follows from the existing ingredients;
no claim of priority for the buffer or concavity arguments is made.

**Real-to-complex implication.** A charge-one q is circular, hence
E|Re q|=(2/π)E|q| and E(Re q)²=u/2. Its real part is in the real third
Wiener chaos. The real sharp bound E|X|≤√(2/π)‖X‖₂ therefore implies
assertion 1, with the correct constant c. The real buffer equivalence uses
fresh copies of the normalized real Hermite cubic in the same CLT argument.
There is no converse between the real and complex assertions in this proof.

## 3. What BNC actually says

For a centered real X with variance σ² and Stein kernel τ, write
Γ for a random Stein factor such that E[Γ|X]=τ(X). For a real kth-chaos
variable Γ=‖DX‖²/k. BNC is

    E[(Γ−σ²)exp(−sX²)]≤0 for every s≥0.

For r>0 set Y_r=X+√r Z with Z independent standard real Gaussian, and
m(r)=E|Y_r|. Gaussian smoothing gives m'(r)=p_{Y_r}(0).
Its Stein kernel at zero satisfies

    τ_{Y_r}(0)p_{Y_r}(0)=m(r)/2,
    [m(r)/2−(σ²+r)p_{Y_r}(0)]
       = E[(Γ−σ²)exp(−X²/(2r))]/√(2πr).

The second identity follows from the Stein factor Γ+r for the sum, after
conditioning at Y_r=0; equivalently it follows by applying the Stein
identity to Gaussian-smoothed sign functions. Hence BNC is equivalent to

    d/dr [m(r)/√(σ²+r)] ≥ 0  for every r>0.

The normalized mean tends to √(2/π) as r→∞, so this monotonicity implies
real PVD. A bound by the limiting constant is a different statement from
monotonicity. The October proposition proves this sufficient route; replacing
its implication by an equality of names obscures an additional requirement.
The argument applies under the integrability of the Stein factor, which
holds for the polynomial chaos factors used here.

## 4. A nondegenerate counterexample to the printed SEI closure

For a centered real variable X with Stein kernel τ_X and variance σ_X²,
define SEI by

    E[(τ_X(X)−σ_X²) 1{|X|<c}]≤0 for every c>0.

Let X₁=Z₁Z₂Z₃/3 and X₂=U, where the Z_j are independent standard real
Gaussians and U is independent uniform on [−1,1]. X₁ is a nondegenerate
real third-chaos variable with variance 1/9. It satisfies SEI: write its
law as √V Z₁ with V=Z₂²Z₃²/9. A Stein kernel is E[V|X₁], and

    E[(τ₁(X₁)−1/9)1{|X₁|<c}]
      = Cov(V, P(|√V Z₁|<c | V)) ≤ 0,

because the conditional interval probability decreases in V. The covariance
sign follows by using an independent copy V′ and integrating
(V−V′)(h(V)−h(V′))≤0. X₂ has a symmetric unimodal density. These are
precisely the distributional hypotheses of the printed closure sentence,
even with the first summand in third chaos. Put Y=X₁+X₂. Then

    Var(Y)=1/9+1/3=4/9,   p_Y(y)≤1/2,   E|Y|≥E|U|=1/2.

The density bound follows by convolution with a probability density, and
the absolute-moment bound is conditional Jensen. Y has a positive continuous
symmetric density. Its Stein kernel satisfies

    τ_Y(y)p_Y(y)=∫_y^∞ t p_Y(t)dt
               =E|Y|/2−∫₀^{|y|}t p_Y(t)dt.

For |y|≤1/10 this yields

    [τ_Y(y)−4/9]p_Y(y)
      ≥ 1/4−(1/10)²/4−2/9 = 91/3600.

Integrating on [−1/10,1/10] proves the explicit violation

    E[(τ_Y(Y)−Var(Y)) 1{|Y|<1/10}] ≥ 91/18000 > 0.

The addend U is **not** a Gaussian-chaos polynomial. This refutes the
unrestricted closure lemma as printed, not a theorem that assumes both
summands belong to a particular chaos, and not K, PVD, or third-chaos BNC.
The scalar arithmetic is checked by reformulations_exact.py. No numerical
integration or assertion about an unknown density is used.

## 5. Correct closure statements

**Gaussian addition.** If X has an integrable Stein kernel and satisfies SEI,
then X+N satisfies SEI for every independent centered Gaussian N.
Indeed, for N of variance v,

    τ_{X+N}(X+N)−(σ_X²+v)
      = E[τ_X(X)−σ_X² | X+N].

The centered-interval probability h_c(x)=P(|x+N|<c) is nonnegative,
bounded, even and nonincreasing in |x|. Layer cake expresses it as a positive
mixture of centered-interval indicators. SEI for X gives
E[(τ_X(X)−σ_X²)h_c(X)]≤0, which is SEI for the sum. The degenerate v=0
case is immediate. The same layer-cake argument proves SEI implies BNC.

**Two summands.** More generally, if independent X₁,X₂ both satisfy SEI
and both have symmetric unimodal densities, their sum satisfies SEI.
Use the Stein factor τ₁(X₁)+τ₂(X₂) and split its centered contribution
into two terms. For each term, integration over the other summand produces
an even decreasing function h_c; the corresponding summand's SEI controls
it. The false sentence kept only the first of these two controls. One
cannot discard the centered Stein contribution of a general addend.

## 6. Supremum and attainment

The diffuse Gaussian √v W is a limit in law of cubic chaos variables on
increasing numbers of fresh coordinates; it is not an element of H₂,₁ in
that construction. Their norms are exactly v, and uniform L2 bounds imply
convergence of the norm payoff. Therefore, if K holds, the **supremum over
all finite dimensions** equals S and is approached by diffuse sequences.
This does not say that a Gaussian attains a supremum in a fixed H₂,₁(ℂⁿ).

There is a direct obstruction to such a fixed-dimensional reading: at n=1
the reviewed axis theorem gives sup_G Λ(G)=Λ(0)=1.3718792806… at the peak,
strictly below the certified Gaussian benchmark S>1.3739535256614.
The equality written with H₂,₁(ℂⁿ) in ch32's K_all display needs the
dimension-uniform supremum, while its upper inequality is asserted in every
dimension. README's informal “attained” language is corrected accordingly.

## 7. The references excluded from the preceding review

The Bernstein representation used in A15T is stated as Theorem 2.6, p.1608,
of [Ehrnström–Wahlén](https://www.numdam.org/item/10.1016/j.anihpc.2019.02.006.pdf):
complete monotonicity on (0,∞) is equivalent to a positive Laplace measure;
the finite limit at zero is exactly the condition for finite total mass.
The [publisher's second-edition record](https://www.degruyterbrill.com/document/doi/10.1515/9783110269338/html)
confirms the Schilling–Song–Vondraček bibliographic item. The public theorem
statement was checked; the book's proof was not reconstructed.

[DLMF 10.32.1](https://dlmf.nist.gov/10.32.E1) gives the integral for I₀
used in the Gaussian angular average. The
[Nourdin–Peccati–Poly–Simone abstract](https://arxiv.org/abs/1407.6216)
explicitly requires centered, variance-one inputs with zero third moment
and fourth moment at least three, and concerns fixed-degree homogeneous
sums and asymptotic Gaussian convergence. This verifies the earlier
literature correction without turning it into a finite-amplitude estimate.

The notation collision flagged on #403 is resolved in the living errata:
in A15T ALIGNMENT §§2–4, B denotes the positive kernel −g_B; in its §5,
B denotes the Gaussian benchmark. In new notes these are written B_ker
and B_Gauss when both occur. The historical source is preserved.
