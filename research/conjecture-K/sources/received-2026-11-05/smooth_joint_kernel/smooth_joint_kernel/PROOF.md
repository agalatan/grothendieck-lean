<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/smooth_joint_kernel/smooth_joint_kernel/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# A regular integral for the joint A/B Hessian, with a nonzero-shift certificate

Scope: the signed infinitesimal A/B target is certified at the peak row,
uniformly for constant-shift modulus x in [.099,.101]. This is not a
uniform theorem for all x, not a finite-amplitude bound, and not Conjecture K.

## Removing the moving singularity exactly

Push forward visible Gaussian measure under y=L(z)=z(a+b|z|^2). Its planar
density is

rho_L(y)=exp(-t)/[pi(a+bt)(a+3bt)], |y|=sqrt(t)(a+bt).

For real shift x>=0, use polar coordinates about y+x=0:

    y=R exp(i psi)-x,  R>=0, 0<=psi<2pi.

The norm Hessian is (Im[h exp(-i psi)])^2/R. The planar area element is
R dR dpsi. The factors cancel exactly. Therefore the quadratic coefficient
of 2 E|L+x+s h| is

    integral rho_L(R exp(i psi)-x)
             (Im[h(R exp(i psi)-x) exp(-i psi)])^2 dR dpsi.

There is no inverse-distance singularity in this representation. The
increment fields, as functions of y, are

    h_A=t-1,
    h_B=y^2/[sqrt(2)(a+bt)^2],

with real coefficient directions h_A,i h_A,h_B,-i h_B. The opposite sign
in the last direction is because the B-shell uses conjugate(r_B).

The radial inverse is explicit. With r=sqrt(t),

    r=2sqrt(a/(3b))*sinh((1/3)asinh(3sqrt(3b)|y|/(2a^(3/2)))).

This inverse and the increment fields are smooth as functions of the two
real coordinates of y; the displayed radial formula is evaluated directly
with real interval arithmetic. No complex analytic integration claim is used.

Reflection psi -> -psi splits the real and imaginary coefficient blocks.
Writing y=yr+i yi, B=br+i bi, A=t-1, the four real features are

    v_re=(-A sin(psi), bi cos(psi)-br sin(psi)),
    v_im=( A cos(psi),-br cos(psi)-bi sin(psi)).

The two gain matrices are integrals of rho_L times these outer products.
The target is p I-K >= M, M=[[.24,.118],[.118,.26]].

## Certificate

verify.py encloses x in [.099,.101] in one interval. It partitions R in
[0,20] using quadratic endpoints 20 j^2/N^2, and psi in [0,pi] uniformly;
the reflection symmetry gives a factor two. Default N=1024. Each entry of
each outer product is enclosed over the full R,psi,x box and multiplied by
the exact R and angular interval lengths. All arithmetic uses Arb at 80 bits.

For the tail R>20, |y|>=20-.101>sqrt(19)(a+19b), hence t>19. The matrix tail
has operator norm bounded by its trace and, conservatively, by

    (2/20) E[(T-1)^2+T^2/2; T>19]
      = .1 exp(-19)[1.5(19^2+2*19+2)-2(19+1)+1].

To see this bound, return to y-plane coordinates: 1/|y+x|<=1/20, and the
sum of the squared real coefficient fields is at most 2[(T-1)^2+T^2/2].
The checker subtracts this tail allowance from each diagonal of p I-K-M.
It proves both remaining 2x2 matrices positive definite through positive
diagonal entries and determinant. Interval off-diagonal entries are retained.

Replay: python verify.py (python-flint required).

The successful replay certifies the entire x interval, not sampled points.
It does not cover the full law of any nonzero unbounded cubic by itself.
Its purpose is to validate a regular integration route for the all-shift
matrix-kernel target. The included explore.py is ordinary floating-point
exploration; in particular its evidence against zero-shift matrix dominance
is not a separate interval certificate.
