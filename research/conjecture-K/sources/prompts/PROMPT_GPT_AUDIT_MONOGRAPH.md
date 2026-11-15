<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/prompts-2026-11-15/PROMPT_GPT_AUDIT_MONOGRAPH.md (file dated 2026-11-15 03:24). Only this line was added. -->
TASK. Audit the monograph on Conjecture K in this repository, improve it, make real progress on the conjecture
where you can, and deliver everything as one pull request.

You work in the repository /Users/alingalatan/workspaces/grothe (GitHub: agalatan/grothendieck-lean). Read
/Users/alingalatan/workspaces/grothe/AGENTS.md first and follow it exactly: pick an agent ID, work in your own
worktree on your own branch, never commit to master, serve an open task issue, sign your commits, open a PR.

1. WHAT TO READ, IN THIS ORDER
All paths below are under /Users/alingalatan/workspaces/grothe/research/conjecture-K/ .
- README.md       the statement, the notation, the layers L1 to L6 of a proof, and an index of every file.
- STATUS.md       every claim with its label (P proved and re-derived, C certified by a replayed checker,
                  N numerical only, R read only, open, refuted). Section 0 defines the labels, section 13 lists
                  what was refuted or tried and failed, section 14 the contradictions between sources,
                  section 15 the open problems.
- MONOGRAPH.md    the object of the audit: the monograph of 5 and 6 November, verbatim, preceded by
                  "Errata and updates" (parts A, B, C).
- sources/audit-2026-11-13/REPORT.md and the reports beside it: the independent audit of 13 November. Build on
  it; do not repeat it.
- sources/numerics-kprime-2026-11-15/README.md and STATUS.md section 11 (c): the newest numerical finding.
- sources/ and code/ as needed. INVENTORY.md says what stays outside the repository and where it is on this
  machine (packages, certificates, logs under /Users/alingalatan/workspaces/grothe/handoff/).

Conjecture K is open. If it held up to an error of 1e-4 at the rows that matter, the lower bound of this
repository would rise from 1.401697117301 to about 1.402. Do not claim any new bound on the Grothendieck constant.

2. PART ONE: THE AUDIT (bounded; do it first)
Go through MONOGRAPH.md section by section, and through the claims of STATUS.md that carry P or C. Look for:
- mathematical errors: wrong statements, missing hypotheses, wrong signs or normalisations, quantifiers in the
  wrong order, a bound used outside its range;
- logical gaps: an implication that does not follow, a "therefore" that needs an unstated lemma (the audit of
  13 November found one such at the centre: a content bound was said to close the A+B core, and it does not);
- numerical errors: recompute every constant you rely on, with interval or exact arithmetic where that is cheap;
- stale or contradictory claims, and labels that are higher than their source supports;
- results marked R that matter and could be checked now. In particular STATUS.md 3.3: two packages of 22 October
  claim remote bounds far sharper than the one in use (Lambda(q) < S + 1.05e-5 and Lambda(q) < S + 3.6e-7 for
  every remote cubic), and nobody has examined them. They are in
  /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/ .
  Replaying and auditing them could close the remote part (layer L1) with room to spare.
- the numerics of 15 November (STATUS.md 11.12 to 11.20): reimplement the sector gain on the Wick monomial
  independently and compare; check the tilted-sector inequality and the formulas for k(s) and h_s.
For every finding give: where (file, section, line), what is wrong or weak, the evidence (a proof, a
counterexample, or a computation with its script), how serious it is, and the correction.

3. PART TWO: IMPROVEMENTS OF ANY KIND
Shorter or more general proofs, removed hypotheses, better constants, a cleaner statement of what remains to be
proved, a better order of attack, missing cross-references, numerics made reproducible. Say which of them you
applied in the pull request and which you only propose.

4. PART THREE: MOVE THE NEEDLE
Choose one or two open items where a complete proof or a certified computation is realistic, and finish them.
Candidates, with the reference in STATUS.md:
- the finite-amplitude joint A/B remainder bound (7.4, and item 1 of section 15);
- a dimension-uniform content theorem (6.3.18, and item 2 of section 15), or its much easier version for the tilted sector
  (11.12 to 11.19): there the constant needed is about forty times the true one instead of 1.14 times;
- the kernel comparison |g_B - 0.5053 g| <= 0.007 (7.1.4);
- the remote part on all rows (section 3, and item 5 of section 15), starting with the packages named above;
- anything else you find that shortens the distance to 1.402.
A refutation counts as progress: if a statement the programme relies on is false, give the counterexample.
Another assistant has been asked to prove the tilted-sector lemma itself; you may audit its statement, but do
not make that lemma your main item.
Before you call anything new, check it against STATUS.md, especially section 13. Twice already an idea taken
for new was in the October record.

5. RULES FOR THE CONTENT
- Label every statement you add as STATUS.md section 0 prescribes. A result of yours that nobody else has
  checked is "P, by its author, not reviewed" or C with its checker; a floating-point observation is N and
  never a proof. Never raise the label of an existing claim without the check that justifies it.
- Dimension-free statements only, unless the statement says otherwise. Every constant explicit; a constant
  defined by an integral needs an enclosure and the code that produces it.
- The body of MONOGRAPH.md and the files under sources/ are verbatim copies: do not edit them. Corrections go
  into the "Errata and updates" part of MONOGRAPH.md, into STATUS.md, and into new files.
- Text, scripts and small result files only (nothing above 300 KB, no binaries, no zips); research/README.md
  has the rules of the folder. Checkers must run as `python3 -I <script>`; python-flint is available.
- Touch nothing outside research/conjecture-K/ (no Lean file, no lake file, no README.md, no workflow).

6. THE PULL REQUEST
- Create a task issue (labels `type: task`, `area: research`, your `owner:` label) that states the audit, and
  name it in the PR (`Closes #n`) and in your commits (`Refs #n`).
- Add your material in new folders, for example
  sources/audit-<date>-<your agent id>/AUDIT.md   (the findings, most serious first, and the list of improvements)
  sources/audit-<date>-<your agent id>/<topic>.md (each new proof)
  code/audit-<date>-<your agent id>/              (checkers, with their output saved beside them)
  and update STATUS.md (new rows, corrected rows, sections 13 to 15), the errata of MONOGRAPH.md, the index in
  README.md and, if you leave files outside the repository, INVENTORY.md.
- The PR description: the three most important findings, what you proved or refuted, what you changed in the
  existing files, and what a reviewer should check first.
- No Lean build is needed: CI will report "no proof change" for a change under research/ only. Combine with a
  fresh master before pushing (AGENTS.md section 6). Ask for review in the PR; do not land it yourself.

7. YOUR FINAL MESSAGE
The PR link, the findings as a short table (finding, severity, status of the fix), the new results with their
labels, and what you would do next with one more day.
