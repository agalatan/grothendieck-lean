<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/BUDGET_AUDIT.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# Content budgets and the permitted B tilt

Agent-ID: **codex-91d4**. Refs #426. 15 November 2026.

This note separates exact budget algebra, inherited research, numerical
search findings, and still unproved targets. Its checker is
`content_structure_exact.py`; its completed output is
`content_structure_exact.log`.

## 1. A B tilt is admissible

The task's sentence “B cannot be tilted” excludes only the inadmissible
choice of a retained element proportional to `conj(r_B)`. There is a
different, admissible choice. Since `r_A,r_B` are holomorphic remote
linear forms, for any **real** `s,t`

    v = −s r_A −t r_B ∈ H_(1,0).

The retained variational definition consequently permits the upper bound
obtained with

    G−v = q+(T−1+s)r_A+Z²conj(r_B)/√2+t r_B.

The pair of norm terms can be replaced by twice the plus expectation:
under `Z↦−Z`, `L` changes sign while all terms of `G−v` are unchanged.
Define `c₀(q)=Π₁ E_Z ph(L+q)`. Differentiation at the remote base gives
the exact two linear coefficients

    c_(A,s)=c_A+s c₀,          c_(B,t)=c_B+t c₀.

For the B term, the real first variation of
`Z²conj(r_B)/√2` is the pairing with
`F_B(q)=E_Z[(Z²/√2)conj(ph(L+q))]`. The added `t r_B` gives
the pairing with `t E_Z ph(L+q)`. This confirms the same holomorphic
coefficient convention; no antiholomorphic retained element was used.

The retained penalty must be kept in full:

    ‖s r_A+t r_B‖²
      =s²‖r_A‖²+t²‖r_B‖²+2st Re⟨r_A,r_B⟩.

Thus the quadratic budget before subtracting a secant majorant is

    P_(s,t) = p I₂ − [[s²,st],[st,t²]].                     (1)

It is diagonal only when `st=0`. A valid secant matrix `M` for this
modified visible expression would give `K=P_(s,t)−M`. Dropping the cross
penalty, or using the old one-shift secant theorem after adding `t r_B`,
would be invalid.

This algebra is **P, author only** here and independently matches the
new work in issue #421. It corrects a constraint in the prompt; it does
not produce a usable two-tilt cost.

## 2. Newer inherited content input, and its review boundary

Read-only inspection found
`/Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/research/conjecture-K/sources/progress-2026-11-15-codex-a7c4/JOINT_CONTENT.md`.
That note is **P by its author, pending external review**, with scalar
checks. It proves a sharp lower raw-kernel ratio by an Abel transform and
an increasing likelihood-ratio argument. Together with the older,
reviewed `.007` alignment certificate, it obtains

    c_B = ρ c_A + e,       ρ=5053/10000,
    ‖e‖≤(7/2000)√u,

using `Π₁q=0` to center a one-sided profile range. The centered estimate
is not being silently upgraded to an externally reviewed input here.

With `t=ρs` the algebra in section 1 gives

    c_(B,ρs) = ρ c_(A,s) + e.                              (2)

For `s=3/5`, the reviewed A content bound and this new alignment imply

    ‖c_(B,15159/50000)‖² ≤ (1/10)D₊+443/10⁸,
    0≤u≤463/10000.

The budget is the exact completion

    η_B = γη_A/α + γ e_*²/(γ−ρ²α)
        =51760323/11700786500000 <443/10⁸,

where `α=.3`, `η_A=6·10⁻⁶`, `γ=.1`,
`e_*²=(7/2000)²(463/10000)`. The new checker rechecks this rational
arithmetic, **not** the full Abel argument or either inherited continuum
certificate. The cost problem for the two-tilt expression remains open.

The root agent's fresh **N** secant search found a direction with cost
about `.09577` at `(s,t)=(.6,.30318)`. This rules out casually pairing
the appealing content relation (2) with a large common cost. It is a
numerical obstruction to that budget strategy, not a counterexample to
the retained sector theorem. The secant reconnaissance files give the
actual witness and its refinement.

## 3. Existing A certificates cannot merely be relabelled `.15`

The reviewed A theorem is

    ‖c_(A,.6)‖² ≤ .3D₊+6·10⁻⁶.

It uses the upper envelope

    H_A(u,χ)=min{γ(u)u²χ, 3u³χ^(3/2), 1/2500,
                 (19321/10⁶)u},                           (3)

and a saved pool of 119 accepted spectral dual models. Each model at a
fixed energy gives an upper bound `F_P(u,χ)` for the raw remote norm sum.
The benchmark `B(u)` then gives the lower deficit bound `B−F_P`.

For a cheap and precise feasibility test, we reevaluated every saved
model at each of two energy nodes, chose the smallest `F_P`, and retained
the minimum of the four branches of (3). All reevaluation uses exact
rationals and the inherited outward 220-bit interval operations; saved
benchmark balls are read as exact decimal intervals. No dual proposal
is newly accepted and no Gaussian integral is recomputed in this part.

| `(u,χ)` | `H_A` | best saved `B−F_P` | required coefficient with `η=6·10⁻⁶` | required `η` with coefficient `.15` |
|---|---:|---:|---:|---:|
| `(.0463,3)` | `.000209009775` | `.000845094962403516` | `>.2402212580023246` | `>.000082245530639472` |
| `(.0275,12.29)` | `.000399956642071759` | `.001434026014496434` | `>.2747207080550062` | `>.000184852739897294` |

The required coefficient here is `(H_A−6·10⁻⁶)/(B−F_P)`.
These are **C, author only, statements about the fixed saved envelope
pool**. They are not lower bounds on true content, not upper bounds on
the true deficit, and not counterexamples to a `.15` content theorem.
They show that simply changing `.3` to `.15` in this verifier cannot
succeed even at those nodes. A stronger theorem needs improved content
envelopes, better deficit duals, joint information, or a different route.

The exact input file is
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_dual_cover_witness.json`,
SHA-256
`40962c50dad6b26069f6b42a71885db53f5f2067fefd17342cdaf7c8b8a0f261`.
Its model counts at the two nodes are nine and eight. This diagnostic
uses all models in that saved pool at the selected energy, but it does
not optimize new dual models or exclude improvements from other proof
methods. The log includes the complete outward endpoint enclosures.

## 4. A quantitative conditional route 2 target

The root's one-shift reconnaissance suggests testing a common joint cost
`m=23/100` for `(s,t)=(3/5,0)`. This is **N support for a proposed target**,
not a certified global secant theorem. Suppose all three following
statements were proved on `0≤u≤463/10000`:

    joint gain ≤ (‖c_(A,.6)‖²+‖c_B‖²)/(.23),
    ‖c_(A,.6)‖² ≤ .15D₊+6·10⁻⁶,
    ‖c_B‖² ≤ .06D₊+4·10⁻⁶.                               (4)

The last two are unproved targets, including the A strengthening. Their
arithmetic is favorable:

    κ = (.15+.06)/.23 =21/23 <1,
    η_sector = (6·10⁻⁶+4·10⁻⁶)/.23 =1/23000.

Split `D≥0` and `D<0` exactly as in the reviewed A assembly, and use the
reviewed peak remote cap with reserve `3.6·10⁻⁷`. Then (4) would imply

    Λ̂(q+(T−1)r_A+Z²conj(r_B)/√2)
       < S+1/23000+3.6·10⁻⁷ < S+5·10⁻⁵.                  (5)

The additive bound is about `4.38382608696·10⁻⁵`; the checker verifies
the fractions and the strict comparison exactly. This is a **P
conditional implication plus C scalar arithmetic**, not a proof of any
premise in (4). It covers arbitrary remote linear forms and sharing only
if the first premise is established at every amplitude.

By contrast, the existing A coefficient alone divided by the proposed
common cost is `.3/.23=30/23>1`, before charging any B content. Thus a
direct combination of the reviewed A black-box bound with a common-cost
secant theorem does not meet the desired deficit coefficient.

## 5. Exact zero-core obstruction for the current one-tilt coefficient

At `w=0`, define the infinitesimal quadratic remainder by
`R₀(α,β)=lim_(h→0) Rem(0;hα,hβ)/h²`. The visible angular integral gives

    R₀(α,β) = (1/2) E[|(T−d)α−Tβ/√2|²/|L|],
    d=2/5.

Indeed, after multiplication by `exp(−i arg Z)`, the direction becomes
`(T−d)α exp(−iθ)+(T/√2)conj(β)exp(iθ)`. The angular mean of its squared
imaginary part is `|(T−d)α−Tβ/√2|²/2`. This is the second derivative of
the absolute-value expectation, hence the quadratic coefficient of the
two-norm remainder. The inverse-radius singularity is integrable under
the planar Gaussian density, including after multiplication by these
polynomial directions. The global scalar estimate
`2(|V+h|−|V|−Re(h conjugate(ph V)))≤4|h|²/|V|` supplies an integrable
dominator for the scaled difference quotients. This justifies passage
through the expectation and only describes infinitesimal amplitude.

For `J_j=E[T^j/|L|]` and `p=2500/1891`, the zero-core cost matrix is

    K_AA =p−9/25−(J₂−(4/5)J₁+(4/25)J₀)/2,
    K_BB =p−J₂/4,
    K_AB =(J₂−(2/5)J₁)/(2√2).

The checker freshly recomputes these exact integrals with the same
outward rational library as the B endpoint moments. It certifies

    .247721 < λ_min(K₀) < .247722,
    .99950 < (.3)(K₀^−1)_AA < .99951.                       (6)

The full 18-digit enclosures are in the replay log. Every fixed positive
Hermitian matrix claimed as a global cost must lie below this local
matrix in the positive-semidefinite order. Matrix inversion reverses
that order. Therefore a strategy which treats the A and B content vectors
as independently controlled has nearly exhausted its coefficient-one
budget even before estimating B: the pure A-content direction already
requires at least `.99950D₊` when supplied only the coefficient `.3`.
This is an exact scalar diagnostic of a **proof strategy**, not a claim
that genuine cubic contents realize an independent pure A direction.
Correlations or alignments of the actual contents could improve the joint
budget; (6) does not rule those out.

## 6. Next meaningful calculation

For route 2, the new raw-B estimate in `CONTENT_STRUCTURE.md` supplies a
baseline `‖c_B‖²≤.13982688δ` at every energy, but is far too crude to
establish the `.06D₊` target by itself. The next finite task is to compute
and enclose the **B-specific** energy-dependent shifted-resolvent profile,
then optimize the A and B content envelopes against the same deficit
duals. Existing A source barriers must not be reused for B without proving
that their differential inequalities dominate B's source.

For route 3, each `(u,χ)` cell should instead certify the augmented remote
quantity `F(q)−pu+H_A/m+H_B/m` against `S+η`; no `D₊` splitting is needed.
This can exploit the slack of `B(u)−pu<S` away from the peak energy, but
near that peak it still needs substantially tighter content information.
The fixed-envelope failures above locate concrete regions to prioritize.
No exhaustive augmented cover has been produced in this note.
