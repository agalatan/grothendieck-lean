# Native checks: single-threaded evaluation

## Current policy and lower chain

Every `native_decide` computation runs sequentially. Lake may compile different
modules in separate processes; no checker uses `Task.spawn` over shared data.
This rule follows a malloc double-free failure in an earlier parallel node-cap
check: the native runtime and compiler are part of the trust boundary, so a run
that happens not to crash cannot establish that shared-state evaluation is sound.
CI screens all three project source trees for forbidden escapes and task spawning.

The activated source allowlist contains **1,395 named facts**: the retained
88 (23 ordinary, five Hardy and 60 cap ranges) plus 1,307 Row 12 facts
(88 coverage, 1,194 piece ranges and 25 anchor ranges). The default report has
**2,016 print directives**, with **1,787 required declarations**.
[LEAN_NATIVE_INVENTORY.md](LEAN_NATIVE_INVENTORY.md) lists the retained facts
and the new families. These are source/registry counts; Row 12 native execution,
the complete CI proof/audit and verified cache upload remain pending.
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
verification and Actions-cache publication run through canonical CI on the
droplet runner. Its bounded preparation plan covers the 15 retained native row
modules and 1,307 new Row 12 leaves, after 126 pure project prerequisites. At most
TWO independent leaves run per owned group, each `-j1`, under aggregate RSS 24 GiB
and disk floor 3 GiB guards. The canonical lakefile remains unchanged; an owned
trace-neutral `weakLeanArgs` overlay controls each child. Only owned child
processes may be stopped, and completed Lake outputs support an identical
incremental resume.

The preparatory builder does not mark or upload a cache. Success requires the
complete `Grothe` build, ONE combined STRICT native/axiom audit and the existing
marker/probe checks, followed by a successful Actions upload. A read-only digest
or leaf receipt is insufficient. A branch cache supports later replay; after
actual merge the ordinary master check must publish the master cache. There is
no unconditional second ordinary branch check. Row 12's 88 localized nodes cover
4,562 pieces; its 223 anchors and every piece check must pass before its row
assembly is verified. The source leaves only rows 13–15 in `CapsRest`.

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
