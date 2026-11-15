<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/joint_ab_uniform_reduction/joint_ab_uniform_reduction/REDUCTION.md (file dated 2026-11-05). Only this line was added. -->
# Two scalar matrix kernels for the infinitesimal signed A/B bound

This note proves an exact reduction, not the target kernel inequalities.
The included scripts are ordinary floating-point exploration, not certificates.

Let a=l-2b, p=1/eps, R=sqrt(t)(a+bt), A=t-1, D=t/sqrt(2), and x>=0.
Use the probability measure e^-t dt dtheta/(2pi), and set

    V=R exp(i theta)+x.

Define real vectors

    v_re=(-A R sin(theta), D[R sin(theta)+x sin(2theta)]),
    v_im=(A[R cos(theta)+x], -D[R cos(theta)+x cos(2theta)]),

and real symmetric matrices

    K_re(x)=E[v_re v_re^T/|V|^3],
    K_im(x)=E[v_im v_im^T/|V|^3].

For constant complex r_A=alpha+i gamma and r_B=beta+i delta, let
h=A r_A+D exp(2i theta)conj(r_B). The quadratic coefficient of
2 E|V+s h| is exactly

    (alpha,beta) K_re(x) (alpha,beta)^T
      +(gamma,delta) K_im(x) (gamma,delta)^T.

Proof: the second differential of the complex norm is
(Im[h conj(V)])^2/|V|^3. The two vectors above are the coefficients of
Im[h conj(V)] in the real and imaginary parts of r_A,r_B. Under theta -> -theta,
v_re is odd and v_im is even, so their cross block integrates to zero.
The singularity at V=0 is locally at worst a constant times 1/|V|, hence
integrable in the two visible real dimensions at any fixed x. At x=0 the
radial singularity is likewise integrable.

For arbitrary complex q, rotate z and both r_A,r_B by the phase of q.
This makes q real nonnegative and preserves Re[r_A conj(r_B)] and the
norms. Consequently the pointwise-in-remote-coordinates bounds

    K_re(x) <= p I - M,  K_im(x) <= p I - M, for every x>=0,
    M = [[.24,.118],[.118,.26]],                         (TARGET)

would prove the signed infinitesimal bound for EVERY remote cubic q and
EVERY shared pair of linear forms, with no remote energy restriction.
This follows by applying the matrix bounds conditionally on the remote
coordinates, then integrating. Appropriate differentiation under expectation
can equivalently be formulated through second variations once domination is
established; the scalar kernel identities themselves are unconditional.

At x=0 both matrices are the same, and the previous signed Hessian certificate
proves TARGET with at least .07 I of slack at all three rows. Exploration at
the peak row over 71 shifts from zero through 5 found no violation; coarse
quadrature near the moving singularity is not adequate for certification.
The 150 random cubic scan is also positive but has no rigorous uniform meaning.

A kernel certificate must handle the moving point V=0 explicitly, for example
by removing a small disk in the L-plane, bounding its matrix integral using
the smooth pushed-forward density and local increment bounds, and enclosing
the complement by interval integration. Neither script does this.

Even certifying TARGET would settle only the infinitesimal bound at remote
bases q. A finite-amplitude A/B path has base q+s(A+B), which depends on z
and cannot be represented by the same constant-shift parameter x. A separate
path estimate is still required. This reduction does not settle J or K.
