# Upper-bound reassessment, 23 October 2026

## Concrete result and exact status

The existing joint-prefix error certificate can be applied to the **actual
bounded polynomial rounder** `T = F0 P3(phi)` already used by the current
master construction. Reassembling its components gives

`sum |E_T - E_X| <= 1017321032757 / 10^18`.

With the unchanged native-checked finite head, current preprocessing, slope,
energy-table error and Hardy-tail allowance, this yields the conditional bound

`K_G^C <= 40000000000000000 / 28477888065186929`

`= 1.4045985400475813... < 1.404598540048`.

This improves the current **conditional** endpoint `1.404598635371` by about
`9.53234e-8`. It does not beat the stronger, unmerged `work/upper-stable`
construction reported at `1.404596071666`, which has a different finite-head
verification boundary. This is reuse of an existing analytic improvement
with a different target function, not a new rounding principle.

`ImprovedComparison.lean` proves the implication from current `DirectHyps`
and the explicitly stronger comparison premise. Its successful axiom output
is in `lean-check.log`: the usual `propext`, `Classical.choice`, `Quot.sound`
and the existing native `head_check`; no `sorryAx` and no new axiom declaration.
The additional comparison premise is not discharged by that Lean theorem.

`tools/reassessment_comparison_upper.py` independently checks exact rational
arithmetic for all three joint-prefix duals, 14 Hilbert–Schmidt union caps,
20 square-root gates and the endpoint. It binds 48 of the 56 coordinate HS
caps to locally present directed-source JSONs; the remaining eight belong
to the two original power-1 cutoffs whose source file is absent. It also binds
all 1,140 phase monomials, every rounding/preprocessing parameter, and all
21,168 current Lean energy entries to the existing exact input files.

**Important remaining source boundary.** Three original numerical-source
files are absent from this checkout: the phase moments JSON, the original
rectangular HS JSON (cutoffs 51 and 101), and the coefficient-center norm JSON.
Their hashes are preserved in the old certificates; their numerical
enclosures survive in the supplied joint-prefix and Taylor comparison JSONs.
Hashes do not prove those enclosures. In particular the three phase moment
bounds used by the improved dual remain explicit inherited premises:

- `E phi^2 <= 2.568529474445872...e-6`;
- `E phi^4 <= 5.714395097039324...e-10`;
- `E phi^6 <= 1.6823873643012012...e-11`.

Their exact rational values are exported in `comparison-result.json`. This
work does not regenerate Gaussian integrations, recover the absent source
files, prove the existing Hardy input, or give a hypothesis-free improved
Grothendieck bound.

## Why the improved comparison applies directly to T

The source is `handoff/upper-residual/matrix/SHARPER_PHASE_COMPARISON.md` and
its immutable `joint_prefix_certificate.json`, SHA256
`89498abdeb0f2a5827177e2147dd75f0f61346deb935e583f3f59eb4b1a5b4c3`.
The phase and frozen correction have the identical hashes used by current
`Data.lean` and the existing polynomial-bridge package.

Let `B` multiply by `i phi`, let the finite centers be `c_j` through degrees
`181,91,51`, and write `w = v - sum c_j/j!`, `rho >= ||w||_2`. Then exactly

`T-X = sum_{j=1}^3 (B^j F0-c_j)/j! - w`.

For the contractive Gaussian smoothing S, expand the difference of grouped
chaos energies. With `R=T-X`, Cauchy–Schwarz gives

`sum |E_T-E_X| <= 2 sum_d ||P_d S X|| ||P_d S R|| + ||S R||^2`.

The source's `a_i,a_tail` bound the raw X norms and are therefore also valid
after contractive smoothing. If `e_i` denotes the actual low-band error,
the common error vector obeys every prefix constraint

`sum_{i<=k} e_i^2 <= epsilon_k^2`.

Because every `epsilon_i < ell_i`, the moment and reverse triangle bounds
give `t^2 + sum_i (ell_i-e_i)^2 <= mu_{2j}`. This positivity check is essential;
the same formula would not follow for unrestricted errors exceeding ell_i.

For arbitrary rational `lambda>0, nu_k>=0`, put `M_i=sum_{k>=i}nu_k`.
Completing squares proves

`sum a_i e_i + a_tail t`

`<= lambda(mu-sum ell_i^2) + a_tail^2/(4lambda)`

`   + sum nu_k epsilon_k^2`

`   + sum (a_i+2lambda ell_i)^2/(4(lambda+M_i))`.

Each supplied dual is checked by exact evaluation of this expression.
Their combined cross contribution is `1.0172466209447794...e-6`; the
quadratic norm-error contribution is `7.441181093871873...e-11`.
The finite rounding term is at most `4rho`, since `||X||<2`. Consequently

`sum |E_T-E_X| <= cross + error^2 + 4rho`

`< 1.017321032757e-6`.

There is no comparison with `F0 exp(i phi)` in this derivation. Thus no
exponential Taylor remainder occurs. This is a fresh assembly of component
inequalities, not subtraction of a remainder from an old upper bound.
The same argument works with the current diagonal preprocessing because
both smoothing and the polynomial-kernel coefficient transport contract.

## Alternating-sign screening: corrections to the attack note

For absolutely summable real coefficients, the strongest elementary statement is

`D = c0-sum_{k>=1}|c_k| <= A = sum_k (-1)^k c_k`.

If `D>0`, then `A>0` automatically. Equality means
`(-1)^k c_k = -|c_k|` for every nonlinear coefficient. This valid identity
does not imply that damping/preprocessing maximizes A at an endpoint.

The generalized claim `max_{|b_i|<=1} W(b)=W(1,1)` in the attack analysis is
false. This was already corrected in the repository's
`handoff-2026-10-15/ch17-crossbound.tex`, subsection “Correction: an endpoint
Fourier value is not preprocessing-monotone.” That section has an exact
one-coordinate counterexample. The later attack note regresses from that
correction.

Here is an additional particularly simple two-coordinate fixture, preserving
charge one, conjugation symmetry, nonnegative energies and disk-valuedness:

`f(z,w)=phase(z) exp(-|w|^2)`.

For the standard Laguerre polynomial L_k,

`integral_0^infinity exp(-2s) L_k(s) ds = 2^(-k-1)`.

The w-energy in degree `2k` is therefore `4^(-k-1)`. If `A_phase(1)=gamma_dagger`,
the alternating functional is

`W(b1,b2)=A_phase(b1)/(4+b2^2)`.

In particular `W(1,1)=gamma_dagger/5`, while the admissible zero auxiliary
preprocessor gives `W(1,0)=gamma_dagger/4`, strictly larger and positive.
The exact finite identities are checked by
`tools/reassessment_alternating_upper.py`; the geometric-series proof supplies
the full infinite formula. This gives no new bound on K_G.

Further distinctions matter for the research plan:

- The master table's reported endpoint maximum and averaged alternating
  partial sums are floating evidence for that table. They do not certify a
  universal preprocessing barrier or its infinite tail. The approximately
  `1.07e-6` T-X energy uncertainty alone corresponds to about `2.1e-6` in K,
  comparable with the remaining reported optimization room of this family.
- Sixty phase-iteration starts do not prove the global one-coordinate maximum.
  Moreover that experiment optimizes the same-map quadratic functional
  `<f,Gamma f>`. General one-coordinate schemes allow two distinct maps and
  the larger bilinear problem `Re<f,Gamma g>`; the old HJM origin pair already
  uses distinct radial amplitudes. A claimed barrier needs a justification for
  reducing this larger class to the quadratic problem.
- The observed two-coordinate W gain is useful numerical evidence. It proves
  neither a global maximum nor that every improved rounder must use the
  observed vortex profile or scale. A search maximum does not upper-bound
  the possible room for future work.
- Full matrix-covariance preprocessing is already developed locally and has
  a strictly larger factor-budget domain than separate scalar channels.
  The “vortex inside a master-like family” direction is one candidate, not a
  necessary condition for progress.
- The attack note calls the inverse of Haagerup's h a series beginning
  `1,-1/8,0,-1/1024,...`. Those are coefficients of the inverse of the normalized
  `h/(pi/4)`. The inverse of h itself begins `4/pi`; its higher coefficients
  also carry the corresponding powers of `4/pi`.

The valid general screening quantity is the supremum of the appropriate
alternating bilinear functional over the **actual admissible covariance
domain**, with a certified tail and coefficient uncertainties. Screening by
`W(1,1)` alone can reject useful candidates.

## Assessment and adjusted attack priorities

The current upper proof has a strong finite core: exact rational
preprocessors, tensor realization, coefficient locality and contraction,
native evaluation of the whole retained head, and an explicit residual
transfer to finite complex matrices. Its small decimal is conditional on
Gaussian kernel validity, chaos/Mehler theory, the comparison enclosures,
energy-table accuracy and the Hardy continuation input. A clean axiom report
of the endpoint implication does not remove those premises.

The comparison allowance is 88.71% of the current residual budget. The
concrete reuse above removes about 4.5% of that allowance, while preserving
the native head proof. By contrast, simply replacing the Hardy squared-mean
cap 7/4 with its reported measured mean changes only a small tail component.

The best immediate upper priorities are:

1. Restore or regenerate the missing moment/HS/norm source files, and replace
   the comparison premise with a small, reviewable finite input interface.
   The new exact replay identifies every surviving and missing binding.
2. Port the existing stronger matrix candidate with an independent native
   matrix-contraction head checker. Its present `head_close` boundary is a
   verification task; inventing another rounder is not required to exploit it.
3. Optimize the full D objective, including transport and tail cost, over
   master-like rounders and matrix covariances. The vortex experiments
   demonstrate how an improvement of W can be lost during the actual transfer.
4. For further comparison savings, retain prefix constraints, covariance
   structure and signed cross terms rather than only the global error norm.
   Higher Taylor cutoffs need fresh coefficients and a complete error budget;
   an unpriced numerical tail is not an improvement.
5. Keep numerical discovery, finite exact certificates and closure of the
   Gaussian analytic theory as separate milestones with explicit dependencies.

The historical 49-branch and 120-mode packages are internally careful about
normalization, physical radial versus holomorphic monomials, full omitted
tails, and the distinction between arithmetic implications and analytic
proofs. Their endpoints `1.404896257347` and `1.404898426735` are superseded
by the later two-coordinate construction; their local optimizer optimality
certificates do not limit enlarged families.

## Literature checked

Primary sources opened online during this audit:

- Heilman–Jones–Malavolta, [Sharper Bounds for the Complex Grothendieck
  Constant](https://arxiv.org/html/2609.25462v1), September 2026. The theorem is
  `1.4 < K_G^C < 1.404898554746`; the `1/gamma_dagger` value remains conjectural.
- Heilman–Jones–Malavolta, [Primal/Dual Method for the Grothendieck
  Constant](https://arxiv.org/html/2610.10477v1), October 2026. Its displayed
  primal/dual theory and endpoint theorem are for the real constant. The local
  complex extension requires its own proof; such a proof is present in the
  manuscript's ch17 rather than supplied directly by the cited real theorem.
- Naor–Regev, [Krivine schemes are optimal](https://arxiv.org/abs/1205.6415).
  This is explicitly a theorem for the real constant and general Gaussian
  scheme measures, not a complex one-coordinate barrier.
- Braverman–Makarychev–Makarychev–Naor, [The Grothendieck constant is strictly
  smaller than Krivine's bound](https://arxiv.org/abs/1103.6161), for context on
  why a historically natural rounding formula need not be the true constant.

These literature checks do not replace review of the local constructions.

## Replay and coverage

From the repository root:

```
python3 -I tools/reassessment_comparison_upper.py
python3 -I tools/reassessment_alternating_upper.py
lake env lean handoff/research-third-decimal/reassessment-20261023/upper/ImprovedComparison.lean
```

`comparison-result.json` records the exact endpoint and source boundary;
`lean-check.log` records the conditional theorem's successful compilation.
`tools/reassessment_conservative_upper.py` separately tests whether the old
available norm/tail enclosures can replace the absent moment file; it is a
floating search diagnostic and cannot prove an optimizer barrier.

Coverage was deliberately recorded honestly. The requested attack_analysis.tex
was read completely, together with NOTES Steps18/18b/19/19b/20/23 and the
current upper plan. The main 49-branch and 120-mode derivations, current
polynomial bridge, mixed-cutoff lemma, sharper joint-prefix proof, matrix
handoff and finite arithmetic proof, relevant Lean implementation and
comparison generator were read in detail. Other unique upper historical
documents were inventoried by hash and structurally scanned for headings,
assumptions, proof boundaries and replay warnings. They were not all reread
line by line and their expensive integrations were not replayed here.
The Step19/20/23 campaigns were assessed from the local analysis and notes,
not independently rerun. Local scripts and logs are present under the requested
attack directory; their existence is not a reproduction of those campaigns. No claim of exhaustive attached-book coverage is made by
this upper subtask.
