<!-- New audit note, authored at this repository path on 2026-11-15. Agent-ID: codex-a7c4. -->
# Remote-sector audit and certified peak closure

Agent-ID: codex-a7c4. 15 November 2026. Refs #395.

**C (fresh independent replay, inherited moment theorem identified below):** the
22 October Stein package proves, at the **peak row only**, for every finite
remote dimension and every complex `H₂,₁` cubic `q`, without an energy bound,

    Λ(q) < 1373953883/10^9 = 1.373953883 < S + 9/25000000.

The allowance is `3.6e-7`. This is a recovered and independently checked October
result, **not a new October theorem attributed to this audit**. It replaces the
unchecked peak-only `1e-5` input for L1. Neither the flank/upper row nor the whole
parameter box is certified by the archive. It is not a Lean theorem, and it
does not prove K or a new Grothendieck bound.

The new consequences proved in sections 4–5 are **P, by their author**:
an explicit continuum tube of remote profiles with error `<8.1e-5`,
and activation of the previously proved disjoint-driver reduction with the
replayed `3.6e-7` allowance. The tube's scalar checks are exact rational checks.
The tube, disjoint consequence and covariance proof were checked by the
separate `sector_audit` worker in the same codex-a7c4 session; this is not the
required external Claude-side review of the PR.

## 1. Findings and provenance

Line references in this table refer to the audit's starting tree, `93098815d`;
archive section references refer to the original ZIP members.

| Location | Finding and evidence | Severity | Correction |
|---|---|---|---|
| `STATUS.md:108`, entry 3.3 | A valid stronger peak certificate had only been read. The five acceptance scripts and three witnesses now pass after **every** profile enclosure is recomputed; see section 2. | High, missed usable result | Promote the `3.6e-7` **peak** statement to C, identify inherited inputs, and use it as the peak L1 input. |
| Entry 3.3; strong archive `PROOF.md` §1 | The README's universal quantifier is over `q` and its dimension, not the row parameters. The proof fixes `a=699/1250`, `b=179/1250`, `p=2500/1891`. | High if extrapolated | Spell out peak-only scope in every summary; other named rows remain open. |
| Entry 3.3, “Sharper remote bounds”; weak archive `PROOF.md` §1 | `1.05e-5` is larger than the existing `1e-5` claim. It improves that package's earlier `1.6e-5`, using sixth-moment constant `1977/40=49.425`, not the repository's sharper `40.45313`. | Medium | Do not describe both packages as sharper than 3.2. Distinguish their moment inputs. |
| `STATUS.md` §13.1 item 15; weak archive `PROOF.md` §3 | The certified `S+1e-5` obstruction in this package is for the **49.425 moment relaxation**. It does not prove that same floor for the 40.45313 relaxation, still less for the Stein relaxation. | Medium | Keep its coefficient and relaxation explicit. The artificial two-point law is not an admissible chaos counterexample. |
| Archive `verify.py:11–13` and prescribed isolated invocation | Direct `python3 -I verify.py` cannot find the sibling modules. A working-directory import could also resolve the standard-library `profile` instead of the supplied integrator. | Medium, reproducibility | Added `remote_replay.py`, which inserts only the resolved acceptance directory and an optional explicit dependency directory. |

The archives remain in the pre-existing external inventory directory
`/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/`.
No archive or original file there was changed.

| Archive | SHA-256 |
|---|---|
| `independent-sector-stein-3p6e-7.zip` | `5ebf9492027059da7ac0f66a1bcb22e605af27cc8fdb4947ec62fa4187309974` |
| `cubic-chaos-improved-certificate.zip` | `92c5178b0b07dcc63cf3705cf46462c32f9a76e96cf42b5dd5db50f29578afbb` |

The strong archive's `PROOF.md` hash is
`c8b8b8028ac01324a62ee77895d846903d49e66d687532724d58731a76dde48c`.
Its five acceptance scripts and three JSON witnesses are copied **verbatim** to
[`../../code/audit-2026-11-15-codex-a7c4/remote_stein_original/`](../../code/audit-2026-11-15-codex-a7c4/remote_stein_original/).
Each is below 300 KB. Their individual hashes are in `remote_replay_all.json`.
The complete [strong proof](remote_strong_PROOF.md) and its
[inherited covariance note](remote_INHERITED_COVARIANCE.tex) are also retained
verbatim here, with a single provenance comment prepended. Their historical
P/C labels are the original authors' labels; the current audit record is this
file.

## 2. What was replayed

All paths below are relative to `research/conjecture-K/code/audit-2026-11-15-codex-a7c4/`.

| Check | Outcome | Status and limit |
|---|---|---|
| `remote_replay.py` | PASS, 138.959 seconds; Python 3.12.3, python-flint 0.9.0 | **C** for all numerical premises of the strong package; no cached integral accepted |
| `remote_rational_audit.py` | PASS: 3,825 cut-piece identities, 155 rectangles by independent vertical slicing, five rejection controls | **C** for these exact finite checks; not an additional integral certificate |
| `remote_legacy_replay.py` | PASS: 1,808 global duals and moment rectangles; improved-moment scalar check and two-point obstruction | **C conditional on stored kernel grids**; grids were not regenerated, so the weaker whole theorem stays R here |

The fresh strong replay covers:

* 68 global cubic Hermite majorants, recomputing `h,h′` at their positive nodes;
  the profile interval `[0,2]` and its infinite tangent ray;
* 45 spectral/covariance Stein nodes at `v=7/200+i/4000`, `0≤i≤44`;
  exact polynomial positivity on every finite cell, zero, and the infinite tail;
* interpolation over the entire central rectangle
  `[7/200,23/500] × [0,1/5]` in `(v,sqrt(χ))`, with exact allowance
  `153/3200000000`;
* 154 complementary moment rectangles, plus the central rectangle, covering
  `[0,3/20] × [0,31/4]` with no gaps; zero variance and every `v≥3/20`;
* the Gaussian benchmark, freshly proving
  `1.3739535256614 < S < 1.3739535256616`.

The two exact central/outer bounds are

    519629358330379958834713591379 / 378200000000000000000000000000,
    85135369756831882044807571219209 / 61964288000000000000000000000000.

Both are strictly below `1.373953883`. The comparison slack against the
rounded `3.6e-7` allowance is exactly `13307/5000000000000 > 0`; the absolute
cap minus the certified lower bound on S is only `0.0000003573386`.
Full output is `remote_replay.log`; the version/hash record is
`remote_replay_all.json`.

The independent algebra check evaluates the original expanded cut polynomial
against the unexpanded formula at five distinct rational points. Both sides
have degree at most four, so this proves each polynomial identity, not merely
a numerical sample comparison. It reconstructs primitive continuity on every
piece. It separately checks rectangular coverage by exact vertical slices,
and verifies rejection of a missing rectangle, a duplicated rectangle,
a negative constant, a polynomial negative inside an interval despite positive
endpoints, and a negative leading coefficient on the infinite ray.

The weak replay reads the ZIP without extracting its >300 KB dual data. It
replaces only `ROOT=Path(__file__).resolve().parent` in memory by a read-only
archive accessor; all acceptance expressions are unchanged. This storage
adaptation and original script hashes are recorded in
`remote_legacy_result.json`. The stored lower/upper kernel grid remains an
explicit assumption of that replay. The stronger replay makes regenerating
the weaker grid unnecessary for any conclusion used here.

## 3. Mathematical implication audited

This section records the proof bridge rather than treating a successful
program exit as a theorem. It was independently re-derived for this audit;
the sixth-moment theorem remains an explicitly inherited mathematical input.

Write `v=E|q|²`, `Q=q/sqrt(v)`, `U=|Q|²`, `χ=EU²−2` for `v>0`. The inherited
complex-cubic moment theorem gives

    EU=1, 0≤χ≤42≤60,
    EU³ ≤ 6+9χ+(4045313/100000)χ^(3/2).

This is precisely the genuine complex bidegree `(2,1)` input in STATUS 3.4;
no assertion about arbitrary proper pairs of real third-chaos variables is
needed. We did not rebuild Lean or replay the tensor theorem's certificate.
Its source-level bridge is already identified by the 13 November audit in
`ADDITIONAL_ANALYTIC_AUDIT.md` §5.

For the real OU generator, set
`X=Γ(Q,Q̄)/3−1`, `c=Γ(Q,Q)/3`, `r=Re(c Q̄²)/U`, with `r=0` at zero.
Writing `P=E[XU]`, `R=E[rU]` avoids colliding with the polynomial Q. The
necessary inputs are

    EX=0, 2P+R=χ, EX²≤2P/3, Er²≤2R/3, R≤χ/3.

The first four follow by writing the degree 2,4,6 decompositions of `U` and
`Q²`: `X=(2/3)U₂+(1/3)U₄`, `c=(2/3)V₂+(1/3)V₄`; then use orthogonality,
`|r|≤|c|`, and the product rule for `L(U²)`. For covariance order, the
archive gives `P−R=16(||N||²_HS−||B||²_HS)+4||H||²_HS`, where the contractions
of the symmetric coefficient tensor are

    N_ab=Σ_jk t_ajk conj(t_bjk),
    H_ab=Σ_jk t_jka conj(t_jkb),
    B_be=Σ_ad t_abd t_dea.

Vectorizing the tensor slices gives `B=TᵀJT`, `T* T=Nᵀ` with unitary slice
transpose J. Schatten Hölder yields `||B||_HS≤||Tᵀ||₄||JT||₄=||N||_HS`.
Hence `P≥R`, and `2P+R=χ` gives `R≤χ/3`. The finite-sum contraction identity
is preserved in `remote_INHERITED_COVARIANCE.tex`. Rather than assuming that
identity, the separate `sector_audit` worker independently re-derived the
following real tensor proof of covariance order in the same session.

Write `Q=F+iH`, `F=I₃(f)`, `H=I₃(g)` in real Gaussian Wiener chaos, with
the convention `E I_k(f)I_k(g)=k!⟨f,g⟩`. Properness and normalization give
`||f||²=||g||²=1/12` and `⟨f,g⟩=0`. Put
`K_ij;kl=Σ_a f_ija g_kla`, `A=||K||²`, `D=⟨K,Kᵀ⟩`, and
`B₂=||f⊗₂g||²`. The product formula gives components of `FH` in degrees
6,4,2,0 with coefficients `1,9,18,6`. The OU product rule multiplies these
components by `0,1,2,3` respectively to obtain `Γ(F,H)`. Consequently

    E F²H² − E[FHΓ(F,H)]
      = 6!||Sym(f⊗g)||² − 648||Sym(f⊗₂g)||² − 72⟨f,g⟩².

The twenty placements of the first three tensor slots among six have
intersection multiplicities `1,9,9,1`. Summing the corresponding contractions
and symmetrizing the two free slots yields

    6!||Sym(f⊗g)||²
      =36(||f||²||g||²+9A+9B₂+⟨f,g⟩²),
    ||Sym(f⊗₂g)||²=(B₂+D)/2.

Thus the preceding expectation difference equals
`36||f||²||g||²−36⟨f,g⟩²+324(A−D)`. Separately, Gaussian integration by
parts in `F H²` and `H F²`, followed by the definitions of P and R, gives

    P−R = 4{E F²H²−E[FHΓ(F,H)]}−1.

The normalized scalar terms cancel, proving
`P−R=1296(A−D)=648||K−Kᵀ||²≥0`. This establishes the needed covariance order
in every finite dimension without an unverified tensor-identity premise.
It is an independent re-derivation of the inherited result, not a new
covariance theorem.

Gaussian integration by parts gives, for the bounded test functions used,

    E[Uf(U)] = E[(1+X)(f(U)+Uf′(U)) + rUf′(U)].

For a continuous piecewise affine `φ`, constant on its final ray, put
`Φ(u)=∫₀ᵘφ`, `d=φ−Φ/u`, `A=Φ−φ`. Taking `f=Φ/u` proves
`EA(U)=E[Xφ(U)+rd(U)]`; the continuous extension at zero is C¹.
For `λ,μ>0`, `ν≥0`, and real `t,β`, define

    f₀=−(φ+β)/2+(2t+λ/3)u,
    g₀=−d/2+(t+μ/3−ν/2)u,
    G=f₀²/λ+g₀²/μ+A+(ν/3−2t)(u²−2).

Expanding the squares proves exactly

    EG = E[λ(X−f₀/λ)²+μ(r−g₀/μ)²]
         +λ(2P/3−EX²)+μ(2R/3−Er²)+ν(χ/3−R) ≥ 0.

The accepted cubics majorize `h(vu)+G(u)` on the whole half-line, where
`h(s)=2E|L+sqrt(s)|`. Their cubic coefficient is nonnegative. Applying the
moment theorem therefore bounds `Λ(q)` by an explicit cubic in `x=sqrt(χ)`
whose form is `c₀+c₂x²+c₃x³`, `c₃≥0`. Its only possible positive interior
critical point is a minimum, so endpoints suffice on each x interval.

The profile's density is `η(s)=exp(−t)/((a+bt)(a+3bt))`, with
`s=t(a+bt)²`. Repeated application of `−d/ds` preserves positive sums of
terms `exp(−t)(a+bt)^−j(a+3bt)^−k`. Thus η is completely monotone, L is a
circular Gaussian scale mixture, and `h′` is completely monotone. This
justifies global cubic Hermite majorants (`h⁽⁴⁾≤0`), the tangent tail and
the Jensen high-variance exclusion. The density calculation also gives

    0≤−h″(s)≤(sqrt(π)/8)(a^−3+4ba^−4)<3.

The last step uses `sqrt(π)<2` and an exact rational check. On the central
rectangle `EU²≤51/25`; hence `J″(v)≥−153/25`, and the chord correction on
a mesh interval of width `1/4000` is at most `153/3200000000`.
This is applied to **each fixed normalized law**, so it requires no
regularity or uniqueness of an optimizing law.

The Arb integrator splits at the unique root of `t(a+bt)²=s`. On the two
analytic pieces it evaluates the angular hypergeometric formulas, with
positive-series disk bounds and a square-root branch guard. The omitted
intervals near zero and the root have nonnegative integrands bounded by
`2exp(−t)(sqrt(t)(a+bt)+sqrt(s))` for h and `exp(−t)/sqrt(s)` for h′.
The ray beyond 64 is bounded by explicit exponential moments; it is not
dropped. The code's complex analytic bounds, real fallback bounds, Hermite
coefficient rounding, polynomial tail and benchmark concavity argument were
inspected. No floating-point objective or optimizer is accepted as a bound.

## 4. New quantitative profile transfer

**P, by its author; checked by the separate sector-audit worker within this
session, not externally reviewed.** Suppose a family stable under positive
scalar multiplication obeys `Λ₀(q)≤S₀+η₀` for profile `(a₀,b₀,ε₀)`. Let
`λ>0`, `ε=λε₀`, and `L=Z(a+b|Z|²)`. Put

    d = |a−λa₀| + (3/2)|b−λb₀|.

Then the same family obeys

    Λ(q) ≤ S + λη₀ + 2sqrt(π)d.                 (T)

**Proof.** The norm triangle inequality, applied to both signs, gives
`|Λ(q)−λΛ₀(q/λ)|≤2E|L−λL₀|`: the quadratic penalties cancel because
`ε=λε₀`. Applying the reverse bound to every Gaussian competitor gives
`S≥λS₀−2E|L−λL₀|`. Combine the two inequalities and use
`E|Z|=sqrt(π)/2`, `E|Z|³=3sqrt(π)/4`, so
`E|L−λL₀|≤sqrt(π)d/2`. There is no energy or dimension restriction. ∎

For the peak constants and `η₀=9/25000000`, choose

    ε∈[37/50,19/25],  λ=2500ε/1891,
    |a−λ·699/1250|+(3/2)|b−λ·179/1250| ≤ λ/50000.

Since `sqrt(π)<2` and `λ≤1900/1891`, (T) gives the explicit uniform error

    η ≤ (1900/1891)(9/25000000+4/50000)
      = 38171/472750000 < 81/10^6 < 1/10000.

The rational inequalities are replayed by `remote_rational_audit.py`.
This is a genuine continuum of row parameters, but a **thin tube about
scaled peak profiles**, not the whole application box or either other named
row. Formula (T) can certify small neighborhoods around additional anchors
once those anchors have valid independent certificates. We found no such
quantitative tube in STATUS or its cited failure list; no priority claim is
made for the elementary continuity argument itself.

## 5. Disjoint A-driver consequence

**P, by its author; checked by the separate sector-audit worker within this
session, not externally reviewed; using the audited redistribution theorem
and C above.** At the peak row, for any remote cubic q and remote Gaussian
linear U **independent of q**,

    Λ(q+(T−1)U) ≤ 1.373953883 < S+3.6e-7.

There is no amplitude restriction. Along any unit L² direction H, the sum
`E|L+sH|+E|L−sH|` is 2-Lipschitz in `s`; thus the penalized functional is
nonincreasing for `s≥ε`. It suffices to treat total energy at most `ε²`.
At the peak `ε≤ℓ`, so the redistribution theorem in STATUS 4.1 applies:
replace `(T−1)U` by an independent Gaussian of variance `E|U|²`, preserving
the penalty. Approximate this Gaussian by normalized sums of independent
fresh `H₂,₁` Wick monomials. The CLT and bounded second moments give convergence
of the expectations of norms, so the remote cap passes to the limit. A
strict bound may become non-strict under this limit; the displayed `≤` is
intentional, and the comparison with `S+3.6e-7` remains strict.

This activates an existing reduction with a newly replayed input. It says
nothing about shared q/U drivers, the B shell or the z-odd sectors.

## 6. Reproduction

With python-flint installed in the interpreter's ordinary environment:

```sh
python3 -I research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_replay.py
python3 -I research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_rational_audit.py
```

On the audited laptop python-flint is already installed in the inventory's
external dependency directory. Add
`--dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies`
to the first command. No installation or source-tree search is performed by
the wrapper. To reproduce the weaker conditional replay:

```sh
python3 -I research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_legacy_replay.py \
  --archive /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/cubic-chaos-improved-certificate.zip \
  --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

All new output files are small text/JSON files in the audit's code directory.
No outside files were created; no historical sources were edited.
