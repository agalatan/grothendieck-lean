# Research modules outside both endpoints

Lean modules, audit scripts and lists that serve neither endpoint, 1.401697117301 < K_G^ℂ < 1.404598149141: obstruction
results, screens, audits and alternative budgets developed while searching for better bounds. They are kept here
unchanged (paths mirror the repository) and are not built: nothing in `Grothe/` imports them.

- `Grothe/`: 33 modules from `Grothe/Upper`, `Grothe/Lower`, `Grothe/LowerAnalytic`, `Grothe/Research` and
  `Grothe/Haagerup/PhaseGeometry.lean`;
- `scratch/`: their focused axiom-report files;
- `data/axioms/modes/`: the audit modes `responses`, `response-geometry`, `phase-response` and `research`;
- `docs/`: `SPHERICAL_TRANSFER.md`, the dated research reports of 23 Oct 2026, `response-geometry.tex` and
  the replay records in `docs/research/`;
- `research/`: inputs of the quintic-projection and response-geometry studies;
- `tools/`: three replay scripts used only by those studies.

To use one again, move it back under `Grothe/` with its imports, run `python3 tools/gen_root_imports.py`, and add its
theorems to `scratch/Axioms.lean` and `data/axioms/required.txt`.
