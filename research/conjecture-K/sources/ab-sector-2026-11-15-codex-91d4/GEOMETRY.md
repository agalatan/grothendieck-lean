<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/GEOMETRY.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# Joint secant geometry and conditional assembly

Agent-ID: **codex-91d4**. Task #426. 15 November 2026.

**Status:** new algebraic reductions are **P, author only**, independently
re-derived within this session; numerical observations are **N**. There is
no global joint certificate here and Phase 4 remains open. Sources are
read-only inputs, not claims that their external reviews were repeated.

## 1. B has an admissible retained tilt

The task's statement that B cannot be tilted is too strong. For remote
holomorphic linear forms `r_A,r_B` and real `s,t`,

    ξ = −s r_A − t r_B

belongs to `H₁,₀`. Although `conj(r_B)` itself is inadmissible as a retained
element, `r_B` is admissible. With `A_s=T−1+s`, choose this trial element to
obtain

    Λ̂(q+(T−1)r_A+Z²conj(r_B)/√2)
      ≤ 2E|L+q+A_s r_A+t r_B+Z²conj(r_B)/√2|
        −p‖q‖²−p(‖r_A‖²+‖r_B‖²)+‖s r_A+t r_B‖².       (1)

The equality of the two norm expectations follows by `Z→−Z`: the shell
and remote terms are even while L is odd. Chaos orthogonality gives the
displayed original cubic energy; no independence among q and the shell
drivers is assumed.

If `c₀=Π₁ E_Z ph(L+q)`, the two linear coefficients in (1) are

    c_{A,s}=c_A+s c₀,       c_{B,t}=c_B+t c₀.                 (2)

For B this follows from the exact pointwise real-part identity

    Re[(Z²conj(r_B)/√2+t r_B)conj(ph(L+q))]
      = Re[conj(r_B)(Z²conj(ph(L+q))/√2+t ph(L+q))].

The quadratic penalty matrix is

    P_{s,t} = p I − (s,t)ᵀ(s,t)
            = [[p−s²,−st], [−st,p−t²]].                  (3)

In particular the off-diagonal penalty cannot be omitted when trying a
second tilt. This mechanism is already present in
`code/kprime-2026-11-15/secant_joint.py`. The active codex-a7c4 worktree's
`sources/progress-2026-11-15-codex-a7c4/JOINT_CONTENT.md`, §4, derives the
same admissible shift and the new bound for `t=.5053s=.30318`.
That unmerged source is new author work, not an inherited reviewed input.

## 2. Five real parameters, and what a fixed matrix can express

For

    f(w;α,β)=E|L+w+(T−1+s)α+tβ+Z²conj(β)/√2|,

the substitution `Z→exp(iθ)Z`, followed by factoring out `exp(iθ)`, gives

    f(w;α,β)=f(exp(−iθ)w;exp(−iθ)α,exp(−iθ)β).             (4)

Reflection also gives `f(w;α,β)=f(conj w;conj α,conj β)`.
Thus the six real variables have five continuous degrees of freedom:
one may set `w=x≥0`, retaining both complex α and β, or set `α≥0` real,
retaining complex w and β. Reflection halves a chosen imaginary-coordinate
range; it does not remove another continuous variable. When the chosen
variable is zero, choose the phase from a nonzero remaining variable or
handle the zero face directly.

A uniform real quadratic majorant in α and β can, without loss for
existence, be averaged over (4), then reflection. The result is a real
Hermitian form

    M_A|α|²+M_B|β|²+2M_AB Re(α conj β).                     (5)

Indeed every rotated/reflected quadratic remains a bound after transforming
the unrestricted w; averaging preserves the bound. This does not assert
that averaging improves a particular optimization objective. There need
not be a unique least matrix in Loewner order. A search should specify its
objective, for example the content-direction inverse cost, rather than
claiming a unique "best majorant."

At a fixed real w the Hessian can have different real and imaginary blocks.
A w-dependent quadratic using terms such as `Re(exp(−2i arg w)α²)` can
keep that information, but after w=q it is not a constant Hilbert-space
cost matrix. Its integration and square completion need additional
arguments. A favorable mixed coefficient measured only at w=0 is not a
uniform mixed coefficient.

For a necessary exact local check, put

    J_n = ∫₀^∞ v^(n−1/2) exp(−v)/(a+bv) dv,     d=1−s.

Angular averaging at w=0 gives the local remainder matrix

    M0_AA = (J₂−2dJ₁+d²J₀)/2,
    M0_BB = t²J₀/2+J₂/4−tJ₁/√2,
    M0_AB = t(J₁−dJ₀)/2−(J₂−dJ₁)/(2√2).                  (5a)

Here t is the real B tilt. The exact local cost is `K₀=P_{s,t}−M₀`.
To derive (5a), factor the phase of L and use

    E_θ (Im[e^(−iθ)h])²
      = |(T−d)α+tβ|²/2+T²|β|²/4
        −(T/√2)Re[((T−d)α+tβ)conj β].

Divide by `√T(a+bT)` and integrate T. The reciprocal-norm majorant
in (11) justifies the zero-amplitude limit by dominated convergence.
Every uniform candidate cost must satisfy the full matrix inequality
`K≼K₀`; finitely sampled directional constraints are insufficient.

## 3. Joint small-amplitude projection: a nonsingular root formula

The A-only projection trick extends, but its old eight-corner root
monotonicity and evenness in the source ordinate must not be assumed.

Fix a projection angle θ. Rotate the visible Gaussian as
`Z=exp(iθ)(x+iy)` and set

    κ=Re(exp(−iθ)α),
    u+iv=exp(iθ)conj(β)/√2,
    ζ=Re(exp(−iθ)w)+t Re(exp(−iθ)β),   d=1−s.

The real projection of the shifted field is the cubic

    P(x)=b x³+(κ+u)x²+(a+b y²−2vy)x
         +(κ−u)y²−κd+ζ.                                   (6)

Its derivative satisfies

    P_x=a+b y²+3b x²+2(κ+u)x−2vy
       ≥ a−(κ+u)²/(3b)−v²/b
       ≥ a−(|α|²+|β|²)/(2b).                               (7)

For the final inequality, the real-coordinate quadratic
`(Re α'+Re β'/√2)²/3` has largest eigenvalue 1/2, while
`(Im β')²/2` acts on an orthogonal coordinate; unused `Im α'` has
coefficient zero. Consequently the projection is strictly increasing in x
throughout the total-amplitude ball

    |α|²+|β|² < 2ab = 125121/781250 ≈ .16015488.             (8)

The radius is about .40019355. This condition is independent of w and of
both tilt values. It gives a unique real root x(θ,y) of (6).

For any perturbation direction `η=(η_A,η_B)`, put

    G_η(x,y)=(x²+y²−d)Re(exp(−iθ)η_A)
       +t Re(exp(−iθ)η_B)
       +Re[exp(iθ)conj(η_B)(x+iy)²]/√2.

Then the real Hessian is represented by

    D²_ρ f(w;ρ)[η,η]
      = (1/π) ∫₀^π ∫_ℝ
          G_η(x(θ,y),y)² exp(−x(θ,y)²−y²)
          /P_x(x(θ,y)) dy dθ.                              (9)

To derive (9), use `|X|=(1/2)∫₀^π|Re(exp(−iθ)X)|dθ`, whose
distributional second derivative contributes `2δ₀`. Integrate x at its
unique root; the Gaussian density is `exp(−x²−y²)/π`. A smooth convex
approximation of absolute value and (7) justify the limit on every closed
ball strictly inside (8). Polynomial factors and a positive denominator
lower bound give an integrable Gaussian bound. The y integral is over
the full line: the `−2vxy` term destroys the old even-y shortcut.

This is a route to a matrix interval certificate, not that certificate.
The old A-only separate monotonicity of the root in its parameters is
not established for (6); interval bisection with the positive derivative
is available. For small-amplitude secants, the entire segment `τ(α,β)`
stays in the ball. A Hessian upper bound `H≤M` there implies

    Rem(w;α,β)=2∫₀¹(1−τ)D²f(w;τ(α,β))[ρ,ρ]dτ ≤ ρ* Mρ.   (10)

## 4. Two exterior controls and the compact interpolation variables

For `h=(T−1+s)α+tβ+Z²conj(β)/√2`, the elementary inequalities give

    Rem ≤ E[|h|²/|L+w|],            Rem ≤ 4E|h|.            (11)

For total amplitude R and v=(s,t), angular orthogonality gives

    E|h|²=R²+|sα+tβ|² ≤ (1+‖v‖²)R².

Therefore `Rem≤4√(1+‖v‖²)R`. A positive-definite candidate M with least
eigenvalue μ covers all `R≥4√(1+‖v‖²)/μ`. This is a valid coarse exterior
test, not an optimized cutoff.

The first inequality in (11), Cauchy–Schwarz in the coefficients, and
the pushforward density under `Z↦Z(a+bT)` provide large-|w| bounds as
in the existing A and raw-joint proofs. All such new tail constants still
need to be computed for the selected tilt and candidate M.

For the compact rest choose α nonnegative real. The five Cartesian
variables `(Re w,Im w,α,Re β,Im β)` enter f through a real affine map,
so f is jointly convex and multilinear interpolation upper-bounds f
by the vertex values of a Cartesian box. Polar coordinates are useful
for searches but do not give this convex-interpolation property. The
subtracted base value and gradient need lower interval enclosures.

## 5. Exact conditional assembly, including negative deficits

Suppose a global secant bound has been certified for a fixed real
matrix M and tilt (s,t), and `K=P_{s,t}−M` is positive definite. Applying
the pointwise inequality at `(w,α,β)=(q,r_A,r_B)` and integrating gives

    Λ̂(q+A r_A+B r_B)
      ≤ Λ(q)+2Re⟨c,r⟩−⟨r,Kr⟩
      ≤ Λ(q)+⟨c,K⁻¹c⟩,                                    (12)

where c is the pair in (2). This uses only the remote independence from
Z and the first-chaos nature of the drivers; arbitrary sharing survives.

For `K=[[k_A,m],[m,k_B]]`, its exact gain is

    ‖c_A‖²/k_A
      +‖c_B−(m/k_A)c_A‖²/(k_B−m²/k_A).                     (13)

If a separate global content estimate proves this gain at most
`κD₊+η_content`, with κ<1, then for D≥0 the upper bound is `S+η_content`.
For D<0 use the reviewed remote cap `Λ(q)<S+η_R`, obtaining

    Λ̂(q+A r_A+B r_B) < S+η_content+η_R.                   (14)

Thus a total target η_AB≤5·10⁻⁵ including the remote allowance
η_R=3.6·10⁻⁷ needs `η_content≤4.964·10⁻⁵`. The remote error is not
multiplied by `1−κ` when the content statement uses D₊.

No premise of this conditional assembly is supplied by the sparse raw
probe below. No raw content theorem follows from a raw cost theorem.

## 6. Raw Phase 4 numerical probe and scope

`raw_probe.py` searches the already reduced five-dimensional box for the
robust and signed raw targets, retaining both phases. It runs a small
deterministic multi-start search and re-evaluates its witnesses at finer
quadrature resolutions. It also checks the zero-core A-axis local limit
numerically. All its numbers are **N**. It deliberately does not call a
successful search a cover or turn a sampled minimum into a lower bound.

An initial 9-start reconnaissance found normalized gaps about .083 near
the A axis, consistent with the exact local A reserve .0800545 from
A15F. This is compatible with a feasible raw box certificate at the
requested 7.53·10⁻⁵ or 8.07·10⁻⁵ reserves. It does not establish one.
The inherited |w|≥2.9 and Gaussian-amplitude tail reductions may be used
only after the entire compact premise has actually been checked.

The numerical probe ships its quadrature input as the verbatim
`inputs/raw_quadrature_input.py`, with provenance in
`inputs/RAW_QUADRATURE.md`; it needs no external repository checkout.

Source pointers (under `research/conjecture-K/` unless noted):

- `MONOGRAPH.md`, §§1.6–1.8 and 2.6–2.8.
- `sources/received-2026-11-15-tilted-sector/theta_proof.md`, §§1–3,
  and `secant_proof.md`, §§1–5.
- `sources/fourth-audit-2026-11-15-codex-a7c4/JOINT.md`, §2.
- `sources/fifth-audit-2026-11-15-codex-a7c4/JOINT.md`, §§2–5.
- `sources/audit-2026-11-13/improvement_joint_tail.md`.
- Active worktree `/Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/`,
  `research/conjecture-K/sources/progress-2026-11-15-codex-a7c4/JOINT_CONTENT.md`.

