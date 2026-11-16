<!-- Verbatim from the delivery conjecture_k_content_law_codex_a786.zip (LEDGER_PATCH.md), 16 November 2026; codex-a786, a GPT session of the user, relayed by the user. Only this line was added. -->
# Proposed ledger changes

Author: codex-a786. Base commit b008629992e5dc6ff5672eb16c3ea72d59dcbccb.
**Proposal only; no repository files or issues were changed.**
IDs below are provisional successor numbers to 6.3.25 at the pinned snapshot.

| Proposed row | Statement | Scope | Status / proof |
|---|---|---|---|
| 6.3.26 | Conditional-phase criterion: for q=√u XP with P=Σλ_j(\|Y_j\|²−1), Σλ_j²=1, the content-law inequality holds with θ=2[24E(b²/R)−8E(pb/R)+E(p²/R)+16(Σλ_j³)²]/[3(4+12Σλ_j⁴)], R=P², p=E[P given R], b=E[PB given R], B=Σλ_j²\|Y_j\|² | Every finite dimension and admissible radial profile; no general small bound for θ is claimed | **P**, author only; PROOFS §§1–3 |
| 6.3.27 | For q=√u XP_m, P_m=m^{-1/2}Σ(\|Y_j\|²−1), ‖c[h]‖²≤[77/(9(m+3))]δΩ̂[h], every u>0. χ=4+12/m. The conditional sign bias is ≤2/(3m) by exact Gamma/reflection Hellinger affinity | Both degree-5 A/B profiles on every requested row, and all profiles satisfying (1). m≥4 gives θ<1.3, m≥21 gives θ<0.37 | **P**; constants and instances **C**, author only; PROOFS §§3–4,6–7; verify.mjs |
| 6.3.28 | The previous content-law bound extends to q=√u(√ρ XP_m+√(1−ρ)Σ conjugate(Z_j)F_j(U)), E‖W‖²=1, with θ=253/[18(m+3)]+2/(9m), or 55/16 for m=1 and 11009947/8553600 for m=8 | Arbitrary finite dimension, ρ∈[0,1], and holomorphic quadratic coefficient tensors F_j. m≥8 gives θ<1.3; m≥36 gives θ<0.37. Includes finite diffuse approximations | **P**; moment/regression checks **C**, author only; PROOFS §§5–7 |

Suggested annotation to **higher-degree STATUS 4.19**, or a new **4.20**:

> The content-law inequality with the same-law functional Ω̂ now has a written
> proof on the structured classes of K ledger 6.3.27–6.3.28, with constants below
> the quoted room targets at the listed ranks. The proof conditions on the
> sign/phase of a Hermitian factor and avoids the loss in 6.3.25. It does not
> cover arbitrary remote cubics. The all-cubic band and full row certificates
> remain open.

Leave **6.3.18**, **6.3.25**'s general majorant, **7.4**, **7.5.5**, and the
universal conclusion in higher-degree **4.19** open. No false statement or
dead-end row needs changing.

Dependencies: 6.3.23 (exact identity), 11.31a (symmetry, also proved directly);
no use of 6.3.25's norm bound. The direct moment formulas do not require 6.3.21.

