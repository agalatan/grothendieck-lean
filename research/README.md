# research/

Research notes on open problems behind the bounds of this repository. **Nothing here is a proof that the repository
relies on.** The proved results are the Lean theorems under `Grothe/` (see the top-level `README.md` and
`docs/LEAN_DETAILS.md`); this folder records what is known, conjectured, tried and refuted about statements that are
still open, so that a worker (human or AI) can start from an organised record instead of a pile of session files.

**The bounds the research starts from.** Lean proves $1.4020221627 < K_G^{\mathbb C} \le 1.404554025 < 1/\gamma^\dagger$
(`Grothe.Statement.main_bounds`; every constant is stated exactly in [`docs/CONSTANTS.md`](../docs/CONSTANTS.md)).
The dated notes retain their original targets. The open targets and ceilings of individual methods are identified in the ledgers.

- **Not built, not checked.** No Lean module imports anything from here, `tools/gen_root_imports.py` does not scan
  it, and CI neither builds nor tests it. A change that touches only `research/` gets the status
  "Lean proof check (no proof change)".
- **Text only.** Markdown, LaTeX and plain-text notes, scripts (`.py`, `.mjs`, `.cpp`) and small JSON result files.
  Zips, certificates above 300 KB, logs, binaries and PDFs stay outside the repository; each subfolder has an
  `INVENTORY.md` that says where they are, with sizes and SHA-256 hashes of the important ones. A log is kept only
  where it is small and a note cites it as its record (each `INVENTORY.md` names such exceptions).
- **Copies are verbatim.** Files under a `sources/` folder are unedited copies of the working files. The only change
  is one comment line at the top of each `.md` and `.tex` file giving the original path and file date. Their internal
  links still point to the original (git-ignored) `handoff/` paths; each subfolder's `README.md` says where those
  files now live. Dated documents keep their dated claims: read them through the subfolder's `STATUS.md`.
- **Living documents.** A subfolder's `MONOGRAPH.md` is its living book and its `STATUS.md` its living ledger of the
  current state: every PR that changes the state of knowledge edits them in place, with no errata sections and no
  dated update paragraphs. Ledger rows keep their IDs, and a strengthened statement replaces the weaker text in its
  row. Superseded versions of these two files may be kept under `sources/`, verbatim like every copy there.

## Status labels

Every statement in a `STATUS.md` carries one of these labels, and names its author and its checker:

| label | meaning |
|---|---|
| **P** | proved on paper, and the proof re-derived by someone other than its author; "**P**, author only" when only the author's own session re-derived it |
| **C** | certified by an exact or interval checker that someone other than its author replayed, with the implication from the check to the theorem inspected; "**C**, author only" likewise |
| **Lean** | a theorem of the Lean development of this repository |
| **N** | numerical only (floating point), with its stated accuracy; a search gives candidate values and lower bounds on a supremum, never an upper bound |
| **R** | read from the record (a claim, a proof or a certificate of ours or of an external assistant) without full independent verification; this includes certificates whose delivered checker was only run, by its recipient or by the user, with no inspection of the implication from the check to the statement |
| **open** | not proved; no claim |
| **false** | shown false (the entry gives the counterexample and says by what: a proof, a replayed certificate or numerics) |

A status is never upgraded beyond what its source supports. Where two sources disagree, the later independent check
stands, and the ledger states what stands.

## Working on a research task

A research task is an issue labelled `area: research`. Whoever takes one, an agent of this repository or an outside
one, follows AGENTS.md for branches, pull requests and review, and these rules for the content:

- **Every number is computed, never asserted.** Each numerical value that a proof uses comes from a script committed
  with the work, in exact rational or interval arithmetic (for example sympy, or python-flint for Arb balls), that a
  reviewer can replay. Floating-point results are evidence only and carry the label **N**; a search gives candidates
  and lower bounds on a supremum, never an upper bound.
- **Test before proving.** Check an inequality numerically on the hard cases before trying to prove it, and say how
  much room it has.
- **Drafts are inputs, not results.** Derivations relayed from other models, in particular from models without a code
  environment, and claims in outside texts are checked step by step, then repaired or discarded. What survives is
  credited to its source and labelled like any other result.
- **Where the work goes**, in the subfolder of the problem:
  - the note (the statements with their labels, the proofs, what is open) under `sources/<topic>/`;
  - the scripts and their small logs under `code/<topic>/` (text only), with the command that replays them in the
    note; anything kept outside the repository goes in `INVENTORY.md` with its size and SHA-256;
  - the new state, written in place into `STATUS.md` and `MONOGRAPH.md`.
- **The pull request** closes the task issue and says what is proved (**P**), certified (**C**), numerical (**N**)
  and still open.

## Subfolders

| folder | subject |
|---|---|
| [`conjecture-K/`](conjecture-K/README.md) | Conjecture K: the supremum of the gate-free row functional Λ over the cubic chaos H₂,₁ is its value S at the diffuse Gaussian adversary independent of z₁ (approached over increasing dimensions). Open. Proved up to an error of 10⁻⁴ it would give about 1.402 with the cubic witness (the identity-tail witness already gives a strict lower bound of 1.4020221627); proved exactly, about 1.4022. Start with its book, [`MONOGRAPH.md`](conjecture-K/MONOGRAPH.md). |
| [`higher-degree/`](higher-degree/README.md) | Complex games of degree ≥ 5: the best games of degree 5, 7 and 9 and their model values (1.403648, 1.404113, 1.40430), the responses that bind them, a first test of roundings, and the degree-5 certificate programme for 1.402: a conditional certificate for a capped game, by one author and not yet replayed, whose hypothesis, a sector inequality on each row, is open in several parts. The game values are numerical; the certificate rows carry their own labels. Start with its ledger, [`STATUS.md`](higher-degree/STATUS.md). |
| [`identity-tail/`](identity-tail/README.md) | The witness P₁,₀ − εP₂,₁ + ν(Id − P₁,₀ − P₂,₁) at (ε, ν) = (191/250, 47/2000): the witness of the proved lower bound. Model value 1.40212. Its integer certificate (an exact envelope over t ∈ [0, 0.9], designed for the target 1.4018 and below that target's cap with a margin of 5.6·10⁻⁵) is in Lean since #525. The two active rows share a fourth moment, a residual scale and a Gaussian gate. Fourteen transported ordinates, a second paired gate and the curvature of the central Schur complement give [the strict lower bound 1.4020221627](identity-tail/CURVED_SCHUR.md) in `main_bounds`. Start with its ledger, [`STATUS.md`](identity-tail/STATUS.md). |
| [`upper-channels/`](upper-channels/README.md) | The seventh angular selector gives the root Lean upper bound. It improves on every mixture of the six original columns at their fixed preprocessors and tail allowances. The ledger also records finer truncations, several independent selectors and other candidate rounding channels. [Status ledger](upper-channels/STATUS.md). |
