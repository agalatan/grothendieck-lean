# A shape-dependent bound for the degree-five witness through amplitude 0.460

Agent-ID: codex-a7c4.

Use the degree-five witness and physical normalization of the [joint spectral cubic lift](../joint-spectral-cubic-lift-codex-a7c4/PROOF.md). Write \(V=\operatorname{Re}\langle f,(P_{1,0}-eP_{2,1}+\eta P_{3,2})g\rangle\), \(h=(f+g)/2\), \(k=(f-g)/2\), \(t=\|P_{1,0}h\|_2\), \(A=\|P_{2,1}k\|_2^2\) and \(K=\|k\|_2^2\). Here \(e=.78,\ \eta=.0779\). For every finite dimension and every unimodular pair with \(0\le t\le.460\), the calculation proves
\[
 V < C,\qquad C=1/1.4023-10^{-5}.
\]
Consequently the supremum on this interval is at most \(C\). Larger amplitudes are still needed for a lower bound on the Grothendieck constant.

## The real certificate at the shape of the lifted cubic

Put \(Q=P_{2,1}k/\sqrt A\) when \(A>0\), \(\chi=\mathbb E|Q|^4-2\in[0,42]\). Rotate the visible coordinate to \(Z\), set \(c=431/500\), \(r=2(179/200)^2-1\). The elliptic lift proof constructs a charge-one field \(W\), obtained as a limit in law and in first absolute and fourth moments of finite-dimensional complex cubics, with \(\mathbb E|W|^2=A+c^2t^2\le\mathbb E|W|\). For \(w=c^2 t^2/(A+c^2t^2)\), the fourth excess of \(W/\sqrt{A+c^2t^2}\) is
\[
 s=(1-w)^2\chi+w(1-w)B+2(1+r^2)w^2,\quad
 B=4J+2r\operatorname{Re}\mathbb E[Z^2\bar Q^2].
\]
The complex contraction bound gives \(B\le2\sqrt{3(1+r^2)\chi}\). The [sector moment calculation](../quintic-sector-moments-codex-a7c4/MOMENTS.md) gives the other signs and coefficients. Specifically, with \(s_j\) the five nonremote sector shares in order \(11,20,10,01,21\), put \(x_j=\sqrt{s_j}\). Then the quadratic upper bound for \(B\) has diagonal \(D=(8,8,4+4r,4,12+8r)\) and the only nonzero off-diagonal \(4\sqrt2 r\) in block \(11,20\). The corresponding lower bound has diagonal \((8,8,4-4r,4,12-8r)\) and off-diagonal \(-4\sqrt2r\). Its determinant in that block is \(64-32r^2>0\). The remaining diagonals are positive. In particular \(B\ge0\).

Write \(b_I\) for an upper bound on \(\mathbb E|F|\) over unit-variance real cubic chaos whose fourth excess is in \(I\). Circular symmetry gives \(F=\sqrt2\,\mathrm{Re}(W/\sqrt{A+c^2t^2})\) with fourth excess \(3s/2\); phase averaging gives \(\mathbb E|W|/\sqrt{A+c^2t^2}=(\pi/\sqrt8)\mathbb E|F|\). For the field obtained by convergence in the elliptic lift proof, take the largest cap among the closed intervals meeting the computed enclosure of \(3s/2\). Finite-dimensional approximants converge in first absolute moment and fourth moment. At an interval boundary this prescription keeps both adjacent bounds. Equivalently, first apply the calculation to arbitrarily small enlargements of the enclosure and take their intersection, using finiteness of the partition.

The original real partition extends to 90 and all finite cubic approximants have real excess at most 63. We use the refined partition only when the upper enclosure is strictly below its right endpoint 4. At its left endpoint every cubic approximant has nonnegative excess.

Every original [KRS501](../../../conjecture-K/sources/real-stein-501-gemini-8732/PROOF.md) interval is replayed. Six of its original 22 potential vectors also furnish a second covering of \([0,4]\) by 16 quarter intervals. On each new interval the only modified inputs are the two endpoints, the upper enclosures of their \(3/2\) powers, the lower endpoint 0 of the auxiliary moment variable, and the bound being asserted. Each such input is supplied to the same unmodified upstream verifier, including its half-line and moment positivity checks. The eventual radius squared is the minimum of the global \(.8884^2\), the cap from each complete applicable partition, and \((\pi/4)(1+.0052898s_{\rm upper})^2\) from [KNG505](../../../conjecture-K/sources/near-gaussian-505-2026-11-21-gemini-2762/PROOF.md).

## Coupling a radial Gram inequality to the mixed fourth moment

The 24 Lean mass-potential certificates give \(K\ge (2E_H p\sqrt A-J(\sqrt\chi))/M_C\) with \(E_H=25/31\), \(M_C=2141/3906\). Each \(J(y)=a+by^2+dy^3\) has \(d\ge0\). The maximal cost on a closed interval is attained at an endpoint. The basic payoff satisfies \(V\le\eta+(1-\eta)t^2+eA-\eta K\) and \(K\ge A\).

Let \(\rho=.8884\). Write \(A_0=\|P_{2,1}^{\rm remote} k\|^2\). The remote ball \(t^2+A_0\le\rho^2\) gives \(A-A_0\ge(A+t^2-\rho^2)_+\). For completeness, the orthogonality of \(h,k\) is pointwise real orthogonality. The support bound for a remote cubic and the independent proper Gaussian coordinate is proved in the [remote support argument](REMOTE.md), via the diffuse cubic approximation of the Gaussian coordinate. For either verified radial Gram profile the [step-weight proof](../quintic-product-support-codex-a7c4/COVER.md) gives
\[
 V\le C_g+(1-h_g)t^2+(e-p_0)A-dK-A\sum_j (p_j-p_0)s_j .
\]
All five \(p_j-p_0\) are positive. Replacing their sum by the smallest price times \((A+t^2-\rho^2)_+/A\) gives one direct payoff arm. This arm, after inserting any of the spectral mass bounds, is increasing in \(A,t^2\). The checker verifies the worst case derivatives \(e-p_0-\min_j(p_j-p_0) > d E_Hp/(M_C\sqrt{.55})\) and \(1-h_g\ge\min_j(p_j-p_0)\).

The same Gram inequality prices \(B\). For each row the checker chooses an integer \(L>0\) such that all \(L(p_j-p_0)-D_j\ge0\) and their first two products satisfy \((L(p_{11}-p_0)-8)(L(p_{20}-p_0)-8)\ge32r^2\). Therefore \(B\le L\sum_j (p_j-p_0)s_j\). If \(V\ge C\), then
\[
 \sum_j (p_j-p_0)s_j
 \le e-p_0+[C_g+(1-h_g)t^2-C-d K]/A .
\]
To maximize the right-hand estimate on \([A_l,A_u]\), fix one spectral witness on that whole interval. In the variable \(v=1/\sqrt A\), its nonconstant part is \(b_2v^2-b_1v\) with \(b_1\ge0\). If \(b_2\ge0\) it is convex; otherwise it decreases on positive \(v\). Thus checking the two endpoints with downward-rounded mass estimates suffices. A negative upper bound here rules out the assumed violation. When the upper bound is nonnegative, multiplying by \(L\) supplies a second upper bound for \(B\). Taking the minimum with the contraction bound narrows the interval for the lifted real excess and selects the applicable certificates.

## Replay and scope

Run the following from a tree containing KRS501 and the step-weight Gram verifier of the six-sector product-support proof.

    python3 -IB -O shape_radius.py --repo /path/to/repository

The checker first removes \(A\le.55\) by \(K\ge A\). Under \(V\ge C\), the basic payoff requires \(A\ge(C-\eta-(1-\eta)t^2)/(e-\eta)\). It starts with \(A_u=\rho^2-c^2t_l^2\). On each \((t,\sqrt\chi)\)-rectangle, it bounds \(w\) from above and below using the two energy and amplitude endpoints. At fixed \(w\), the lower and upper bounds on the lifted excess increase with \(\chi\). At the two resulting shape endpoints, optimizing the actual quadratics in \(w\) includes any interior extremum. The resulting radius cap tightens \(A_u\); four such iterations always retain every possible violating response. The terminal payoff uses that same energy in each joint increasing mass/payoff expression. Adaptive closed bisection covers the whole \([0,.460]\times[0,\sqrt{42}]\). No floating-point optimization is used for acceptance.

The exact sum of the accepted rectangle areas equals the area of the full domain. Replaying at inverse targets 1.4025 and 1.403 covers all shapes through .4597 and .459, respectively. The [two-amplitude extension](TILTED.md) takes the primary target through .460505023 with two amplitudes and .46051 with three.

The two frozen profiles are supplied to the original eight-price rational step checker, including its mean inequality. Every additional KRS bound is proved from the original potential. The amplitude cover has 364 leaves. Its least extra contradiction margin is greater than \(6{,}948{,}546/10^{12}\). The unconditional reserve established for the physical payoff is \(10^{-5}\). At \(t=.460,\sqrt\chi=.66\) deleting the refined partition makes the same majorant miss by more than .0002. At \(t=.461,\sqrt\chi=.66\) even the full frozen majorant exceeds the trigger by more than .0002. Deleting only the signed Gram constraint on the mixed fourth moment also makes the bound at the first point miss by more than .00008. These tests measure where the estimates lose information. Realizability of the later point is open.
