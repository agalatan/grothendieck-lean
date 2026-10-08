# References and provenance

The main analytic input is Steven Heilman, Chris Jones and Giulio Malavolta,
*Sharper Bounds for the Complex Grothendieck Constant*, arXiv:2609.25462v1.

- Versioned HTML: https://arxiv.org/html/2609.25462v1
- Abstract/version record: https://arxiv.org/abs/2609.25462v1
- Source repository: https://github.com/sheilman77/grothendieck_cx
- Pinned revision:
  `7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f`

The bundled `upstream/grothendieck_cx` directory contains the dependency files
already used and checked in this workspace, with their original contents.
It is not represented as a complete clone of the repository. Current upper
manifests pin the relevant source files and coefficient tables; the lower
checker pins `check_complex_lower.py` by SHA-256.

The paper's complete text is not included. Sections 7–8 are particularly
important for the lower Gaussian operator reduction, potential profiles,
and cubic moments. The upper construction and analytic prerequisites are
described in the same paper and the bundled source.

The other instance's user-supplied work is preserved under `received/`.
Its original archive hash and pasted-message hash are in
`received/UPLOAD_PROVENANCE.json`. Its report is historical source material;
the current audit and combined improvement are in
`packages/grothendieck-cross-instance-review/`.

Five local delivery stages are preserved:

1. `grothendieck-refinement`: first upper refinement.
2. `grothendieck-new-directions`: structural explorations and obstructions.
3. `grothendieck-lower-refinement`: moment and lower-profile refinements.
4. `grothendieck-further-squeeze`: current lower certificate and an earlier upper.
5. `grothendieck-cross-instance-review`: current upper certificate and the audit.

Their local research status and limitations remain as documented in the notes.
No bibliography entry or saved `PASS` label is an authority to assume a Lean
theorem without proving it or listing it as an explicit hypothesis.
