# Verified import into the complex lower-bound construction

Current internally reproduced lower endpoint: **K_G^C > 1.4008970709**.
Exact uniform operator-norm cap: **7138283181/10000000000**.
No completed Lean proof is claimed.

Read `research-note.md` and `../../formalization/LOWER_IMPORT_ADDENDUM.md`.
The independent full replay, from this handoff root, is:

```sh
python tools/reproduce.py --suite lower --workdir replay-work
```

Or run this package directly with standard Python and a C++17 `g++`:

```sh
python packages/grothendieck-lower-import/verify_all.py --source upstream/grothendieck_cx/check_complex_lower.py --workdir replay-work/lower
```

The reference verifiers reject Python `-O`/`-OO`. The proof gates use exact
fractions; numerical searches are not replay prerequisites. All Gaussian
analytic dependencies and the1e-8 point/polynomial correction remain explicit.
The primary selected polynomial pool contains97 new imported majorants plus
the48 prior extras; the full checked import contains418 new majorants and is
preserved in the research directory.

`received-instance-audit.md` explains which received ideas duplicated previous
work and which were useful. `logs/full-verification.txt` records the complete
new replay. The contact-moment helper is retained for research; the current
certificate uses constant rho only.
