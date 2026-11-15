# research/

Research notes on open problems behind the bounds of this repository. **Nothing here is a proof that the repository
relies on.** The proved results are the Lean theorems under `Grothe/` (see the top-level `README.md` and
`docs/LEAN_DETAILS.md`); this folder records what is known, conjectured, tried and refuted about statements that are
still open, so that a worker (human or AI) can start from an organised record instead of a pile of session files.

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
| **R** | read from the record (a claim, a proof or a certificate of ours or of an external assistant) without full independent verification; this includes certificates replayed only by their recipient |
| **open** | not proved; no claim |
| **false** | shown false (the entry gives the counterexample and says by what: a proof, a replayed certificate or numerics) |

A status is never upgraded beyond what its source supports. Where two sources disagree, the later independent check
stands, and the ledger states what stands.

## Subfolders

| folder | subject |
|---|---|
| [`conjecture-K/`](conjecture-K/README.md) | Conjecture K: the supremum of the gate-free row functional Λ over the cubic chaos H₂,₁ is its value S at the diffuse Gaussian adversary independent of z₁ (approached over increasing dimensions). Open. With an error of 10⁻⁴ it would lift the lower bound from 1.401700037873 to about 1.402, exactly about 1.4022. Start with its book, [`MONOGRAPH.md`](conjecture-K/MONOGRAPH.md). |
