# Native checks: single-threaded evaluation (status, 23 Oct 2026)

## Why
A parallel node-cap check on `work/lower-caps2` aborted with a malloc double free (SIGABRT) in
`GrotheKernel` bignum interval multiplication (`mulI`) running inside `Task.spawn` tasks that shared
data. A double free is memory corruption inside code that `native_decide` trusts; a run that does
not crash is not thereby known to be uncorrupted. Policy since then: every `native_decide` fact is
evaluated by single-threaded code (no `Task.spawn`, no shared-state concurrency); parallelism only
across processes (one fact per module, `lake` builds modules in parallel).

## What changed
* PR #1 (`c6942a2`, merged as `5bed67f`): `allPar` is `List.all`; `checkCert` and `bivarT`
  (upper head) are sequential. Master since then has no `Task.spawn` anywhere in `Grothe/` or
  `GrotheKernel/` (checked with `git grep Task.spawn origin/master`; the newer facts
  `phi_cover_check`, `capChords_check` and the 60 `capRangeKK_j` are sequential too).
* This branch (`work/native-split`): the lower certificate check `cert_check`, which takes
  74 min sequentially, is split into 13 single-threaded `native_decide` chunks in
  `Grothe/Lower/Cert/` (rows ×5 of 4 rows, batches ×3 of 7, boxes ×4 of 2,200, the partition),
  reassembled into the unchanged theorem `cert_check` by `all_of_chunk` (`Grothe/Lower/Cert/Parts.lean`).
  `scripts/check_axioms.py` pins the 13 chunk facts instead of `cert_check`'s native axiom.

## Timings (droplet `yo`, 8 cores, shared with two other builds; one core per native module)
| module | fact | sequential wall time |
|---|---|---|
| `Grothe.Upper.Final` | `head_check` | 62 s (module build) |
| `Grothe.Upper.Haagerup` | `haagerup_check` | 257 s |
| `Grothe.Lower.RowCheck` (monolithic, PR #1) | `cert_check` | 4,421 s (74 min) |
| `Grothe/Lower/Cert/*` (this branch) | 13 chunks | 37 min wall for all 13 in parallel (table below) |

Chunk modules (built together by `lake build Grothe.Lower.RowCheck`, 8 processes on the shared
droplet; each time is the module build including its single-threaded native check):
| chunk | time | chunk | time |
|---|---|---|---|
| `Partition` | 40 s | `Rows0` | 967 s |
| `Batches0` | 337 s | `Rows1` | 1,108 s |
| `Batches1` | 344 s | `Rows2` | 557 s |
| `Batches2` | 395 s | `Rows3` | 1,220 s |
| `Boxes0` | 2,199 s | `Rows4` | 392 s |
| `Boxes1` | 2,172 s | `Boxes2` | 1,534 s |
| `Boxes3` | 1,809 s | | |
All 13 return `true`; `RowCheck` (the reassembly, `decide +kernel` for the length bound) builds in
13 s with no warning; `#print axioms Grothe.Lower.lower_bound_data` shows exactly the standard
axioms and the 13 chunk facts. The boxes dominate: splitting them into 8 chunks of 1,100 would
bring the wall time to about 20 min. Not yet run: the full build of this branch with the
caps/upper-chaos modules of master and `check_axioms.py` on it (expected count: 227 + 13 = 240).

Full build of PR #1's tree (98f61ec + c6942a2) on the droplet: 87 min wall, EXIT 0, 0 warnings;
`check_axioms.py`: 186 theorems, 3 native facts — the sequential evaluation reproduces `true` for
all three facts that were previously computed with `Task.spawn`.

## Could the crash mechanism have affected the earlier (parallel) facts?
1. Lean's runtime marks every object reachable from a closure passed to `Task.spawn` as
   multi-threaded (`lean_mark_mt`); reference-count updates on MT objects are atomic, so pure code
   sharing data between tasks is supposed to be race-free.
2. `GrotheKernel` and the lower checkers contain no `unsafe`, `ptrEq`, `implemented_by`, `@[extern]`,
   `IO`/`ST`, `Thunk` or arrays with in-place update (checked by grep); `mulI` is four `Int`
   products plus shifts. So the double free is not caused by unsafe user code.
3. The likely mechanism is therefore in the runtime/compiler: an object shared across tasks
   without MT marking (for example a closed term or a value created lazily after the spawn), whose
   non-atomic reference count races; GMP-backed `Int`s are separate heap objects and are freed when
   their count reaches zero, hence a double free.
4. A race of this kind usually crashes; it can also free an object still in use, so another thread
   may read a reused buffer. A silently wrong `Bool` is improbable (the corrupted value would have to
   flow into a comparison and flip it without crashing) but cannot be excluded in principle.
5. The three earlier parallel facts (`head_check`, `cert_check`, `haagerup_check` — the last was
   never parallel) never crashed in many local, droplet and CI builds.
6. Decisive evidence: the sequential re-evaluation (PR #1 tree) returns `true` for all of them,
   with no `Task.spawn` involved. So the bounds on master do not depend on any parallel run.
7. Recommendation: keep the rule "no `Task.spawn` inside `native_decide`"; parallelise only by
   modules. CI should forbid `Task.spawn` in `Grothe/` and `GrotheKernel/` (one grep line in
   `.github/workflows/lean.yml`; not done here).
