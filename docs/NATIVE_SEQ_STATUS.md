# Native checks: single-threaded evaluation

## Current policy and lower chain

Every `native_decide` computation runs sequentially. Lake may compile different
modules in separate processes; no checker uses `Task.spawn` over shared data.
This rule follows a malloc double-free failure in an earlier parallel node-cap
check: the native runtime and compiler are part of the trust boundary, so a run
that happens not to crash cannot establish that shared-state evaluation is sound.
CI screens every project source tree (`Grothe/` and the four `Grothe*Kernel/` libraries) for forbidden escapes and
task spawning. The rule covers every proof in the tree: the lower bound, the multi-channel upper proof behind
`main_bounds` (`K ≤ 1.404554025`), the seven-channel selector proof, and the older single-channel upper proof.

The canonical allowlist and report are `data/axioms/native.txt` and
`scratch/Axioms.lean`; [LEAN_NATIVE_INVENTORY.md](LEAN_NATIVE_INVENTORY.md)
records the native computations and their timing evidence. The scalar
sixteenth-power check uses `decide +kernel`, so its scalar-tail consequences
use only standard axioms.

The native checks of the lower bound are the row checks `Grothe/Lower/Cert/RowSS.lean` and the node-cap facts: the range facts of
the whole-fibre nodes, the coverage and piece facts of the localised nodes and the chord facts of every row
([CAPS.md](CAPS.md)). Each is one sequential computation; the node caps are split into many modules, so that Lake
checks them in separate processes. The mass row needs no native fact: its cover and witnesses are kernel-checked (`certMassRow`,
`massMesh_ok`, `massCapsOK`), and the axiom report holds `certMassRow` and `mass_law_bound` to the three standard axioms.

The independent precompiled `GrotheCapsKernel` library holds the cap checker. The node-cap fact modules import only
its computation layer and rational data, while soundness and the row assemblies stay outside that computation
closure. The node caps are verified, and the shared cache published, only by CI on its heavy runner: a successful
build checks the axiom report, records the source digest in its verified cache and saves the cache; subsequent CI
replays that cache.

## Why process parallelism is permitted

Lean is intended to mark objects shared with `Task.spawn` as multi-threaded, with
atomic reference counting. The earlier crash occurred despite pure checker code
using exact integer arithmetic. A runtime/compiler error in object sharing can
therefore affect a trusted native computation even without unsafe project code.
The earlier three parallel-era certificate results were independently reproduced
by sequential evaluation; the repository now prevents shared-state task spawning
inside all native checkers. Independent OS processes retain parallel build
throughput without sharing these runtime objects.
