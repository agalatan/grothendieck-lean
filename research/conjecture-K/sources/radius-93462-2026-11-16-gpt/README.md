<!-- Verbatim from the delivery cubic_l1_rho_0_93462.zip (README.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# A certified dimension-free cubic-chaos bound: rho = 0.93462

**Theorem [C].** For every dimension and every complex Wick cubic
\(q\in H_{2,1}\),
\[
\mathbb E|q|\le\frac{46731}{50000}\sqrt{\mathbb E|q|^2}.
\]

This improves the preceding certified 0.9359 bound. The proof uses the two
moment ceilings supplied in the question, new joint projection constraints
[P], and seven explicit rational dual certificates [C]. It does not reach
0.916 or prove the sharp conjecture. No relaxation optimum is asserted.

Read `PROOF.md` for the complete written reduction, precise certificate
lemma, and explicit cubics defeating failed strengthenings. `SOURCES.md`
records the literature read and what it contributed.

## Replay the proof

Run these commands from this directory:

```sh
# cubic_l1_gram_certificate/
node verify.mjs
python verify.py certificates.json
python verify_identities.py
python negative_controls.py
```

The JavaScript verifier needs Node 20 or later. All verification scripts
use only their language's standard library. The JavaScript and Python
certificate verifiers independently use exact rational arithmetic. They
check every radius in the entire half-line and every s in [0,42]. The
verification uses 673 terminal Bernstein intervals. `verification.txt`
contains the recorded output.

The analytic improvement retains the Gram matrices of two tensor
contractions and of the fourth-chaos projections. It also proves the
following rank-one constraint, in the notation of `PROOF.md`:

\[
R\le\frac{1+\alpha}{4}B+
\left(5+\frac3\alpha\right)(1-Q),\qquad\alpha>0.
\]

This constraint is dimension free and is proved in writing, with no
numerical step. The proof also gives
\(\mathbb E[\bar q^{\,2}a]\le\delta/2\).

## Optional numerical discovery [N]

`discover.py` and `basis.py` contain the numerical optimizer used for the
stronger duals. Install `requirements-discovery.txt` and run, for example,

```sh
# cubic_l1_gram_certificate/
python discover.py 5.6
```

This writes a floating-point candidate to the current directory. Its
output is **not a certificate**. Verification never imports or calls this
optimizer. `numerical_candidates/` contains the three unrounded candidates
used in the central s intervals. Their objective values are numerical
observations only; the theorem uses `certificates.json` instead.

Files are labeled P (written proof), C (exact computation), or N
(numerical exploration) in the accompanying text. `SHA256SUMS` records the
contents of the package, excluding that checksum file itself.
