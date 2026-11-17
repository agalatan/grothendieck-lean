<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-weak2-2026-11-17/REVIEW3.md (17 November 2026); claude-b9ee: the review of the third Gemini answer to the weak-bound prompt, an answer that is not kept. Its checks are in code/third-chaos-2026-11-17/gemini-weak2/checks/. Only this line was added. -->
# Review of the third Gemini answer to the weak-bound prompt (claude-b9ee, 17 Nov 2026, about 07:00)

Same Gemini (no code environment, first-round prompt). Not kept verbatim. Printed outputs are again not the outputs
of its script.

| claim | verdict |
|---|---|
| Thm A: N = 9 circle kernel gives (E\|F\|)^2 <= 0.762548, E\|F\| <= 0.87324 | False. Its own LP (odd m <= 39, w in [-10,10]) gives 0.808538, the same as with all m (checks/g_n9.py): worse than N = 7 (0.793278). |
| Thm A': circle kernels tend to 4 sqrt5/(3 pi) = 0.949 | Contradicts its own Thm A and the 7-point bound; no argument. |
| Thm B: sharp bound for sum_i X_i Q_i(Y) + sum_k a_k h3(Z_k) + c W | Statement true and already known: condition on the scale of the conditionally Gaussian part, apply the diagonal-sum bound with a Gaussian, then Jensen (ledger 3.21 (e2) + (e6) closure). Its proof is invalid: the one-at-a-time unimodal replacement needs a unimodal background, and the unreplaced h3 terms are not unimodal. |
| C(1): (T) for kappa_4 <= 0.0760 | False: reverts to E(F^2 - 1)^2 = kappa_4 (true: kappa_4 + 2), the error its previous answer had caught, and the integral is off by 2. Correct method gives 0.0268. |
| C(2): (T) for kappa_4 >= 49 (summary says 41.8) | No proof; the text breaks off. |
| C(3): (T) for n <= 14 | False as stated: its plain slicing values are wrong (n = 13: printed 0.82069, true 0.84254). |
| C(4): (T) for a(F) >= 0.818 | Weaker than the certified 0.7931 (rank1-cert-2026-11-17), because its plain values are wrong. |

Possible gem (H, not worked out): in the slicing bound the extremal circle function sin x + (1/3) sin 3x needs a fixed
relative sign of the degree-1 and degree-3 parts, while the radial factor e_1(R) changes sign at R^2 = n + 2 and
e_3(R) does not. For zonal-type F (like h3(<u,X>)) the alignment holds on one side of R^2 = n + 2 and fails on the
other, where the constant drops to 16/(3 pi sqrt5) = 0.7592 for sin x - (1/3) sin 3x. A uniform version would need the
joint law of the frequency-1 and frequency-3 parts over circles for every Y_3; finite-dimensional gain only.
