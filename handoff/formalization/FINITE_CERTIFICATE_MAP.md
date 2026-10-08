# Finite certificates and their formalization boundary

**No Lean proof has been implemented.** The existing Python, C++, JavaScript,
and Arb programs produced successful local checks. Their `PASS` output is not
a Lean kernel proof. This map describes data that can be reified into exact
finite propositions, the soundness lemmas a checker would need, and the
analytic premises that must remain explicit until formally proved.

Paths below are relative to the proposed handoff ZIP root. Read
`LOWER_FORMALIZATION.md` and `UPPER_FORMALIZATION.md` for the analytic maps.
`finite_certificate_map.json` is the accompanying machine-readable inventory.
No Lean or Mathlib version is selected here, and no suggested theorem name
below denotes an already existing formal theorem.

## Exact target normalization

| Quantity | Exact rational |
|---|---|
| Desired lower endpoint `L` | `1400813971 / 1000000000` |
| Certified operator norm cap `B` | `3569353321 / 5000000000` |
| Desired upper endpoint `U` | `702449179522979 / 500000000000000` |
| Kernel mixture mass `M` | `250000000000000003 / 250000000000000` |
| Suggested normalized slope target `G` | `7117952651600243 / 10000000000000000` |

The lower terminal check is exact:

`1 - L*B = 507952309 / 5000000000000000000 > 0`.

Thus a formal analytic implication `K >= 1/B` yields the strict conclusion
`L < K`. For the upper construction, define the **unnormalized** repaired slope
`D = c0 - sum_{n>=1}|cn| - total_error` and the **normalized** slope
`Gamma = D/M`. The existing directed computation reports
`Gamma > 0.7117952651600243044873...`. A useful future rational certificate
target is `Gamma >= G`, equivalently `D >= M*G`, because

`G*U - 1 = 3491331740483897 / 5000000000000000000000000000000 > 0`.

Together with the rounding transfer theorem `K <= 1/Gamma`, this yields
`K < U`. The rational comparison is elementary; **the proposed inequality
`Gamma >= G` still needs a Lean-checked finite interval computation**. Do not
mistake the decimal Arb log for that proof.

## Data representation and checker architecture

1. Decode rational strings (`"a/b"` or finite decimals) exactly, without a
   floating-point intermediary. Normalize denominators to positive integers.
   Some LP files instead use objects with decimal-integer strings
   `numerator` and `denominator`; apply the same normalization.
2. Generate typed Lean data from JSON, or use a verified decoding layer. The
   untrusted converter may propose data; the formal theorem must concern the
   actual reified arrays, with shape and range checks proved inside Lean.
3. Prove small generic checker-soundness lemmas, then evaluate exact Boolean
   checks on concrete data and use those lemmas to obtain propositions.
   Separate finite arithmetic soundness from analytic implications.
4. Use a validation route whose resulting proof objects are checked by the
   Lean kernel. Do not silently replace kernel-checked evaluation with a
   compiler oracle, an external `PASS`, an axiom, or `sorry`. If an accelerated
   evaluation feature enlarges the trusted computing base, document that
   explicitly rather than calling it kernel-only checking.
5. Store hashes as provenance information. A matching SHA-256 identifies
   bytes; it proves no polynomial, interval, integral, or Grothendieck claim.

Recommended logical layers: exact rationals and polynomials; sound interval
arithmetic; Bernstein and matrix checkers; finite covers; concrete datasets;
conditional certificate theorems; analytic bridge theorems; final endpoints.

## Lower certificate: 21 profiles, 4,197 rectangle leaves, 20 scalar leaves

The final files are in `packages/grothendieck-further-squeeze/lower/`.
The independent executable specifications are `verify_joint_profiles.py` and
`verify_augmented_envelope.py`. Their constructors and optimizers are not
needed to check the frozen certificate.

### Source and physical-majorant layer

The pinned upstream `upstream/grothendieck_cx/check_complex_lower.py` contains
nine source profiles and their `DATA`. The base package has 48 additional
physical polynomials. Its full replay checks 997 price/Schur certificates,
220 source polynomials, the 48 additions, and prior moment covers.

Every used point cap and physical-polynomial constant is lifted by exactly
`1/100000000`. This is part of the replacement certificate: do not revert to
the unlifted source values or describe the unmodified source run as passing.
Higher polynomial coefficients are unchanged by this lift.

The new final rectangle checks are rational, but they assume each selected
polynomial is a **global physical majorant**, not merely an upper bound on
its old moment-search rectangle. Formalizing the base replay also requires
soundness of its Gaussian-moment enclosures and its C++ directed floating
interval computations; a rationalized downstream cap alone does not prove
these analytic/interval premises. See the lower analytic map for that chain.

### Profile and rectangle data

`coupled-profiles.json` is a list of 21 records. Each record specifies two
source indices, their identifiers, an exact weight `w`, parameters/cap,
and a list of leaves. The current total is 4,197 leaves. Each leaf has:

- `path`: a finite binary word;
- `box`: four rational strings `[u_lo,u_hi,x_lo,x_hi]`;
- `polynomials`: two indices into the source-plus-additional polynomial lists;
- optional `argument_scales`: two rational strings overriding record defaults.

Record-level `argument_scales` is also optional. Without either override use
the original source residual parameters `delta1,delta2`. Exactly 819 current
leaves carry allocation overrides. For every effective allocation check
`lambda1,lambda2 >= 0` and `w*lambda1+(1-w)*lambda2 = d`, where
`d=w*delta1+(1-w)*delta2`.

If `tightening` is present, independently check the averaged matrices,
averaged `ell,beta`, all matrix gates at `d'=record.delta`, and
`0<d'<=d`. Check the redundant metadata rather than trusting it:
`original_delta=d` and `extra_u2_penalty=d^2/d'-d`. Untightened records use
`d'=d`. The exact matrix conditions are: `epsilon=37/50`, `0<d'<epsilon`,
`M_R=M_I`, `ell>=2*beta>=0`; `M_E,M_R` are positive definite; subtracting each
specified dominance diagonal leaves a positive semidefinite matrix:

- `M_E - diag(-1,epsilon,epsilon)`;
- `M_E - diag(epsilon-d',0,0)`;
- `M_R - diag(-1,epsilon)` and `M_R - diag(epsilon,0)`.

For these small rational symmetric matrices, checking all principal minors
with a proved PSD criterion is one option. LDL or Schur-complement checkers
are alternatives, but need their own soundness proofs. The Python call to
the upstream `profile_gate` is not itself a Lean proof of admissibility.

Let `rho=977459/1000000`, `C6=4942289/100000`, and `epsilon=37/50`.
For selected lifted physical polynomials `p1,p2`, require length7,
coefficients3 and5 zero, and coefficients1 and6 nonnegative. For
`A_k=w*p1_k*lambda1^k+(1-w)*p2_k*lambda2^k` and
`g=2*w*(1-w)*(beta1-beta2)^2/epsilon`, reconstruct

`J(u,x) = A0-g + rho*A1*u + (A2-d^2/d')*u^2`

`         + A4*(2+x^2)*u^4 + A6*(6+9*x^2+C6*x^3)*u^6`.

Subtract **one** penalty `d^2/d'`; do not reuse the source penalties after
changing argument scales. Allocation can vary by leaf because each choice
is an upper bound for the same physical potential, as proved in the analytic
map. That statement is an analytic input to the finite checker.

For fixed `u>=0`, the variable x part is `a*x^2+b*x^3` with `b>=0`, so its
maximum on a nonnegative interval lies at an endpoint. Prove this elementary
lemma, then check the u-Bernstein upper bound at both saved x endpoints.
For a power polynomial `p(u)=sum_j p_j*u^j` of declared degree `n`, the
coefficients on `[l,h]` are obtained exactly by

`a_k = (h-l)^k * sum_{j=k}^n p_j * binom(j,k) * l^(j-k)`;

`b_k = sum_{j=0}^k a_j * binom(k,j)/binom(n,j)`.

The soundness theorem is `p(u)<=max_k b_k` on `[l,h]`, because Bernstein
basis functions are nonnegative and sum to one. Require every resulting
coefficient at both x endpoints to be at most the profile's cap.

### Exact rectangle coverage

Decode each path from `[0,rho] x [0,31/4]`. At even depths bisect u, at odd
depths bisect x; digit0 chooses the lower half and digit1 the upper half.
Reconstruct and compare the saved box exactly. Reject invalid digits,
duplicate paths, and a path that is a prefix of another.

For `D=max(path lengths)`, verify the integer equality
`sum 2^(D-length(path)) = 2^D`. With prefix-freeness this covers the full root
rectangle. The generic cover lemma, including closed-boundary overlap, needs
a proof; the equality by itself is not a geometric theorem.

### Scalar envelope

`envelope.json` has 31 rows: the crude row, nine old profiles, and21 virtual
profiles, sorted by `ell`; it has20 scalar cover leaves. Rebuild the rows from
the checked inputs rather than trusting the saved rows. The crude row is
`(ell,beta,C)=(0,0,epsilon*rho^2)`. Old caps come from the checked base moment
cover; new caps come from the rectangle layer.

Write `F_i(t)=t^2-2*ell_i*t+C_i`. A leaf selects one or two row indices. For
a pair with `a=2*(beta_i-beta_j)^2/epsilon>0`, the valid envelope is the
appropriate single endpoint outside `|F_i-F_j|<=a`; within that window it is

`(F_i+F_j)/2 - a/4 - (F_i-F_j)^2/(4*a)`.

This is piecewise quadratic. Split exactly at its two window boundaries and
check endpoints plus the vertex when the quadratic is concave and its vertex
lies inside the piece. Each scalar binary path bisects `[0,9/10]`. Check path
coverage as above and also exact saved endpoints. Every chosen maximum must
be at most `B=3569353321/5000000000`. The admissible t-range and the connection
between profile bounds and the operator are separate analytic theorems.

## Upper finite LP: what can be proved immediately from rational data

The two rational files `packages/grothendieck-cross-instance-review/audit/`
`replayed-certificate.json` and `replayed-our-table.json` contain a240-by6
matrix `C`, six penalties, six primal weights,239 dual coefficients, and an
exact rational optimum. They concern the supplied **unpreprocessed** model,
not the later full preprocessed upper bound.

Check all shapes, positive denominators, `sum_i w_i=1`, `w_i>=0`, `gamma>0`,
and `|y_n|<=1`. Define `a_i=C_0i-sum_{n=1}^{239} y_n*C_ni`. Check both signed
rays, equivalently `|a_i|-penalty_i<=gamma`, for all six columns. Check that
the primal score

`C_0*w - sum_{n=1}^{239}|C_n*w| - sum_i penalty_i*w_i`

equals `gamma`. This proves an attained global optimum for real signed
mixtures with total absolute weight1, via a small exact duality argument;
no formal LP optimizer is needed. Complementarity and active set
`{1,3,4,5,7}` are useful additional checks, but the dual/primal proof is enough.

The second, relaxed certificate uses negative uncertainty penalties and
drops the unknown tail. With a separate theorem relating the actual kernel
coefficients to `C` and those uncertainties, it proves the method floor
`1.404898309212694 < B_fixed_norm`. This is not a lower bound on K. It applies
only to the direct coefficient-norm criterion for these six fixed kernels;
it does not constrain a common nonlinear preprocessor or other kernels.
Finite-model optimality and coefficient provenance are distinct obligations.

## Upper interval assembly: exact inputs are not integral proofs

The current best upper package is
`packages/grothendieck-cross-instance-review/combined/`. Its main verifier is
`verify_combined.py`; its source and input identities are in `manifest.json`.

- `inverse_eta.json`:120 rational radial coefficients, with positive leading
  coefficient and sum of absolute values exactly1. This normalization is an
  immediate finite rational target. Tensor realizability and the Wiener
  composition contraction are analytic lemmas.
- `added_origin_120_240.npz`: eight Float64 arrays of length120, indexed by
  left/right, real/imaginary, lower/upper, plus `start=120,count=240,cutoff=36`.
  Reject NaN/infinity and reversed bounds. Decode each finite IEEE754 value
  as its exact signed dyadic rational; do not reinterpret its displayed
  decimal as an exact endpoint. NumPy is only an extraction tool. A Lean
  theorem must still prove that the corresponding true integral lies within
  each pair of endpoints. The same obligation applies to the original two
  upstream tables supplying indices0..119.
- `energies.json`: rational ceilings for the left, right, and joint energies,
  respectively `1.10684082009393895861618`,
  `1.106774759136645693569585`, and `3.504133054650557143086961`.
  Parsing these rationals is easy; proving the integral inequalities is not
  supplied by a stored `status="PASS"` field or an Arb log.
- The source fifth preprocessor has denominator `10^12`. Exact integer
  convolution checks `||rho5||_1<1` and `||rho5^20||_1<1/2`; the new outer
  reserve is exactly `1/5497558138880`. The finite coefficient-norm sum before
  that reserve is an interval-polynomial computation, not currently a saved
  standalone rational trace.
- Scalar coefficients are extended through239, W1 is summed through16383,
  and the full eta composition has degree57240. These calculations use Arb
  arithmetic involving pi, square roots, and `exp(-18)`. An eventual Lean
  checker needs sound rational interval replacements and proved enclosing
  constants, or an independently checked trace of those operations.

The current package does **not** contain Lean-checkable quadrature certificates
or a complete finite interval-operation trace for the upper assembly. Useful
next exports are exact dyadic coefficient boxes, exact rational interval bounds
for the scalar prefix and total tails, and a checked interval-polynomial
composition trace or another proved coefficient-norm bound. Keep every such
export tied to a formal containment theorem. Do not promote numerical
integration output to an axiom while presenting the final theorem as complete.

A sensible first milestone is a theorem conditional on explicit coefficient
and energy enclosure hypotheses. Then discharge those hypotheses one by one.
Until all are discharged, its name and documentation should say that it is a
conditional certificate theorem, not a proved numerical Grothendieck bound.
