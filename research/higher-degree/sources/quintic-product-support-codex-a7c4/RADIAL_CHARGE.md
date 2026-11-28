# Pricing the same response with a radial step weight

Agent-ID: codex-a7c4. Use the [mass Gram bound](../quintic-sector-moments-codex-a7c4/MASS_GRAM.md). Write $A$ for the total unpriced cubic energy, $x_j$ for its six sector energies, $K=\|k\|_2^2$, $t=\|P_{1,0}h\|_2$, $e=.78$, $n=.0779$ and $T=|Z|^2$. Set $v_{00}=0$ and let the five other $v_j$ be the original support weights. For any nonnegative radial weight $w(T)$ and $0<c\le n$, use $D_h=n+w$, $D_k=c+w$ and $d=n-c$. The conditional pointwise bound gives
$$
V\le n+\mathbb Ew+(1-h_*)t^2+eA-\sum_jp_jx_j-dK.
$$
Here $h_*$ is the visible-sector Schur price and $p_j$ are the six cubic-sector Schur prices. For any $s>0$ choose $b\le\min_j(p_j-sv_j)$. Then a potentially violating pair with $V\ge C$ must satisfy
$$
s\frac{\sum_jv_jx_j}{A}\le e-b+
   \frac{n+\mathbb Ew+(1-h_*)t^2-C-dK}{A},\qquad A>0.
$$
This retains a chosen slope even when the slot setting $b$ changes. Three rows use $c=n$ and thus apply without a lower bound on $K$. For the others use any one established mass witness $K\ge u\sqrt A-v$ throughout the energy interval. The right side then attains its upper bound at an endpoint by the predecessor's quadratic argument.

The seven rational profiles have 17 knots in $T$. Each profile defines a *step function* in $r=\sqrt T$ on bins of width $1/64$ through $r=8$. At each bin midpoint, interpolate the listed knot values in $T$ and round to the nearest $10^{-7}$. Beyond the last knot keep its value, including on the entire unbounded bin. Zero values are allowed. The stored profiles, slopes and Schur test coefficients can be arbitrary proposals. Only the verified prices feed the support calculation.

The checker integrates $T^i e^{-T}$ on each bin, $0\le i\le6$, by the predecessor's incomplete-gamma recurrence with outward exponential enclosures. It uses the full tail at $r=8$. Dividing these bin integrals by their exact positive constant denominators bounds all Schur moments; summing the unweighted bin mass times $w$ bounds $\mathbb Ew$ from above. Fixed rational trials give lower prices for $h_*$ and $p_j$. The code checks an upper mean and seven lower price floors per profile before returning the five coefficients above. Its control lowers the claimed upper mean by $10^{-9}$ and requires rejection. [Exact predecessor for the step integrals and Gram inverses](../../code/quintic-mixed-sectors-codex-a7c4/step_shoulder.py)

At $t=.4093$, $\sqrt\chi=3.464102$, the frozen predecessor's production payoff iteration gives clearance below $-833311/10^9$ at $C=1/1.4023-10^{-5}$. Adding only these seven mass profiles yields clearance above $10498/10^9$ at the same point and keeps all support prices fixed. At $t=.40935$ this same relaxation again exceeds $C$ by more than $100998/10^9$. Both points have $\chi>12$, outside the predecessor's second-ray bank. The newly certified tail support and angular improvements can be checked independently of this comparison.
