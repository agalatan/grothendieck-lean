# Fixed energy with an arbitrary remote orientation

Agent-ID: codex-a7c4. In the [random-amplitude result](RANDOM_AMPLITUDE.md), suppose the visible coefficient is a fixed scalar \(\sqrt x\) and the other coefficient is \(\sqrt p\,U\), where \(p=1-x\) and \(\|U\|=1\) almost surely. Then the same exact maximum holds for **every** law of \(U\) invariant as a function under common physical rotation of its Gaussian inputs. In particular \(\mathbb E U\) can be nonzero. The family includes \(U=\operatorname{sgn}(|B|^2-1)\), whose two values have different probabilities. The reciprocal optimum remains between \(1.40397477\) and \(1.40397478\). This extension keeps the visible coefficient fixed. The random-amplitude theorem permits both coefficients to vary jointly under its antipodal hypothesis.

Use \(a_0,a_1,a_2,\nu,e\) from the [fixed-amplitude scalar estimate](GAUSSIAN_DRIVER_BOUND.md), \(\alpha=e+\nu\), \(m=\|\mathbb EU\|^2\), \(s=\mathbb E|\langle U,U'\rangle|^2\) for an independent copy, and \(c_k=\|P_kU\|_{L^2}^2\). Reflection of the fresh sign-changing Gaussian coordinates interchanges the two responses and ensures every unrotated payoff is real. Common physical rotation gives charge one.

## Positive payoff

The first signed content is now \(a_0(x-pm)\). At degree three the single-slot coefficient is \(-a_0p c_2\). In the three-slot constant term the three negative components with one \(U\) have squared mean \(x^2pm\) each. Two positive terms with one \(U\) and one \(\overline U\) contribute \(2xp^2s\). The third two-slot mean is also nonnegative. The negative term with three copies costs at most \(p^3s\), since its squared mean is bounded by \(\mathbb E|\langle U,U'\rangle|^3\le s\). Hence
\[
 \Delta_3\ge\Delta_{3,*}+a_0p(1-c_2)-3a_1x^2pm+a_1p^2(2x-p)s .
\]

At degree five the negative single-slot amount is at most \(a_0p(1-c_2)\). The three negative degree-two terms with one \(U\) sum to \(3a_1x^2p c_2\le3a_1x^2p\), already allowed in \(\Delta_{5,*}=a_2x^5-3a_1x^2p\). The three-\(U\) degree-two term costs at most \(a_1p^3\). In the five-slot constant term there are five one-\(U\) means of squared norm \(x^4pm\) each. There are six positive balanced two-slot terms contributing \(6x^3p^2s\). Each of the ten three-slot and the one five-slot mean has squared norm, before its amplitude factor, at most \(s\) by the same independent-copy inequality. Dropping the other positive terms gives
\[
 \Delta_5\ge\Delta_{5,*}-a_0p(1-c_2)-a_1p^3
       -5a_2x^4pm+a_2p^2(6x^3-10x^2p-p^3)s .
\]

The first-chaos penalty on \(pm\) in the signed real objective has coefficient \(a_0[(1-w)(1-\nu)+w]\). This pays for the two displayed one-slot terms for every \(d\le(1-w)\nu\), since \(3\alpha/8+15\nu/64<1-\nu\). Likewise \(d\le(1-w)\alpha\) pays for \(a_0p(1-c_2)\). For \(x\ge1/2\), \(2x-p\ge1/2\) and \(10x^2p+p^3-6x^3\le11\). Therefore \(\alpha/2>11(3/8)\nu\) absorbs the full remaining \(s\)-term. The scalar proof applies unchanged.

For \(x\le1/2\) take \(s\le1\) and pay the additional \((1-w)\alpha a_1p^3+d a_2(10x^2p^3+p^5)\) over the scalar envelope. The replay checks it on 64 closed intervals for \(w=0,\ d=0,\nu\). The clearance at either test exceeds .015. Affine interpolation in \(d/(1-w)\), followed by the term \(wa_0x\le wa_0\), covers the full coefficient triangle; \(w=1\) is immediate.

## Negative payoff

Replacing \(g\) by \(-g\) negates the real payoff and exchanges the two Gaussian slots. In the resulting positive-payoff problem the negative slot is **deterministic**. Write \(p'\) for its squared norm and \(x'=1-p'\). Its first-chaos penalty is exactly \(a_0[(1-w)(1-\nu)+w]p'\). Repeat the variance proof of the random-amplitude result, allowing all odd-slot tensor means in addition. At degree three their sum of squared norms is at most \(3x'^2p'+p'^3\le3p'\); at degree five it is at most \(5x'^4p'+10x'^2p'^3+p'^5\le16p'\). These bounds use only \(\|\mathbb E T\|^2\le\mathbb E\|T\|^2\) on each component and preserve every other variance and remote energy debit in that proof. The first-chaos penalty pays for both sums because \(3\alpha/8+16(3/64)\nu<1-\nu\). Thus the same scalar cap bounds the negated payoff. A common visible unit vector with \(x=1\) attains the cap.

~~~sh
python3 -IB -O experiments/quintic-signed/code/unbalanced_driver.py
~~~
