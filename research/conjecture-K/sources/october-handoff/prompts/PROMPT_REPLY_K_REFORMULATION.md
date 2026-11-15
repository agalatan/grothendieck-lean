<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_REPLY_K_REFORMULATION.md (file dated 2026-10-22). Only this line was added. -->
# Reply to the real-part reformulation (22 Oct)

Thank you. Your §1 is correct and we have recorded it with proof (circular symmetry of L ± G, |a+b|+|a−b| = 2max(|a|,|b|)); we
reproduced the identity to 1.4e-6 by quadrature, and your local ratio 0.852 for i z₁ Y matches our independent sector-Hessian table
(imaginary Y-sector: second variation −0.395 against 2/ε = 2.644). Your SDP figures (≥ 2.19e-4 loss for Λ, 8.8e-5 with −‖P₁₀k‖² kept)
agree with our audit of the best certificate (78% of its loss is in the row/gate structure, 22% in the law relaxation), so we work on
the response functional N = t² + p‖F‖² − ‖P₁₀k‖² − ε‖P₂₁h‖², F = εP₂₁k, not on raw Λ.

**One correction.** The convex order |q|² ≥_cx ‖q‖²·Exp(1) on H₂,₁ (your §5, first case) is false. Counterexamples we have certified:
  q_θ = z₀[cos θ (|z₀|²−2)/√2 + i sin θ (|z₁|²−1)], θ ≈ 0.47: the density of |q|²/‖q‖² at 0 is 0.85 < 1, and the stop-loss function
  M(a) = E(|q|²/σ² − a)₊ − e^{−a} is −5.9e-4 at a = 0.15 (negative for a < 0.22; the relative phase i between the diagonal Wick and the
  off-diagonal part is essential);
  H = z[(|z|²−2) + i(|w|²−1)]/√3 has E e^{−30|H|²} < 1/31, while convex order would force ≥ E e^{−30 Exp(1)} = 1/31.
So Φ₀ concave (true; we have a proof via complete monotonicity of the visible density) plus convex order cannot settle the z₁-independent
case; that case needs the true constraints on the law of |q|²: E|q|⁴ ≥ 2σ⁴, the sixth-moment bound E|q|⁶ ≤ 9m − 12 + C₆(m−2)^{3/2}
(m = E|q|⁴/σ⁴, C₆ = 40.45313 for circular cubics), the first-moment cap E|q| ≤ 0.9736σ, and the Stein cuts E G(|q|²) ≥ 0 obtained by
completing squares against the spectral budgets (E X² ≤ (2/3)E[XU], E r² ≤ (2/3)E[rU], 2E[XU] + E[rU] = EU² − 2 for U = |q|²/σ² and its
chaos components X (second chaos), r (sixth-order part)) and the covariance order. These are proved for every circular (2,1)-cubic.

**What would help most now.**
1. Your interval-arithmetic LP for the z₁-independent case, but at ε = 1891/2500 and with the Stein-cut family above as additional
   constraints (we can supply the exact cut statements and a reference checker); report the certified bound on sup_q Λ(q) − S.
2. The single-function form. For fixed t the maximiser is explicit; the adversary wants a three-valued t with large cubic energy
   ‖P₂₁t‖² and small |Re L|-weighted mass. Is there a dimension-free inequality ‖P₂₁t‖² ≤ (4/(π²ε))(s₀ + πE|t||Re L|) that is exact for
   t = sign(Re G)1{|Re G| > |Re L|}, G Gaussian? Hypercontractivity bounds ‖P₂₁t‖² by a power of the mass but is not sharp; a proof must
   use the geometry of the set {|Re G| > |Re L|} near the hyperplane Re z₁ = 0. Any partial result (e.g. for t depending on (z₁, one
   remote Gaussian direction) only, or an upper bound within 1e-4 of s₀) is useful.
3. The coupled (|z₁|²−1, z₁²) block: please send the exact second-variation matrix you computed, so that it can be checked against our
   diagonal entries (A-sector −0.931, B-sector −1.867 at unit norm).
Label proofs [P], exact/interval checks [C], floats [F]; no numerical search counts as proof.

**Addendum (after your second message).** Please deliver cubic-chaos-local-stability.zip (the sandbox link is not reachable from here);
we will replay the rational and interval verifiers and record (1)-(7) as [P,C]. Your A--B coupling through Re E[uv] corrected an omission in
our own second-variation table (we had treated the sectors as uncoupled in the diffuse limit); your diagonal entries should match ours:
A-sector −0.931, B-sector −1.867, Y circular −1.401, Y real/imaginary −2.41/−0.395, visible −2.34 (unit norm, second derivative of Λ,
ε = 1891/2500). The improper Gaussian-mixture theorem is accepted as written. Next useful step on your side: (i) the finite-amplitude
version of (1) along the slice ψ_ρ = ρX(|X|²−2) + √(1−ρ²)X²Ȳ with a coupled A-sector α(T−1)X on the same X (we measure the remote-only
payoff of the slice at S − 1.7e-3 ... S − 2.0e-3, far from S, so there is room for a non-perturbative argument there); (ii) item 2 of the
list above (the single-function form).

**Addendum 2 (after the improved independent-sector certificate).** Thank you; the Bernstein/two-point theorem is a clean structural fact and
we have recorded it. Two remarks. (i) For circular (2,1)-cubics the sixth-moment inequality holds with C6 = 40.45313 (sharp up to 0.4%:
the Wick monomial attains 40.295), and all of its tensor facts are now proved in Lean; it is stronger than 1977/40. (ii) But plugging 40.45313
into your two-point formula only lowers the relaxation optimum from S + 1.005e-5 to S + 9.76e-6 (float), and the worst case moves to m -> 2,
where the two-point law with the Gaussian's first three moments beats Exp(1) by ~1e-5 regardless of C6. So the next gain must come from
constraints that see more of the chaos law near m = 2. Candidates already proved for circular cubics: the separate spectral budgets
E X^2 <= (2/3)E[XU], E r^2 <= (2/3)E[rU], 2E[XU] + E[rU] = EU^2 - 2, the covariance order, the contraction-Gram budget, and the radial
integration-by-parts identity (all as in our Stein cuts). Can your structural method (Bernstein representation + Hermite interpolation) be
extended to these joint constraints on (U, X, r), e.g. by showing the extremal laws are supported on few points in u for each fixed test?
That would turn the Stein-cut LP into a closed form.
