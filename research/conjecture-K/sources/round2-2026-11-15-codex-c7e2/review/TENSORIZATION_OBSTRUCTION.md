<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/review/TENSORIZATION_OBSTRUCTION.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- /workspace/scratch/f307e93b3610/codex-c7e2-round2/review/TENSORIZATION_OBSTRUCTION.md -->
# Why the near-Gaussian theorem does not bootstrap to global K by replication

The new theorem excludes small normalized fourth excess. The natural replication operations either fail to make the **whole** cubic Gaussian, or change the objective without an inequality preserving a violation. The following are exact structural statements, not numerical evidence.

## 1. Keeping the visible coordinate fixed preserves an obstruction to Gaussianity

Decompose G=νH(Z)+G_c(Z,Y), where H(Z)=Z(|Z|²−2)/√2 and E_Y G_c=0. For independent remote blocks Y_j, the normalized replication that preserves the visible deterministic term is

    G_N=νH(Z)+N^(−1/2)Σ_j G_c(Z,Y_j).

This is still a genuine H₂,₁ cubic. Every sector energy is unchanged: remote cubic, A, B, Q, P all have centered independent coefficient copies, and ν is fixed. In particular U=||G_N||² and V=||G_N−q_N||² do not change with N.

The total-excess projection bound therefore gives, for every N,

    Δ(G_N)≥(4/3)V²,
    χ(G_N)≥(4/3)(V/U)².                       (1)

Thus remote replication cannot drive total kurtosis to zero unless the original visible energy is zero. Replicating ν inside the normalized sum would instead multiply it by √N and would not preserve the energy.

For a concrete example take G=Z(|Y|²−1), with U=V=1. Then

    G_N=Z N^(−1/2)Σ_j(|Y_j|²−1),
    E|G_N|⁴=6+12/N,
    χ(G_N)=4+12/N.                            (2)

The conditional CLT limit is ZR with R an independent real Gaussian. It is a Gaussian product, not a proper complex Gaussian. This explains exactly what survives: conditional Gaussianization of the remote coefficient fields leaves a variance and pseudocovariance depending on the shared visible Z.

## 2. Replicating all coordinates changes the visible profile

Let (Z_j,Y_j) be independent copies of all coordinates, and set

    G_N=N^(−1/2)Σ_j G(Z_j,Y_j),
    Z_N=N^(−1/2)Σ_j Z_j.

Then χ(G_N)=χ(G)/N. Orthogonality of the first and third chaoses gives E[conjugate(Z_N)G_N]=0; the multivariate CLT makes (Z_N,G_N) converge to independent proper complex Gaussians of variances 1 and U. If one defines the new visible profile to be L(Z_N), then

    F_{L(Z_N)}(G_N)−pU → B(U)−pU≤S.          (3)

This operation does enter the near-Gaussian cone. But the left side of (3) has no value-preserving identity with the original F_L(G), nor does convexity give the needed monotonicity.

If instead one replicates the whole pair (L,G), the visible part becomes

    L_N=N^(−1/2)Σ_j L(Z_j)
       =(a+2b)Z_N+bC_N,
    C_N=N^(−1/2)Σ_j Z_j(|Z_j|²−2).

It is not L(Z_N). Conditional Gaussian Wick projection gives

    E[C_N | Z_N]=N⁻¹ Z_N(|Z_N|²−2),
    ||C_N−E[C_N|Z_N]||²=2(1−N⁻²).            (4)

Thus the cubic part of the profile does not disappear; most of it becomes an additional cubic random field rather than the prescribed one-coordinate profile. In fact

    ||L_N−L(Z_N)||²=4b²(1−N⁻¹),              (5)

which stays positive. A proof for the original fixed profile cannot be applied to the averaged pair as if these two visible fields were identical.

## 3. Even in the remote class, convexity supplies the wrong comparison

For a remote q of variance u, ordinary independent block replication q_N has χ(q_N)=χ(q)/N and objective converging to B(u)−pu. Conditional Jensen gives only

    F(q_N)≥F(q/√N),
    Λ_p(q_N)≥Λ_p(q/√N)−pu(1−1/N).            (6)

The lost penalty in (6) prevents it from propagating a violation of Λ_p(q)≤S. Jensen does not compare Λ_p(q_N) with Λ_p(q). Triangle inequalities introduce a rescaled visible profile and likewise do not preserve the original target.

Adding an independent Gaussian buffer and rescaling to fixed energy has the same limitation. With

    G_v=√[U/(U+v)](G+√v W),

one has ||G_v||²=U and χ(G_v)=Δ(G)/(U+v)²→0, but its objective converges to B(U)−pU. Independent Gaussian buffers can be approximated by fresh diffuse cubic blocks, so this path is legitimate in the closure; there is still no monotonicity preserving the starting value. The near-Gaussian theorem controls the endpoint, not the direction of travel.

Consequently, a universal transformation that simultaneously preserves the profile and energy, does not decrease the objective, and drives total kurtosis to zero would itself be an additional global theorem. None of these elementary replication operations establishes it.

## 4. Local strict maximality and homogeneity do not prohibit separated maxima

The structural properties “paired norm, convex and even before subtracting the quadratic penalty, 2-Lipschitz in amplitude, jointly homogeneous in the visible input and perturbation” do not force global maximality from local maximality. For a deterministic real visible input l>0,

    J(t)=|l+t|+|l−t|−pt²=2 max(l,|t|)−pt².

At t=0 this has a strict local maximum. If 1/p>2l, it has a strictly higher maximum at |t|=1/p. This example is not a Gaussian-chaos counterexample; it proves that the listed functional properties alone cannot provide the missing implication.

For Conjecture K the new theorem rules out a neighborhood of the diffuse Gaussian boundary. A hypothetical high-kurtosis maximizing component could remain separated from that boundary by a region of lower values. Ruling this out requires a global replacement inequality, a genuine monotone deformation, or another global argument. Neither a local Hessian theorem nor amplitude homogeneity supplies one.
