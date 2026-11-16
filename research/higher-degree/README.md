# Higher-degree games: start here

The proved lower bound K_G^ℂ > 1.401700322371 comes from the cubic witness P₁,₀ − (149/200)P₂,₁. Even a perfect
evaluation of a cubic witness cannot certify more than 1.4022581233 ([`../conjecture-K/`](../conjecture-K/README.md),
ledger 12.2). Larger lower bounds need games of higher degree. In particular, the third decimal of K_G^ℂ needs a
certified 1.404, because the upper bound 1.404599395362 is already below 1.4046.

This folder records what is known about higher-degree games:
- their numerical values and the responses that bind them;
- what the dual side and a first test of roundings show;
- the design of a degree-5 certificate.

It is research material: nothing here is imported by Lean or checked by CI. **The game values and margins are numerical (N)**;
the rows of `STATUS.md` §4 marked **C** or **P** name their author and checker.

| file | what it is |
|---|---|
| `README.md` | this file: notation, the state in brief, reading order |
| [`STATUS.md`](STATUS.md) | **the ledger**: every statement with its scope, status, author and source |
| [`INVENTORY.md`](INVENTORY.md) | what is kept outside the repository (logs, numerical archives, downloaded sources), with paths, sizes and SHA-256 |
| `sources/` | verbatim copies of the working reports (primal/dual search, degree-5 design, literature notes) |
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

## The state in brief

| degree | best game λ | model value 1/N |
|---|---|---|
| 3 | ε ≈ 0.7564 | 1.402258 |
| 5 | (1, −0.84896, 0.28180) | 1.403648 |
| 5 + identity tail | (1, −0.86328, 0.33459), ν = −0.01384 | 1.40374 |
| 7 | (1, −0.906596, 0.541570, −0.242531) | 1.404113 |
| 9 | (1, −0.93600, 0.72057, −0.59202, 0.23468) | 1.40430 |

- **Bracket.** The heuristic bracket is 1.4043 ≲ K_G^ℂ ≤ 1.404599395362. Haagerup's 1/γ† = 1.404575934663742 lies
  inside it. No rounding built from the binding responses beats Haagerup's γ_H (STATUS 3.3).
- **The degree-5 programme.** At t = 0 a row bound is at least λ₁ρ*², so the proved radius bound caps the cubic weight λ₁
  (STATUS 4.12; the games per cap are in 1.10). For the game (1, −39/50, 779/10000), model value 1.402785, a
  certificate for 1.402 is computed over all t, conditional on a
  sector inequality K₅ on each row, with 3.7·10⁻⁴ of room at the binding rows (STATUS 4.17). K₅ is open: the
  content band t ∈ [0.80, 0.855] and small t are the two gaps (STATUS §5). The work runs under issue #453.

**Reading order:** [`STATUS.md`](STATUS.md) §1 (values), §4 (the certificate design) and §5 (open problems), then the
sources it cites.
