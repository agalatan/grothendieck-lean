# Softened first coefficient: cover status

Agent-ID: codex-cf82. Experimental external Arb generator, not a Lean
proof and not yet a complete coefficient enclosure.

`softened_q0_cover.py FIRST LAST OUTPUT.json` computes directed Arb enclosures
for selected mixture indices over rational radial panels from 0 to 35. These
panels partition exactly at all three root-neighborhood
boundaries. Within those neighborhoods the script skips m≥9 by the shared
L² cutoff and skips m=6,7,8 using a separate q=0 absolute bound <3e-21.
The omitted s>35 tail of this particular q=0 coefficient is <1e-16 by
Cauchy--Schwarz and the independently audited signed phase-weighted L² tail.
This scalar estimate is not a whole-band or base-energy estimate.

Each leaf interval receives an absolute radius allowance of 1e-17 times its
width divided by 35. Thus the nominal sum is at most 1e-17 per scale and
4.56e-15 across 456 scales, independent of subdivision. The aggregator
also checks the actual sum of serialized ball radii is <5e-15. The integrand uses only
entire functions, integer powers, and inversion; β intervals containing
zero become nonfinite, forcing subdivision. A separate analytic audit
accepted this guard. The script checks all phase tuples, profile inputs,
ε and aQ against the Lean Data.lean text, and returns exact binary midpoint
and radius in JSON together with hashes of both sources and itself. This
text comparison is not an in-kernel proof of the parser or radial identity.

`softened_q0_driver.py` runs one index per subprocess, with explicit index
and whole-job deadlines and durable index receipts. Reused receipts must
match source hashes and mixture metadata. Its final aggregator accepts
only all 456 distinct indices -220,...,235 exactly once, checks metadata,
sums their binary intervals with exact rational arithmetic and charges the
root omissions, radial tail and original-to-mixture error separately.
The scope is external Arb plus the documented analytic arguments, not Lean.

Measured so far: before the cutoff and panel layout were changed, the complete radial
cover at m=-220 took 161 evaluations and roughly 0.3 s, producing an Arb
interval with radius <6.6e-19. A
bounded restart test reached 13 distinct low indices and correctly returned
incomplete at its deadline. At m=0, panels [0,4] and [4,8] completed,
but [8,12] was still running after 20 seconds and the timed probe stopped.
After splitting into unit panels, [8,9] also completed within 20 seconds,
but [9,10] remained active at the timeout. With real-axis suppression and
centered Taylor integration, a later 55 s m=0 attempt advanced through
[24,25] but had not completed [25,25.2]; this was before reducing L to 35.
An independent finer [8,9]
integral succeeded in ~3.8 s at a much tighter per-panel tolerance. The
low-scale m=-220 process peaked around 49.6 MB RSS, which does not bound
memory on hard panels. These runs do not determine peak memory, full runtime,
or whether every remaining panel passes a one-shard timeout.

At the time of this local assessment, no complete 456-scale sum had been
computed. The numerical phase error <2.9e-13, root cutoff <4.782e-16 and
scalar coefficient tail <1e-16 rely on written/external-Arb arguments.
Consult a run's own checkpoint and receipt aggregation for its outcome.
