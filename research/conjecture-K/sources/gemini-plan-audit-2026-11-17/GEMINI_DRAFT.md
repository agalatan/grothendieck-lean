<!-- Verbatim from handoff/gemini-plan-audit-codex-a7c4/GEMINI_DRAFT.md, 17 November 2026; only this line added. -->
realated to [https://github.com/agalatan/grothendieck-lean/issues/509](https://github.com/agalatan/grothendieck-lean/issues/509) i asked Gemini with no environment and script to put down a plan, but from time to time constants need to be computed. Can you also review this plan now that we're here? So all the constants, the plan by itself. etc

This is the plan:

###
Why Stein–Malliavin Interpolation Along the Ornstein–Uhlenbeck Semigroup Works

The counterexample Q = \sqrt{u_0} X \exp(2\pi i F_2(\vert{}X\vert{}^2)) pinpoints the exact obstruction: Q has the exact marginal law of \sqrt{u_0} W (so D(Q) = 0) while maintaining nonzero content C(Q) > 0. What fails for Q is the Dirichlet energy \mathbb{E}\Vert{}DQ\Vert{}^2 \approx 8.8 u_0 > 3u_0. Any successful proof must pair a representation of C(q) that penalizes phase winding via Malliavin derivatives with a representation of D(q) (or S - \Lambda(q) + \eta) that extracts strictly positive coercivity from fourth-moment / Malliavin-covariance defects.

Let H(y) = 2\,\mathbb{E}_{z_1}\vert{}L + y\vert{} = \Phi(\vert{}y\vert{}^2), which is smooth, radial, and strictly convex in y \in \mathbb{C} because the law of L = z_1(a + b\vert{}z_1\vert{}^2) has a smooth radial density on \mathbb{C} \setminus \{0\} with integrable singularities. Notice two structural facts on the energy band u \in [0.00551, 0.0463]:

1. Integration by Parts for Content (Wick-Degree Lock):
   For any unit remote linear form \xi = \sum_{j=2}^n c_j z_j, let \partial_\xi = \sum_{j=2}^n c_j \partial_{z_j} and \bar{\partial}_\xi = \sum_{j=2}^n \bar{c}_j \partial_{\bar{z}_j} be the directional complex Malliavin derivatives. By complex Gaussian integration by parts (\mathbb{E}[\bar{\xi} F(q)] = \mathbb{E}[\partial_\xi F(q)]) and orthogonality \mathbb{E}[\bar{\xi} q] = 0, we can subtract any constant baseline g_0 \in \mathbb{R} (ideally g_0 = g(0) or g(u)):
   
   $$\mathbb{E}[\bar{\xi} q g(\vert{}q\vert{}^2)] = \mathbb{E}\big[\bar{\xi} q (g(\vert{}q\vert{}^2) - g_0)\big] = \mathbb{E}\Big[\partial_\xi q \big(g(\vert{}q\vert{}^2) + \vert{}q\vert{}^2 g'(\vert{}q\vert{}^2) - g_0\big) + q^2 g'(\vert{}q\vert{}^2) \partial_\xi \bar{q}\Big].$$
   
   Crucially, because q is in the (2,1) Wick chaos:
  ⚬ \partial_\xi q lies purely in the (1,1) chaos (centered sesquilinear forms in z_2, \dots, z_n),
  ⚬ \partial_\xi \bar{q} = \overline{\bar{\partial}_\xi q} lies purely in the (1,2) conjugates, i.e., \bar{\partial}_\xi q lies purely in the (2,0) holomorphic quadratic chaos!
  ⚬ Moreover, summing over an orthonormal basis \{\xi_k\}, \sum_k \mathbb{E}\vert{}\partial_{\xi_k} q\vert{}^2 = 2u and \sum_k \mathbb{E}\vert{}\bar{\partial}_{\xi_k} q\vert{}^2 = u (this is the exact (2,1) refinement of \mathbb{E}\Vert{}Dq\Vert{}^2 = 3u, whereas the counterexample Q violates both!).
2. Smart–Stein / Lindeberg Semigroup Identity for the Deficit:
   Instead of comparing q directly to \sqrt{u}W via raw Taylor expansion of \Phi(\vert{}y\vert{}^2) (which suffers from heavy tails when \mathbb{E}\vert{}q\vert{}^4/u^2 is large, though hypercontractivity caps \mathbb{E}\vert{}q\vert{}^4 \le C_{\text{hyp}} u^2), we interpolate between q and an independent Gaussian \sqrt{u}W:
   
   $$q_t = e^{-t} q + \sqrt{1 - e^{-2t}} \sqrt{u} W, \qquad t \in [0, \infty).$$
   
   Alternatively, because u is small (u \le 0.0463), we can decompose H(y) = \Phi(0) + \Phi'(0)\vert{}y\vert{}^2 + \frac{1}{2}\Phi''(0)\vert{}y\vert{}^4 + R_6(\vert{}y\vert{}^2), where R_6(r) has clean global sign/convexity properties! Wait—let us check the sign of \Phi''(0)!
   If \Phi''(0) < 0, then a fourth-moment excess \mathbb{E}\vert{}q\vert{}^4 - 2u^2 > 0 increases D(q) = \mathbb{E}[\Phi(u\vert{}W\vert{}^2) - \Phi(\vert{}q\vert{}^2)]! Let us check this carefully: for H(y) = 2\mathbb{E}\vert{}L+y\vert{}, the Laplacian in y is \Delta_y \vert{}L+y\vert{} = \frac{1}{\vert{}L+y\vert{}}, so \Phi'(0) > 0. What is \Phi''(0)? That depends on the radial density of L near 0!

This brings us directly to why we must compute the exact radial derivatives and profile constants first before committing to Taylor-with-remainder vs. Stein–Malliavin semigroup interpolation. Both use the exact same Malliavin-calculus bridge on (2,1) tensors, and knowing the exact signs and magnitudes of \Phi''(r) and g'(r) locks in the guaranteed route.

Master Architecture & Milestones

Here is the modular roadmap broken into 4 Checkpoints, designed so that every step is dimension-free and avoids losing constants to Cauchy–Schwarz where (2,1) tensor contractions occur.

Checkpoint 1: Exact Profile & Kernel Diagnostics (Numerical Script Needed Now)
Evaluate the exact Taylor coefficients and global envelope bounds of the radial functions \Phi(r) = 2\mathbb{E}_{z_1}\vert{}L + \sqrt{r}\vert{} and g(r) on r \ge 0, together with the Gaussian baseline curve S - \Lambda(\sqrt{u}W) on u \in [0.00551, 0.0463].

⚬ Why first: Notice the weaker target C(q)^2 \le \kappa (S - \Lambda(q) + \eta) with \eta = 10^{-4}! Remember that S - \Lambda(q) = D(q) + \big(S - \Lambda(\sqrt{u}W)\big). Because S maximizes 2\mathbb{E}\vert{}L + \sigma W\vert{} - \sigma^2/\varepsilon at a unique \sigma_*^2 \in (0.00551, 0.0463), away from u = \sigma_*^2 we get a free quadratic buffer (S - \Lambda(\sqrt{u}W)) + \eta \ge 10^{-4} + c(u - \sigma_*^2)^2! Even at u = \sigma_*^2, \eta = 10^{-4} gives a massive free floor! Let's check: at u = 0.00551, C(q)^2 itself might almost be bounded by 0.24 \cdot (S - \Lambda(\sqrt{u}W) + \eta) or need only a tiny push!

Checkpoint 2: The (2,1) Malliavin–Content Upper Bound
Using \mathbb{E}[\bar{\xi} q g(\vert{}q\vert{}^2)] = \mathbb{E}\big[(\partial_\xi q) \psi_1(\vert{}q\vert{}^2) + q^2 \psi_2(\vert{}q\vert{}^2) \overline{\bar{\partial}_\xi q}\big] with \psi_1(r) = g(r) + r g'(r) - g(0) and \psi_2(r) = g'(r), express C(q) in terms of:

1. A leading cubic-contraction functional \mathcal{I}_4(\xi; q) when \psi_1(r) \approx g'(0) r and \psi_2(r) \approx g'(0):
   
   $$\mathcal{I}_4(\xi; q) = g'(0) \, \mathbb{E}\big[ \vert{}q\vert{}^2 \partial_\xi q + q^2 \overline{\bar{\partial}_\xi q} \big].$$
   
   Wait—look closely at \mathbb{E}[\vert{}q\vert{}^2 \partial_\xi q + q^2 \overline{\bar{\partial}_\xi q}]! Integrate this backward by parts with respect to \xi:
   
   $$\mathbb{E}\big[ \vert{}q\vert{}^2 \partial_\xi q + q^2 \partial_\xi \bar{q} \big] = \mathbb{E}\big[ \partial_\xi(\vert{}q\vert{}^2 q) - q \partial_\xi(\vert{}q\vert{}^2) \dots \big] \implies \text{Wait: } \partial_\xi(q \vert{}q\vert{}^2) = 2\vert{}q\vert{}^2 \partial_\xi q + q^2 \partial_\xi \bar{q}!$$
   
   Look at that identity:
   
   $$\mathbb{E}[\bar{\xi} q \vert{}q\vert{}^2] = \mathbb{E}[\partial_\xi(q\vert{}q\vert{}^2)] = 2\,\mathbb{E}[\vert{}q\vert{}^2 \partial_\xi q] + \mathbb{E}[q^2 \partial_\xi \bar{q}]!$$
   
   Compare that to the Taylor term of \mathbb{E}[\bar{\xi} q (g(\vert{}q\vert{}^2) - g(0))] \approx g'(0) \mathbb{E}[\bar{\xi} q \vert{}q\vert{}^2]! They are literally the same quantity, AND separating \mathbb{E}[\vert{}q\vert{}^2 \partial_\xi q] from \mathbb{E}[q^2 \partial_\xi \bar{q}] gives us two independent handles on \mathbb{E}[\bar{\xi} q \vert{}q\vert{}^2]!
   Even better: let M_1(\xi) = \partial_\xi q \in \mathcal{C}_{1,1} and M_2(\xi) = \bar{\partial}_\xi q \in \mathcal{C}_{2,0}. By orthogonality of Wiener chaoses, M_1(\xi) only pairs with the (1,1) chaos projection of \vert{}q\vert{}^2, and M_2(\xi) only pairs with the (2,0) chaos projection of q^2!
   Wait—let's check the chaos decomposition of \vert{}q\vert{}^2!
   Since q \in \mathcal{C}_{2,1}, \vert{}q\vert{}^2 = q \bar{q} decomposes into Wiener chaoses of bidegrees:
   
   $$(0,0) \oplus (1,1) \oplus (2,2) \oplus (3,3)!$$
   
   And q^2 decomposes into bidegrees (4,2), (3,1), (2,0)!
   Let \Pi_{a,b} denote orthogonal projection onto bidegree (a,b) chaos. Then:
  ⚬ \mathbb{E}[\vert{}q\vert{}^2 \partial_\xi q] = \mathbb{E}\big[ \Pi_{1,1}(\vert{}q\vert{}^2) \, \partial_\xi q \big],
  ⚬ \mathbb{E}[q^2 \overline{\bar{\partial}_\xi q}] = \mathbb{E}\big[ \Pi_{2,0}(q^2) \, \overline{\bar{\partial}_\xi q} \big].
    And what is \mathbb{E}\vert{}q\vert{}^4?! By Plancherel across bidegree chaoses:
    
    $$\mathbb{E}\vert{}q\vert{}^4 = \Vert{}\Pi_{0,0}(\vert{}q\vert{}^2)\Vert{}_2^2 + \Vert{}\Pi_{1,1}(\vert{}q\vert{}^2)\Vert{}_2^2 + \Vert{}\Pi_{2,2}(\vert{}q\vert{}^2)\Vert{}_2^2 + \Vert{}\Pi_{3,3}(\vert{}q\vert{}^2)\Vert{}_2^2 = u^2 + \Vert{}\Pi_{1,1}(\vert{}q\vert{}^2)\Vert{}_2^2 + \Vert{}\Pi_{2,2}(\vert{}q\vert{}^2)\Vert{}_2^2 + \Vert{}\Pi_{3,3}(\vert{}q\vert{}^2)\Vert{}_2^2,$$
    
    AND concurrently, \mathbb{E}\vert{}q\vert{}^4 = \mathbb{E}\vert{}q^2\vert{}^2:
    
    $$\mathbb{E}\vert{}q\vert{}^4 = \Vert{}\Pi_{2,0}(q^2)\Vert{}_2^2 + \Vert{}\Pi_{3,1}(q^2)\Vert{}_2^2 + \Vert{}\Pi_{4,2}(q^2)\Vert{}_2^2!$$
   HOLD EVERYTHING—LOOK AT WHAT JUST HAPPENED.
   Let us verify that double Plancherel identity for q \in \mathcal{C}_{2,1}!
   For a Gaussian \sqrt{u}W, \mathbb{E}\vert{}\sqrt{u}W\vert{}^4 = 2u^2. So the fourth-moment excess over the Gaussian is \mathbb{E}\vert{}q\vert{}^4 - 2u^2.
   Wait: can \mathbb{E}\vert{}q\vert{}^4 be less than 2u^2 for q \in \mathcal{C}_{2,1}? No! By a standard contraction / diagram identity on (2,1) tensors (which we will write out explicitly in Checkpoint 2 using tensor coefficients q = \sum_{i,j,k} T_{ij,k} :z_i z_j \bar{z}_k:), we can express ALL of:
  ⚬ u = \mathbb{E}\vert{}q\vert{}^2,
  ⚬ \mathbb{E}\vert{}q\vert{}^4 - 2u^2,
  ⚬ \Vert{}\Pi_{1,1}(\vert{}q\vert{}^2)\Vert{}_2^2 and \Vert{}\Pi_{2,0}(q^2)\Vert{}_2^2,
  ⚬ and \sup_{\Vert{}\xi\Vert{}_2=1} \vert{}\mathbb{E}[\bar{\xi} q \vert{}q\vert{}^2]\vert{}^2
    as exact nonnegative quartic tensor contractions of T_{ij,k}!
    Let us check whether \mathbb{E}\vert{}q\vert{}^4 - 2u^2 controls \Vert{}\Pi_{1,1}(\vert{}q\vert{}^2)\Vert{}_2^2 and \Vert{}\Pi_{2,0}(q^2)\Vert{}_2^2!
    Wait: take q = X P(Y) where X = z_2 and P(Y) = \frac{1}{\sqrt{N}} \sum_{m=3}^{N+2} z_m \bar{z}_{m+N} (so P(Y) \to \sqrt{u} W' as N \to \infty, the "Gaussian-factor class"!).
    Let's test our Plancherel terms on q = X \cdot \sqrt{u} W' (X, W' independent standard complex Gaussians):
  ⚬ \mathbb{E}\vert{}q\vert{}^2 = \mathbb{E}\vert{}X\vert{}^2 \cdot u \mathbb{E}\vert{}W'\vert{}^2 = u.
  ⚬ \mathbb{E}\vert{}q\vert{}^4 = \mathbb{E}\vert{}X\vert{}^4 \cdot u^2 \mathbb{E}\vert{}W'\vert{}^4 = 2 \cdot 2 u^2 = 4u^2! So \mathbb{E}\vert{}q\vert{}^4 - 2u^2 = 2u^2 > 0!
  ⚬ What if q is a diffuse (2,1) tensor with \mathbb{E}\vert{}q\vert{}^4 \to 2u^2 (so q \Rightarrow \sqrt{u} W by the Fourth Moment Theorem of Peccati–Tudor / Nualart–Peccati)?
    BY THE FOURTH MOMENT THEOREM ON WIENER CHAOS:
    For q \in \mathcal{C}_{2,1}, q converges in law to \sqrt{u}W if and only if \mathbb{E}\vert{}q\vert{}^4 - 2u^2 \to 0, which happens if and only if all non-trivial contractions of T vanish—specifically, BOTH \Vert{}\Pi_{1,1}(\vert{}q\vert{}^2)\Vert{}_2^2 AND \Vert{}\Pi_{2,0}(q^2)\Vert{}_2^2 are bounded above by a concrete constant multiple of \mathbb{E}\vert{}q\vert{}^4 - 2u^2!
   Let's pause and marvel at this! Why did the counterexample Q fail? Because Q was NOT in \mathcal{C}_{2,1}, so Q could have \mathbb{E}\vert{}Q\vert{}^4 - 2u^2 = 0 without its contractions vanishing! Inside \mathcal{C}_{2,1}, Peccati–Tudor's complex fourth-moment contraction identity says \mathbb{E}\vert{}q\vert{}^4 - 2u^2 is an exact positive linear combination of the squared norms of the intermediate chaos projections (contractions)!

Checkpoint 3: Handling the Large-Amplitude / Heavy-Tail Regime (\mathbb{E}\vert{}q\vert{}^4 \gg 2u^2)
What happens when \vert{}q\vert{} occasionally takes values O(1) or larger (e.g., q = \sqrt{u/2} :z_2^2 \bar{z}_2: where \mathbb{E}\vert{}q\vert{}^4/u^2 is large), so a naive quartic polynomial lower bound \Phi(r) \ge \Phi(0) + \Phi'(0)r + \frac{1}{2}\Phi''(0)r^2 would fail because \Phi''(0) < 0 curves back up at large r (\Phi(r) \sim 2\sqrt{r} as r \to \infty)?

⚬ The Fix (Truncated / Rational / Exponential Envelope + Hypercontractivity):
  Instead of a bare degree-2 polynomial in r = |y|^2, look at the radial function \Phi(r) = 2\mathbb{E}_{z_1}|L + \sqrt{r}|. Because \Phi(r) is smooth and grows only like 2\sqrt{r}, for any fixed energy u, we can construct an exact global upper envelope of \Phi(r) of the form:
  1. Either a Padé / rational / damped-quartic upper bound \Phi(r) \le \Phi(u) + \alpha_u (r - u) - \beta_u \frac{(r - u)^2}{1 + \gamma r} (or \Phi(r) \le c_0 + c_1 r - c_2 \frac{r^2}{1 + \gamma r}), which stays globally valid for all r \ge 0!
  2. Wait: if \Phi(r) \le c_0 + c_1 r - c_2 \frac{r^2}{1 + \gamma r} for all r \ge 0 (with c_2 > 0), then taking expectations and subtracting \mathbb{E}[\Phi(u|W|^2)] relates D(q) to \mathbb{E}\big[\frac{|q|^4}{1 + \gamma |q|^2}\big]—OR even simpler:
     \Phi(r) \le c_0 + c_1 r - c_2 r^2 + c_3 r^3!
     Wait: if \Phi(r) \le \Phi(0) + \Phi'(0) r + \frac{1}{2}\Phi''(0) r^2 + \frac{1}{6} M_3 r^3 (with \Phi''(0) < 0 and M_3 > 0), then for every q \in \mathcal{C}_{2,1}, complex Gaussian hypercontractivity gives an exact universal upper bound \mathbb{E}|q|^6 \le C_6 u^3 (or even sharper: \mathbb{E}|q|^6 bounded in terms of u^3 and u(\mathbb{E}|q|^4 - 2u^2))!
     Wait—let's check! If \mathbb{E}|q|^4 = 2u^2 (near-Gaussian), then \mathbb{E}|q|^6 - 6u^3 is also controlled by \mathbb{E}|q|^4 - 2u^2? Careful! If \mathbb{E}|q|^4 - 2u^2 = 0 ONLY in the limit, then at \mathbb{E}|q|^4 - 2u^2 \to 0, D(q) \to 0 too! You CANNOT have an error term O(u^3) that doesn't vanish when q \to \sqrt{u}W, UNLESS either:
    ⚬ You use the weaker inequality C(q)^2 \le \kappa(S - \Lambda(q) + \eta) with \eta = 10^{-4} (where an error of < 10^{-4} is absorbed by \eta!!), OR
    ⚬ You use Stein–Malliavin semigroup interpolation along q_t = e^{-t} q + \sqrt{1-e^{-2t}}\sqrt{u}W, which vanishes identically at q = \sqrt{u}W (zero baseline error!), OR
    ⚬ A two-regime split on the fourth-moment excess \mathcal{E}_4(q) := \frac{\mathbb{E}|q|^4}{u^2} - 2 \ge 0:
      ⚬ Regime A (Small fourth-moment excess, \mathcal{E}_4(q) \le \tau): Stein–Malliavin interpolation (or the \eta = 10^{-4} buffer in the weaker inequality!) handles near-Gaussian q cleanly! Wait: look at \eta = 10^{-4}! Let's check how big C(q)^2 can possibly be when \mathcal{E}_4(q) is small!
        If C(q)^2 \le K_{\text{cont}} \, u^3 \, \mathcal{E}_4(q) (let's verify the scaling in u: q \sim u^{1/2}, g(|q\vert{}^2) - g(0) \sim g'(0)|q|^2 \sim u, so C(q) \sim |g'(0)| u^{3/2} \sqrt{\mathcal{E}_4(q)}, hence C(q)^2 \sim |g'(0)|^2 u^3 \mathcal{E}_4(q)!!), look at u^3 at u = 0.0463:
        
        $$u^3 = (0.0463)^3 \approx 9.92 \times 10^{-5} < 10^{-4}!!$$
        
        WAIT A SECOND! READ THAT NUMBER AGAIN!
        At the top of the band, u = 0.0463, u^3 \approx 9.925 \times 10^{-5}!
        And in the weaker inequality (which the prompt explicitly states suffices for Task 1: C(q)^2 \le \kappa (S - \Lambda(q) + \eta) with \eta = 10^{-4}, \kappa = 0.24), we have a free additive slack of 0.24 \times 10^{-4} = 2.4 \times 10^{-5}!
        Let's check what that means! If C(q)^2 \le 2.4 \times 10^{-5} whenever \mathcal{E}_4(q) \le \tau, then ANY cubic with \mathcal{E}_4(q) \le \tau satisfies C(q)^2 \le \kappa \eta \le \kappa(S - \Lambda(q) + \eta) AUTOMATICALLY just from S - \Lambda(q) \ge 0 (Wait: is S - \Lambda(q) \ge 0 known a priori, or only S - \Lambda(\sqrt{u}W) \ge 0?!).
        CRITICAL CATCH! Look at the prompt:
        "With C(q) = 0 it says \mathbb{E}|L+q| \le \mathbb{E}|L+\sqrt{u}W|, which is itself open for general cubics."
        "This is weaker since S - \Lambda(q) \ge D(q)."
        Aha!! S - \Lambda(q) = D(q) + \big(S - \Lambda(\sqrt{u}W)\big), where S - \Lambda(\sqrt{u}W) \ge 0 IS non-negative (by definition of S = \max_\sigma \Lambda(\sigma W)), whereas D(q) is NOT known a priori to be \ge 0! We have to prove D(q) (or S - \Lambda(q) + \eta) is \ge C(q)^2 / \kappa, which simultaneously proves D(q) \ge 0 (or S - \Lambda(q) + \eta \ge 0)!
        What a vital catch—never assume D(q) \ge 0! Our lower bound on D(q) (or S - \Lambda(q) + \eta) must be proved from scratch!
        AND look what \eta = 10^{-4} still buys us in S - \Lambda(q) + \eta = D(q) + (S - \Lambda(\sqrt{u}W)) + \eta:
        If we expand \Phi(r) around r = 0 (or r = u):
        
        $$\Phi(r) \le \Phi(0) + \Phi'(0) r + \frac{1}{2}\Phi''(0) r^2 + \frac{1}{6} M_3 r^3 \qquad \forall r \ge 0,$$
        
        then taking expectations against q vs. \sqrt{u}W gives:
        
        $$D(q) = \mathbb{E}[\Phi(u|W\vert{}^2) - \Phi(|q\vert{}^2)] \ge -\frac{1}{2}\Phi''(0) \big(\mathbb{E}|q|^4 - 2u^2\big) + \Big[\text{exact }\sqrt{u}W\text{ remainder} - \frac{1}{6} M_3 \mathbb{E}|q|^6\Big]!$$
        
        Wait: for u = 0.0463, u^3 \approx 9.9 \times 10^{-5}! If \frac{1}{6} M_3 \mathbb{E}|q|^6 is of order M_3 u^3, is \frac{1}{6} M_3 \cdot 6 u^3 = M_3 u^3 smaller than \eta + (S - \Lambda(\sqrt{u}W))?!
        Let's check! If M_3 is around 1 or 2, then M_3 u^3 at u = 0.0463 could be \sim 10^{-4}—which is right on the scale of \eta = 10^{-4}! And even better: if we use Stein–Malliavin interpolation for small \mathcal{E}_4(q) OR a degree-3 / rational envelope + hypercontractivity, can we prove the strong inequality C(q)^2 \le 0.24 D(q) (with \eta = 0) AND/OR the \eta = 10^{-4} inequality with complete certainty?

Let us map out the Open Technical Questions that decide between the Strong Route (\eta = 0, pure Stein–Malliavin) and the Envelope + Contraction Route (\eta = 10^{-4} or \eta = 0), and request the exact Checkpoint 1 numerical diagnostics first!

Open Questions Along the Path (To Resolve at Checkpoints 2 & 3)

1. Exact Contraction Ratio in \mathcal{C}_{2,1} (Algebraic — No Script Needed, Solved in Checkpoint 2):
   For an arbitrary remote cubic q = \sum_{i,j,k \ge 2} T_{ij,k} :z_i z_j \bar{z}_k: (with T_{ij,k} = T_{ji,k}) of energy u = \mathbb{E}|q|^2 = 2 \sum_{i,j,k} |T_{ij,k}|^2:
  ⚬ What is the exact identity for \mathbb{E}\vert{}q\vert{}^4 - 2u^2 in terms of the three partial trace/contraction tensors of T?
    Specifically, define the three contraction matrices/tensors:
    ⚬ (A_1)_{i, i'} = \sum_{j,k} T_{ij,k} \overline{T_{i'j,k}} (a positive semidefinite (n-1)\times(n-1) matrix of trace u/2),
    ⚬ (A_2)_{k, k'} = \sum_{i,j} T_{ij,k} \overline{T_{ij,k'}} (a PSD matrix of trace u/2),
    ⚬ B_{ij, i'j'} = \sum_k T_{ij,k} \overline{T_{i'j',k}} (symmetric two-index PSD operator of trace u/2),
    ⚬ C_{ik, i'k'} = \sum_j T_{ij,k} \overline{T_{i'j,k'}} (mixed two-index PSD operator of trace u/2).
  ⚬ How does the leading cubic content vector v_m = \mathbb{E}[\bar{z}_m q \vert{}q\vert{}^2] express in terms of T, A_1, A_2, B, C, and what is the exact sharp constant \Theta_* in:
    
    $$\sup_{\|\xi\|_2 = 1} \big|\mathbb{E}[\bar{\xi} q |q|^2]\big|^2 \le \Theta_* \, u \big(\mathbb{E}|q|^4 - 2u^2\big) \quad \text{?}$$
    
    (Note: Let's verify on q = \sqrt{u} X W': here \mathbb{E}|q|^4 - 2u^2 = 2u^2, and \mathbb{E}[\bar{X} q |q|^2] = u^{3/2} \mathbb{E}[|X|^4 |W'|^2] = 2 u^{3/2}, so |\mathbb{E}[\bar{X} q |q|^2]|^2 = 4u^3 = 2 u (\mathbb{E}|q|^4 - 2u^2), giving ratio 2! We must prove the sharp universal $\Theta_$ across ALL (2,1) tensors!)*
2. Sign and Regularity of \Phi''(r) and g'(r) near r = 0 (Resolved by Checkpoint 1 Numerics):
   Does L = z_1(a + b|z_1|^2) with a = 699/1250 > 0, b = 179/1250 > 0 have a bounded smooth density at the origin?
  ⚬ Quick analytical check: The map z_1 \mapsto w = z_1(a + b\vert{}z_1\vert{}^2) is a global real-analytic diffeomorphism of \mathbb{C} \to \mathbb{C} because a > 0, b > 0 \implies \frac{d}{dr}[r(a+br^2)] = a + 3br^2 \ge a > 0!
  ⚬ Therefore, the density \rho_L(\vert{}w\vert{}^2) of L with respect to Lebesgue measure on \mathbb{C} is C^\infty and strictly positive everywhere, including at w = 0, where \rho_L(0) = \frac{1}{\pi a^2}!
  ⚬ Wait—let's check what \Delta_y (2\mathbb{E}\vert{}L+y\vert{}) = 2\mathbb{E}\big[\frac{1}{\vert{}L+y\vert{}}\big] does in \mathbb{R}^2 \simeq \mathbb{C}!
    Since \Delta_y = 4 \frac{d}{dr}\big(r \frac{d}{dr}\big) on radial functions \Phi(r) (r = \vert{}y\vert{}^2):
    ⚬ 4 \Phi'(0) = (\Delta_y H)(0) = 2 \mathbb{E}[|L|^{-1}] > 0.
    ⚬ What is \Delta_y^2 |L+y| in the distributional sense on \mathbb{R}^2?!
      Remember in 2D: \Delta_y |y| = \frac{1}{|y|}, and \Delta_y \big(\frac{1}{|y|}\big) is NOT -4\pi \delta_0 (\Delta \ln\vert{}y\vert{} = 2\pi \delta_0), rather |y|^{-1} has homogeneity -1, so \Delta_y |y|^{-1} is a hypersingular / Hadamard finite-part kernel of homogeneity -3!
      By smoothness of \rho_L, H(y) = 2(|\,\cdot\,| * \rho_L)(y) is C^\infty in y \in \mathbb{C}! And its radial derivatives at y = 0:
      
      $$H(y) = \Phi(|y|^2) = \Phi(0) + \Phi'(0) |y|^2 + \frac{1}{2}\Phi''(0) |y|^4 + \frac{1}{6}\Phi'''(0) |y|^6 + \cdots$$
      
      exist to all orders! Even better, \Phi''(0) < 0 iff \Delta_y \big(\mathbb{E}|L+y|^{-1}\big)\big|_{y=0} < 0, which holds because \rho_L(|w|^2) attains its strict global maximum at w = 0!
3. Closing the Tail vs. Near-Gaussian Gap (Checkpoint 3 Decision Gate):
   Once Checkpoint 1 gives us the exact numbers for \Phi'(0), \Phi''(0), \Phi'''(0), g(0), g'(0), g''(0), and global envelope bounds on r \in [0, \infty):
  ⚬ Branch 3A (Weaker Form \eta = 10^{-4}, Fast & Elementary):
    Check if a global upper bound \Phi(r) \le \Phi(0) + \Phi'(0)r - \beta r^2 + \gamma r^3 (or rational \Phi(r) \le \Phi(0) + \Phi'(0)r - \frac{\beta r^2}{1 + \lambda r}) combined with hypercontractivity on \mathcal{C}_{2,1} (where exact/sharp hypercontractive bounds on \mathbb{E}|q|^6 or \mathbb{E}[\frac{|q|^4}{1+\lambda|q|^2}] hold) already beats C(q)^2 / \kappa - (S - \Lambda(\sqrt{u}W) + \eta) across the entire band u \in [0.00551, 0.0463]!
    Wait—test the rational upper bound idea right now! Suppose \Phi(r) \le \Phi(0) + \Phi'(0)r - \frac{\beta r^2}{1 + \lambda r} for all r \ge 0. Look at what happens as q \to \sqrt{u}W when u = 0.0463: at q = \sqrt{u}W, \mathbb{E}[\Phi(u|W|^2)] vs \Phi(0) + \Phi'(0)u - \beta \mathbb{E}[\frac{u^2|W|^4}{1 + \lambda u |W|^2}] leaves a small gap of O(\lambda u^3)! If that gap is < \eta + (S - \Lambda(\sqrt{u}W)), then a single rational inequality + the (2,1) contraction bound proves the \eta = 10^{-4} theorem in one shot for ALL dimensions n!
  ⚬ Branch 3B (Strong Form \eta = 0, C(q)^2 \le 0.24 D(q)):
    To have zero gap at q = \sqrt{u}W, we cannot drop O(u^3) at the Gaussian point. Instead:
    ⚬ For \mathcal{E}_4(q) \ge \tau_0 (moderate-to-large fourth-moment excess), the O(u^3) gap of the rational/cubic upper envelope IS strictly absorbed by -\frac{1}{2}\Phi''(0) u^2 \mathcal{E}_4(q) = -\frac{1}{2}\Phi''(0)(\mathbb{E}|q|^4 - 2u^2), giving C(q)^2 \le 0.24 D(q) with \eta = 0!
    ⚬ For \mathcal{E}_4(q) < \tau_0 (small fourth-moment excess, near-Gaussian regime), we apply Stein–Malliavin interpolation along q_t = e^{-t} q + \sqrt{1-e^{-2t}}\sqrt{u}W:
      
      $$D(q) = -\int_0^\infty \frac{d}{dt} \mathbb{E}[\Phi(|q_t|^2)] \, dt.$$
      
      Using complex Malliavin integration by parts (\mathcal{L} q = -3q on \mathcal{C}_{2,1}, whereas \mathcal{L}(\sqrt{u}W) = -\sqrt{u}W—be careful! In complex Ornstein–Uhlenbeck, q has total degree 3, so P_t q = e^{-3t} q, NOT e^{-t} q! Rather, the smart path q_\theta = \cos\theta \, q + \sin\theta \, \sqrt{u}W uses Malliavin Stein-characterization of q via q = \frac{1}{3} \delta D q, comparing the Malliavin covariance matrix of q to u I!). Because \mathcal{E}_4(q) < \tau_0 is small, the Malliavin covariance defect \| \langle Dq, Dq \rangle - \text{Gaussian} \|_2^2 is strictly coercive in \mathcal{E}_4(q), while sixth-moment remainder fluctuations of |q_\theta|^2 are controlled by hypercontractivity + smallness of \mathcal{E}_4(q)!

Look how clean that two-regime synergy is:

⚬ Checkpoint 2 + Rational/Cubic Envelope immediately tests whether Task 1 (weaker form, \eta = 10^{-4}) already closes globally without even needing Stein–Malliavin, AND automatically proves Task 1 (strong form, \eta = 0) for all cubics with \mathcal{E}_4(q) \ge \tau_0!
⚬ Then, if we want \eta = 0 all the way down to \mathcal{E}_4(q) = 0, we only ever run the Stein–Malliavin covariance perturbation inside the tiny near-Gaussian ball \mathcal{E}_4(q) < \tau_0!

Checkpoint 1: Numerical Constants & Profiles Request

Please pass the following precisely defined quantities to your script runner (using high-precision integration, e.g., mpmath or scipy with epsabs=1e-13, exploiting radial symmetry L = e^{i\theta} |z_1|(a + b|z_1|^2) where R = |z_1|^2 \sim \mathrm{Exp}(1)).

Note the 1D reduction over R = |z_1|^2 \in [0,\infty) (with weight e^{-R} dR) and angle \phi \in [0, \pi] (with weight \frac{1}{\pi} d\phi): for y = \sqrt{r} \ge 0, writing \ell(R) = \sqrt{R}(a + bR):


$$|L + \sqrt{r}| = \sqrt{\ell(R)^2 + r + 2\ell(R)\sqrt{r}\cos\phi},$$

$$\Phi(r) = \frac{2}{\pi} \int_0^\infty e^{-R} \int_0^\pi \sqrt{\ell(R)^2 + r + 2\ell(R)\sqrt{r}\cos\phi} \, d\phi \, dR,$$

$$g(r) = \frac{1}{\pi \sqrt{r}} \int_0^\infty (R - 1) e^{-R} \int_0^\pi \frac{\sqrt{r} + \ell(R)\cos\phi}{\sqrt{\ell(R)^2 + r + 2\ell(R)\sqrt{r}\cos\phi}} \, d\phi \, dR \quad (r > 0).$$


(Tip for script runner: both \phi-integrals express in closed form via complete elliptic integrals E(k) and K(k), making 12-digit accuracy instantaneous and singularity-free!)

Please compute and return the following 5 labeled blocks:

1. Taylor Coefficients at r = 0 (for a = 699/1250, b = 179/1250, \varepsilon = 1891/2500):
  ⚬ Phi_0 = \Phi(0), Phi_1 = \Phi'(0), Phi_2 = \Phi''(0), Phi_3 = \Phi'''(0), Phi_4 = \Phi^{(4)}(0).
  ⚬ g_0 = g(0), g_1 = g'(0), g_2 = g''(0), g_3 = g'''(0).
2. Gaussian Baseline Buffer across u \in [0.00551, 0.0463]:
  ⚬ S_val = \max_{\sigma \ge 0} \big(\mathbb{E}[\Phi(\sigma^2 \vert{}W\vert{}^2)] - \sigma^2/\varepsilon\big) and the maximizer u_star = \sigma_*^2.
  ⚬ Table of \Lambda_{\text{Gauss}}(u) = \int_0^\infty e^{-s} \Phi(u s)\,ds - u/\varepsilon and the buffer B_Gauss(u) = S_{\text{val}} - \Lambda_{\text{Gauss}}(u) at u \in \{0.00551, 0.01, 0.02, 0.03, u_*, 0.0403448, 0.0463\}.
3. Behavior and Global Bounds of g(r) and \psi_1(r), \psi_2(r) on [0, \infty):
  ⚬ Recall \psi_1(r) = g(r) + r g'(r) - g(0) and \psi_2(r) = g'(r).
  ⚬ Check monotonicity/signs of g(r), g'(r), g''(r) on [0, 10].
  ⚬ Compute global suprema over r \in (0, \infty):
    ⚬ M_g_lin = \sup_{r > 0} \frac{|g(r) - g(0)|}{r} and M_g_quad = \sup_{r > 0} \frac{|g(r) - g(0) - g'(0)r|}{r^2}.
    ⚬ M_g_cap = \sup_{r > 0} |g(r) - g(0)| and \sup_{r > 0} \sqrt{r}|g(r)| (since F(y) is bounded by \mathbb{E}||z_1|^2 - 1| = 2/e, \sqrt{r}|g(r)| \le 2/e globally!).
    ⚬ Check whether |g(r) - g(0)| is bounded above by a damped linear function \frac{|g'(0)| r}{1 + \mu_g r} for all r \ge 0, and find the largest valid damping constant mu_g_min (Wait: to get an upper bound \frac{|g'(0)| r}{1 + \mu r} \ge |g(r) - g(0)|, we want the largest \mu \ge 0 for which |g(r) - g(0)| \le \frac{|g'(0)| r}{1 + \mu r} holds for all r \ge 0, i.e., \mu_{\max} = \inf_{r > 0} \frac{|g'(0)|/|g(r)-g(0)| - 1}{r}!).
4. Global Upper Envelopes for \Phi(r) on r \in [0, \infty):
  ⚬ Check the sign of \Phi'''(r) and \Phi^{(4)}(r) on [0, 5]. Specifically, is \Phi'''(r) > 0 and decreasing on [0, \infty)?
  ⚬ Compute M_Phi3 = \sup_{r > 0} \frac{\Phi(r) - (\Phi(0) + \Phi'(0)r + \frac{1}{2}\Phi''(0)r^2)}{r^3} (if finite, it equals \frac{1}{6}\Phi'''(0) whenever \Phi^{(4)} \le 0!).
  ⚬ Test the global rational upper bound:
    
    $$\Phi(r) \le \Phi(0) + \Phi'(0) r + \frac{\frac{1}{2}\Phi''(0) r^2}{1 + \lambda r} \qquad \forall r \ge 0.$$
    
    Compute the minimum damping parameter lambda_min = \sup_{r > 0} \max\!\left(0, \frac{\frac{1}{2}|\Phi''(0)| r^2}{\Phi(0) + \Phi'(0)r - \Phi(r)} - 1\right) \!\Big/\! r so that this inequality holds globally for all r \ge 0! (Since \Phi(r) \sim 2\sqrt{r} as r \to \infty while \Phi'(0)r - \frac{|\Phi''(0)| r^2}{2(1+\lambda r)} \sim (\Phi'(0) - \frac{|\Phi''(0)|}{2\lambda}) r, any \lambda > \frac{|\Phi''(0)|}{2\Phi'(0)} works asymptotically; lambda_min gives the exact sharpest global rational upper envelope!).
5. Sanity Check on Known Extremal Families at u = 0.0463 and u = 0.00551:
  ⚬ Evaluate C(q)^2, D(q), C(q)^2 / D(q), and \mathcal{E}_4(q) = \mathbb{E}\vert{}q\vert{}^4/u^2 - 2 for:
    ⚬ Case I (Gaussian factor): q = \sqrt{u} z_2 W' (z_2, W' independent \mathcal{CN}(0,1)).
    ⚬ Case II (Diagonal self-interacting cubic): q = \sqrt{u/2} (|z_2|^2 - 2) z_2.
    ⚬ Case III (Holomorphic-squared remote): q = \sqrt{u/2} z_2^2 \bar{z}_3.

Pausing here as requested. Once you return the Checkpoint 1 numerical outputs, in our next step (Checkpoint 2) we will derive the exact (2,1) tensor contraction & Plancherel identity bounding |\mathbb{E}[\bar{\xi} q |q|^2]|^2 and the damped remainder against \mathbb{E}|q|^4 - 2u^2, and plug in the exact numbers from Checkpoint 1 to see how much of Task 1 closes immediately and what (if anything) remains for Checkpoint 3.
###