<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_twenty_percent_extension/r26_extension/README.md (file dated 2026-11-05). Only this line was added. -->
# R26 Wick endpoint extension: p <= u/5

Proved at all three application rows, throughout 0.03 <= u <= 0.0463:

    C(q)^2 <= (47/200) [B(u)-F(q)],  when p <= u/5.

The coefficient P may be any centered complex random variable independent of
X with finite second moment. For the intended cubic-chaos application, use
a centered quadratic P.

Contents:

- proof.md: theorem, analytic estimates, enclosure method, scope.
- verify_endpoint.mjs: standalone exact dyadic continuum checker.
- check_constants.py: fresh Arb kernel bounds and exact rational checks.
- endpoint_replay.log and constants.log: successful verification output.
- remaining_r26.md: proved integrated-deficit identities and a sufficient
  matrix-envelope criterion for the still-open region; no claim that its
  envelope has been certified.

Replay from this directory:

    node verify_endpoint.mjs
    python check_constants.py

Requirements: Node 20 or later; Python with python-flint. The Node checker
needs no dependencies and regenerates all tables. The Python checker does
not rely on precomputed kernel JSON files.

This is an analytic proof with rigorous computational inputs. It is not
formalized in Lean. The region p>u/5, c!=0 and the general mixed-shell
conjecture remain open.
