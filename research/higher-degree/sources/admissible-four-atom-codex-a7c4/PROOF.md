# Four bulk scales suffice with the response restriction

Agent-ID: codex-a7c4. Paper proof, author only. This reduction concerns the relaxed scale laws in [three-cluster problem P5](../degree5-attack-2026-11-25/problems/P5-three-cluster-scale-law.md).

Fix the cluster size, cubic parameters, energy $u>0$, a profile $h$ of P5 and an allowance $\theta>0$. Write $\nu$ for the law of $H$ on $[0,3c^2]$ with mean one. **If an admissible law violates $|c_X|^2\le\theta\delta\widehat\Omega$, an admissible law supported on at most four points violates it with the same parameters.** In fact, one need only test admissible laws on at most two scales and laws on three or four scales whose response minimum equals the gate threshold. At four distinct scales the contact equations determine the weights. Without the response restriction two points suffice. The allowance on that finite family remains to be proved. A selected law need not come from a trilinear polynomial on the three spheres.

## Positivity in the relaxed model

Write $s=s_R$, $D_0=XR_A$ where $R_A=a(|X|^2-2)/\sqrt2+\sum m_j(S_j-c)$, and $\delta_0=\mathbb E|D_0|^4-2(1-s)^2$. This core is a genuine Wick cubic of energy $1-s$, so $\delta_0\ge0$ by the circular cubic fourth-moment identity. [Conjecture K ledger, row 6.3.21](../../../conjecture-K/STATUS.md)

With $\kappa=\mathbb E G^2$, the relaxed fourth moment in P5 gives the identity
\[
 \delta/u^2=\delta_0+
 4s\left(\sum_j |m_j|^2+\left|\sum_j m_j\right|^2\right)
 +s^2\big[(1+1/c)^3\kappa-2\big].
\]
Indeed weighting the expectation of $|R_A|^2$ by $R S_1S_2S_3/c^3$ changes $R$ from exponential to gamma of shape two and each $S_j$ from gamma of shape $c$ to gamma of shape $c+1$. The centered driver term then has mean zero and variance $a^2$. The cofactor has mean $\sum m_j$ and variance $(c+1)\sum |m_j|^2$. Finally $\kappa\ge 2c/(c+1)$, so the last bracket is at least $2(1+1/c)^2-2>0$. This proves $\delta\ge0$ even for relaxed laws. Also $\widehat\Omega\ge(3/4)\mathbb E[V k'(V)^2]\ge0$ by Cauchy–Schwarz and $\mathbb EV=u$.

## Preserve the response minimum

Take a standard proper Gaussian $Z$ independent of the model. Rice's formula in P5 is $\rho(\lambda^2v)=\mathbb E|Z+\lambda\sqrt v|$. The gate is $g_\nu(\lambda)\ge t_{\rm lo}$ for every $\lambda>0$, where
\[
 g_\nu(\lambda)=\mathbb E|Z+\lambda\sqrt V|-\lambda u/\epsilon_1 .
\]
Both $g_\nu(\lambda)$ and $g'_\nu(\lambda)$ are affine in $\nu$ at fixed $\lambda$. Differentiation is justified by the integrable bound $\sqrt V$. For $V>0$ and $\operatorname{Im} Z\ne0$ the norm is strictly convex in $\lambda$. Since $\mathbb EV=u>0$, the averaged curve is strictly convex, and $g'_\nu(0)=-u/\epsilon_1<0$.

If $a=m_1=m_2=m_3=0$, there is no driver contribution to the content. Integrating its independent phase gives $c_X=0$ and the desired inequality follows from positivity. Otherwise $R_A$ is a nonzero polynomial of independent variables with densities, so $\sqrt R|R_A|>0$ almost surely. Adding the isotropic bulk cannot cancel this nonzero number with positive probability, even if $H$ has an atom at zero. Hence $\Pr(V=0)=0$. The bound $\big||Z+\lambda\sqrt V|-\lambda\sqrt V\big|\le |Z|$ gives
\[
  g_\nu(\lambda)=\lambda(\mathbb E\sqrt V-u/\epsilon_1)+o(1)
  \qquad(\lambda\to\infty).
\]
Here the expected constant is zero since the pointwise limit of the difference is $\operatorname{Re}Z$. Every file has $t_{\rm lo}>0$. Admissibility thus forces $\mathbb E\sqrt V>u/\epsilon_1$. There is a unique finite minimum $\lambda_*>0$.

For a violating admissible $\nu$, fix this $\lambda_*$. Keep the mean of $H$ and the two quantities $g_\nu(\lambda_*)$, $g'_\nu(\lambda_*)$ fixed. Every replacement law with these three moments is admissible. Its derivative at $\lambda_*$ is zero and its convex response curve takes the same value there. Freezing only the value at the old minimum would allow the minimizing amplitude to move.

## Preserve a strict violation using one linear objective

Set $B_\nu=\mathbb E[V k'(V)]$ and $A_\nu=\mathbb E[V k'(V)^2]$, so $\widehat\Omega_\nu=3A_\nu/2-3B_\nu^2/(4u)$. The quantities $c_X,\delta,A_\nu,B_\nu$ are affine in $\nu$. Choose a phase $\psi$ and $p>0$ such that
\[
 2\operatorname{Re}(e^{i\psi}c_X)-p\delta-(\theta/p)\widehat\Omega_\nu>0 .
\]
Such a choice exists because the infimum of $p\delta+(\theta/p)\widehat\Omega_\nu$ is $2\sqrt{\theta\delta\widehat\Omega_\nu}$, including zero factors. In this expression replace the positive multiple of $B^2$ by the same multiple of $2B_\nu B-B_\nu^2$. This gives an affine lower bound $L$ on the displayed expression for every candidate law and equality at $\nu$.

All four functions of the bulk scale used here (the mean observable, the value and derivative of the response, and the objective) are continuous and bounded on $[0,3c^2]$. For the P5 bounded continuous profiles, $k'$ is bounded and continuous. One can couple the integrals for all bulk scales with the same Gaussian, gamma, angle and beta variables. On this compact interval the observable for $V$ is dominated by a polynomial in the gamma variables; the response derivative is dominated by $\sqrt V$, with a Gaussian giving probability zero to the nondifferentiable point. Dominated convergence proves the claim. The same proof applies to profiles satisfying these continuity and domination conditions.

The vector of the three moments and $L$ is an average on a compact curve in $\mathbb R^4$. By Carathéodory's theorem it is reproduced by at most five atoms. If five positive weights remain, choose a nonzero perturbation of the weights preserving the total and the three moments. Take its sign so that $L$ does not decrease, and move until one weight reaches zero. The four remaining atoms are admissible and have $L>0$, proving the assertion. Without the gate only the total and the mean must be preserved, giving at most two atoms by the same argument.

## A strict gate needs at most two scales

On the at most four support points just obtained, maximize the same affine witness $L$ over the admissible simplex section with mean one. It is compact, since every gate inequality is closed in the weights. Choose an extreme maximizer; it still has $L>0$. If its gate minimum is strictly above $t_{\rm lo}$, small perturbations of its positive weights preserving the mean remain feasible in both directions. To see this uniformly for large amplitudes, the positive asymptotic slope $b=\mathbb E\sqrt V-u/\epsilon_1$ stays above $b/2$ near the maximizer. Conditional Jensen gives $g(\lambda)\ge\lambda b/2$ there. On the remaining compact amplitude interval the positive margin persists by continuity. Three or more positive weights would then admit a nonzero mean-preserving two-sided perturbation, contradicting extremality.

It follows that any required three- or four-scale search can impose both $g(\lambda_*)=t_{\rm lo}$ and $g'(\lambda_*)=0$. For fixed scale positions and contact amplitude, let $J_j(\lambda)=\mathbb E[|Z+\lambda\sqrt V|\mid H=h_j]$ denote the integral evaluated with scale $h_j$. The four equations in the weights $w_j$ are
\[
 \sum w_j=1,\qquad \sum w_j h_j=1,\qquad
 \sum w_j J_j(\lambda_*)=t_{\rm lo}+\lambda_* u/\epsilon_1,\qquad
 \sum w_j J'_j(\lambda_*)=u/\epsilon_1.
\]
At a four-point extreme maximizer the matrix of these equations is nonsingular. A kernel vector otherwise preserves all four constraints in both directions, and convexity at the same contact keeps both perturbed laws admissible. Thus for four distinct scales and a contact amplitude one only solves a linear system and checks its weights. No amplitude discretization is needed to establish feasibility at a genuine contact.

The contact equations also give a way to certify a whole family without inverting nearly singular matrices. Fix the geometry, the contact amplitude and the phase, price and square-linearization parameters. Let $l(h)$ be the corresponding one-scale affine objective, including its constant. If
\[
 l(h)\le d_0+d_1 h+d_2 J_h(\lambda_*)+d_3 J'_h(\lambda_*)\quad(0\le h\le3c^2)
\]
and $d_0+d_1+d_2(t_{\rm lo}+\lambda_*u/\epsilon_1)+d_3 u/\epsilon_1\le0$, integration proves the required sign on that contact family. The four multipliers are unrestricted real numbers. The pointwise majorant is a sufficient certificate; constructing such majorants for the eleven P5 profiles remains open.

## Why the response restriction matters

The count of four is sufficient. Optimality for the Rice gate is open. A simple convex gate illustrates why two atoms cannot be deduced from convexity on the unconstrained mean-one laws. On the four scales $0,1/2,3/2,2$ let $A=\Pr(H=0)-1/4$ and $B=\Pr(H=1/2)-1/4$. Impose $(\lambda-1)^2+B(\lambda-1)+A\ge0$ for $\lambda>0$. The uniform law on these four scales is feasible and has mean one. In any feasible convex decomposition of that law, the value at $\lambda=1$ forces $A=0$ for every constituent, since each $A$ is nonnegative. The derivative at this interior zero then forces $B=0$. Normalization and mean one determine the other two masses to be $1/4$ each. As a check on the derivative condition, the weights $(1/4,1/8,5/8,0)$ also have mean one and agree at $\lambda=1$. Their gate value at $\lambda=17/16$ is $-1/256$. Thus the four-point law is itself an extreme feasible law in this example. This example uses a quadratic gate; it places no lower bound on the support needed for P5 itself.

The [exact replay](../../code/admissible-four-atom-codex-a7c4/replay.py) checks the moving-minimum example and expands the gamma moments independently for one complex cofactor, three cluster sizes and two bulk laws. Run `python3 -IB research/higher-degree/code/admissible-four-atom-codex-a7c4/replay.py` from the repository root. The general reduction uses the argument above.
