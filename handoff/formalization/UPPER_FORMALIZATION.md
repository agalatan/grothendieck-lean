# Upper-bound formalization map and reproduction contract

## Target, scope, and present trust boundary

The target is the unrestricted complex Grothendieck bound

\[
K_G^{\mathbb C}<U_*,\qquad U_*:=1404898359045958/10^{15}
=1.404898359045958.
\]

This is the final combined certificate, not the older upper endpoints printed
by prerequisite scripts. The current evidence is a mathematical argument plus
Python exact arithmetic and directed Arb calculations. **It is not a Lean
proof.** A successful Python run, a SHA256 match, or an imported decimal is not
a proof of the corresponding proposition in Lean.

The intended ZIP-relative paths are:

- `packages/grothendieck-cross-instance-review/combined/`: final combined proof,
  scripts, table, rational preprocessor, manifest, and successful logs.
- `upstream/grothendieck_cx/`: original source at commit
  `7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f`.
- `FINITE_CERTIFICATE_MAP.md`: companion account of finite certificates and
  serialization, including the separate lower-bound and LP work.

No Lean release, mathlib release, theorem name already available in a library,
or existing implementation is asserted here. The theorem labels below are
**proposed mathematical interfaces**, not existing declarations. Inspect the
chosen library before selecting concrete APIs or dependencies.

The foundational source is [Heilman–Jones–Malavolta, arXiv:2609.25462v1](https://arxiv.org/html/2609.25462v1).
Useful locations to consult are Definition3.1 and Lemma3.5 for kernels and
tensors, (2.1)–(2.2) for phase coefficients, Section4.2 for the origin kernel,
and Section6 for its analytic and numerical estimates. Our direct transfer
argument, joint first-order tail, and complete finite preprocessing are stated
below so they can be formalized without implementing an inverse-series search.

## 1. Fix conventions before importing numerical data

Use the complex inner product **linear in its first argument**, as in the source.
If the selected library uses the opposite convention, define an explicit wrapper
and prove every covariance/tensor identity for that wrapper. Do not repair an
orientation mismatch by silently conjugating one data table.

For an arbitrary finite complex matrix \(A=(a_{ij})\), define
\[
C(A)=\sup_{|u_i|=|v_j|=1}\left|\sum_{ij}a_{ij}u_i\bar v_j\right|,
\qquad
V(A)=\sup_{\|x_i\|=\|y_j\|=1}\left|\sum_{ij}a_{ij}\langle x_i,y_j\rangle\right|.
\]
Allow arbitrary finite-dimensional complex Hilbert spaces in \(V\), or prove the
span-reduction equivalence to a fixed dimension at least the number of vectors.
The proof below raises dimension by tensor products; it does not prove the same
bound for a fixed-order Grothendieck constant. Handle empty index sets separately
or restrict the theorem to positive matrix dimensions and extend trivially.

Recommended final formulation: prove the universal matrix inequality with a
constant \(B<U_*\), then relate this to the infimum definition of \(K_G^{\mathbb C}\).
This avoids assuming in advance that the infimum is attained. Every term in
\(V(A)\) is bounded by \(\sum|a_{ij}|\), so its finiteness does not require invoking
a preexisting Grothendieck theorem.

An odd real coefficient sequence \(c\in\ell_1\) represents both
\[
f(t)=\sum_{n\ge0}c_nt^{2n+1},\qquad
f^{\mathrm{phys}}(z)=\sum_{n\ge0}c_nz|z|^{2n}.
\]
These are different functions. Ordinary polynomial composition occurs on the
odd representative; the physical radial extension agrees with it after
composition **because the coefficients are real**. Keep radial index \(n\)
distinct from ordinary polynomial degree \(2n+1\).

## 2. Core theorem dependency graph

| Proposed theorem | Precise obligation | Depends on / relevant implementation |
|---|---|---|
| `valid_kernel_expectation_bound` | For a kernel jointly realizable by unit-circle random variables for every finite vector family, \(|\sum a_{ij}K(\langle x_i,y_j\rangle)|\le C(A)\). | Integrability, finite-sum/expectation interchange, norm of an expectation. Joint realization is essential. |
| `tensor_radial_monomial` | \(z|z|^{2n}\) is the inner product of the indicated unit tensor vectors. | Conjugate Hilbert space, tensor product, unit-norm multiplication. |
| `direct_coefficient_transfer` | If \(q/M\) is valid, \(q\in\ell_1\), \(M>0\), and \(q_0>\sum_{n\ge1}|q_n|\), then \(V(A)\le M C(A)/(q_0-\sum_{n\ge1}|q_n|)\). | Previous two theorems, absolute convergence, finite supremum argument. |
| `l1_preprocessor_allowable` | A real odd sequence of coefficient norm at most1 defines cross inner products of unit feature vectors. | Direct sums of weighted tensor monomials and two orthogonal padding directions. |
| `gaussian_kernel_valid` | A measurable unit-modulus pair of functions of shared Gaussian projections gives a valid kernel for every finite vector family. | One shared finite Gaussian vector, covariance calculation, equality in law of proper Gaussian pairs. |
| `phase_kernel_expansion` | The phase correlation equals \(\sum h_nz|z|^{2n}\) on the closed unit disk. | Complex Gaussian/Laguerre calculation or a formal phase identity; includes boundary cases. |
| `origin_kernel_expansion` | The symmetrized radial phase pair has coefficients \(k_n=\operatorname{Re}(a_n\bar b_n)\), with \(\sum|k_n|\le1\). | Charge-one basis, Mehler action, Parseval/Cauchy–Schwarz, conjugate reflection. |
| `dirichlet_spectral_identity` | The first-order radial integral equals \(\sum(2n+1)|r_n|^2\) for the three functions used below. | Domain/regularity, integration by parts or closed quadratic form, basis completeness. |
| `truncated_input_error` | Restricting a unit-modulus radial input to \([0,36]\) changes its entire coefficient vector by norm at most \(e^{-18}\). | Parseval/Bessel and \(\int_{36}^{\infty}e^{-s}ds=e^{-36}\). |
| `visible_energy_subtraction` | Correct finite boxed weighted norms by the omitted-input norm before squaring and subtracting from total energies. | Certified coefficient boxes, previous theorem, finite weighted triangle inequality. |
| `joint_first_order_tail` | Sixth tail bounded by \(\sqrt{E_CW_N}+\sqrt{E_LE_R}/(2N+1)\). | Endpoint cancellation, spectral energies, Cauchy–Schwarz and monotonicity of weights. |
| `scalar_tail_bounds` | First four Cauchy tails and fifth complete-block tail have the certified bounds. | Holomorphic continuation/boundary certificate; exact polynomial norms; Wallis estimate. |
| `composition_error_contracts` | \(\|R\circ\eta\|_1\le\|R\|_1\) for real odd \(R\in\ell_1\) and \(\|\eta\|_1\le1\). | Absolutely summable convolution and sums of powers. |
| `finite_combined_certificate` | Pinned finite data imply the normalized repaired slope exceeds \(g_*:=7117952651600243/10^{16}\). | Formal interval/finite checker plus integral-enclosure hypotheses. |
| `final_upper_bound` | All preceding hypotheses discharged implies \(K_G^{\mathbb C}<U_*\). | Direct transfer, fixed eta admissibility, exact inequality \(g_*U_*>1\). |

The direct transfer proof is short: each nonlinear tensor monomial contributes
at most \(V(A)\), while validity bounds the mixed correlation by \(M C(A)\).
For every original vector family,
\(q_0|\sum a_{ij}\langle x_i,y_j\rangle|\le M C(A)+S V(A)\),
where \(S=\sum_{n\ge1}|q_n|\). Take the supremum and rearrange. This avoids
formalizing the source's inverse-germ repair lemma; our frozen eta still needs
its elementary tensor admissibility theorem.

## 3. Kernel data and admissibility

`upstream/grothendieck_cx/audit_sparse6_altgroups.py` defines the five exact
rational rows. Its third stored row is negated relative to the positively
weighted physical branch. `verify_combined.py` reverses that row. Prove this
sign conversion, using oddness of the phase representative, before comparing
rows or replacing weights.

The six weights used in the final certificate are the exact rational decimals

```text
0.983543458398378100
0.012416654023174663
0.003031585753026536
0.000593628184609741
0.000016934659448514
0.000397738981362458
```

Their sum is exactly
\(M=250000000000000003/250000000000000000\), not1. The probabilities are
\(w_i/M\). Prove positivity and the mass identity over the rationals.

For a real odd preprocessor \(\rho\), construct separate left/right maps from
\(\sqrt{|c_n|}\) times
\(x^{\otimes(n+1)}\otimes\bar x^{\otimes n}\), putting the coefficient sign on
one side. If the coefficient norm is below1, pad the left and right maps by
orthogonal unit directions so their cross correlation is unchanged. This
establishes allowable preprocessing for the five rows and for frozen eta.

Define a standard complex Gaussian with density \(\pi^{-1}e^{-|z|^2}\), hence
\(\mathbb E|Z|^2=1\). Set phase(0)=1, or another fixed unit scalar, and explicitly
use that the exceptional origin has Gaussian measure zero. Prove the phase
kernel formula with
\[
h_n=\frac{\pi}{4(n+1)}\frac{\binom{2n}{n}^2}{16^n},\qquad
h_0=\pi/4,\quad
\frac{h_{n+1}}{h_n}=\frac{(2n+1)^2}{4(n+1)(n+2)},\quad\sum h_n=1.
\]
For the first five kernels, all finite scalar coefficients are rational
multiples of \(\pi\). The current code uses Arb, but Lean can instead compute
these finite coefficients over the rationals and use a proved interval for
\(\pi\). Numerical search or LP optimality is not a dependency.

The sixth kernel uses exact complex polynomials `LEFT`, `RIGHT` from
`support_compression_certificate/complex_upper_origin_layer_definitions.py`.
Let \(U=P_L/|P_L|\) and \(V=P_R/|P_R|\) on the nonnegative radial line. Establish
nonvanishing, measurability, smoothness away from any exceptional endpoint, and
unit modulus. Functions on the complex plane are
\(F(re^{i\theta})=e^{i\theta}U(r^2)\), and similarly for \(G\).
The source symmetrization uses the pair
\(F^\#(z)=\overline{F(\bar z)}\), \(G^\#(z)=\overline{G(\bar z)}\)
with probability1/2. Prove this conjugates the coefficients, so the average
has real coefficients \(\operatorname{Re}(a_n\bar b_n)\). Taking the real part
of the whole physical kernel would be a different operation and is invalid
here.

## 4. Signed radial basis, spectra, and first-order energy

A normalization matching the **code** is
\[
\psi_n(s)=\frac{(-1)^n\sqrt{s}}{\sqrt{n+1}}L_n^{(1)}(s),\quad
H=L^2([0,\infty),e^{-s}ds),\quad
\widehat U_n=\int_0^\infty\psi_n(s)U(s)e^{-s}ds.
\]
Establish that \((\psi_n)\) is a real-valued orthonormal basis of \(H\). Its
charge-one lift is \(e^{i\theta}\psi_n(r^2)\). The paper's displayed Laguerre
basis may omit \((-1)^n\); both sides of a product then change by the same sign.
Pick one convention and prove the translation once. The saved coefficient
tables use the signed formula above.

Prove the Mehler eigenvalue \(z|z|^{2n}\) on that charge-one component and the
coefficient expansion of the correlation. This includes convergence at
\(|z|=1\), justified by the absolute coefficient sum. The simple \(\ell_1\)
bound is \(\sum|a_n\bar b_n|\le\|a\|_2\|b\|_2=1\).

For a radial amplitude \(R\) in the appropriate quadratic-form domain, prove
\[
\mathcal E_1(R):=\int_0^\infty e^{-s}
\left(2s|R'(s)|^2+\frac{|R(s)|^2}{2s}\right)ds
=\sum_{n\ge0}(2n+1)|\widehat R_n|^2.
\]
The associated differential expression is
\(-2sR''+(2s-2)R'+R/(2s)\). Do not substitute the constant radial amplitude
into this energy identity: its singular term at zero diverges. Our three
amplitudes are endpoint-subtracted and vanish at zero. Show the identity for
these actual functions, by a closed-form-domain theorem or approximation with
controlled boundary terms. Smoothness only on \((0,\infty)\) without domain
or endpoint estimates is not sufficient.

For the constant radial amplitude1, prove its coefficients are
\(\xi_n=(-1)^n\sqrt{h_n}\). With \(\alpha=U(0),\beta=V(0)\), set
\(r_n=a_n-\alpha\xi_n\), \(s_n=b_n-\beta\xi_n\).
The exact polynomial data imply \(\beta=-i\alpha\). The stronger exact input
identity checked by the final verifier is
`RIGHT[0] == (LEFT[0][1], -LEFT[0][0])`. It gives equal endpoint norms and the
normalized phase identity; mere numerical near-orthogonality is insufficient.

Define the **real** joint amplitude
\[
C(s)=\operatorname{Re}\{\bar\beta[U(s)-\alpha]+\bar\alpha[V(s)-\beta]\}.
\]
Prove \(C(0)=0\),
\(c_n=\widehat C_n=\operatorname{Re}(\bar\beta r_n+\bar\alpha s_n)\), and
\[
k_n=\xi_n c_n+\operatorname{Re}(r_n\bar s_n).
\]
The endpoint cancellation also lets the implementation use
\(c_n=\operatorname{Re}(\bar\beta a_n+\bar\alpha b_n)\). All steps use the
reality of \(\psi_n\); a generic complex orthonormal basis would require more
care with conjugation and real parts.

## 5. Exactly what the coefficient tables must prove

The coefficient function required for each side and index is
\[
A_n(S,T)=\int_S^T e^{-s}\psi_n(s)U(s)\,ds.
\]
For the integration variable \(s=t^2\), its code integrand becomes
\[
\frac{2(-1)^n t^2}{\sqrt{n+1}}e^{-t^2}L_n^{(1)}(t^2)U(t^2).
\]
Prove the change of variables and the normalization; do not regard a matching
array shape as evidence of either.

| Data | Mathematical enclosure obligation | Generation/loading code |
|---|---|---|
| Source main table, indices0…119 | Both real/imaginary parts of \(A_n(0,25)\) lie in the saved boxes. | `support_compression_certificate/complex_upper_origin_layer_coefficients.py`; main table basename ends `_n120_analytic.npz`. |
| Source correction table, indices0…119 | Enclose \(A_n(25,36)\); add these boxes to the main boxes. | `generate_origin_tail_25_36.py`, `origin_tail_25_36.npz`, `tight_origin_extension.py`. |
| Combined added table, indices120…239 | Enclose \(A_n(0,36)\) directly for both sides. | `combined/generate_added_origin.py`, `combined/added_origin_120_240.npz`. |

Source-table SHA256 values are
`fc29fa555fb66c5cd6a2ac53dbd2508207b6058cfe0b339163faadeb85ad54da`
and `8bcc654f4fd44881a7b487fe1336a8905aaa2d1b52deca45e622e1c397fb03aa`.
The added table's SHA256 is
`8996603d5ad031d58e073105956d4189d4a1df3a6862f84a9dce1ec3dbce8dec`.
Check the bundled manifest for the canonical source-file hashes.

IEEE754 binary64 endpoints in NPZ files are exact dyadic rationals once their
bits are decoded. Export each finite endpoint by its integer numerator and
power-of-two denominator; reject NaN and infinities; verify lower≤upper, shapes,
index ranges, and metadata. **This exact export does not prove that any integral
lies between those endpoints.** Neither matching hashes nor overlap with a
second table supplies the missing enclosure theorem. The other-instance table
was compared for consistency but is not used as the source of these enclosures.

The original scripts use directed Arb integration and then check their outward
binary64 serialization. A Lean certificate must either prove that integration
algorithm sound and replay a sufficient trace, or replace it with a formal
quadrature/Taylor-remainder checker. The current NPZ files and logs do not
contain a complete kernel-checkable trace of Arb's adaptive integration.
Use exact complex rectangles or separately certified real/imaginary intervals.
The code's analytic extension evaluates real- and imaginary-coefficient
polynomials separately; taking `real` of a complex polynomial at nonreal
integration arguments destroys holomorphy and is not a valid replacement.

All true coefficients still include \(s>36\). Let \(d=e^{-18}\). Bessel/Parseval
proves the **joint vector** bound
\(\|(a_n-A_n(0,36))_n\|_2\le d\), and likewise for the right side. A per-index
bound alone would introduce an erroneous extra factor in the subsequent use.
The `joint_l2_tail_bound` floating metadata is not a formal proof; derive the
exponential bound analytically and enclose it with proved arithmetic.

## 6. Energy quadrature and all its infinite remainders

`combined/verify_dirichlet_energy.py` integrates the first-order energy of
\(U-\alpha,V-\beta,C\), over \([10^{-12},80]\). The cap propositions required
are the following **exact rational** inequalities:

```text
E1(U-alpha) < 1.10684082009393895861618
E1(V-beta)  < 1.106774759136645693569585
E1(C)      < 3.504133054650557143086961
```

Decimal syntax in a formal importer must represent those rationals exactly.
`energies.json` stores rational numerators/denominators; `energies.log` reports
successful Arb calculations. The log's printed ball descriptions are not a
formal certificate format.

The finite middle integral needs the same certified quadrature bridge as the
coefficient tables. Additionally prove the following analytic bounds. The
source establishes a phase derivative bound
\(L=12+1/(\delta|\operatorname{Im} A|)\) on the left, and analogously with \(B\)
on the right. The underlying rational polynomial nonvanishing, root-location,
and logarithmic-derivative estimates are checked by
`support_compression_certificate/complex_upper_convex_2e6_polynomial_certificate.py`,
using helpers from `complex_radial_phase_polynomial_certificate.py` and the
actual rational coefficients in `complex_upper_convex_2e6_radial_coefficients.py`.
The first script replaces the helper module's exploratory polynomial before
checking it: importing the helper alone would check different coefficients.
Its Sturm/root/Rouché conclusions require formal soundness lemmas if imported.
For each side,
\[
\mathcal E_1(U-\alpha;[0,\epsilon])\le\tfrac54L^2\epsilon^2,
\quad
\mathcal E_1(U-\alpha;[S,\infty))
\le e^{-S}\left(2L^2(S+1)+2/S\right).
\]
These follow from \(|U'|\le L\), \(|U(s)-\alpha|\le Ls\), and \(|U-\alpha|\le2\).
The joint outside bound is twice the sum of the two side bounds. Only the
middle joint integral retains cancellation. Check the closed/half-open
endpoint conventions, harmless null points, and nonnegative integrands.

For \(N=240\) and \(\lambda_n=2n+1\), obtain visible lower norms from the boxed
coefficient differences. If \(B_n\ge0\) is a proved lower bound on the modulus
of a boxed residual, then
\[
L_R=\max\left(0,\sqrt{\sum_{n<N}\lambda_nB_n^2}-\sqrt{2N-1}\,d\right)
\]
is a lower bound on its true weighted norm. For the joint sequence replace the
error by \(2\sqrt{2N-1}\,d\). The current data have positive inner expressions;
the verifier asserts that positivity. Assert or prove \(B_n\ge0\) before
squaring interval lower endpoints. A squared negative lower bound would not
supply the needed lower bound on a squared modulus.

Subtract these squared lower norms from the corresponding total-energy caps.
The resulting bounds are
\[
E_L<0.000884260662142687,\quad E_R<0.000885126188452271,\quad
E_C<0.003521036759326558.
\]
These displayed coarse values explain the tail but may lose the last digits of
the final target. The final checker must retain the tighter interval values or
choose new outward rationals with a proved final margin.

With \(W_N=\sum_{n\ge N}h_n/\lambda_n\), prove
\[
\sum_{n\ge N}|k_n|
\le\sqrt{E_CW_N}+\frac{\sqrt{E_LE_R}}{2N+1}.
\]
The first summand is weighted Cauchy–Schwarz for \(\xi_nc_n\); the second uses
\(\lambda_n\ge2N+1\). The implemented value is below
`0.000063628476111533542` before multiplying by the sixth mixture weight.

For \(W_N\), sum the recurrence through index16383 and prove the remaining
bound \(1/(16\cdot16384^2)\). One route proves the Wallis bound
\(h_n\le1/[4n(n+1)]\) for \(n\ge1\), then the rational telescoping comparison
\[
\frac{h_n}{2n+1}\le\frac1{16}(n^{-2}-(n+1)^{-2}).
\]
The Wallis estimate is an analytic/combinatorial lemma, not a consequence of
checking finitely many recurrence values. Prove it from a formal Wallis
inequality or a monotonicity-plus-limit argument with its limit theorem.

## 7. All scalar series and tails

For row \(\rho(t)=tP(t^2)\), the radial polynomial in outer block \(j\) is
\(h_jx^jP(x)^{2j+1}\). To compute coefficients with radial index below240,
only \(j<240\) can contribute. Prove this support fact; it justifies the
finite prefix loop independently of any numerical tolerance. Exact rational
polynomial convolution can calculate the coefficients divided by \(\pi\).

For branches1–4, prove the supplied complex-analytic bounds for the full
odd representatives: holomorphic continuation on the relevant radius and
modulus at most10 there. The radii are \(6/5\) and \(111/100\) for the remaining
three branches. Cauchy's coefficient estimate and an odd geometric series give
\[
\sum_{n\ge240}|[t^{2n+1}](h\circ\rho_i)|
\le\frac{10R_i^{-481}}{1-R_i^{-2}}.
\]
Source code: `complex_upper_convex_2e6_scalar_tail_certificate.py`, invoked by
`audit_sparse6_altgroups.py` and the prerequisite checker. It checks roots and
a finite angular grid with an explicit Lipschitz reserve. Formalize the
root-enclosure completeness, boundary-cover estimate, correct analytic square
root branch, and inference of holomorphy; a root finder returning plausible
roots is not a formal Cauchy-tail theorem.

For the fifth branch, `verify_combined.py:fifth_tail` computes exact integer
coefficients of \(\rho_5^{20}\), proving
\(\|\rho_5\|_1<1\) and \(\|\rho_5^{20}\|_1<1/2\).
It sums all outer blocks \(j<320\) **before** taking absolute values for radial
indices \(n\ge240\). The greatest radial index is
\(319+639\cdot37=23962\). Prove there is no truncation beyond this finite
polynomial. The omitted outer blocks have total coefficient norm at most
\[
\sum_{j\ge320}h_j\|\rho_5^{2j+1}\|_1
\le\frac1{4\cdot320\cdot2^{32}}.
\]
Proof: \(\lfloor(2j+1)/20\rfloor\ge32\), submultiplicativity, and
\(\sum_{j\ge320}h_j\le1/(4\cdot320)\) by telescoping Wallis bounds.
The final fifth tail is below `1.040219496692e-12`. This outer reserve bounds
all coefficients of omitted blocks, so overcounting their possible low modes
is safe. Do not reuse the much larger reserve printed by the historical
`upper_base/verify_exact.py` as if it were the final fifth-tail value.

## 8. Whole-vector integration error and rational eta

For the two finite truncated-input coefficient vectors \(A,B\), and true
coefficient errors of Euclidean norm at most \(d\), prove
\[
\sum_{n<N}|a_n\bar b_n-A_n\bar B_n|
\le d(\|A\|_2+\|B\|_2)+d^2.
\]
Taking real parts contracts absolute value. Multiply by \(w_6\). This single
\(\ell_1\) error covers the linear coefficient and every retained nonlinear
coefficient together; it is not to be charged twice. The current weighted
error is below `1.210877787495e-11`. Box widths for the finite integrals are
already handled by finite interval arithmetic and must not be confused with
this omitted-input error.

Let \(Q\) denote the finite mixed odd polynomial, and let \(R\) collect both
coefficient-integration error and all scalar/origin tails. Prove
\(\|R\|_1\le E+T\), where \(T\) is the weighted six-tail sum.
The file `inverse_eta.json` contains120 rational numbers \(e_j\), with
\(e_0>0\) and \(\sum|e_j|=1\). Its SHA256 is
`d058a4b2bec57a15bb889fcfc7462eeaabce5fd526eee0e4cace217b4af5825c`.
These are the whole definition of the frozen preprocessor; no inverse-series
algorithm or numerical optimization is required.

Prove \(\eta^{\mathrm{phys}}\) allowable and
\(\|R\circ\eta\|_1\le E+T\). Compute the entire \(P=Q\circ\eta\).
Its maximal radial degree is \(239+479\cdot119=57240\), corresponding to
ordinary odd degree114481. Keep all57241 radial coefficients. Confusing these
two notions of degree or truncating the composition at index239 would invalidate
the final estimate.

If the exact finite quantities satisfy
\[
D:=P_0-\sum_{n=1}^{57240}|P_n|-E-T>0,
\]
then the true composed coefficient difference is at least \(D\), even when the
error has a degree-one term. Direct transfer gives \(K_G^{\mathbb C}\le M/D\).
The actual finite data are interval enclosures, so the formal checker needs a
lower bound for \(P_0\) and upper bounds for the other three contributions.

## 9. Exact final endpoint and useful staged theorem

The directed computation reports
\[
D/M>0.7117952651600243044873313283636240423\ldots.
\]
A useful **rational** interface for Lean is the stronger-than-needed claim
\[
D/M>g_*:=7117952651600243/10^{16}.
\]
The final endpoint conversion is then elementary exact arithmetic:
\[
g_*U_*-1=
\frac{3491331740483897}{5000000000000000000000000000000}>0.
\]
Thus \(M/D<1/g_*<U_*\). No logarithm, square root, Arb arithmetic, or decimal
rounding is needed at this last step. Proving only this rational comparison
would establish a **conditional** bound; the hypotheses producing \(D/M>g_*\)
still need formal proofs.

An honest first milestone is a theorem explicitly parameterized by:

1. Six-kernel validity and coefficient-identification theorems.
2. The three coefficient-table integral-enclosure families.
3. The three total-energy cap theorems and spectral identity.
4. The four scalar Cauchy certificates and Wallis theorem.
5. Soundness of the finite rational/interval checker and its accepted data.

It can conclude the target upper bound **under those hypotheses**. Keep their
status visible in the statement and documentation. Only after discharging them
can the project describe the numerical bound as fully formalized. Do not hide
any of them behind new axioms, `sorry`, opaque external `PASS` strings, unchecked
FFI calls, or a theorem declaring an Arb result correct by fiat.

For a formally checked numerical layer, practical options include exported
rational Taylor/remainder certificates for quadrature, validated root disks
with rational Rouché bounds, or a fully formal interval-integration library.
Every exported certificate needs a proved checker-soundness theorem. For finite
polynomial convolutions and comparisons, proof-producing evaluation can avoid
formalizing the Python implementation itself. Performance choices should be
made after identifying what the chosen Lean kernel actually checks; no
particular execution tactic is assumed sound or available here.

## 10. Reproduction and file-level audit requirements

Use the Python environment separately from Lean. The observed runs used
Python3.14, python-flint0.9.0, and NumPy. These are reproduction observations,
not a promise of availability or a required Lean toolchain. The main combined
verifier needs Python/NumPy/python-flint and does not require SciPy. Do not run
Python with `-O` or `-OO`; the verifier rejects them because its assertions are
part of the computational check.

From the ZIP root, with `python` pointing at that environment:

```sh
python packages/grothendieck-cross-instance-review/combined/verify_combined.py \
  --source-dir upstream/grothendieck_cx

python packages/grothendieck-cross-instance-review/combined/verify_combined.py \
  --source-dir upstream/grothendieck_cx --full

python packages/grothendieck-cross-instance-review/combined/verify_dirichlet_energy.py \
  --source-dir upstream/grothendieck_cx --output regenerated-energy.json

python packages/grothendieck-cross-instance-review/combined/generate_added_origin.py \
  --source-dir upstream/grothendieck_cx --output rebuilt-added-origin.npz

python packages/grothendieck-cross-instance-review/combined/verify_combined.py \
  --source-dir upstream/grothendieck_cx --added-table rebuilt-added-origin.npz
```

Default assembly checks pinned hashes, finite series, visible energy, the exact
power20 norm, and complete eta composition. `--full` additionally reruns the
available original prerequisites and the three new first-order integrals. It
**does not regenerate any coefficient table**. The separate generator above
regenerates only indices120…239; the source main/correction generators must
also be run if rebuilding every table. Preserve their historical pinned files
or direct regenerated outputs to fresh locations; do not silently overwrite
inputs and call a changed table the original one.

The current bundle's `verification.log`, `full-verification.log`, and
`energies.log` record successful executions; an independent agent reassembled
the final bound and reintegrated all three energies. These are reproducibility
checks, not an independent formal verification of Arb. Read the manifest, the
source generators, and the proof together. The root-level SHA manifest should
pin whatever final ZIP layout is actually delivered; update command paths if
the packager changes that layout.

## 11. Remaining analytic work, in dependency order

1. Define matrix suprema, valid kernels, radial extensions, and tensor
   preprocessing with the stated complex conventions.
2. Prove shared-Gaussian validity, phase/Laguerre coefficients, Mehler action,
   basis completeness, and absolute convergence of kernel expansions.
3. Prove the first-order radial quadratic-form identity for the concrete
   endpoint-subtracted functions, with all domain and boundary conditions.
4. Prove the exact source polynomial nonvanishing/derivative prerequisites and
   the four complex-analytic Cauchy certificates using certified finite data.
5. Build a sound bridge from finite quadrature certificates to the actual
   coefficient and energy integrals; the present Arb logs leave this bridge
   unformalized.
6. Prove all infinite-reserve inequalities, then verify rational data,
   interval operations, complete composition, and the final slope inequality.

The sixth step alone is valuable and achievable independently, but it must not
be presented as a Lean proof of the full Grothendieck bound while steps1–5
remain mathematical assumptions.
