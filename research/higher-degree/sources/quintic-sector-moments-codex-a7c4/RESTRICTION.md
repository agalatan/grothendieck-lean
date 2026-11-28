# Cubic fourth excess under restriction to the remote coordinates

Agent-ID: codex-a7c4.

Let $Q$ be a unit complex Wick cubic of bidegree $(2,1)$. Split off one standard proper complex coordinate $Z$ and put $r=\mathbb E_Z Q$, $x=\|r\|_2^2$. Write $s_{ij}$ for the fraction of squared norm in visible bidegree $(i,j)$, so $s_{00}=x$. Set $J=\sum(i+j)s_{ij}$ and $\chi=\mathbb E|Q|^4-2$. If $x>0$, put $\chi_R=\mathbb E|r|^4/x^2-2$. Then
$$
x^2\chi_R+\frac43 J^2\le\chi.
$$
At $x=0$ the first term means the unnormalized fourth excess $\mathbb E|r|^4-2x^2=0$.

**Real compression.** For a real cubic $F=I_3(f)$ on standard Gaussian space with symmetric kernel $f$, let $M=f\otimes_2 f$ and $N=\operatorname{sym}(f\otimes_1 f)$. The cubic product formula gives $\kappa_4(F)=1296\|M\|_{\rm HS}^2+1944\|N\|_{\rm HS}^2$ at any variance. If $P$ projects onto the remote real coordinates, let $g=P^{\otimes3}f$. Conditional expectation over the visible coordinates sends $I_3(f)$ to $I_3(g)$. [Cubic product identity and normalization](https://github.com/agalatan/grothendieck-lean/blob/868b73eaeb4f4a28a71d3208398110c4ebfe4133/research/conjecture-K/sources/paired-cubic-codex-a7c4/PROOF.md)

On the remote axes $a,b$, put $A_i=(f_{abi})$ for each remote $i$, and $B_v=(f_{abv})$ for each visible real axis $v$. Then $M_g=\sum_iA_i^2$. Write $D=\sum_{i,v}\operatorname{tr}(A_i^2B_v^2)\ge0$. Splitting the two contracted indices in $M$ gives $M_{RR}\succeq M_g+2\sum_v B_v^2$; the omitted term is a Gram matrix. Taking Hilbert–Schmidt norms and retaining the visible block separately gives
$$
\|M\|^2-\|M_g\|^2\ge4D+\|M_{VV}\|^2.
$$

The all-remote block of $N$ is $N_g+\operatorname{sym}\sum_v B_v\otimes B_v$. For real symmetric matrices $A,B$ the inner product of the symmetrized squares is $[(\operatorname{tr}AB)^2+2\operatorname{tr}(ABAB)]/3$. Cauchy–Schwarz for $AB$ and $BA$ gives $|\operatorname{tr}(ABAB)|\le\operatorname{tr}(A^2B^2)$. Thus $\|N\|^2-\|N_g\|^2\ge-4D/3$. Combining the two changes yields
$$
\kappa_4(F)-\kappa_4(I_3(g))\ge1296\|M_{VV}\|^2+2592D.
$$

**Visible occupation.** Choose $F=\sqrt2\operatorname{Re} Q$. Circularity gives fourth cumulants $3\chi/2$ and $3x^2\chi_R/2$ for $F$ and its restriction. The visible Gaussian number operator multiplies each partial Wick degree $(i,j)$ by $i+j$. Orthogonality and circularity preserve the energy $s_{ij}$ of each real projection, giving $J=\mathbb E\|\nabla_V F\|^2$. Differentiating $I_3(f)$ and using second-chaos isometry identifies this with $18\operatorname{tr} M_{VV}$. The two visible real axes give $\|M_{VV}\|^2\ge J^2/(2\cdot18^2)$. Substitution proves the result. Equivalently $J=\mathbb E[(|Z|^2-1)|Q|^2]$: the remote coefficients of different visible indices are orthogonal, and multiplication by $|Z|^2$ has diagonal coefficient $i+j+1$ on the normalized one-coordinate complex Hermite basis.

**Exact controls.** The [tensor controls](../../code/quintic-sector-moments-codex-a7c4/restriction_controls.py) run with isolated, optimized Python. For $Q=(Y_1+Z)Y_2\overline{Y_3}/\sqrt2$ with independent standard proper inputs, the checker recovers $x=J=1/2$, $\chi_R=\chi=6$ and the debit $11/6$. On a real tensor with $g_{123}=1$ and visible slice $\operatorname{diag}(1,1,-1)$, the symmetrized cross term is exactly $-4/3$. This exercises the step that pays for a negative cross term with the Gram increment.

## Sharp bound in terms of mixed energy

Let $h=1-x$ and $h_1=\sum_{i+j=1}s_{ij}$. The preceding argument also gives
$$
\chi\ge x^2\chi_R+\frac43J^2+\frac23h_1^2
      \ge x^2\chi_R+2(1-x)^2.
$$

To see the extra term, retain the positive square of $L=\operatorname{sym}\sum_v B_v\otimes B_v$ when expanding $\|N_g+L\|^2$. Its exact value is
$$
3\|L\|^2=\sum_{v,w}(\operatorname{tr}B_vB_w)^2+
 2\sum_{v,w}\operatorname{tr}(B_vB_wB_vB_w).
$$
There are precisely two visible real slices. The second sum is at least $\operatorname{tr}[(B_1^2-B_2^2)^2]\ge0$ by the same Hilbert–Schmidt inequality. The first is the squared Hilbert–Schmidt norm of their two-by-two Gram matrix, hence $\|L\|^2\ge(\sum_v\|B_v\|^2)^2/6$. The part of the symmetric kernel with exactly one visible index has squared norm $3\sum_v\|B_v\|^2$; multiplying by $3!$ gives $h_1=18\sum_v\|B_v\|^2$. Multiply the new square by $(2/3)1944$ to obtain $2h_1^2/3$. Finally $J\ge2h-h_1$ and $0\le h_1\le h$, with
$$
\tfrac43(2h-h_1)^2+\tfrac23h_1^2-2h^2
=\tfrac23(h-h_1)(5h-3h_1)\ge0.
$$

The coefficient $2$ is sharp at every fixed $x<1$. For any unit remote cubic $q_R$, take fresh independent standard proper coordinates $A_j,B_j,Z$ and put $Y_N=N^{-1/2}\sum_{j=1}^N A_j\overline{B_j}$. Its variance is one, and its fourth moment is $2+2/N$, since the summands are independent and circular with fourth moment $4$. Thus $Z Y_N$ is a unit Wick cubic with fourth excess $2+4/N$. The cubic $Q=\sqrt{x}\,q_R+\sqrt{1-x}\,Z Y_N$ has remote fraction $x$, $h_1=J=1-x$, and independent centered circular summands, so its fourth excess is exactly $x^2\chi_R+(1-x)^2(2+4/N)$. Taking $N\to\infty$ gives the claimed sharpness. At $x=1$ the restriction is the whole cubic.

The checker also tests two anticommuting real symmetric slices on which the trace correction vanishes and the Gram lower bound is attained. It checks the finite-$N$ mixed example by conditioning on the $A_j$ and taking exact exponential moments.

## Restriction by a complex subspace

Fix a visible complex subspace of dimension $d\ge1$ and any ordered orthonormal basis for it. Starting with $Q_0=Q$, let $Q_j$ be the conditional expectation of $Q_{j-1}$ over its $j$th visible coordinate. Each $Q_j$ is a Wick cubic on the remaining coordinates or is zero. Set $v_j=\|Q_j\|_2^2$, $u_j=v_{j-1}-v_j\ge0$, and let $\Delta(P)=\mathbb E|P|^4-2\|P\|_2^4$. Applying the one-coordinate bound to $Q_{j-1}/\sqrt{v_{j-1}}$ and multiplying by $v_{j-1}^2$ gives $\Delta(Q_{j-1})-\Delta(Q_j)\ge2u_j^2$. A zero variance gives equality in that step. Summing and using Cauchy–Schwarz gives
$$
\Delta(Q)-\Delta(Q_d)\ge2\sum_{j=1}^d u_j^2\ge\frac{2}{d}(v_0-v_d)^2.
$$
The last bound depends only on the subspace. For sharpness at any fixed remote fraction $x<1$, take $Q=\sqrt{x}\,q_R+\sqrt{(1-x)/d}\sum_{j=1}^dZ_jY_{j,N}$ with independent copies of the preceding baths, disjoint from $q_R$, and visible plane spanned by the $Z_j$. Each step removes variance $(1-x)/d$. Additivity of fourth excess for independent centered circular variables gives $\Delta(Q)-\Delta(Q_d)=(1-x)^2(2+4/N)/d$. The limit attains the coefficient $2/d$; arbitrary variances follow by homogeneity.
