# Higher-degree games: start here

The proved lower bound K_G^ℂ > 1.40191 comes from the cubic witness P₁,₀ − (191/250)P₂,₁ with an identity tail
([`../identity-tail/`](../identity-tail/README.md)). Even a perfect evaluation of a cubic witness cannot certify more than 1.4022581233 ([`../conjecture-K/`](../conjecture-K/README.md),
ledger 12.2). Larger lower bounds need games of higher degree. In particular, the third decimal of K_G^ℂ needs a
certified 1.404, because the upper bound 1.40455741 is already below 1.4046.

This folder records what is known about higher-degree games:
- their numerical values and the responses that bind them;
- what the dual side and a first test of roundings show;
- the degree-5 certificate programme: its design, a conditional certificate for a capped game, and what is known
  about the sector inequality that the certificate assumes.

It is research material: nothing here is imported by Lean or checked by CI. **The game values and margins are
numerical (N)**, apart from the **P** or **C** parts of `STATUS.md` rows 1.6, 1.9, 2.6 and §4, which name their author and checker.

| file | what it is |
|---|---|
| `README.md` | this file: notation, the state in brief, reading order |
| [`STATUS.md`](STATUS.md) | **the ledger**: every statement with its scope, status, author and source |
| [`INVENTORY.md`](INVENTORY.md) | what is kept outside the repository (logs, numerical archives, downloaded sources), with paths, sizes and SHA-256 |
| `sources/` | verbatim copies of the working reports (primal/dual search, literature notes, the degree-5 design, its progress and the capped game, the content problem as posed to outside sessions, the review of the content band, the game with the radius 0.93 and the scope of the content lemma, and the attack plan of 25 November with its six problem statements) |
| `code/` | the scripts behind them and the small result files the ledger cites |

**Living documents.** `STATUS.md` is edited in place by every PR that changes the state of knowledge; copies under
`sources/` stay verbatim ([`../README.md`](../README.md)). There is no book yet: `STATUS.md` with this file is the
record.

## Notation

- **Games.**
  - P_{m,n} is the projection onto the complex Wick chaos of bidegree (m, n).
  - A game of degree 2K+1 is T_λ = Σ_{k≤K} λ_k P_{k+1,k}, with λ₀ = 1.
  - Its vector value tends to 1 (u = z/‖z‖), so K_G^ℂ ≥ 1/N(λ), where N(λ) = ‖T_λ‖_{∞→1} is the supremum of
    Re⟨f, T_λ g⟩ over unimodular pairs in every dimension.
- **Identity tail.** λ_k = ν for every k > K. The tail acts pointwise, Σ_{k>K} c_k = Re E[f̄g] − Σ_{k≤K} c_k, so it
  needs no truncation.
- **The graded model.**
  - The visible coordinate z (P₁,₀f is linear, so after a rotation it is a multiple of z), together with independent
    remote Gaussians.
  - A remote variable of bidegree (a, b) is a diffuse sum of Wick monomials; its Hermite polynomial H_{p,q} lies in
    bidegree (pa + qb, pb + qa).
  - A model value is the value of an explicit response pair, so it is a **lower** estimate of N(λ), and
    1/N_model is an **upper** estimate of what the game certifies.
- **Response families.**
  - W3, W5, W7: one remote variable of bidegree (2,1), (3,2) or (4,3).
  - Z2, Z3, Z4: one, two or three extra ordinary coordinates.
  - B, X11, Y: remote (2,0), (1,1), and real (1,1).
  - h∘ρ: preprocessed phase.
  - The plain phase z/|z|.
- **The certificate rows** (STATUS §4).
  - t = ‖P₁,₀(f + g)/2‖ is the visible linear part of a unimodular pair (f, g), and V = Re⟨f, T_λ g⟩ its value. A row
    is a choice of multipliers (ℓ, β, b_A, b_B, ν₅) made for one t; its bound is a parabola in t (STATUS 4.1). The
    envelope is the maximum over t of the smallest row bound, and the room of a row is 500/701 minus its bound.
  - q is the remote cubic of a response, u = E|q|² its energy, δ = E|q|⁴ − 2u² its fourth cumulant and χ = δ/u². In
    rows 4.19–4.34, V also stands for |q|². With ψ the potential of the row and B₅(u) its Gaussian value at the
    energy u, D(q) = B₅(u) − E ψ(|q|) is the deficit of q, S₅ = sup_u[B₅(u) − cost(u)] the benchmark of the row,
    and u\* (written σ\*² in some rows) its reference energy, the energy at which that supremum is attained.
  - K₅ is the sector inequality of a row, Λ₅ ≤ S₅ + η₅ with an allowance η₅ (STATUS 4.1). The A and B shells are
    its two sectors of first order: visible |z|² − 1 with a remote linear form, and visible z²/√2 with a remote
    antilinear form.
  - For a radial profile h, c[h] = Π₁[q·h(|q|²)] is the first-chaos content of q and e\* its direction;
    k(v) = E h(v + uτ) with τ ~ Exp(1), and Ω̂[h] = (3/2)E[V·k′(V)²] − (3/4)(E[V·k′(V)])²/u. The content law is
    ‖c[h]‖² ≤ θ·δ·Ω̂[h]. Its allowance θ_room(u) is the largest θ that keeps a row inside its room at the energy u
    in the law-layer relaxation (sufficient, not necessary; STATUS 4.29); the thresholds of STATUS 4.19 are minima
    of such allowances over a row's band of energies.
  - From the switch point t_s up, the certificate uses Gaussian rows, each tuned for one t (tuned rows); below t_s
    it uses law rows (STATUS 4.17, 4.31). A covering row is a tuned row used on a piece of t below its tuning point.
  - The junta is a cubic of one coordinate, the Wick monomial H(y) = y(|y|² − 2)/√2. A spike is such a coordinate
    in a diffuse bulk and c its coefficient; in the one-spike family of STATUS 4.23, c² is its share of the
    energy and ρ = c/√(2(1 − c²)).
  - M1a, M1b and M2 are milestones of issue #453: the conditional certificate, the research gate and the sharing
    lemma.

## The state in brief

| degree | best game λ | model value 1/N |
|---|---|---|
| 3 | ε ≈ 0.7564 | 1.402258 |
| 5 | (1, −0.84896, 0.28180) | 1.403648 |
| 5 + identity tail | (1, −0.86328, 0.33459), ν = −0.01384 | 1.40374 |
| 7 | (1, −0.906596, 0.541570, −0.242531) | 1.404113 |
| 9 | (1, −0.93600, 0.72057, −0.59202, 0.23468) | < 1.404218 (**P + C**, author only), 1.4041781 (**N**) against t = 0 multi-spike pairs (1.40430 in the PD2 pool; at most 1.40430 after retuning, open; STATUS 1.6, 1.8, 2.6) |

- **Bracket.** Upper bound K_G^ℂ ≤ 1.40455741 < 1/γ† = 1.404575934663742 (**Lean**: `Grothe.Statement.main_bounds`, `Grothe.UpperSix.constant_lt_inv_gammaDagger`); heuristic lower end at most 1.40430, open after STATUS 2.6 (λ₉ of STATUS 1.6 itself is below 1.404218 certified and ≈ 1.4041781 numerically against mesoscopic t = 0 multi-spike pairs, and a degree-9 game retuned against the larger pool is at most 1.40430; STATUS 1.6, 1.8, 2.6). Its left end is a model estimate, not a bound
  (STATUS 1.8). Haagerup's 1/γ† lies above the proved six-channel upper bound. No rounding built from the degree-9 binding responses
  beats Haagerup's γ_H (STATUS 3.3).
- **The degree-5 programme.** At t = 0 a row bound is at least λ₁ρ\*², so the proved radius bound caps the cubic
  weight λ₁ (STATUS 4.12; the games per cap are in 1.10 and 4.33). For the game (1, −39/50, 779/10000), model value
  1.402785, a certificate for 1.402 is computed over all t, conditional on a sector inequality K₅ on each row, with
  3.7·10⁻⁴ of room at the binding rows (STATUS 4.17). An independent Level A replay checks the row and envelope reductions (STATUS 4.40). On [1/4, 5/12], actual pairs force the sector comparison with their own remote cubic to spend more than the published row allowances. For the same pairs, row 0.25 of Claim 1 stays more than 0.172 below the target. A direct comparison with the law cap remains open for general pairs. The law-cap replay and several proof steps remain open (STATUS §5): the content lemma on every tuned row from t = 0.647 to
  0.886, whose binding rows are the lowest and need covering rows (STATUS 4.31, 4.32); whether the content
  inequality holds in every dimension (STATUS 4.28, 4.30); certified constants on t ≥ 0.86; the law rows between
  the direct bound (through t = 0.35859076 with the independently reviewed cubic radius and the mass inequality, STATUS 4.18e) and t = 0.647; and the other pieces of the gate (STATUS 4.16). At the upper end, a direct proof covers every pair from $t=0.88425210$ to the physical endpoint, and also covers pairs of remote cubic energy at most $3/5000$ from $t=0.81$ upward (STATUS 4.18d). The work runs under issue #453.

- **Visible quintic phase.** Optimizing its complex coefficient over a remote cubic buys less than $1.07\times10^{-7}$ over optimizing the real coefficient for the same law on all nineteen P6 rows. The gain from changing the prescribed real coefficient is a separate term in a fixed-profile proof (STATUS 4.16a).

**Reading order:** [`STATUS.md`](STATUS.md) §1 (values), §4 (the certificate design) and §5 (open problems), then the
sources it cites.
