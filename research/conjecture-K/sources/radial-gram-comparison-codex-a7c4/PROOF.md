# A total-variation comparison for circular cubic chaos

Agent-ID: codex-a7c4. Related tasks [#509](https://github.com/agalatan/grothendieck-lean/issues/509) and [#683](https://github.com/agalatan/grothendieck-lean/issues/683).

Let q=a+ib belong to the circular Gaussian cubic chaos of bidegree (2,1), normalized by E|q|²=1. Let G be standard complex Gaussian and set s=E|q|⁴−2. With the convention that total variation is the supremum over Borel events,

    d_TV(law(q), law(G)) ≤ min(1, ((√74 + 8)/18) √s).

Equivalently, any bounded real Borel test with oscillation M has expectation discrepancy at most M times this bound. For a nonzero cubic of general energy u use s = E|q|⁴/u² − 2 and compare with √u G. This controls integration of bounded residuals after subtracting terms whose moments are known. The signed inequalities in Conjecture K require additional information.

## The radial Stein equation

Write X=(√2 a, √2 b) and let Z have the standard real Gaussian law in two dimensions. Both vector laws are invariant under rotations. Averaging a test over rotations preserves its two expectations and bounds its oscillation by that of the original test. It therefore suffices to take a continuous radial test h with values in [0,1].

Solve Δf − x·∇f = h − Eh(Z) radially. At a radius r>0 write u=h(r), and let n and m be the conditional means of h for |Z|≤r and |Z|>r, respectively. Set p=(1−exp(−r²/2))/r², so 0<p≤1/2. Indeed, multiplying the radial equation by r exp(−r²/2) and integrating from zero gives

    A = f′(r)/r = p(n−m),       B = f″(r) = u−m−A.

These are the tangential and radial Hessian eigenvalues. Since A+B=u−m and B−A=u−[2pn+(1−2p)m], both their sum and difference have absolute value at most one. Hence |A|+|B|≤1, a bound on the nuclear norm (sum of singular values) of the Hessian. At the origin both eigenvalues tend to (h(0)−Eh(Z))/2. The solution is twice continuously differentiable with bounded Hessian and gradient of at most linear growth.

The third-chaos Gaussian integration-by-parts identity gives

    Eh(X) − Eh(Z) = E tr[(I−T) Hess f(X)],     Tᵢⱼ = ⟨DXᵢ,DXⱼ⟩/3.

For each component this follows from LXᵢ=−3Xᵢ and the Gaussian Dirichlet form applied to ∂ᵢf(X). Boundedness of the Hessian and the Gaussian polynomial moments justify the chain rule and approximation by cutoffs. The matrix pairing is bounded by the operator norm of I−T times the Hessian nuclear norm. Continuous tests suffice for total variation by regularity of the two finite Borel measures (approximate an event in their sum measure). Thus the estimate also covers discontinuous tests.

## Two variances from one contraction tensor

Let W=tr(T)/2−1 and J=(T₁₁−T₂₂)/2+iT₁₂. The eigenvalues of T−I are W±|J|. With V=EW² and D=E|J|², Cauchy–Schwarz gives

    E‖T−I‖op = E|W|+E|J| ≤ √V+√D.

In the coordinate order (n,h,b,y,z) of the contraction tensor, the existing Gaussian identities give the coefficient vectors below. Here n and h are Gram coordinates, independent of the conditional means in the preceding section. The energy identity gives s=2P+Q in the notation of the library. [Spectral identities](../../../../Grothe/LowerAnalytic/GramBudget.lean) · [Gram certificate](../../../../Grothe/Lower/Gram.lean).

    s  = (32,  8,  32, 96,  0)·(n,h,b,y,z)
    9V = (80, 20,  16, 96, 32)·(n,h,b,y,z)
    9D = ( 0,  0, 128, 96,  0)·(n,h,b,y,z).

For real weights λ≤μ≤11λ/8, let c=(37λ+32μ)/162. Then λV+μD≤cs. To see this, expand 9(cs−λV−μD) into the following four nonnegative terms. In order, the first two factors in the left column are evaluations of the two positive Gram matrices, on (1,−1) and, for the rescaled second matrix, (1,1). The other two are contraction inequalities.

| Factor | Multiplier |
|---|---|
| n+h−2z | 128(μ−λ)/3 |
| n+h+b+9y−3z | (352λ−256μ)/9 |
| n−b | (128μ−32λ)/3 |
| y | (992μ−752λ)/3 |

Choose t=8/√74, λ=1+t and μ=1+1/t. These weights lie in the stated cone. The inequality 2√(VD)≤tV+D/t proves

    (√V+√D)² ≤ ((√74+8)/18)² s.

Together with the radial Stein estimate this proves the result. The balanced weights also give E‖I−T‖²_HS=2(V+D)≤(23/27)s. That form applies when pairing the two matrices in mean square using a test-specific Hessian bound.

## Scope and checks

The Gram relaxation permits the ray (n,h,b,y,z)=(1,1,1,0,1), which annihilates all four factors. It gives V/s=37/162 and D/s=16/81, attaining the stated coefficient in the *relaxed bound on √V+√D*. Optimality for actual cubic laws or total variation would also require equality in the preceding analytic estimates.

The [exact replay](../../code/radial-gram-comparison-codex-a7c4/verify.py) checks all five coefficient identities on both boundary rays of the weight cone, the extremal Gram ray, the nuclear-norm cube vertices and a rational enclosure of the radical. Its recorded output is [result.json](../../code/radial-gram-comparison-codex-a7c4/result.json). The [Lean check](KERNEL.md) verifies the two rational Gram certificates, their real interpolation, the radical and the Hessian eigenvalue bound. The Gaussian integration and passage to total variation above are paper arguments. The comparison is independent of any numerical endpoint for the Grothendieck constant.
