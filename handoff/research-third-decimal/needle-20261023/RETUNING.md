# Retuning the cubic multiplier with frozen source majorants

23 October 2026. Read against master `6a869c8` in the isolated research
worktree. No endpoint is claimed here. All checks below were small exact
finite algebra, with no Gaussian integration or heavy search.

The fastest useful endpoint task is the complete free refinement of the
existing cover. A tiny multiplier increase can be added later, but its reward
is only a few billionths in the reciprocal and requires source-cap transport
at **every** used source node. Substantial retuning toward `.7564` cannot be
obtained by relabelling the old certificates.

## 1. The exact finite transport

Write `e=149/200`, `e'=e+Delta`, `Delta>=0`, and let a row have
`E,R,ell,beta,delta,a`, where `a=(1+b1,b2,b3)` and `A=delta*a`.
Its physical source field is `tau*A`, its source matrix is

```
M = diag(E,E,R,R,e*I2),
```

and its pinned price is

```
C = E[1:,1:], h = E[1:,0]+A[1:],
D = E00-e+2*A0-h^T*C^-1*h.
```

Keep `ell,beta` fixed. A fully explicit admissible upward path is

```
E' = E+Delta*diag(0,1,1),  R' = R+Delta*I2,
delta' = delta+Delta,     a' = delta*a/delta'.
```

The physical coupling `A'=delta'*a'=A` is unchanged. Every k-side shell
remains positive semidefinite, as do `E',R'`. The extra gate
`N=E-diag(e-delta,0,0)` satisfies
`N'=N+Delta*diag(0,1,1)`. Thus this path also preserves that gate; scaling
`E,R` alone or keeping `delta,a` fixed does not establish all the gates.
The new pinned price is exactly

```
D' = D-Delta+h^T*[C^-1-(C+Delta*I2)^-1]*h.
```

The new stored source coordinate is `s'=delta'*tau`; old `s` labels cannot
be reused unchanged. Equivalently work directly with the physical field
`tau*A`, avoiding this redundant parameterization.

For frozen positive Gaussian cell prices, the majorant

```
J(m;b) <= -m^T*Q*m+C0+2*h0^T*(m+b)+(m+b)^T*H*(m+b),
Q=M^-1,
```

uses `C0,h0,H` independent of `E,R,e` once the visible polynomial
`L=z[ell+beta(|z|^2-2)]` and those cell prices are fixed. Hence replace
`Q` by `(M')^-1`, retain the same Gaussian `C0,h0,H`, the same source-space
regions and nonnegative S-lemma multipliers, and recheck exact LDL. On each
piece this is exactly `exactint.piece_quadratic_multi(Qnew,a,...)`, with the
appropriate external field. A maximum over all covering pieces is a valid
new cap if every LDL check passes. No Gaussian cell is reintegrated.
The covering regions are in `m` coordinates and must stay there; transporting
them as though they were response coefficient regions changes the proof.

Sources: `handoff/lower-stein/cert-0745d/tools/exactint.py`, especially
`piece_quadratic_multi`; `replay_midcaps_exact.py`, `cons_of` and `coverage`;
and `tools/rankone_replay_verify_transport.py`. For unlocalized block
majorants see `tools/rankone_analytic_transport.py:majorant`. The old
source SHA checks and the original moment authentication remain required.
Changing `ell,beta` does **not** preserve these particular `C0,h0,H`.

## 2. A concrete exact check and an obstruction to the larger move

Use the nine authenticated pieces in
`handoff/research-third-decimal/rank-one-certification-20261023/replay/localized-row0855-s027-fminus003105.json`,
with original recipe
`handoff/lower-stein/cert-0745d/midcaps/mc_a_0.855.json`, node index 28.
They retain the full twelve-dimensional source, at physical
`r=3799912185593856/7611644474086025`, `s=.27`.

Keeping `E,R,ell,beta,delta,a` fixed and changing only `e` to `e+10^-8`
passes all nine exact new LDL checks. The all-piece maximum rises by less
than `5.280e-29`, versus stored cap slack greater than `1.563e-11`.
This selected cap therefore survives that multiplier change. This does not
transport all source nodes or certify a new global endpoint.

In contrast, the automatic repaired-gate path in section 1 fails the first
piece's Schur positivity already at `Delta=10^-4`, and also at
`Delta=57/5000` (the move to `.7564`). This rejects those *frozen prices*,
not the retuned witness. New cell prices, S-lemma multipliers or sharper
majorants are needed for that path. In particular, an old scalar cap alone
does not justify a cap for a changed source matrix.

For fixed old gates, all 19 rows pass the E/R shell minors exactly at
`Delta=10^-7`. The smallest of the two R-shell margins before the change is
`1.0028401728515194e-7`, at row 0. Hot-row E-shell margins are approximately
`1.10e-7`; their R-shell margins are approximately `1.05e-7`. This explains
why a fixed-gate transport is a needle, rather than a substantive retuning.
The `N` gate and every source majorant must still be checked for a final run.

## 3. What an unchanged-source-cap transport would buy

Suppose every source cap has been transported to `e'` with its old numerical
value, while all row parameters and gates are unchanged. For any fixed mixed
row, the source/law polynomials are unchanged and `D'=D-Delta`. With mixed
visible parameter `betaBar`, its exact bound changes pointwise by

```
Delta*[tau^2-2*betaBar^2/(e*e')].
```

Consequently an already checked box upper `U` has the sufficient new upper

```
U' = U+Delta*[tauUpper^2-2*betaBar^2/(e*e')].
```

For a whole-row-envelope box use `rho^2` instead of `tauUpper^2`, because its
stored row cap already took a global scale supremum. Use the actual common
mixed `betaBar`; applying this correction separately after row mixing misses
the retained-square variance. The crude row also transports, with constant
increase `Delta*rho^2`.

A standard-library Fraction sweep of all 8,756 archived boxes, at
`Delta=10^-7`, gives the conditional sufficient global cap
`0.7134217971173942...`, compared with the old actual box maximum
`0.7134217985255055...`. Its reciprocal is `1.401695328122206...`, only
about `5.66e-9` above `1/Bcap`. This sweep assumes all unchanged source caps;
it is not a proof that that assumption holds. It is smaller in practical
value than completing the free cover-refinement campaign.

The worst archived boxes before retuning are:

- 7234: `.7134217985255055`, rows 13 and mixture `(.06 row12+.94 row14)`.
- 5661: `.7134217984631229`, mixtures of rows 14 and 15.
- 7415: `.7134217974673642`, mixtures of rows 14 and 15.
- 3661: `.7134217973148504`, row 12 and a row14/15 mixture.
- 1247: `.7134217969064060`, row 12 and a row12/14 mixture.

These are frozen *cover* values, not claims that their saved atomic laws
survive newer common-Stein cuts. Box 8168 remains a whole-row obligation;
its old upper is `.7134212350251790`, and the conservative tiny-retuning
upper is `.7134213219858778`. It does not become the maximum in this screen.
All values use the committed
`handoff/lower-stein/cert-jointmoment-lifted-codex/{inherited,cover}.json`.

## 4. Recommended completion order

Finish and replay the free finite cover, then plug it into a generic
same-`NodeCaps` endpoint theorem. This changes neither source potentials nor
their analytic assumptions. Only then consider the tiny retuning if its
extra proof work is justified. A substantive cubic target at `1.402` requires
a real multiplier in the necessary window `.745928<e<.766838` and genuinely
new row caps. The original `.745` witness cannot reach that target: an actual
finite Gaussian pair already has payoff above `.71329>500/701`. The separate
all-complex, dimension-uniform cubic-family ceiling is `1.4022581233`; neither
barrier is an upper bound on the Grothendieck constant.
