<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_r26_twenty_percent/wick_research/README.md (file dated 2026-11-05). Only this line was added. -->
# Wick extension, 5 November 2026

**Proved:** at all three application rows, for
q=X[c(|X|²-2)+P(Y)] with EP=0 and X independent of Y,

    p=E|P|² <= u/5,  u=2|c|²+p in [0.00551,0.0463]
    implies C(q)² <= (9/40)[B(u)-F(q)].

Read proof.md for the theorem, complete analytic argument, and the precise
dependence on the existing shared-A shell-cost estimate.

Replay:

    node verify_template.mjs
    python check_kernels.py
    python verify_deficit.py

The Node checker has no dependencies. Python requires python-flint.
The checks passed in this run. This is a computationally assisted paper proof,
not a Lean proof.

integrate_first.md records a further exact reduction. Its proposed 0.20 scalar
envelope is UNPROVED. The exploratory Python scripts need numpy and scipy and
are not part of the certificate. General R26 and Conjecture K remain open.
