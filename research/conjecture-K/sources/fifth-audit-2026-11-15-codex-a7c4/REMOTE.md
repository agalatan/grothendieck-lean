<!-- New fifth-audit note. Agent-ID: codex-a7c4. Refs #411. -->
# Augmented moment certificates for the retained A-core

Agent-ID: codex-a7c4. 15 November 2026. Baseline merged #409,
`0882c67d3f7dbfd02f821cad48808440643f802d`.

**P by author, not externally reviewed; C with fresh Arb profile inputs and
exact rational continuum acceptance.** This note completes two larger
classes for the retained A-core using the reviewed global tilted remainder
and content bounds together with the October moment-polynomial bank. It
does not prove the general tilted lemma, raw joint A/B control, Conjecture K,
or a new Grothendieck bound. Existing source files are unchanged.

## 1. Completed statements

Keep the **peak profile** fixed:

    ε=1891/2500,  p=2500/1891,
    a=699/1250, b=179/1250, L=Z(a+b|Z|²), T=|Z|².

Let q be any remote H₂,₁ cubic in any finite dimension, and let r be any
remote linear form, with arbitrary sharing between q and r. Write

    u=E|q|², δ=E|q|⁴−2u²,
    χ=δ/u², x=√χ                 when u>0.

The existing fourth-moment theorem gives 0≤χ≤42. Let S be the peak Gaussian
benchmark, and Λ̂ the retained first-chaos dual of STATUS 2.10a/11.1.
For **every amplitude of r**, the following hold:

1. **Every tensor at lower energies:** if 0≤u≤21/1000, then

       Λ̂(q+(T−1)r) < S−69/25000000 < S.              (1)

   The first subtraction is 0.00000276. No restriction on χ beyond its
   automatic cubic bound is imposed. This uses the remote slack together
   with the sector cost; it is not the sector-only statement 𝒥≤η.

2. **A larger near-Gaussian class over the whole energy range:** if
   0<u≤463/10000 and χ≤1/4, then

       Λ̂(q+(T−1)r) < S+1/50000.                     (2)

   The zero cubic is covered by (1). This enlarges the previous subclass
   .03≤u≤.0463, χ≤.07 in STATUS 11.46, and removes its lower energy cutoff.

There is no assumption on the sign of the same-variance deficit D(q), no
bound on ‖r‖, and no independence assumption between q and r. These are
peak retained **A-core** statements; B and odd sectors are not included.
They are not transferred to the profile rectangle of STATUS 3.15.

The new acceptance has three rectangular roots and 33 accepted leaves.
It uses only 17 of the 154 already stored Hermite polynomials. Every used
profile integral was recomputed with Arb; the scalar acceptance and
subdivision are exact rational arithmetic. This is a completed augmented
**moment** certificate, a limited realization of the route in STATUS 11.44.
It does not use the October spectral/Stein cuts or the headline remote cap.

## 2. The retained trial inequality, explicitly re-derived

This also addresses comment 2 of the
[review of #409](REVIEW_409_claude-b9ee.md). For
G=q+(T−1)r, the retained dual is

    Λ̂(G)=inf_A {‖A‖²+E|L+G−A|+E|L−G+A|}−p‖G‖²,

where A ranges over first-chaos linear forms. Choose A=−s r for real s.
The visible coordinate Z is independent of q,r; E(T−1)=0 and
E(T−1)²=1, so ‖G‖²=u+‖r‖². Under Z↦−Z, L changes sign while
q+(T−1+s)r is unchanged. Thus the two expected norm terms are equal, and

    Λ̂(q+(T−1)r)
      ≤ 2E|L+q+(T−1+s)r|−pu−(p−s²)‖r‖².         (3)

This is STATUS 11.12, with every sign and normalization retained. It is
valid in every finite dimension and at every real s. No row-specific
number enters this derivation. The orthogonality between q and r needed
in the subsequent content projection follows because they lie in third
and first chaos, respectively.

Set s=3/5 and

    k=p−s²−13/20=59009/189100,
    γ=1077659/27000000, ℓ_c=19321/1000000.

The reviewed global secant bound and content results (STATUS 11.30,
11.39–11.41) give

    Λ̂(q+(T−1)r) ≤ Λ(q)+C(q)²/k,
    C(q)² ≤ min{(2/25)δ, ℓ_c u}                  (u≤.0463),
    C(q)² ≤ γδ                                  (.03≤u≤.0463).   (4)

Here C is tilted content at s=3/5, not the raw A-content. Formula (4)
uses only the reviewed content estimates. Neither 3δ^(3/2) nor 1/2500,
which remain partly or wholly unreviewed in the ledger, is used.

For completeness, the first inequality follows from (3) by subtracting
2E|L+q|, applying the global remainder bound, and obtaining
2Re⟨r,c(q)⟩−k‖r‖²≤C(q)²/k. It requires no maximizer. At u=0, q=0
almost surely, C(0)=0, so Λ̂((T−1)r)≤Λ(0)<S. The stronger margin in
(1) is also accepted at that endpoint by the certificate below.

The reviewed #409 comment says that it checked 11.46 **including** 11.12.
The missing part of the previous ledger was explicit review provenance,
not an invalid retained inequality. Equation (3) supplies the standalone
derivation as well.

## 3. Why the old polynomials can be reused globally

Define the physical squared-radius profile

    h(z)=2E_Z|L+√z|, z≥0.

Circularity of L and independence of q imply
2E|L+q|=E h(|q|²). The variable z here is the **physical** squared radius,
not the normalized variable |q|²/u. The reviewed visible scale-mixture
argument implies h′ is completely monotone, so h⁽⁴⁾≤0 on (0,∞).

For two distinct positive nodes a_i,b_i, let H_i be the cubic Hermite
interpolant of h and h′ there. Its error is

    h(z)−H_i(z)=h⁽⁴⁾(ξ)(z−a_i)²(z−b_i)²/24≤0.      (5)

The assertion holds for every z>0, including outside the node interval;
continuity supplies z=0. This global majorization was already re-derived
in A15 `REVIEW_claude-b9ee.md` §3. The entries in the October file
`moment-boxes.json` have rational polynomials P_i whose coefficients are
strict upper bounds for the corresponding coefficients of H_i. Since
z≥0, coefficientwise domination proves P_i(z)≥h(z) globally. The default
checker freshly repeats that coefficient acceptance from Arb h,h′ values.

**The file's box is not the validity domain of P_i.** It only records where
the October cover chose to use that global majorant. The new cover may
choose any of the polynomials at any nonnegative physical energy. This
reuse, rather than treating the old box assignment as compulsory, produces
the gains in (1)–(2).

Write P_i(z)=c₀+c₁z+c₂z²+c₃z³. Every chosen c₃ is strictly positive.
The inherited cubic moment identities and sixth-moment theorem are

    E|q|⁴=(2+x²)u²,
    E|q|⁶≤(6+9x²+C₆x³)u³, C₆=4045313/100000.      (6)

Consequently

    Λ(q)≤M_i(u,x)
      :=c₀+(c₁−p)u+c₂(2+x²)u²
                       +c₃(6+9x²+C₆x³)u³.         (7)

The fourth moment is an equality, so a negative c₂ causes no sign problem.
The sign c₃>0 is essential for applying the upper bound in (6); the checker
asserts it. The mathematical moment theorem is inherited from the same
reviewed inputs used for STATUS 3.3, not newly proved by this computation.

On a cell with energy entirely below .03 use g=2/25, and on a central
cell use g=γ. By (4) and (7), either of the following is a valid upper bound:

    M_i(u,x)+(g/k)x²u²,
    M_i(u,x)+(ℓ_c/k)u.                             (8)

Selecting one of (8) per cell is valid because both content bounds hold.
The checker never chooses a different polynomial or surcharge separately
at the endpoints of a cell and then interpolates between those choices.

## 4. Exact continuum acceptance

For fixed u≥0, either expression in (8) has the form
A(u)+B(u)x²+D(u)x³ with D(u)=C₆c₃u³≥0. Its derivative is
x(2B+3Dx), which can change from negative to positive but not from positive
to negative on x≥0. Its maximum on a closed x interval is therefore at an
endpoint. This remains true after either surcharge, which changes only
A or B.

At each x endpoint the expression is a cubic polynomial in u. On a closed
u interval the exact conversion to the Bernstein basis bounds it by its
largest Bernstein coefficient. Thus a single rational comparison accepts
the **entire closed rectangle**, not a sampled grid.

The rational benchmark input is

    S > S₋=1.3739535256614,

inherited from the previously replayed Gaussian benchmark. The default
checker reconstructs the following complete covers by exact midpoint
bisection. It records every leaf, its selected polynomial and surcharge,
and checks the total area independently of the recursive coverage.

| Root domain (u,x) | Content coefficient | Leaves | Certified upper minus S₋ |
|---|---|---:|---|
| [0,.021]×[0,13/2] | min of (2/25)δ and ℓ_c u | 14 | −20198706037192643142583529162342563 / 7312901341184000000000000000000000000000 |
| [0,.03]×[0,1/2] | min of (2/25)δ and ℓ_c u | 1 | −36064772321703562304332862841 / 446344076000000000000000000000000 |
| [.03,.0463]×[0,1/2] | min of γδ and ℓ_c u | 18 | 842078830838236606966361251747059727 / 42849031296000000000000000000000000000000 |

The first number is below −.00000276. The last is approximately
.000019652225625, strictly below .00002; its exact remaining margin is

    14901795081763393033638748252940273
    / 42849031296000000000000000000000000000000 > 0.   (9)

Because √42<13/2, the first cover includes every possible cubic fourth
cumulant. The second and third together cover every 0<u≤.0463 with
χ≤1/4. This proves (1)–(2). The disjoint interiors and shared endpoints
of recursive bisection leave no boundary gaps. The zero-energy case was
handled separately above, so the undefined expression δ/u² is never used
to classify q=0.

## 5. A precise obstruction to simply refining this fixed bank

The unchanged 154-box assignment, with the new surcharge inserted, failed
many cells. Reusing its global polynomials closes the classes above, but
cannot by itself close the whole requested rectangle.

At the exact point u=1/25 and x=2 (χ=4), evaluate both expressions (8) for
all 154 stored polynomials. Even their minimum, attained at index 44 with
the γδ surcharge, exceeds the certified Gaussian upper bound
S₊=1.3739535256616 by

    591496381497018542247503807
    / 2942209485351562500000000000000
      > .0002 > .0001 > .00002.                    (10)

This is an exact finite-bank limitation: every available upper polynomial
plus either listed content surcharge is too large **at that point**.
Subdividing boxes or changing selections among this bank cannot fix it.
New/tighter remote duals (including Stein cuts) or a sharper content budget
are needed for a certificate by this route there.

Equation (10) is **not** a lower bound on the true functional, an exhibited
realizable moment law, or a counterexample to the augmented theorem. A poor
upper bound does not refute the desired upper bound. The exact computation
records this limitation so that the next worker need not repeat a blind
refinement of the same bank.

## 6. Reproduction and trust boundary

From the repository root:

```sh
python3 -I research/conjecture-K/code/fifth-audit-2026-11-15-codex-a7c4/remote_augmented.py \
  --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

The dependency directory is an existing python-flint 0.9.0 installation;
omit it when python-flint is available normally. The full default run
passed, including fresh profile integrations for all 17 chosen Hermite
polynomials. It was replayed after adding the explicit leaf/input record.
The adjacent JSON contains every selected rational polynomial and its row
SHA-256, every leaf, fresh Arb enclosures for h and h′, exact margins, and
SHA-256 hashes of the original polynomial bank and profile/checker code.
Saved JSON is output, not an acceptance input.

`--exact-only` checks the rational cover and obstruction without rerunning
the Arb inputs, and is explicitly labelled conditional on the stored caps.
It cannot overwrite the full-replay result. All runs are read-only by
default; `--write-result` explicitly regenerates only the adjacent JSON.
Assertions reject `-O`. No dependency was installed, no Lean build was run,
and no original certificate or source file was edited.

The profile integration algorithm and the Gaussian benchmark/moment/tilted
inputs retain their previously recorded mathematical review. This pass
replays the used profile values and independently checks the new global
reuse, surplus and continuum implications. It does not audit Arb internals
or repeat the large tilted secant certificate. In particular no unreviewed
uniform or cubic-cumulant content estimate is silently promoted.
