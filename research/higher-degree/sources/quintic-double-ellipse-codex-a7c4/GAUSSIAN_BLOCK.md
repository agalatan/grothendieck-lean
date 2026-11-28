# Reweighted elliptic tests and a conditional Gaussian projection

Agent-ID: codex-a7c4. These two conclusions use the capped degree-five normalization, price vectors and buffered target \(C=1/1.4023-10^{-5}\) of the [shape-conditioned lift](PROOF.md). The upper bound on the payoff covers a structural subclass. The obstruction below concerns the current relaxation.

## An obstruction for every two-sector test direction

Let \(U=P_{2,1}k=R+H\), where \(R\) is the remote projection and \(H\) collects the five visible sectors. For an actual pair, pointwise support for any admissible carrier coefficient \(c\) gives
\[
 c t\ell +s_0\|R\|^2+s_1\|H\|^2
 \le\mathbb E|s_0R+s_1H+\ell ZM|,\quad
 \mathbb E|s_0R+s_1H+\ell ZM|^2=s_0^2\|R\|^2+s_1^2\|H\|^2+\ell^2.
\]
Here \(M\) is the independent centered elliptic Gaussian from the predecessor. The variance uses orthogonality of sectors and centering of \(M\).

Set \(t=.47, A=.620,\ \|R\|^2=.56,\ \|H\|^2=.06,\ K=.637\). To realize the cubic shape and sector moments, take \(R/\sqrt{.56}\) to be the normalized sum of twelve independent fresh triples \(X_iY_i\bar W_i\) and \(H/\sqrt{.06}=ZY\bar W\) using fresh \(Y,W\). These components are independent and proper circular. For a unit triple the normalized fourth excess is \(8-2=6\); the normalized sum has excess \(6/12\). The full normalized cubic therefore has excess \(446/961\). Only sector \((1,0)\) is nonremote.

Fix any \(s_0,s_1,\ell\ge0\). The nonremote plus carrier component is \(Z D\), where \(D=s_1\sqrt{.06}\,Y\bar W+\ell M\). Put \(a=.06s_1^2,b=\ell^2,r=\mathbb E M^2\). Then \(\mathbb E|D|^2=a+b\), \(\mathbb E|D|^4=4a^2+4ab+(2+r^2)b^2\). Consequently the unnormalized fourth excess of \(ZD\) is \(6a^2+4ab+2(1+r^2)b^2\le6(a+b)^2\). The independent remote circular component has excess at most \(6\) at unit variance. The normalized fourth excess of their sum lies in \([0,6]\) for every choice of the three weights whenever the variance is positive. Its real excess therefore lies in \([0,9]\).

Every recorded KRS501 bound from the original and refined slabs applicable to this interval gives a complex radius at least \(\mu=\sqrt{\pi}/2\). The KNG505 and global radius bounds also exceed or equal \(\mu\). For all \(c\le.864\), the verified inequality \(c^2t^2+A<\pi/4\) implies by weighted Cauchy–Schwarz that the support left side stays below \(\mu\) times the square root of its variance. This covers every choice of the separate sector weights and of the carrier amplitude, including the uniform choice and zero endpoints. The remote diffuse support tests with coefficient one also pass because \(t^2+\|R\|^2<\pi/4\) and the lifted remote shape is at most \(1/2\).

The exact replay verifies the global mass cut, each of the 24 shape-specific mass cuts, Parseval, and both new radial Gram upper estimates evaluated with the actual sector allocation. The least of the three payoff estimates exceeds \(C\) by more than .001311995. The cubic field is genuine; no claim is made that actual phase responses realize this simultaneous scalar tuple. Thus it rules out proving the full inequality at \(t=.47\) with these radius tests and these scalar debit estimates alone.

## A quantitative result from conditioning on a Gaussian block

Choose a cubic orthogonal projection \(U_0\) of \(U\) for which \(U_0\) and the visible variable \(Z\) are jointly centered proper complex Gaussian after conditioning on a sigma-field of the original coordinates. The auxiliary carrier \(M\) is independent of all those coordinates. One concrete construction is to choose any block of Gaussian coordinates containing \(Z\) and keep the cubic summands with exactly one holomorphic occurrence and zero antiholomorphic occurrences in that block. Given all other coordinates, those summands are complex-linear in the block. This construction includes the remote/mixed example above by using the visible coordinate together with one holomorphic factor from each remote triple. It admits arbitrary other sectors in the orthogonal complement. Put \(A_0=\|U_0\|_2^2\). As an orthogonal projection inside \(H_{2,1}\), \(\operatorname{Re}\langle k,U_0\rangle=A_0\).

Fix \(M=m\). Conditioning and then applying Jensen in the random conditional variance gives
\[
 \mathbb E|U_0+\ell m Z|
 \le\mu\sqrt{\mathbb E|U_0+\ell m Z|^2}
 =\mu\sqrt{A_0+\ell^2|m|^2}.
\]
The equality on the right uses the exact chaos orthogonality \(\mathbb E[U_0\bar Z]=0\); conditional independence of \(U_0,Z\) is unnecessary. Choose \(\ell=ct\) in pointwise support and put \(B=A_0+\ell^2\). If \(B>0\), the result is \(\sqrt B\le\mu\mathbb E\sqrt S\), where \(S=1-w+w|M|^2,\ w=\ell^2/B\).

For any nonnegative \(S\) of mean one, the square-root identity and Cauchy–Schwarz imply
\[
 1-\mathbb E\sqrt S
 =\tfrac12\mathbb E\frac{(S-1)^2}{(\sqrt S+1)^2}
 \ge \frac{\operatorname{Var}(S)^2}{4(\mathbb ES^3-\mathbb ES^2)}.
\]
Indeed \((\sqrt S+1)^2\le2(S+1)\). If \(S=1\) almost surely, the deficit is zero. For nonconstant \(S\), the denominator equals \(\mathbb E[(S-1)^2(S+1)]>0\). Writing \(v=1+r^2,\ u=2+6r^2\), direct real Gaussian moments give \(\mathbb E|M|^4=2+r^2,\ \mathbb E|M|^6=6+9r^2\). Substitution yields
\[
 \delta(w)=\frac{w^2v^2}{4(2v+uw)},\qquad
 A_0 \le \mu^2\left(1-\delta(c^2t^2/\mu^2)\right)^2-c^2t^2 .
\]
Here \(B\le\mu^2\), \(\delta\) increases on the positive axis, and the verified range keeps its complement positive. The case \(B=0\) is immediate. The energy cap decreases with \(t\) over the checked range.

The full cubic energy satisfies \(A=A_0+\|U-U_0\|^2\). Insert the cap for \(A_0\) and a proposed bound on the discarded physical energy into the single zero-mass-price Gram estimate
\[
 V\le C_g+(1-h_g)t^2+(e-p_0)A-\gamma(A+t^2-\rho^2)_+ .
\]
The folded term follows from the independently checked remote ball. The expression increases in both \(A,t^2\), including both sides of its breakpoint. The replay uses the lower endpoint of each \(t\) interval for the energy cap and the upper endpoint for the increasing payoff. The three full prefixes are:

| maximum \(t\) | maximum \(\|U-U_0\|^2\) | closed intervals | uniform clearance below \(C\), trillionths rounded down |
|---:|---:|---:|---:|
| .4814 | 0 | 26 | 3896098 |
| .480 | .0006 | 24 | 13685563 |
| .470 | .005 | 21 | 19990035 |

At \(t=.4815\) the fixed scalar estimate with zero discarded energy exceeds the target. At \(t=.47\), the new structural energy cap for \(U_0=U\) excludes the example's proposed energy by more than .007. Finding a large enough common Gaussian block in a general cubic remains an additional requirement.

Replay from the repository root:

    python3 -IB -O research/higher-degree/code/quintic-double-ellipse-codex-a7c4/gaussian_block.py
