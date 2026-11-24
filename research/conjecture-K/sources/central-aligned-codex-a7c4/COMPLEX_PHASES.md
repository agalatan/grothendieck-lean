# Independent complex phases near the real cover of (P)

Agent-ID: codex-a7c4. Task #580. **P + C, author only.** At the peak profile,
(P) holds at every shift and amplitude whenever, after rotating w to the real axis,
the coefficients satisfy

    √((Im A)²+(Im B)²) ≤ max(|Re A|,|Re B|)/32.

If w=0, any common rotation satisfying this test suffices. For a nonzero real
part let t=max(|Re A|,|Re B|) and write (A,B)=t(D+i e). Then D is in one of
the four real charts (±1,y), (y,±1) and ‖e‖₂≤1/32. On the 31,090 direct boxes
the previous audited radius was 1/8192 in these coordinates. Section 5 extends
the same tube across every inherited box and beyond the compact chart domain.
General complex (P), the odd-sector premise and the row consumer remain open.

## 1. Pair opposite imaginary increments

Write Z=x+iy, T=|Z|², dγ=e⁻ᵀ dx dy/π, a=699/1250, b=179/1250,
c=15159/50000, L=(a+bT)Z and h_D=(T−2/5)D_A+c D_B+Z² conj(D_B)/√2.
Let V=L+w+t h_D, k=t h_{i e}, r=‖e‖₂. In the notation of the
[real-cover proof](PROOF.md), J=Rem(w,tD)/t²−Q₀(D)−w²S/2−t²S²,
S=‖D‖². Reflection Z↦conj(Z) makes the linear subtraction in the imaginary
increment integrate to zero and interchanges the two norms |V+k| and |V−k|.
The target increases by Q₀(i e)+w²r²/2+t²(2Sr²+r⁴), which is nonnegative
by the positive definiteness of Q₀. Cauchy–Schwarz on the pair gives

    J(w,D+i e,t)−J(w,D,t)
      ≤ E[(|V+k|+|V−k|−2|V|)/t²]
      ≤ E[2|h_{i e}|²/(|V|+√(|V|²+t²|h_{i e}|²))].                 (1)

At V=k=0 the cost is zero. In particular, the integrand is bounded by both
2Mr/t and M²r²/|V|, with M²=(T−2/5)²+(c+T/√2)².
These bounds remain valid at a zero of V when the second bound is taken as
infinite. With Q(T)=3T²/2−37T/100+63/250, one has M²≤Q(T),

    M e⁻ᵀ ≤ M₁=51/100,     M²e⁻ᵀ ≤ M₂=3/4,     E M² ≤ 3−37/100+63/250.

The replay bounds the exponential below by its degree-ten Taylor polynomial
and checks positive Bernstein coefficients on each unit interval up to 4,
then positive power coefficients after translation by 4. The expectation
uses E T=1 and E T²=2.

## 2. Uniform estimate including singular amplitudes

Write β=tD_B. The imaginary part is

    Im V = y(a+bT+√2 βx) = b y[(x+β/(√2 b))²+y²−d],   d=β²/(2b²)−a/b.

In polar coordinates around (−β/(√2 b),0), |V|≤s implies
ρ |ρ²−d| ≤ v = s/(b|sin θ|). Its radial area is at most 2^(1/3) v^(2/3),
uniformly in d. To see this, scale ρ by v^(1/3); it suffices to treat v=1.
If d≤3/2^(2/3), radii above 2^(2/3) satisfy ρ³−dρ>1. Otherwise let x₁<x₂
be the positive roots of ρ³−dρ=−1 and x₃ the positive root of ρ³−dρ=1.
The negative root of the first equation is −x₃, so x₃=x₁+x₂ and x₁x₂x₃=1.
The occupied squared-radius length is x₁²+x₃²−x₂²=2/x₂≤2^(4/3), since
x₂≥2^(−1/3) (evaluate the cubic at 2^(−1/3)). Radial area is half this
length. The two directions sin θ=0 have zero angular measure.

Concavity of sin on the two chords with endpoints 0, π/6 and π/2 gives an
integral of |sin θ|^(−2/3) on the full circle of at most π(8−4·2^(−1/3)).
Consequently area{|V|≤s}≤π A₀(s/b)^(2/3), where A₀=61/10 exceeds
8·2^(1/3)−4. This is uniform in both the shift and the real direction.
After inserting the density in (1), integrate the superlevel areas of
min(U,W/|V|), with U=2M₁r/t and W=M₂r². The cost is at most
3 A₀(W/b)^(2/3) U^(1/3). Its cube is at most

    K r⁵/t,    K=(3A₀)³ (M₂/b)² (2M₁).                             (2)

## 3. Monotone real maps and individual margins

The symmetric derivative of V is bounded below by mI, where

    m = a − (t²/b) max{(D_A+D_B/√2)²/3, D_B²/2}.

Indeed, in the direction (cos θ,sin θ), rotate the source coordinates to
(ξ,η) along and perpendicular to that direction. The directional derivative
of the parallel component is a+3bξ²+bη²
+2t(D_A+D_B/√2)cos(θ)ξ−√2 tD_B sin(θ)η. Complete the two squares and
maximize the resulting convex combination over θ. This is the real-coefficient
specialization of [the joint projection formula](../ab-sector-2026-11-15-codex-91d4/GEOMETRY.md).
It also gives m≥a−t²S/(2b) by Cauchy–Schwarz.

For m>0, strong monotonicity gives |V(z)−V(z′)|≥m|z−z′|. The derivative
is invertible everywhere, so the image is open. Properness, from the cubic
leading term b|z|²z, makes it closed. There is a unique z₀ with V(z₀)=0.
For the measure M² dγ, a disk of radius s has mass at most min(E M²,M₂s²).
Integrating the superlevel sets of 1/|z−z₀| gives an integral at most
2√(M₂ E M²)<3. By (1) the cost is therefore at most 3r²/m.

On each direct real leaf, the original corner upper bounds and interpolation
errors give J≤−μ for a rational μ>0. The minimum is
7014462798447740663525007/2515803550630543360000000000. For t≤1/4, S≤2
gives 3(1/96)² < (a−1/(16b)) min μ. For t≥1/4, (2) gives
K(1/512)⁵ < (min μ)³/4. This already proves a uniform radius of 1/512.
Using each leaf's own μ, upper and lower t and direction endpoints, the
largest of the three sufficient tests 18r<μ (the original bound),
3r²<mμ and Kr⁵<t μ³ proves r=1/32 on 27,158 leaves.

## 4. Source integration on the other 3,932 leaves

Partition [−4,4]×[0,4] into squares of side h; use reflection for y<0.
The norm of the map e↦h_{i e}/i, on **real** two-vectors, is bounded by the
square root of the largest eigenvalue of the Gram matrix of the two complex
columns T−2/5 and c−Z²/√2. On each square bound the two diagonals from above
and the absolute off-diagonal entry from above. The entries are

    (T−2/5)²,     c²−√2 c(x²−y²)+T²/2,     (T−2/5)(c−(x²−y²)/√2).

The largest eigenvalue of the matrix of those three bounds dominates the
quadratic form, by evaluating it at (|e_A|,|e_B|). Take the smaller of that
eigenvalue bound and max{Q(T_min),Q(T_max)} as H. With α=tD_A and β=tD_B,
ordinary interval products enclose

    Re V = w+x(a+bT)+α(T−2/5)+β(c+(x²−y²)/√2),
    Im V = y(a+bT+√2 βx).

Let d be a lower bound on the distance of this rectangular enclosure from zero.
For all parameters in the leaf the integrand in (1) is bounded by

    2 H r² / (d + √(d²+t_min² H r²)).

The expression is increasing in H r² and decreasing in d and t_min. Where
m>0 there is also an integral bound on the same cell: the Lebesgue integral
of 1/|z−z₀| over any square of area h² is at most 2√π h, by integrating the
bound min(h²,π/s²) for its superlevel area. The cell-average cost is therefore
at most 2√π H r²/(m h), even if the enclosure contains zero. Multiply the
smaller bound by twice the area times an upper bound on the Gaussian density.
For the omitted region T≥16, M≤51/100+(123/100)T by the triangle inequality.
Its contribution is at most (2r/t_min)(51/100+17·123/100)e⁻¹⁶.

The script encloses source and leaf parameters using integers with denominator
2²⁸, and integrates with weights rounded up on denominator 2⁴⁸. It rounds
distances down, Gram eigenvalues up, and exp(−x) up by the reciprocal of the
degree-40 Taylor lower bound on exp(x). All square roots use integer square
root with directed rounding. Each accepted upper sum, including the tail, is
strictly below its leaf's original μ. The three mesh widths 1/4, 1/8 and
1/16 certify respectively 1,061, 2,704 and 167 additional leaves.

## 5. All shifts and amplitudes; complex proportional drivers

For a real chart let S=‖D‖² and E=‖e‖²≤1/32². Physical squared amplitude is
t²(S+E). On an inherited origin leaf, compare its upper bound directly with the
squared cap of the shift profile in row 7.4.11. On an amplitude leaf, t²S≥3/4
suffices by 7.4.12. The directional exterior in that row, divided by t², reads

    16t²(S+E)²+3(S+E) ≥ 6[(2D_A+D_B)²+(2e_A+e_B)²].

Its left side minus its right side is at least the real reserve plus
(32t²S−27)E, by (2e_A+e_B)²≤5E. Bound the real reserve below using S_min,
t_min and the larger endpoint value of (2D_A+D_B)². It suffices to add
min(0,32 t_min² S_min−27)/32² to this lower bound. The exact replay passes
1,266 origin leaves, 43 amplitude leaves and 193 directional leaves, exhausting
the 1,502 inherited leaves. Together with section 4 this covers all 32,592 leaves.

Outside the tree, |w|≥5/4 is an all-direction exterior. For t≤1/1024,
t²(S+E)≤(2+1/32²)/1024² < (1/512)², the universal origin cap.
For t≥7/8, t²(S+E)≥(7/8)²>3/4 because S≥1. If t=0 the phase condition
forces A=B=0 and (P) is equality. These cases give the stated global tube.

As an application, let Y and Y_j be independent standard complex Gaussians and
q=Y[γ(|Y|²−2)+Σ_j d_j(|Y_j|²−1)] for real γ,d_j. Let r_A=αY and r_B=βY
with complex α,β satisfying the displayed phase condition in the fixed frame
of Y. After rotating Y to the real axis, q is real, so the pointwise bound
applies almost surely. If the real shift has the opposite sign, rotate all
three variables by a further minus sign. Under u=2γ²+Σ d_j²≤0.0463 and
u+|α|²+|β|²≤0.080051, row 7.4.10 consequently gives
Λ̂(q+A_shell+B_shell)<S_G+4936/10⁸, with its usual retained trial
ξ₀=−(3/5)(r_A+0.5053r_B).
For example γ=1/7, α=1/16, β=(1+i/20)/32 gives a normalized imaginary
component 1/40 and a nonreal driver ratio 1/2+i/40. The example and its
energy caps are checked by the constant replay.

## Replay

Run from the repository root. With the twenty original region receipts in
one directory or its shard subdirectories, the second command validates the
published real certificate and computes every new source-grid sum.

```sh
python3 research/conjecture-K/code/central-aligned-codex-a7c4/phase_tubes.py
python3 research/conjecture-K/code/central-aligned-codex-a7c4/phase_tubes.py --receipts "$RECEIPTS"
```

The first command checks the universal rational constants only. The full replay
uses Python's standard library. The original outward source integrals are a
dependency of the real margins. Their generating commands and the archived run
are documented in the [real-cover README](../../code/central-aligned-codex-a7c4/README.md)
and [inventory](../../INVENTORY.md#central-aligned-directions-codex-a7c4-task-431).
The combined hash pins the twenty numerical inputs of that run. The
[replay output](../../code/central-aligned-codex-a7c4/complex-phases.txt)
records the counts at each radius. Neither certificate is a Lean proof.
