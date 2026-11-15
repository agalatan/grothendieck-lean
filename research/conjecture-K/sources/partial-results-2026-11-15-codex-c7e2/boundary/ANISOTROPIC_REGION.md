<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-partial-2026-11-15/conjecture_k_partial_results/boundary/ANISOTROPIC_REGION.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Agent-ID: codex-c7e2. 2026-11-15. -->
# An anisotropic norm majorant and a larger all-sector region

This is a proved regional inequality, with its scalar constants checked by exact rational arithmetic. It does **not** prove Conjecture K on the whole parameter box, or even for every cubic at the peak row. The mathematical derivation is independent of numerical optimization. Base repository: `6bb44599190397f806d2db89b25df4e6785b758e`.

**Provenance.** The scalar majorant in §1 and its raw full-sector application are already in `sources/manuscript/legacy/ch40-gpt-global-local-K.tex`, subsection “A sharper global two-sign inequality,” lines 290–370. I independently re-derived them and found this overlap before delivery; neither is claimed as new. The additional step here is applying that existing anisotropic majorant to the retained trial ξ=−(2/5)r_A−(7/100)r_B−(2/7)νZ. This produces the negative A/B coefficient in (6), substantially strengthening the isotropic retained regional estimate currently recorded in STATUS 7.5.1. The visible correction uses the existing square-completion principle of STATUS 5.4c. Formula (7) is a replay/rearrangement of the legacy raw estimate, included for comparison and completeness.

## 1. The existing scalar inequality, re-derived

For every complex z,

\[
 |1+z|+|1-z|\le 2+\tfrac12(\Re z)^2+(\Im z)^2.\tag{1}
\]

The radial coefficient 1/2 is sharp at z=2, and the tangential coefficient 1 is sharp as z tends to zero along the imaginary axis.

**Proof.** In the dual representation of the left side choose unit complex numbers u,v and put m=(u+v)/2 and k=(u-v)/2. Then

\[
 |m|^2+|k|^2=1,\qquad \Re(m\bar k)=0,
\]

and the corresponding support functional is 2Re m+2Re(\bar k z). If z=x+iy, completing squares gives

\[
 2\Re(\bar k z)-\tfrac12x^2-y^2
 \le 2(\Re k)^2+(\Im k)^2.
\]

Write m=t e^{i\theta}, k=\pm i\sqrt{1-t^2}e^{i\theta}, with 0≤t≤1; the cases m=0 or k=0 are covered by a suitable choice of angle. Set c=cos θ. The required bound is

\[
 2tc+(1-t^2)(2-c^2)\le2.
\]

Its deficit is exactly

\[
 (t-c)^2+t^2(1-c^2)\ge0.
\]

Taking the supremum over u,v proves (1). Consequently, for l≠0 and any h,

\[
 |l+h|+|l-h|\le2|l|
 +\frac{3|h|^2-\Re[(\bar l/|l|)^2h^2]}{4|l|}.\tag{2}
\]

## 2. Full cubic decomposition

Let Z be a proper standard complex Gaussian independent of all remote coordinates, T=|Z|², and

\[
 a=699/1250,\quad b=179/1250,\quad p=2500/1891,
 \qquad L=Z(a+bT).
\]

Write a general charge-one third-chaos element as

\[
 G=q+(T-1)r_A+\frac{Z^2\overline{r_B}}{\sqrt2}
   +ZQ+\bar ZP+\frac{\nu Z(T-2)}{\sqrt2}.
\]

Here q∈H₂,₁ of the remote space, r_A,r_B∈H₁,₀, Q∈H₁,₁, P∈H₂,₀, and ν∈C. All remote sectors may share their variables. Define

\[
 u=\|q\|_2^2,\quad E_A=\|r_A\|_2^2,\quad E_B=\|r_B\|_2^2,
 \quad V=E_A+E_B,\quad W_Q=\|Q\|_2^2,
 \quad W_P=\|P\|_2^2,\quad W_\nu=|\nu|^2.
\]

All six sectors are mutually orthogonal in the ordinary Gaussian L² space, hence
\(\|G\|_2^2=u+V+W_Q+W_P+W_\nu\).

For real s,t take the retained trial ξ=−s r_A−t r_B and let H=G−ξ. Set

\[
 I_j=\int_0^\infty\frac{x^{j-1/2}e^{-x}}{a+bx}\,dx,
 \quad j=0,1,2,3,
 \qquad \zeta=E[r_A\overline{r_B}].
\]

After dividing by the phase of Z, the harmonics of H have visible frequencies −1,+1,0,−2:

\[
 e^{-i\theta}\{q+(T-1+s)r_A+t r_B\},\quad
 e^{i\theta}\frac{T\bar r_B}{\sqrt2},\quad
 \sqrt T\{Q+\nu(T-2)/\sqrt2\},\quad
 e^{-2i\theta}\sqrt T P.
\]

For |H|² the distinct harmonics are orthogonal. Within frequency −1, q is orthogonal to both linear forms. Within frequency zero, EQ=0 removes Q/ν. For H²e⁻²ⁱθ only frequency pairs (−1,+1) and (0,0) survive. Thus its expectation under the radial weight is exactly

\[
 E\frac{e^{-2i\theta}H^2}{|L|}
 =\sqrt2\{[I_2+(s-1)I_1]\zeta+tI_1E_B\}
   +I_1 E Q^2+\frac{I_3-4I_2+4I_1}{2}\nu^2.\tag{3}
\]

In particular, no independence between remote fields was used. Inserting (3) and the analogous diagonal norm expression into (2), and bounding −Re EQ²≤W_Q and −Re ν²≤Wν, gives

\[
 F_\xi(G):=\|\xi\|_2^2+E|L+G-\xi|+E|L-G+\xi|-p\|G\|_2^2
\]
\[
 \le B_0+(3I_0/4-p)u+A_{s,t}E_A+B_{s,t}E_B
       +2C_{s,t}\Re\zeta
       +(I_1-p)W_Q+(3I_1/4-p)W_P
       +\bigl((I_3-4I_2+4I_1)/2-p\bigr)W_\nu,\tag{4}
\]

where B₀=(387/500)√π and

\[
 A_{s,t}=s^2+\tfrac34[I_2+2(s-1)I_1+(s-1)^2I_0]-p,
\]
\[
 B_{s,t}=t^2+\tfrac34[t^2I_0+I_2/2]-\tfrac{\sqrt2}{4}tI_1-p,
\]
\[
 C_{s,t}=st+\tfrac34t[I_1+(s-1)I_0]
             -\tfrac{\sqrt2}{8}[I_2+(s-1)I_1].\tag{5}
\]

The retained functional is at most Fξ. Setting s=t=0 makes Fξ the raw Λ itself.

## 3. Certified retained peak-row extension

Taking s=2/5 and t=7/100 in (4), the exact checker proves the A/B matrix is strictly below −(11/40)I. Its approximate eigenvalues, only for orientation, are −0.805289 and −0.275651.

One can add the orthogonal visible first-chaos correction αZ with α=λν and λ=−2/7, without changing any A/B or remote coefficient. In frequency zero, bound the anisotropic square by the isotropic square and use EQ=0. The resulting ν coefficient is

\[
 (1+I_1)\lambda^2-\sqrt2(I_2-2I_1)\lambda
       +(I_3-4I_2+4I_1)/2-p<-249/500.
\]

Its approximate value is −0.498611. The full trial is ξ=−(2/5)r_A−(7/100)r_B−(2/7)νZ. The following global bound is therefore valid in every dimension and at every amplitude:

\[
 \boxed{\widehat\Lambda(G)\le B_0+
 \frac{413}{500}u-\frac{11}{40}V
 -\frac{16}{125}W_Q-\frac{213}{500}W_P-\frac{249}{500}W_\nu.}\tag{6}
\]

For raw Λ the exact checker with s=t=0 proves the A/B matrix lies below (37/200)I, giving

\[
 \boxed{\Lambda(G)\le B_0+
 \frac{413}{500}u+\frac{37}{200}V
 -\frac{16}{125}W_Q-\frac{213}{500}W_P-\frac{33}{100}W_\nu.}\tag{7}
\]

Let R̂ and R denote the respective linear energy expressions after B₀ in (6) and (7). Using the independently reviewed benchmark lower enclosure
\(S>13739535256614/10^{13}\), the checker establishes:

* If R≤1037/500000, then Λ(G)<S: this proves **exact K on this region**.
* If R̂≤1037/500000, then Λ̂(G)<S.
* With 1087/500000 replacing the budget, the respective bound is <S+10⁻⁴.

Each comparison has strict reserve >2.45×10⁻⁷. No response-energy assumption, approximate K premise, conditional-core hypothesis, or finite-dimensional restriction is needed for these regional statements.

For comparison, the previously checked retained regional majorant had coefficients 771/500 on u, +43/250 on V, −16/125 on both W_Q and W_P, and −33/100 on Wν. Formula (6) improves each changed coefficient: 413/500 on u, −11/40 on V, −213/500 on W_P, and −249/500 on Wν. The retained region therefore contains the previous one and is strictly larger.

**Complete retained no-remote theorem.** If q=0, every coefficient in (6) is strictly negative. Consequently, for arbitrary simultaneous A/B/Q/P/ν sectors in any dimension, at every amplitude and with arbitrary sharing,

\[
 \widehat\Lambda(G)\le B_0-\frac{11}{40}V-\frac{16}{125}W_Q
 -\frac{213}{500}W_P-\frac{249}{500}W_\nu\le B_0<S.
\]

In particular, G=0 is the unique maximizer of the retained functional in this entire no-remote subspace. This is a theorem for Λ̂, not an assertion that raw K has been closed on this class by this method.

For nonzero remote q, on the remote axis (6) still reaches only u≤1087/413000≈0.002632 for the 10⁻⁴ allowance, far short of u*≈0.040345. This cannot close the conjecture by itself.

## 4. Exact checker and its mathematical scope

Run `python3 -I verify_anisotropic.py`. It uses the Python standard library only; all acceptance decisions are rational or integer comparisons, not floating-point calculations. The output is `anisotropic_certificate.json`.

For c=a/b and α=j+1/2, the integral I_j is Γ(α)/b times the Gamma(α,1) expectation of 1/(X+c). Given any polynomial P nonzero at −c,

\[
 \ell_P(x)=\frac{1-P(x)^2/P(-c)^2}{x+c}\le\frac1{x+c},
\]

and, given any polynomial Q nonzero at −c,

\[
 u_Q(x)=\frac{1+xQ(x)^2/[cQ(-c)^2]}{x+c}\ge\frac1{x+c}
 \quad(x\ge0).
\]

Both quotients are polynomials. Their expectations are exact rational Gamma moments. The checker uses monic Laguerre polynomials only to choose efficient P and Q; positivity comes from the displayed square identities, independent of any theorem about their roots. Γ(j+1/2) is a rational multiple of √π. The script obtains π from Machin's formula with alternating-series remainders and encloses square roots by integer square root on a fixed rational grid. It checks the two-by-two positive-definiteness conditions for both matrices in (6) and (7).

The checker proves the integral and matrix constants conditional on the elementary identities just derived; it is not a Lean formalization. The benchmark lower enclosure is inherited from the repository, explicitly printed by the checker. No numerical search enters the proof.

## 5. Independent numerical attack on the full profile box

`search.py` searches the full six-dimensional complex space H₂,₁(C²), plus an independent Gaussian buffer. The buffer is a closure device: a strict violation in this enlarged class would transfer to finite cubic chaos by diffuse approximation. It is not itself a cubic variable in the chosen finite dimension.

Rotational invariance reduces the two coordinates to Z=r and X=s eⁱθ. The six normalized basis fields are

\[
 \frac{Z(T-2)}{\sqrt2},\quad(T-1)X,\quad
 \frac{Z^2\bar X}{\sqrt2},\quad Z(|X|^2-1),\quad
 \frac{\bar Z X^2}{\sqrt2},\quad\frac{X(|X|^2-2)}{\sqrt2}.
\]

Conditional expectation over the Gaussian buffer uses the Rice mean in terms of scaled modified Bessel functions, with its analytic derivatives. The remaining integral uses Gauss–Legendre quadrature on the two radii in [0,7] and a uniform phase grid. The objective subtracts the pure-Gaussian benchmark on the same grid, reducing quadrature bias. The analytic gradient agreed with centered finite differences to maximum absolute error 1.21×10⁻¹¹ at one generic test point.

Ten starts at each of the eight corners of [0.74,0.76]×[0.76,0.90]×[0.12,0.16], the center, and the peak gave 100 optimizations on a 28×28×24 grid, repeated on a 48×48×48 grid. All converged very close to the pure Gaussian. The largest refined apparent excess was 2.68×10⁻¹⁶. Tiny residual remote-cubic coefficients can remain because the objective is flat to second order along that direction. This search supplies **no global certificate**, no quantitative exclusion neighborhood, and no counterexample. Its full records are `results.jsonl` and `results_fine.jsonl`.
