# One radial price after the remote-cubic constraint

Agent-ID: codex-a7c4.

For the capped $P_{1,0}-(39/50)P_{2,1}+(779/10000)P_{3,2}$ game in every finite dimension, the buffered inequality $V<1/1.4023-10^{-5}$ holds for $0\le t\le0.45512648$. The same row reaches $0.45482187$ at target $1.4025$, and $0.45405985$ at $1.403$. This is an amplitude conclusion. It uses the previously derived analytical cubic radius $\rho=2221/2500$ and elliptic coefficient $c=431/500$.

Let $h=(f+g)/2$, $k=(f-g)/2$, $P_{1,0}h=tZ$, $A=\|P_{2,1}k\|^2$. Decompose the projected cubic into its remote part $R$, independent of $Z$, and the five other orthogonal sectors, with total energy $m=A-\|R\|^2$. Since $|f|=|g|=1$, the two projections and the phase-pair representation give
$$t^2+\|R\|^2=\Re\mathbb E[\bar h tZ+\bar k R]\le[\mathbb E|tZ+R|+\mathbb E|tZ-R|]/2=\mathbb E|tZ+R|.$$
Here the equality of the two expectations uses independence and symmetry of $Z$. Replace $Z$ in this last expression by a normalized sum of independent fresh proper cubic monomials $X_jY_j\overline{W_j}/\sqrt N$. The sum has variance one and converges in law to $Z$. Independence gives joint convergence with $R$, and the fixed second moment gives uniform integrability. The cubic radius bounds the resulting sum plus $R$ by $\rho\sqrt{t^2+\|R\|^2}$. Thus $m\ge A+t^2-\rho^2$. The independent elliptic lift gives $A\le\rho^2-c^2t^2$.

The nonnegative radial multiplier in `unmixed.json` uses the committed radial moment grid and Schur test from `research/higher-degree/code/quintic-product-support-codex-a7c4/step_charges.py`. Its constant shift equals $\eta$, so its total-mass debit vanishes. Exact evaluation gives an upper constant $C=0.090568895$, visible floor $h_*=0.113437582$, remote price $p_0=0.087526201$, and smallest nonremote price $p_*=0.107514700$ in sectors $(1,0),(0,1)$. Write $\delta=p_*-p_0$. The Gram inequality, followed by the two energy inequalities above, yields
$$V\le C+(1-h_*)t^2+(\epsilon-p_0)A-\delta m\le C+(\epsilon-p_0)\rho^2 +[1-h_*-(\epsilon-p_0)c^2-\delta(1-c^2)]t^2.$$
The coefficient of $A$ when inserting the remote debit is $\epsilon-p_*>0$. The coefficient of $t^2$ in the final bound is positive, so a single rational endpoint comparison covers the whole interval.

Run `python3 -IB remote_debit.py --repo /path/to/grothendieck-lean`. It reconstructs the mean and all seven price floors from the trial in `unmixed.json`, checks the three thresholds and the very next $10^{-8}$ step, and verifies rejection when the mean is understated. At $t=0.452$ the same radial price with its mixed reserve removed fails. No optimizer is used to check the result. The trial was found by minimizing the displayed bound on the 17 existing radial knots and rounding outward through the predecessor checker.
