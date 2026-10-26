# Native checks: single-threaded evaluation

## Current policy and lower chain

Every `native_decide` computation runs sequentially. Lake may compile different
modules in separate processes; no checker uses `Task.spawn` over shared data.
This rule follows a malloc double-free failure in an earlier parallel node-cap
check: the native runtime and compiler are part of the trust boundary, so a run
that happens not to crash cannot establish that shared-state evaluation is sound.
CI screens all three project source trees for forbidden escapes and task spawning.

The current allowlist contains **89 named facts: 24 ordinary facts, five Hardy
facts and 60 cap ranges**. The default report has **550 entries**, of which
**332 declarations** are required. [LEAN_NATIVE_INVENTORY.md](LEAN_NATIVE_INVENTORY.md) lists the facts
and distinguishes earlier module timings from current verification.
The scalar sixteenth-power check uses `decide +kernel`, so all sixteen
scalar-tail reports use only standard axioms.

The default lower theorem is
`Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data`, and the
separate `lower_bound_of_capsRest` theorem now uses the same refined endpoint
`1.401697049825`. Both use the unchanged Gaussian `NodeCaps` proposition, defined
in `LowerAnalytic/NodeCaps.lean`. The finite lower certificate has 14 sequential
native facts: five row chunks, three mixed-batch chunks, one extra law-node check,
four refined-box chunks and one refined coverage-tree check.

The old `Lower/Cert/Boxes0–3`, `Lower/Cert/Partition`, `RowCheck` and old-constant
corollaries are retired. The generic `treeCoverOK`/`treeCoverOK_sound` pair proves
coverage for the refined certificate. It requires both recursive children and
includes cut boundaries; it omits the old unused straddler scan. Thus the old
partition-specific proposal [#56](https://github.com/agalatan/grothendieck-lean/issues/56)
is moot. No runtime saving has been measured for this change.

The independent precompiled `GrotheCapsKernel` library holds the cap checker.
The heavy range modules import its computation layer, while soundness and the
refined lower-cover assembly stay outside that computation closure. Full caps
verification and shared-cache publication run only through the droplet runner.
A successful runner build checks both axiom reports, records the source digest in
its verified cache and saves the branch cache; subsequent CI replays that cache.

## Earlier measurements for retained chunks

These module build timings were recorded on droplet `yo` under shared load on
23 October 2026. They include elaboration and one sequential native check per
module; they are not new measurements of the current candidate.

| Chunk | Wall time |
|---|---:|
| `Rows0` | 967 s |
| `Rows1` | 1,108 s |
| `Rows2` | 557 s |
| `Rows3` | 1,220 s |
| `Rows4` | 392 s |
| `Batches0` | 337 s |
| `Batches1` | 344 s |
| `Batches2` | 395 s |

The earlier caps run at `4304b22` took 239 min 41 s wall time across fifteen
four-range modules. Individual row modules took 2,255–10,377 s. These figures
motivate reusing a verified cache; they do not predict the combined runner build's
runtime. No timing for an individual range fact was isolated.

## Why process parallelism is permitted

Lean is intended to mark objects shared with `Task.spawn` as multi-threaded, with
atomic reference counting. The earlier crash occurred despite pure checker code
using exact integer arithmetic. A runtime/compiler error in object sharing can
therefore affect a trusted native computation even without unsafe project code.
The earlier three parallel-era certificate results were independently reproduced
by sequential evaluation; the repository now prevents shared-state task spawning
inside all native checkers. Independent OS processes retain parallel build
throughput without sharing these runtime objects.
