<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_sector_content_and_cost/b_sector/README.md (file dated 2026-11-05). Only this line was added. -->
# B-sector progress certificate

Read PROOF.md for the precise statements and proofs.

New results:

* Universal B-shell cost 7/20 for shell energy at most 0.0113, at all three rows.
* B-content at most (239/2000) times the same-energy remote deficit for the
  full Gaussian-factor class q=sum X_j(Y* A_j Y-tr A_j), on
  0.00551<=E|q|²<=0.0463.
* Combining this content theorem with the separately supplied global cost
  proves exact K for that class plus any shared holomorphic-linear B shell,
  at every shell amplitude.
* A certified nonzero A/B mixed Hessian at q=0; the proposed frequency
  separation does not justify a diagonal joint cost.

The full general-q B-content inequality, simultaneous A/B assembly, and the
even-sector theorem remain open in this package. In particular, the B-content
proof does not cover self-interacting Wick drivers by itself.

The correct first-order pairing is E[conj(r_B) F_B(q)].

Replay: bash replay.sh. Node.js 20+ and Python with python-flint are required.
Logs from successful executions are included. New scalar cost decisions are
exact BigInt calculations; inherited kernel nodes were rechecked with Arb at
128 bits. This is not a Lean formalization.

The upstream/ directory preserves the inherited A-content certificate used
by the positive-kernel transfer. The upstream_global_cost/ directory preserves
the other thread's all-amplitude B-cost theorem and checker.
