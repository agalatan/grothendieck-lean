<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/odd-gap-continuation/restricted-driver-assembly/PROOF_NOTES.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Restricted all-sector assembly at the same explicit trial

Agent-ID: **codex-91d4**. Refs #436 and #444. 15 November 2026.
**P, author-level assembly; exact scalar C.** The newly imported even
cone certificate is author-level P+C from codex-a7c4, awaiting Claude
review. Its quadrature is not independently replayed in this folder.

## Statement and precise dependencies

Keep every original peak-row hypothesis, energy cap, sector normalization,
and arbitrary sharing between the genuine remote fields. Impose the
additional driver relation

```
r_B = kappa r_A,    |kappa+4| <= 3,
```

where kappa is one constant complex number. Suppose the energies lie in
one of the already proved regional domains of the c=0 odd premise

```
J_Psi(0) - .01||U||² <= sigma(u)-D_minus(q)+50e-6.       (1)
```

Then the fixed trial from the task satisfies

```
T_xi0(E+O) < S_benchmark + 99e-6.                       (2)
```

For the central driver relation r_B=-2r_A, the stronger conclusion is

```
T_xi0(E+O) - S_benchmark
 <= 6151872/212253745625 + 50e-6 - D_plus(q)
 < 79e-6.                                             (3)
```

Here xi0=-(3/5)(r_A+(5053/10000)r_B), and the one global visible
coefficient is c=0. In (3), xi0=(159/25000)r_A. Since the retained
functional is at most this trial, the same upper bounds apply to it.

The regional assumption in (1) is discharged, in particular, on each of
the six rectangles in `../budget/ENERGY_SLACK.md`. It is also discharged
on the earlier tiny strip and ten small-energy rectangles, and on the
nonincrease subregions of `../SECTOR_CONES.md`. This statement does not
include the rest of their surrounding energy box. It does not use a
spectral annulus as an averaged odd theorem or assume the missing uniform
centered-matrix bound.

No global (P) or global odd premise is assumed: the even cone theorem and
the specified proved regional odd lemma suffice. Their inherited proof
and review labels remain explicit. The proportional-driver restriction
is real; this is not a solution of the arbitrary-driver L5 gap.

## 1. The inherited even cone covers this entire remote law

Codex-a7c4's frozen directional certificate proves (P) whenever

```
16 S_r² + 3 S_r >= 6|2A+B|²,    S_r=|A|²+|B|².
```

Its amplitude-complete subcone is |2A+B|²<=S_r/2. For B=kappa A,

```
|2A+B|²-S_r/2 = (|A|²/2)(|kappa+4|²-9) <= 0.
```

This identity holds pointwise for every remote outcome and every shift
q. There is no restriction to a selected remote event, so all unconditional
content and centering identities retain their original meaning.

The imported source is #444 at commit
`4cc7a1ab59f4fd907aa2dd2dd3cc7a6b85de0f71`, bundled in `inputs/`.
The 446-job numerical source commit is
`fb2a3a64102725387c5864ee07eb8fa62b4b901c`. Both cloud shard outcomes and
their complete job sequence were checked from the logs, but this is not
an independent interval replay or exact aggregation. See SOURCE_MAP.json.

## 2. Use the explicit trial before taking any infimum

Define, for the even core,

```
T_xi0(E) = ||xi0||² + 2E|L+E-xi0| - p||E||²,
Lambda(q) = 2E|L+q| - pu.
```

The reviewed joint reduction starts with this explicit trial. Its
averaged (P) estimate therefore bounds T_xi0(E)-Lambda(q), although
the final retained inequality in JOINT_TARGET.md is written after
taking the infimum. Codex-a7c4 confirmed and committed the trial-level
statement in #444; no inequality for an infimum is reversed here.

For r_B=-2r_A, put x=||r_A||, rho=5053/10000, delta=2rho-1,
C=1/50, e0=7532/10^7, and E0=.0463. Then

```
V=5x², ||R||=delta x, ||U||=(2+rho)x,

T_xi0(E)-Lambda(q) <= 2(C delta+2e0)x-Kx²,
K=.31delta²+.08(2+rho)²-10(.080051-E0).
```

This uses the uniform inherited content norms, the shared-moment joint
identity and u+V<=.080051, which follow from the original full caps.
No extra independence is imposed. To reserve the existing U allocation,
replace K by

```
K_c=K-.01(2+rho)²=1018817979/10^10>0.
```

Completion of the square, or maximization over all real x, gives

```
T_xi0(E)-Lambda(q)+.01||U||²
 <= (C delta+2e0)²/K_c
 = 6151872/212253745625 < 29e-6.                       (4)
```

The earlier <19e-6 retained estimate used the full .08||U||² cost.
It cannot also supply the .01||U||² allocation used in (1) without
this recomputation. The new checker rejects that reuse for this
quadratic envelope. It is not a claim that every conceivable sharper
family estimate with a U allocation must exceed19e-6.

## 3. Exact common-trial and signed-deficit assembly

Visible parity makes the odd trial increment an exact central norm
secant at X=L+E-xi0. The reviewed Psi inequality gives

```
T_xi0(E+O)-T_xi0(E) <= J_Psi(0).                     (5)
```

The genuine parity sectors are orthogonal, so the energy penalty in
(5) is exactly -pW. The same xi0 and global c=0 occur on both sides.

Since Lambda(q)=S_benchmark-sigma-D, equations (1), (4) and (5) give

```
T_xi0(E+O)-S_benchmark
 <= -sigma-D + G_c-.01||U||²
                 +.01||U||²+sigma-D_minus+50e-6
 = G_c+50e-6-D_plus,
G_c=6151872/212253745625.
```

This proves (3). In particular both signs of D are handled exactly;
the .36e-6 remote gap must not be charged again.

For the whole kappa disk, the previously reviewed scalar cession is

```
T_xi0(E)-Lambda(q)+.01||U||²-D_plus <49e-6.
```

The same assembly cancels D_plus-D_minus-D identically and yields
(2). This uses the pointwise cone only to discharge (P); its proof
does not change the established general-family multipliers.

## 4. A fully shared, genuine all-sector example in a new region

Let Y be a standard proper remote complex Gaussian, and set

```
u=1/50, EA=1/1000, EB=1/250, V=1/200, W=139/10^6,
q=sqrt(u) Y(|Y|²-2)/sqrt(2),
r_A=sqrt(EA)Y, r_B=-2r_A,
Q=sqrt(W/3)(|Y|²-1),
P=sqrt(W/3)Y²/sqrt(2), nu=sqrt(W/3).
```

All six components are nonzero and genuine in their stated sectors.
The displayed normalized Hermite factors have squared norm1. Thus
the three odd energies are all W/3; the remote cubic, both drivers,
Q and P use the same remote variable. The theorem allows any other
sharing with these same energy and driver constraints as well.

The exact checker verifies both response caps (even the coarse pi>3
lower bound leaves reserve), the remote and total caps, and membership
in the proved low-u rectangle u<=.02,V<=.005,W<=.000139. This example
lies outside the old direct regional half-space and all ten old
small-energy rectangles. No numerical norm integral or response
realization is asserted. Conclusion (3) follows from the stated proofs.

A second example reaches ordinary odd energy near the quoted numerical
benchmark optimizer:

```
u=.0403448, EA=2e-8, EB=8e-8, V=1e-7,
W_Q=W_P=5e-6, W_nu=.01, W=.01001.
```

Use the same genuine Hermite factors and fully shared Y, scaled to these
energies, with r_B=-2r_A. It satisfies the nu-dominant nonincrease cone
and both response caps, and again lies outside the old direct region and
ten small-energy rectangles. The weighted-cap comparison uses an exact
Machin lower bound for pi. No location of the benchmark optimizer is
certified or required, and no positive energy slack near it is assumed.
Conclusion (3) also holds here and for arbitrary sharing at these energies.

## Replay scope

Run the parent continuation's default `python3 -I replay.py`. It freshly
replays the regional energy checker before this new assembly checker.
The latter replays the bundled a7c4 scalar source, independently checks
its coefficients, both deficit signs, the common trial, the example and
negative controls. It does not rerun a7c4's 446-job quadrature or the
inherited remote profile integrations. All such inputs and review labels
are exposed; no runtime dependency reaches another ignored handoff.
