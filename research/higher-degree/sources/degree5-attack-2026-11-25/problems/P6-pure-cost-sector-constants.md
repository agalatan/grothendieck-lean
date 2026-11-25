# P6. Certified pure-cost constants for the odd and the quintic sectors of the degree-5 rows

**Summary.** For each of about twenty explicit choices of five real constants, certify (in exact or interval
arithmetic) a handful of one- and two-dimensional Gaussian integrals: a scalar that must be below 1, the largest
eigenvalue of a 4×4 matrix function of one real parameter, and of a 12×12 one, each against an explicit bound, and
prove the short finite-amplitude statements that turn them into inequalities valid for all perturbation sizes.
These are the "pure cost" inputs of a sector inequality used in a lower-bound certificate for the complex
Grothendieck constant; all of them are true numerically with room, and none has a certificate.

Source record (not needed to do the work): ledger row 4.16 and §5 item 2 ("the other pieces of 4.16") of
`research/higher-degree/STATUS.md`; `sources/degree5-capped-2026-11-16/CAPPED_GATE.md` §§3, 4, 6 (items 4, 5, 7, 8);
`sources/degree5-progress-2026-11-16/GATE.md` §3; the pointwise inequality of `research/conjecture-K/STATUS.md` row
7.5.12 (repository `agalatan/grothendieck-lean`, master).

Labels: **P** proved on paper, **C** certified by exact or interval arithmetic, **N** floating point; "author only"
when nobody but the author has checked it.

---

## 1. Setting and notation

**One Gaussian.** z is a standard complex Gaussian (density π⁻¹e^{−|z|²}; T = |z|² ~ Exp(1), arg z uniform and
independent). E_z is the expectation over z. ph(a) = a/|a|.

**Wick basis.** e_{a,b}(z) = :z^a z̄^b:/√(a!b!), orthonormal in L²(z). Explicitly, for a ≥ b:
e_{a,b} = (−1)^b·b!·z^{a−b}·L_b^{(a−b)}(T)/√(a!b!) (generalised Laguerre polynomial), and e_{b,a} = conj(e_{a,b}). The
ones used here:

    e₁₀ = z,  e₀₁ = z̄,  e₁₁ = T − 1,  e₂₀ = z²/√2,  e₂₁ = z(T − 2)/√2,  e₁₂ = conj(e₂₁),  e₃₀ = z³/√6,
    e₃₂ = z(T² − 6T + 6)/√12.

**Constants.** ε₁ = 39/50, η = 779/10000, p₁ = 1/ε₁ = 1.28205…, p₂ = 1/η = 12.8370….

**Rows.** A row is (ℓ, β, b_A, b_B, ν₅). The rows of the problem are the 18 lines of the file
`research/higher-degree/code/degree5-content/rows5.lines` (JSON keys `l`, `beta`, `bA`, `bB`, `nu5`; labels
`t` = 0.70, 0.74, 0.76, 0.78, 0.80, 0.81, 0.82, 0.83, 0.84, 0.845, 0.85, 0.855, 0.86, 0.865, 0.87, 0.875, 0.88, 0.886),
and the row labelled 0.79, which is the key `row` of
`research/higher-degree/code/degree5-content/profiles_low/band_row_0.70.json`. They are floating-point numbers; for a
certificate round each to a rational with denominator 10⁶ and state the rounding (the statements below are stable
under changes of 10⁻⁶). Five of them, for orientation:

| label | ℓ | β | b_A | b_B | ν₅ |
|---|---|---|---|---|---|
| 0.79 | 0.7516941250 | 0.1186447826 | −0.0449189246 | −0.0247617045 | 0.0077710644 |
| 0.81 | 0.7833781762 | 0.1288429711 | −0.0472494177 | −0.0258300556 | 0.0089880800 |
| 0.82 | 0.7997556522 | 0.1341353557 | −0.0484474255 | −0.0263799069 | 0.0096459978 |
| 0.85 | 0.8512025455 | 0.1508568950 | −0.0521920307 | −0.0280612971 | 0.0118305960 |
| 0.886 | 0.9171736799 | 0.1726830224 | −0.0576943381 | −0.0316068868 | 0.0149469693 |

**The base.** For s ≥ 0:

    g(T) = ℓ + β(T − 2) + ν₅(T² − 6T + 6)/√12,      L′(z) = z·g(|z|²) = z(ℓ + β(T − 2)) + ν₅·e₃₂(z),
    D(z) = 1 − b_A·e₁₁(z) − b_B·e₂₀(z),      A₊(z; s) = L′ + s·D,      A₋(z; s) = L′ − s·D.

(s is the modulus of a "remote cubic" at a point; nothing about it is needed here.) On every row of the problem
g > 0 on [0, ∞) (its three coefficients are positive; min g = 0.47–0.60).

---

## 2. The statements

**(a) The zero-core scalar.** Z := ε₁·E_z[|z|/g(|z|²)] = ε₁·∫₀^∞ √T·e^{−T}/g(T) dT.

> For every row with label ≥ 0.81: Z < 1. Certify an upper bound for each row.

Values (N; record and this file agree to four digits): 0.9944 (0.81), 0.9770 (0.82), 0.9598 (0.83), 0.9429 (0.84),
0.9345 (0.845), 0.9262 (0.85), 0.9180 (0.855), 0.9098 (0.86), 0.9016 (0.865), 0.8935 (0.87), 0.8854 (0.875),
0.8774 (0.88), 0.8688 (0.886). For the rows 0.70–0.80 it is above 1: 1.2062, 1.1244, 1.0857, 1.0483, 1.0121 at 0.70,
0.74, 0.76, 0.78, 0.80, and 1.0300 at 0.79; for those rows certify the value to 10⁻⁴ (it is an input of (c)).

**(b) The odd pair, second order.** For (Q, P) ∈ ℂ² put O(z) = Q·z + P·z̄ and

    q_odd(s; Q, P) := Σ_{±} E_z[ (Im(O·conj(ph A_±)))² / (2|A_±|) ],

a real quadratic form in (Re Q, Im Q, Re P, Im P) with matrix M_odd(s) (4×4, symmetric, positive semidefinite).

> For every row with label ≥ 0.81 and every s ≥ 0: λ_max(M_odd(s)) ≤ λ_max(M_odd(0)) = p₁·Z < p₁.

(P at s = 0: A_± = z·g, the maximiser is Q imaginary, P = 0, and the value is |Q|²·E[|z|/g].) N: the maximum over
s ∈ [0, 6] is at s = 0 on every row tested, and the ratio falls from s = 0: 0.9262, 0.9138, 0.8798 at s = 0, 0.1, 0.2
on the row 0.85.

**(c) The odd pair, all amplitudes.** F_odd(s; Q, P) := E_z[|A₊ + O| + |A₋ − O| − |A₊| − |A₋|].

> For every row with label ≥ 0.81, every s ≥ 0 and every (Q, P) ∈ ℂ²: F_odd(s; Q, P) ≤ κ_odd·p₁·(|Q|² + |P|²) with a
> certified κ_odd < 1 (κ_odd = Z is the natural conjecture).
> For the rows 0.79 and 0.80: certify an upper bound of E_max(s) := sup_{Q,P} [F_odd(s; Q, P) − p₁(|Q|² + |P|²)] as
> a function of s (it is positive only for small s).

There is no first-order term: E_z[conj(z)(ph A₊ − ph A₋)] = 0 = E_z[z·(ph A₊ − ph A₋)] for real s (P, by z → −z
together with the charge of each term under z → e^{iφ}z; check it). N for E_max: on the row 0.80,
E_max(0) = 8.0·10⁻⁵ and E_max(s) = 0 for s ≥ 0.05; on 0.78, E_max(0) = 1.2·10⁻³.

**(d) The quintic block, elementary majorant.** Let 𝔼 = (e₀₀, e₁₀, e₂₀, e₃₀, e₀₁, e₁₁, e₂₁, e₃₁, e₀₂, e₁₂, e₂₂, e₃₂)
(all e_{a,b} with a ≤ 3, b ≤ 2), 𝔼₁ = (e₁₀, e₀₁, e₂₁, e₁₂, e₃₀), and for a list 𝔽 of these functions

    N_𝔽(s) := Σ_{±} E_z[ 𝔽·𝔽\* / (2|A_±|) ]        (Hermitian, positive semidefinite, size |𝔽|).

> For every row and every s ≥ 0: λ_max(N_{𝔼₁}(s)) ≤ (1/4)·p₂ and λ_max(N_𝔼(s)) ≤ (1/2)·p₂.

N (this file; the first agrees with the record's 0.241): sup_s λ_max(N_{𝔼₁})/p₂ = 0.2406 (row 0.70, at s = 0.35),
0.2039 (0.80), 0.1972 (0.82), 0.1878 (0.85), 0.1768 (0.886); sup_s λ_max(N_𝔼)/p₂ = 0.4822 (0.70), 0.4233 (0.80),
0.4121 (0.82), 0.3955 (0.85), 0.3762 (0.886), each attained at s = 0. (The second set is new in this file; it is not
in the record.)

**What (d) gives (P, one line):** for a ≠ 0 and u ∈ ℂ, |a + u| ≤ |a| + Re(ū·ph a) + |u|²/(2|a|). Hence for every
x ∈ ℂ^{|𝔽|}, with K = Σ_j x_j·𝔽_j: E_z[|A₊ + K| + |A₋ + K|] ≤ E_z[|A₊| + |A₋|] + Re Σ_j x̄_j·E_z[conj(𝔽_j)(ph A₊ + ph A₋)]
+ x\*N_𝔽(s)x, at every amplitude. So (d) says that the even ("h-side") perturbations cost less than a quarter,
respectively half, of their quadratic price p₂|x|², after the first-order term.

**The weakest versions that still suffice.** In (a)–(c): any certified constant below 1. In (d): any certified
constant below 1; the smaller it is, the smaller the share κ_h of the deficit that these sectors take (the share
scales like 1/(1 − constant)). The numerical room is 0.6 % (row 0.81) to 13 % in (a)–(c) and a factor 2–4 in (d).
For the row 0.81, Z = 0.9944: this row needs care; if it cannot be certified below 1, say so (the certificate can
use the allowance of (c) there instead).

---

## 3. What is known

- All values above are floating point (N), from two programs (the record's and one written for this file) that
  agree to four digits. The integrands have integrable singularities 1/|A_±| at the zeros of A_± (isolated points
  of the z-plane, moving with s), so a certificate needs an enclosure that handles them (see §5).
- (b) at s = 0 and the concavity of the increment in |Q|² at s = 0 are proved in the record (P, author only).
- In the record, the combination of these statements with the first-order ("content") inequalities into the full
  sector inequality is a design, not a written proof; this problem asks only for the statements of §2.

---

## 4. Why the obvious approaches fail

- **The elementary majorant on the odd pair** gives (c) at s = 0 only. Applied to A_± ± O it bounds F_odd by
  Σ_± E[|O|²/(2|A_±|)]. At s = 0 this equals (|Q|² + |P|²)·E[|z|/g] (the cross term averages out over arg z), so
  F_odd(0; Q, P) ≤ Z·p₁(|Q|² + |P|²) at every amplitude (P). For s > 0 it is too weak: its largest eigenvalue over p₁
  is 0.9593, 1.0427, 1.2248, 1.1962, 0.6961 at s = 0.1, 0.2, 0.4, 0.8, 1.5 on the row 0.85 (N, this file), above 1,
  while the true second-order form (which carries the factor sin² of the angle between O and A_±) stays below its
  value at s = 0.
- **A quadrature rule without error control** cannot certify (a) on the row 0.81 (room 0.56 %) or (b) near s = 0.
- **Monotonicity in s of λ_max(M_odd(s))** is observed, not proved; do not assume it. Cover s ∈ [0, s₁] by cells and
  treat s ≥ s₁ by an analytic bound (for large s, |A_±| ≥ s|D| − |L′| and E[|z|²/|D|] is finite).

---

## 5. Suggested approaches

- **(a)** is a one-dimensional integral of a smooth function: Arb's rigorous integrator, or exact Gauss–Laguerre
  with a derivative bound, or a Taylor model on [0, 40] plus the tail bound ∫_{40}^∞ √T e^{−T} dT / min g.
- **(b), (d): matrix entries as two-dimensional integrals with a 1/|A| singularity.** Use polar coordinates centred
  at each zero of A_± (the weight r dr removes the singularity), or the substitution used for the analogous
  degree-3 problem: when z ↦ L′(z) = z·g(|z|²) is a radial diffeomorphism (true here: (T·g(T)²)′ > 0), push the
  Gaussian forward to the plane of y = L′(z) and use shifted polar coordinates around −s·D… note that D depends on
  z, so at s > 0 the zero set is not a pure shift; a cell decomposition of the z-plane with interval Newton
  isolation of the zeros is the robust route. Then bound λ_max by Gershgorin or by a certified
  Cholesky/Sylvester test of c·I − M on s-cells, with the derivative of the entries in s bounded on each cell
  (∂_s(1/|A_±|) is not integrable, so differentiate after integrating by parts or use monotone bracketing in s).
- **(c): the sharp pointwise secant inequality** (proved and replayed in the degree-3 record; elementary). For
  L ≥ 1, Y ≠ 0, K, O ∈ ℂ, with K·conj(ph Y) = u_K + i·v_K and O·conj(ph Y) = u_O + i·v_O:

      |Y + K + O| + |Y + K − O| − 2|Y| − 2Re(K·conj(ph Y)) ≤ (1/|Y|)·(L·u_K² + v_K² + (L/(2L − 1))·u_O² + v_O²).

  With K = 0 and L → ∞ it gives |Y + O| + |Y − O| − 2|Y| ≤ (u_O²/2 + v_O²)/|Y|, valid at all amplitudes: the
  component of O across Y costs v_O²/|Y| and the component along Y half as much. It applies to F_odd with Y = A₊,
  because A₋(z) = −A₊(−z) and O(−z) = −O(z) give E_z|A₋ − O| = E_z|A₊ − O| (checked numerically for this file), so

      F_odd(s; Q, P) = E_z[|A₊ + O| + |A₊ − O| − 2|A₊|] ≤ E_z[(u_O²/2 + v_O²)/|A₊|] =: q̃_odd(s; Q, P).

  q̃_odd is a quadratic form; its v-part is q_odd. N (this file; λ_max of q̃_odd over p₁, s on a grid of step 0.025
  in [0, 2]): it equals Z at s = 0 and its maximum over s is 1.0761, 1.0574, 1.0381, 1.0192, 1.0099, 1.0014 on the
  rows 0.81, 0.82, 0.83, 0.84, 0.845, 0.85 (near s = 0.5; it is ≥ 1 on s ∈ [0.175, 0.75] for the row 0.81 and on
  [0.525, 0.55] for 0.85) and 0.9916, 0.9829, 0.9740, 0.9645, 0.9563, 0.9474, 0.9385 on the rows 0.855, …, 0.886. So:
  **on the rows 0.855–0.886 statement (c) would follow from a certified bound of λ_max(q̃_odd(s)) alone** (a
  one-parameter family of 4×4 matrices, with room 0.8–6 %), and on the rows 0.81–0.85 it follows outside a window
  of s around 0.5, where a genuine cover of (s, Q, P) (five real dimensions after the symmetries, as in the
  degree-3 certificate) or a sharper two-scale secant bound is needed. Re-derive the inequality before using it.
- **Negative controls:** the certifier must reject Z < 1 on the row 0.80 (true value 1.0121), reject the bound of
  (d) with 1/5 in place of 1/4 on the row 0.70, and reject (b) with p₁·Z replaced by 0.9·p₁·Z.

---

## 6. Deliverable

- A proof note for the paper parts ((b) at s = 0, the vanishing first-order terms in (c), the passage from the
  certified integrals to (c) at all amplitudes, the one-line majorant of (d)), every step checkable.
- A certifier and its result file: for each row, certified upper bounds for Z, sup_s λ_max(M_odd(s))/p₁,
  sup_s λ_max(N_{𝔼₁}(s))/p₂, sup_s λ_max(N_𝔼(s))/p₂, and κ_odd or E_max. Exact rational or interval arithmetic
  (python-flint/Arb, or C++ with outward rounding and an exact verifier of the stored data), the rounding of the row
  constants stated, the negative controls and their outcomes.
- Labels "P, author only" and "C, author only".

---

## 7. How to test a claimed result

A floating-point check (numpy; about a minute): a polar grid in z (Gauss–Legendre panels in |z| on [0, 6.6] with
weight 2r·e^{−r²}, 256 equispaced angles) reproduces to four digits

| row | Z | λ_max(M_odd)/p₁ at s = 0, 0.1, 0.2 | sup_s λ_max(N_{𝔼₁})/p₂ | sup_s λ_max(N_𝔼)/p₂ |
|---|---|---|---|---|
| 0.80 | 1.0121 | 1.0121, 0.9966, 0.9537 | 0.2039 (s = 0.40) | 0.4233 (s = 0) |
| 0.81 | 0.9944 | 0.9944, 0.9795, 0.9392 | 0.2005 (s = 0.40) | 0.4177 (s = 0) |
| 0.82 | 0.9770 | 0.9770, 0.9626, 0.9242 | 0.1972 (s = 0.45) | 0.4121 (s = 0) |
| 0.85 | 0.9262 | 0.9262, 0.9138, 0.8798 | 0.1878 (s = 0.45) | 0.3955 (s = 0) |
| 0.886 | 0.8688 | 0.8688, 0.8582, 0.8287 | 0.1768 (s = 0.45) | 0.3762 (s = 0) |

and, for (c), a random search over s ∈ [0, 2], directions and amplitudes |(Q, P)| ∈ [0.02, 3] finds
sup F_odd/(p₁(|Q|² + |P|²)) = 0.9025 (0.81), 0.8753 (0.82), 0.8861 (0.85), 0.8159 (0.886): below the s = 0
second-order value on each of these rows (600 samples per row; a search gives lower bounds of the supremum). The
matrix M_odd is assembled from the four functions B = (z, i·z, z̄, i·z̄) as
M_odd = Σ_± E[v_± v_±ᵀ/(2|A_±|)], v_± = Im(B·conj(ph A_±)).
