# Gaussian Schur bound for the holomorphic complex Gaussian kernel

This analytic lemma has been derived and independently reviewed within this research session. External review and Lean formalization remain outstanding. It applies to a complex symmetric 2 by 2 matrix R with I+Re(R) and I-Re(R) positive definite. The phase functions are arbitrary measurable functions of two complex Gaussian variables with modulus at most one. They need not be products over the real and imaginary coordinates.

Let A=(I-R^2)^(-1), C=R A. Fix a real positive number j, and put

    Z = Re(A) - j I,
    Cr = Re(C), Ci = Im(C),
    E = (Cr Z^(-1) Cr + Ci Z^(-1) Ci)/2,
    T = Z - Cr Z^(-1) Cr,
    W = 2T + E.

Assume Z+Cr and Z-Cr are positive definite. Then Z, T and W are positive definite, and E is positive semidefinite. The Schur bound is

    |H(R)| <= B_S(R),
    B_S(R)^2 = 1 / [64 j^4 |det(I-R^2)|^2 det(Z) det(W)].       (1)

Thus the squared modulus bound involves only scalar determinants, products and inverses of 2 by 2 matrices. No diagonalization or matrix square root is needed to verify (1).

## Proof with all normalization constants

Scale each real coordinate by sqrt(2), so each real Gaussian has covariance I. The original holomorphic density for one real copy (x,y in R^d, d=2) is

    (2 pi)^(-d) det(I-R^2)^(-1/2)
    exp[-x^T A x/2 - y^T A y/2 + x^T C y].

The full circular complex density is the tensor product of two identical such densities, one for real parts and one for imaginary parts. The chosen square-root branch does not matter for the norm estimate.

Let S=(2j)^(-1) I. Change the marginal reference measure from Lebesgue measure to the Gaussian probability measure of covariance S. Equivalently, divide the joint density by the square roots of the two marginal densities. This gives an operator on ordinary Lebesgue L2 with kernel

    L(x,y)=c exp[-x^T B x/2-y^T B y/2+x^T C y],
    B=A-jI, Re(B)=Z,
    c=(2pi)^(-d/2) det(S)^(1/2) det(I-R^2)^(-1/2).

The functions multiplied by the square roots of the reference Gaussian densities have L2 norm at most one. Therefore the full complex correlation has modulus at most ||L tensor L||_(2->2) = ||L||_(2->2)^2, even when the phase functions couple all coordinates.

Since Z is positive definite, the y integral in LL* is absolutely convergent. Its kernel is

    k(x,z)=a exp[-x^T D x/2-z^T conjugate(D) z/2+x^T Ec z],
    a=|c|^2 pi^(d/2)/sqrt(det Z),
    D=B-C Z^(-1) C/2,
    Ec=C Z^(-1) conjugate(C)/2.

C is symmetric, so Ec is Hermitian. Hence Re(Ec)=E is real symmetric positive semidefinite. Write Dr=Re(D). Then

    Dr-E = Z-Cr Z^(-1) Cr = T,
    Dr+T = 2T+E = W.

The condition Z+Cr>0 and Z-Cr>0 implies T>0 by taking the Schur complement of the positive block matrix with diagonal Z and off-diagonal Cr.

Taking the absolute value of k gives the positive symmetric kernel

    P(x,z)=a exp[-x^T Dr x/2-z^T Dr z/2+x^T E z].

Use the positive Schur weight w(x)=exp[-x^T T x/2]. Gaussian integration gives

    (P w)(x)/w(x)
      = a (2pi)^(d/2)/sqrt(det W)
        * exp[-x^T (E-E W^(-1) E) x/2]
      <= a (2pi)^(d/2)/sqrt(det W),

because W=E+2T>E>=0 implies E W^(-1) E <= E. The weighted Schur test therefore yields

    ||L||^2 = ||LL*|| <= ||P||
       <= det(S) / [2^(d/2) |det(I-R^2)| sqrt(det Z det W)].

For d=2 and det(S)=1/(4j^2), this is

    ||L||^2 <= 1/[8 j^2 |det(I-R^2)| sqrt(det Z det W)],

whose square is exactly (1). This is the bound for the full COMPLEX correlation, not for a single real copy.

All manipulations can first be applied to compactly supported test functions. The Schur bound supplies bounded extensions to L2; the original Gaussian density is absolutely integrable because I±Re(R)>0, so dominated convergence identifies the extension with the desired correlation for bounded measurable functions.

## Hardy tail consequence

Let R(t)=M diag(p(t),-tau(t)) M be the existing odd real polynomial preprocessing, with holomorphic kernel H(t)=sum_(k odd) h_k t^k. If the original Gaussian tube gates and the two new gates Z±Cr>0 hold on |t|=r>1, and the normalized circle mean of B_S(R(t))^2 is at most Q, then

    sum_(k>N) |h_k| <= sqrt(Q) r^(-N) / sqrt(r^4-1)

for odd N. The original tube gates extend to the interior by the harmonic maximum principle. The new Schur gates are only needed on the integration circle. They do not need to extend to the interior.

The formula is independent of the phase function's complexity. It applies equally to the original phase, the sixteen-step phase flow, and the polynomial-phase approximation.
