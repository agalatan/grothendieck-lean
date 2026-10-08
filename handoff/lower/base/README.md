# Complex Grothendieck lower-bound refinement

**Locally verified result: \(K_G^{\mathbb C}>1.40020018\).**

Read [the research note](research-note.md) for the argument, attribution,
limitations, and why this does not determine another digit of the constant.

The package contains our replacement certificates and verification scripts.
It depends on the analytic reduction in Heilman–Jones–Malavolta,
[arXiv:2609.25462v1](https://arxiv.org/html/2609.25462v1).
The result has been checked locally, including an independent implementation
of the polynomial/coverage verification; external review and novelty
assessment remain open.

**Reproduce the entire certificate.** Python's standard library and a C++17
compiler available as `g++` suffice. Do not use Python's `-O` flag.

Download the unmodified upstream
[check_complex_lower.py at the pinned commit](https://raw.githubusercontent.com/sheilman77/grothendieck_cx/7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f/check_complex_lower.py).
It is not bundled. The verifier requires SHA-256
`8c6105340cced0ee4b4d4977baab4c0d43f07466ce77e726eb1277b613473ac1`.

From the present workspace:

```sh
python3 outputs/grothendieck-lower-refinement/verify_all.py \
  --source work/source_complex/check_complex_lower.py \
  --workdir work/lower-next/reproduction
```

Elsewhere, provide the absolute path to your downloaded source and a scratch
directory. The local run is recorded in
[full-final-verification.txt](logs/full-final-verification.txt).

`replay_physical.py` regenerates the Gaussian price certificates with an
explicit conservative rational lift. `verify_refinement.py` independently
checks the saved polynomial majorants, every refined rectangle, coverage,
and the final rational bound. Numerical optimization is not needed to run
either verifier.

The separate scripts `certify_cubic_constants.py` and
`certify_quadrature_rho.py` check the auxiliary moment improvements.
The stronger first-moment bound 0.977459 is not needed for the principal
lower bound: the final certificate retains 0.98.

The comparison with reported real-constant bounds is in
[literature_status.md](literature_status.md). In particular, a newly found
SSRN abstract claims a stronger real interval, but its full proof was not
accessible for audit in this session. We do not silently treat the older
real interval as the latest reported claim.
