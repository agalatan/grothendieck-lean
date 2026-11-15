<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_GPT_MULTIGRADE_FIBRE.md (file dated 2026-10-22). Only this line was added. -->
# Target: a certificate architecture for degree-5 complex Hermite games that keeps the cross-degree coupling (multi-grade fibre)

## Why this target
The cubic witness P10 − εP21 cannot certify more than ≈ 1.402258 (/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch4-ceilings.tex),
and the proved chirp obstructions cap degree ≤ 5 games at 1.4036705 and degree ≤ 7 at 1.4044895. The best degree-5 game T = P10 − ε1 P21 + η P32,
(ε1, η) = (0.8494, 0.283), has model norm 0.712427, i.e. up to 1.40365 — the only route to a lower bound clearly above 1.402.
Two certificate architectures FAIL on it by the same amount (≥ 2·10⁻²):
- the gated-row method (/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch5-negatives.tex, negative "degree-5 witness with
  any HJM-type reduction": sound rows ≥ 0.7322);
- the paired-support multi-row architecture with independent-Gaussian tests (same file, negative "degree-5 witness with a paired-support architecture": ≥ 0.7327;
  code /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/attack-20261022/step15b_support_full.py).
Mechanism (IDE): in the model the k-side cubic gain ε1‖P21k‖² is paid by the degree-5 penalty η‖P32k‖², because a bounded response with a large cubic part must
carry a degree-5 part. Through the visible fibre, k ≈ a(Z)·W + …: P21k sees the Z-average of the remote coefficient profile a, P32k its (|Z|²−1) profile, and
boundedness forces a(Z) to vary (a ∝ 1/|L(Z)| for phase responses). Certificates that treat chaos grades as independent lose exactly this.
Also exact [P]: the paired support ½(E|A+B| + E|A−B|) is the pointwise support function of the complex response set {(h,k) = (e^{iα}cos θ, i e^{iα}sin θ)},
so support tests are exact pointwise; the loss is in the choice of tests/residuals.

## The task
Design and test (first in the Gaussian-ideal model, then with a law relaxation) a row/support architecture for T = P10 − ε1P21 + ηP32 whose fibre contains
the visible coordinate Z AND one remote direction per grade, W3 ∈ H21(remote), W5 ∈ H32(remote) (and their conjugate/shifted sectors as needed), with the
response a single bounded function of (Z, W3, W5, …) inside the fibre, so that the cross-degree coupling is computed exactly in the fibre. Concretely:
1. [P] Write the exact reduction: for unimodular f, g, Re⟨f,Tg⟩ = t² − ε1‖Qh‖² + η‖Rh‖² − ‖Pk‖² + ε1‖Qk‖² − η‖Rk‖²; split each remote projection into the
   chosen grade directions plus orthogonal remainders; state which remainders are dropped (sign) and which are bounded by a law relaxation.
2. [F] Gaussian ideal: with W3, W5 diffuse independent Gaussians, compute the row value (the sup over bounded fibre functions) and compare with the model
   norm 0.712427. Report the loss; the architecture is viable only if the loss is ≲ 2·10⁻⁴.
3. If viable: state the law relaxation needed for the pair of residuals (U3, U5) = (|q3|², |q5|²) (joint moments, cross moments, Stein/spectral cuts for each grade,
   cross-grade identities) and estimate its loss, in the style of the cubic pipeline (moments + Stein cuts + rows).
4. State precisely the multi-grade domination statement (generalised Conjecture K) that the architecture assumes, and test it numerically against coupled adversaries
   (junta + A-sector-type couplings across grades).
Label [P]/[C]/[F]; no endpoint claim. Deliver a write-up and scripts.
