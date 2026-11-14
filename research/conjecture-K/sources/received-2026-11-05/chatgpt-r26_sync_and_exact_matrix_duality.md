<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-r26_sync_and_exact_matrix_duality.md (file dated 2026-11-05). Only this line was added. -->
# R26: synchronized status and exact scalar matrix duality

5 November 2026. This note does not prove R26 or Conjecture K.

## Sources and scope

The attached `Pasted text(20261105-070928).txt` is byte-for-byte identical to
`Pasted text(20261105-070758).txt`, the latest monograph retrieved from the
parallel research. The monograph and the available saved proof archives were
read. Retrieval supplied excerpts from the parallel chats, not their full
transcripts; browser security blocked full ChatGPT page access.

The Gaussian-factor, Wick-endpoint, integrated-envelope, fresh-reductions,
and envelope-audit results below are their documented results. Lightweight
exact algebra checks were replayed; this synchronization does not claim a new
replay of every interval box in all archives.

## Current mathematical boundary

Write q=X[c(|X|^2-2)+P], p=E|P|^2, u=2|c|^2+p and f=2|c|^2/u.
Throughout, Delta=B(u)-F(q) is the same-norm deficit, distinct from S-Lambda(q).

* The Gaussian-factor class sum_j X_j(Y* A_j Y-tr A_j), with the Gaussian
  vector X independent of Y, has the certified constant 0.239 on the three
  rows for 0.00551 <= u <= 0.0463. It does not cover arbitrary mixtures of
  the six shells or all polynomials without an explicitly displayed Wick term.
* For 0.03 <= u <= 0.0463 and f >= 15/16, the Wick-endpoint theorem gives
  C(q)^2 <= (49/211) Delta, for arbitrary centered independent P of finite
  variance. This is p <= u/16, not small Wick energy.
* For 1/16 <= f <= 15/16, the fixed envelope

      |T_c(z)-lambda(u)z|^2 <= H_{c,u}(z)(0.09+0.13|z|^2/p)

  would give C(q)^2 <= 0.22 Delta for arbitrary centered P. Its |z| >= 4 tail
  is proved. Its compact part is supported by floating computations, not yet
  certified on a continuum.
* For 0 < f < 1/16, the bridge to R23 remains open. The certified radial
  moment relaxation obstruction exceeds 0.246; it is an obstruction to that
  relaxation, not a counterexample to R26. Directional information matters.
* The corrected peak-row value is K(0.0463) in (0.166781,0.166783), where
  K(u)=-2uB''(u)-u^2B'''(u). The previously quoted 0.1913 is not this kernel.
* Exact extremality E is false. The conjectured 0.11 envelope E' remains
  unproved. Constants 0.239, 0.22 and 49/211 cannot imply a 0.11 bound.
* Mixed shells and several self-interacting drivers remain open. Conditioning
  driver by driver is not, by itself, a proof that the required family and
  independence assumptions survive.

The available audit archive additionally contains certified deterministic-shift
kernel tables: H=-g, P=Phi', G=g', U=-Phi''. These names must not be confused
with the benchmark B,J kernels. Those tables and their positive-integral
generator are useful inputs for a compact-region certificate of the fixed
envelope. Table coverage and interpolation error still require checking for
that new application.

## Exact scalar duality for the directional bound

Here is an additional proved simplification of the directional target.
For any real symmetric positive semidefinite matrices A,D of the same finite
size, define

\[
 L(A,D)=\max_{\|h\|=1}
       \left(\sqrt{h^TAh}+\sqrt{h^TDh}\right)^2.
\]

Then

\[
 \boxed{L(A,D)=\inf_{s>0}
 \lambda_{\max}\big((1+s)A+(1+s^{-1})D\big).}
\tag{1}
\]

If A and D are both nonzero, the infimum is attained. No commutation
assumption is required. Zero-matrix cases are limits as s tends to an endpoint.

### Proof

For every s>0 and h, the elementary inequality
2 sqrt(xy) <= sx+y/s, with x=h^TAh and y=h^TDh, gives the <= direction.

Assume A,D are nonzero. Put Q(s)=(1+s)A+(1+1/s)D and
phi(s)=lambda_max(Q(s)). This is convex because it is the supremum over unit
h of convex functions h^TQ(s)h. It tends to infinity at both endpoints:
phi(s)>=(1+s)||A|| and phi(s)>=(1+1/s)||D||. Choose a minimizer s_*.

Let V be the top eigenspace of Q(s_*). The one-sided derivatives of phi at
s_* are respectively the minimum and maximum of

    h^T(A-D/s_*^2)h

over unit h in V. This follows by differentiating the maximum of the smooth
Rayleigh quotients (or by the variational formula for the top eigenvalue).
At a minimum these two values straddle zero. The Rayleigh quotient of the
compression of A-D/s_*^2 to V fills the interval between its extremal
eigenvalues. Consequently some unit h_* in V satisfies

    h_*^T D h_* = s_*^2 h_*^T A h_*.

For this h_*, equality holds in the elementary inequality, and

    (sqrt(h_*^T A h_*)+sqrt(h_*^T D h_*))^2
      =h_*^TQ(s_*)h_*=phi(s_*).

This proves the reverse inequality. If A=0 or D=0, both sides equal the norm
of the other matrix, completing the proof.

## Application to R26

Use the established directional reduction, with E the size-biased Bregman
part of the deficit, M its controlled covariance matrix, a0 the realified
Wick contribution, and Delta=E+|c|^2K:

\[
 C(q)^2\le\max_{\|h\|=1}
 \left(|h^Ta_0|+\sqrt{E\,h^TMh}\right)^2.
\]

Take A=a0 a0^T and D=E M in (1). Thus the directional upper bound is EXACTLY

\[
 \inf_{s>0}\lambda_{\max}
 \left((1+s)a_0a_0^T+(1+s^{-1})EM\right).
\tag{2}
\]

The previously stated matrix condition was sufficient at any fixed s.
Optimizing s makes it equivalent to the directional target. This equivalence
does not make the preceding Cauchy-Schwarz bound an equality for C(q).

For A,D nonzero and t=kappa Delta, the target in (2) <= t is equivalent to
the existence of s>0 with Q(s) <= t I. For a real 2-by-2 symmetric Q, this
requires only

\[
 t-Q_{11}\ge0,\qquad t-Q_{22}\ge0,\qquad
 (t-Q_{11})(t-Q_{22})-Q_{12}^2\ge0.
\tag{3}
\]

These are suitable for rational/interval verification without an angular
grid or an eigenvalue square root. One rigorously verified choice of s per
parameter box is sufficient; numerical optimization merely proposes it.

There is also an exact search restriction. If a=||A||>0 and d=||D||>0,
feasibility forces t>max(a,d) and

\[
 \frac{d}{t-d}\le s\le\frac{t}{a}-1.
\tag{4}
\]

This follows from (1+s)A <= Q(s) <= tI and
(1+1/s)D <= Q(s) <= tI. An empty interval disproves this particular
directional target at the supplied A,D,t, not necessarily the content
inequality itself.

What remains is the substantive R26 estimate: uniform enclosures of E,M,a0
compatible with the conditional quadratic-form law and its directional
moments. Formula (2) removes optimization loss; it does not supply those
enclosures or certify either of the outstanding parameter regions.
