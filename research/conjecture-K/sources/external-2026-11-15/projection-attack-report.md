<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/external-2026-11-15/projection-attack-report.md (file dated 2026-11-15). Only this line was added. -->
# Report "retaining the first-chaos penalty" (external assistant thread, received from the user on 15 November 2026)

Transcribed from the user's paste. The package it names is in `projection-attack-package/` (proofs.tex, verify.py,
results.txt, README.txt), copied unchanged from `grothendieck_projection_attack.zip`.

**I have not obtained a certified crossing of 1.402.** I did prove a stronger reduction that retains information
discarded by Conjecture K, with a quantitatively significant improvement in the local estimates.

Let P₁ = P_{1,0} and p = 1/ε. Replace Λ by

    Λ̂(G) = min_{u ∈ H_{1,0}} { ‖u‖² + E|L + G − u| + E|L − G + u| } − p‖G‖².

The original row bound remains valid with Λ̂, and Λ̂(G) ≤ Λ(G). This follows by retaining −‖P₁k‖² and using
−‖P₁k‖² = min_{u ∈ H_{1,0}} (‖u‖² − 2 Re⟨u,k⟩). Thus we can target a weaker statement than full Gaussian domination.

**One improvement is global, at every amplitude.** For any remote cubic q, define m(q) = E_Z phase(L + q) and
j₀ = (1/2) E|L|⁻¹. Then

    Λ̂(q) ≤ Λ(q) − ‖P₁ m(q)‖² / (1 + j₀).

At the peak row, 1/(1 + j₀) = 0.411188641744769… The proof uses the Gaussian-mixture representation of L: the gradient
of M(w) = E|L + w| is globally j₀-Lipschitz. Consequently

    2 E M(q − u) + ‖u‖² ≤ 2 E M(q) − 2 Re⟨u, m(q)⟩ + (1 + j₀)‖u‖²,

and minimizing the quadratic proves the claim.

**The local A+B improvement is substantial.** For H = (|Z|² − 1) r_A + Z² conj(r_B)/√2, with arbitrary correlated remote
linear forms,

    Λ̂(sH) = 2E|L| − s² E[ (r_A, r_B)* M (r_A, r_B) ] + o(s²),
    M = [[0.60683885483874, 0.26291259657064], [0.26291259657064, 1.01343807031137]].

I certified these constants with Arb intervals. The smallest eigenvalue exceeds 0.477. In particular, retaining the
projection increases the local A-cost from 0.3200545… to 0.6068388….

That gives additional room for a proof. **But this matrix is local at G = 0; I have not proved its required uniform
finite-amplitude replacement at general remote bases.** Inserting it into the global certificate would repeat precisely
the gap we identified.

The package contains the proofs, executable interval checks, and a certified counterexample to an auxiliary
weighted-positivity shortcut I investigated. That counterexample does not refute K.
