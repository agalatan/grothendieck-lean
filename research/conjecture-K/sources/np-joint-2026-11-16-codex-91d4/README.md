<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/np-joint-refinement-2026-11-16/README.md (16 November 2026); codex-91d4. Only this line was added. -->
# Joint Malliavin refinement from the Nourdin--Peccati digest

Agent-ID: **codex-91d4**. Refs #436. New author-only P+C for
**claude-b9ee** to review; no tracked repository changes.

Read REPORT.md for Phase 0 and the final scope, PROOF_NOTES.md
for the proof, and BOOK_APPLICATION.md for what was learned from
the book. All lower fields keep their original law and arbitrary
sharing. Both Q/nu channels remain present. No scalar deficit,
premise(P) or extra response penalty is spent.

## Replay from a clean copy

Use Python 3.12 or newer with the pinned python-flint package:

```sh
python3 -m venv /tmp/codex-91d4-np-joint-review-env
/tmp/codex-91d4-np-joint-review-env/bin/python -m pip install -r requirements.txt
/tmp/codex-91d4-np-joint-review-env/bin/python -I -B replay.py --numerics --output /tmp/codex-91d4-np-joint-review-run
```

Choose fresh paths; an existing output is refused. The driver copies
only five bundled scripts into a new temporary directory and runs
four scoped checkers, fourteen rejection controls, and optionally
the N selector. It then saves that source-only package, logs,
source/output hashes and a receipt. The runtime is offline and
does not import any book file, sibling handoff, repository module,
NumPy or SciPy. No saved numerical output is acceptance data.

`python3 -I -B replay.py --hashes-only` needs only the standard
library. Without --output, logs are written under replay_runs here.
Source manifests exclude replay trees, which have their own receipts.
The initial records and optional digest check log are provenance,
not inputs. ENVIRONMENT.json records only the author's temporary
development location; it is never used by the replay.

## What is checked

- algebra.py: exact inherited tensor/Hermite identities, circular
  normalization, mixed moments and the partial interpolation.
- verify_parity.py: exact parity-pairing controls, both shift
  components and sharpness of the centred half-range factor.
- verify_reference.py: fresh outward M/J integration, analytic
  Gaussian tails and interpolation over the complete u interval.
- verify_budget.py: covariance PSD, energy allocation, the global
  concavity maximum bracket, hard tuple and entire region III.

The dimension-independent proof is analytic P; the scripts check
its stated arithmetic and integration components. No Lean theorem
or general caps-only closure is claimed. The new result is not
covered by the preceding packet's independent review.

Recorded clean replay: **10.367 seconds**, Python **3.14.8**,
python-flint **0.8.0**, all nineteen steps passed (four C checks,
fourteen rejection controls and one N selector). The receipt is
`replay_runs/codex-91d4-clean-replay/RECEIPT.json`.
