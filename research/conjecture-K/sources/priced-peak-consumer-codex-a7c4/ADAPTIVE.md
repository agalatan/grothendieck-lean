# Seven energy-dependent peak profiles on the lower-central interval

Agent-ID: codex-a7c4. Row 8.13c, task #790. At the single witness $\varepsilon=94/125$ the row value is strictly below $713245/10^6$ throughout $0.8372\le t\le0.8393$, in every finite dimension, with all six cubic sectors and arbitrary sharing. Together with the [three upper slabs](PROOF.md) this covers $[.8372,.8635]$. The exterior of 8.12 leaves $[.751,.8372]$ to close. The reciprocal $200000/142649$ remains conditional on that interval. This extension has grade **P + C, author only** and uses the inputs of 8.13a, including the author-only rows 3.3a and 3.5a.

## Choosing the visible profile

Fix the actual bounded responses $f_+,f_-$ and their average and half-difference $h,k$. The witness fixes $G=\varepsilon P_{2,1}k$, with $P_{1,0}h=tZ$. Denote the squared norms of its remote, two even and three odd components by $U,V,W$, respectively. These are numbers determined by the response. The row inequality 2.1 with the retained functional 2.10a holds for this $G$ for every pair of visible coefficients $(\ell,\beta)$. We may select $(\mu\ell_0,\mu\beta_0)$ from $U,V$. That choice is constant throughout the expectation. [Row inequality and retained functional](../../STATUS.md)

Use the seven increasing scales in the table. Define $E=.0463$, $K=.080051$. Take the first scale such that $U\le\mu^2 E$ and $U+V\le\mu^2 K$. To see that a scale exists, let $H_{\rm ph}=\varepsilon^2(\pi_{\rm hi}/4-.8372^2)$. Row 3.5a gives $U\le H_{\rm ph}$ on this amplitude interval. Row 2.12b gives $3U/4+V\le3H_{\rm ph}/2$, hence $U+V\le7H_{\rm ph}/4$. The last scale covers both maxima. [Sharp radius](../buffered-rice-codex-a7c4/PROOF.md) · [Response ellipsoid](../progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md)

## Pricing a layer

At scale $\mu$ write $u=U/\mu^2$, $v=V/\mu^2$, $w=W/\mu^2$, $H=H_{\rm ph}/\mu^2$. By construction $u\le E$, $u+v\le K$. In these units the explicit trial of 7.5.13 incurs the increment $(\mu-1)\|\xi_*\|^2-p(u+v+w)$ over its original peak value, with $p=\mu/\varepsilon-p_0$. Its squared norm is at most $.452(v+w)$ because $\xi_*=-.6(r_A+.5053r_B)-.28\nu Z$ and the two summands are orthogonal. Thus the increment is at most $-pu-zv$, with $z=p-.452\max(0,\mu-1)$. The checker verifies $p\ge z\ge0$ at every scale. In particular at $.9987$ the norm term itself is nonpositive. This pays the odd energy on every layer. [Trial and signed-square bound](PROOF.md)

For each closed KAST cell $[u_l,u_h]\times[v_l,v_h]$ meeting $u\le H$, $3u/4+v\le3H/2$, the normalized energies satisfy
$$
u\le u_m=\min(u_h,H,2H-4v_l/3),\qquad
u+v\le t_m=\min(u_m+v_h,3H/2+u_m/4,K).
$$
If $\nu$ is the preceding scale (zero for the first), every response assigned to the current scale failed at least one of its predecessor's two caps. A cell can therefore be discarded if **both** $u_m<(\nu/\mu)^2 E$ and $t_m<(\nu/\mu)^2 K$. Equality stays in the check, covering handoffs. The closed cells from 8.13a cover the normalized domain. Each retained cell has an upper bound $d$ for the fixed trial minus $S$ before repricing. The layer upper bound is
$$
\max_{t\in\{.8372,.8393\}}(t^2-2\mu\ell_0t)
+2(\mu\beta_0)^2/\varepsilon+\mu\bigl(S_{\rm hi}+\max_{\rm retained}(d-pu_l-zv_l)\bigr).
$$
Convexity gives the endpoint maximum. The cell construction and the outward benchmark are shared with the three upper slabs.

| Scale | Retained cells | Clearance below $.713245$, rounded down in millionths |
|---:|---:|---:|
| .9987 | 1471 | 6.683996 |
| 1.0097 | 173 | 5.445747 |
| 1.0131 | 96 | 5.132511 |
| 1.0145 | 51 | 5.050840 |
| 1.0155 | 29 | 7.925049 |
| 1.016 | 29 | 5.379187 |
| 1.028 | 5 | 1254.347668 |

Run `python3 -IB research/conjecture-K/code/priced-peak-consumer-codex-a7c4/adaptive.py` from the repository root. The [exact replay](../../code/priced-peak-consumer-codex-a7c4/adaptive.py) rejects omission of the final scale, use of the final scale alone, and a negative shell price. The two former controls distinguish coverage of the physical energies from sufficient clearance on the layers.
