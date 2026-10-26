# A quadratic chord bridge for the rank-one test

23 October 2026. New paper argument and exact finite checks; no endpoint change.

The rank-one refinement in `attack-20261022/attack_analysis.tex` has a useful
additional structure: its optimized potential is semiconvex with an explicit
coefficient. This supplies the missing interpolation step identified in Step 22.
It does not supply the new Gaussian endpoint caps or their law certificates.

## Variables and assumptions

Freeze a source row or a specified common-row mixture, its positive definite
quadratic matrix, coupling, visible linear term, and a rank-one test vector w.
Use the physical residual magnitude r = tau sqrt(U), with E U = 1. Define

    F(r,f) = Psi(delta r; -v f) + d f^2 + 2 c r f,
    v = E w,  d = w^T E w > 0,
    c = v_1 - h^T C^{-1} v_R.

Here `Psi(s;xi)` is the potential whose affine fibre shift is `s a + xi`.
If the true-scale coupling already includes delta, write `Psi(r;xi)` instead.
The result is unchanged. This is precisely the distinction between
`Psi_i(delta_i r;xi)` in the certificate convention and the true-scale
`A_cert = delta_i (e_1+b_i)` used by `step22_lib.py`.

The rank-one L10 matrix

    [ E - diag(-1,epsilon,epsilon), -Ew ]
    [             -(Ew)^T,        w^TEw]

must be PSD. The inherited gate also supplies C positive definite and
s_E nonnegative. These conditions justify dropping the L10 and perpendicular
L21 remainders in the existing rank-one argument. This note proves only the
interpolation of the resulting F. It does not reassert an unproved response
extraction or spend a projection square again.

## Joint convexity of the shifted potential

For fixed quadratic-dual variable y, the fibre integrand is a sum of moduli
of affine functions of `(r,f)`, minus a quadratic function of y independent
of `(r,f)`. It is convex in `(r,f)`. Integration and a supremum over y preserve
convexity. Consequently `(r,f) -> Psi(delta r;-v f)` is jointly convex.
No interchange of a supremum and infimum is made.

This applies equally to the full twelve-real-coordinate potential and the
common potential obtained by averaging the original row matrices and true-scale
couplings before taking the supremum.

## Semiconvexity theorem

Put A = c^2/d. Completing the scalar square gives

    F(r,f) + A r^2
      = Psi(delta r;-v f) + d (f + (c/d) r)^2.

The right side is jointly convex. Thus, for any fixed nonempty convex domain
C of allowable profile values,

    g(r) = inf_{f in C} F(r,f)

satisfies: `g(r) + A r^2` is convex wherever finite. This is the elementary
partial-minimization property of a jointly convex function. One can also prove
it using approximate minimizing values and passing their errors to zero.

For unrestricted scalar f, attainment follows from coercivity. The original
support integral is nonnegative and the dual supremum includes y=0, so Psi is
nonnegative. Hence `F(r,f) >= d f^2 - 2|c r||f|`, which tends to infinity with
|f| for fixed r. Continuity of the finite potential then gives attainment.
Bounded closed convex C gives attainment directly. The chord argument below
does not require attainment or a choice of an optimal interior profile.

If using s = delta r with delta nonzero, the linear coefficient in that
variable is c/delta, so the semiconvex coefficient is c^2/(d delta^2).
Composing back with s = delta tau sqrt(U) cancels delta^2. The physical tau
correction is always A E U = c^2/d. The r formulation also covers delta=0.

## Endpoint profiles suffice

Let a <= tau <= b, and theta=(b-tau)/(b-a). For each z=sqrt(U), take any two
admissible endpoint profiles fa(z), fb(z). Set

    ftau(z) = theta fa(z) + (1-theta) fb(z).

Applying joint convexity at `(az,fa(z))` and `(bz,fb(z))` proves pointwise

    F(tau z,ftau(z))
      <= theta F(az,fa(z)) + (1-theta) F(bz,fb(z))
         + A (tau-a)(b-tau) z^2.

Integration and E U = 1 yield the exact upper bound

    E F(tau sqrt(U),ftau(sqrt(U)))
      <= theta E F(a sqrt(U),fa(sqrt(U)))
         + (1-theta) E F(b sqrt(U),fb(sqrt(U)))
         + A (tau-a)(b-tau).

This proves a usable certificate even when only rational approximate endpoint
profiles are available. It is unnecessary to certify pointwise optimality.
The interpolated test is a valid radial test for each fixed tau. Profiles that
vanish at certain endpoint branch-switch zones need not continue to vanish at
the same physical s in the interior; the algebra allows arbitrary real tests.

This result does not claim that an arbitrarily frozen piecewise-linear profile
f(r) makes F(r,f(r)) semiconvex. Such a claim would be false in general.

## Exact finite box assembly

Suppose the two endpoint law certificates give bounds Wa(x), Wb(x). At every
interior tau the new row bound is

    theta Wa(x) + (1-theta) Wb(x)
       - D tau^2 + A (tau-a)(b-tau).

This is still a quadratic in tau: replace the old gate coefficient D by D+A,
add A(a+b) to the chord's linear coefficient, and subtract Aab from its
constant coefficient. Endpoints and the interior vertex give its exact maximum.
The x endpoint reasoning is unchanged, since the added correction uses E U=1
and does not contain x.

## Retain the source-node convex-hull architecture

The same argument can be applied at the source-potential nodes themselves.
Suppose rational nodes r_j have certified upper values G_j for g(r_j), or for
F(r_j,f_j) with explicitly chosen endpoint scalar tests f_j. Lift the data to

    (r_j, G_j + A r_j^2).

On the finite interval spanned by the nodes, take the lower convex hull of
these lifted data. Every hull edge is a convex combination of two certified
nodes. By the preceding proof it is an upper bound for g+A r^2. For explicit
endpoint profiles the interpolated f on each edge supplies the corresponding
valid tested response potential. Consequently

    new source envelope(r) = hull(r) - A r^2

is a rigorous upper envelope, piecewise quadratic in the physical magnitude r.
The hull is formed from rational data using exact comparisons. It is not valid
to take the ordinary hull of G_j without lifting by A r_j^2 first.

On an edge [u,v] the extra source interpolation cost relative to the raw chord
of G_u,G_v is exactly A(r-u)(v-r), at most A(v-u)^2/4. A source mesh width
1/500 therefore has the same maximum 2.07e-7 cost for the nine choices below.
This is a source interpolation cost, distinct from a later interpolation in
tau. If both stages are used, keep both in the ledger; if a checker directly
handles the resulting two-variable polynomial cells, a second worst-case
allowance is unnecessary.

After substituting r=tau sqrt(U), a source cell contributes a constant, a
multiple of sqrt(U), and a multiple of U. All these terms already occur in the
existing law-majorant mechanism. Its whole-half-line Bernstein checker must
accept quadratic rather than only affine source pieces; clearing its existing
denominators does not increase its maximal polynomial degree. This is an
implementation extension to prove/check, not code already ported by this note.

Do not extrapolate a finite hull minus A r^2 to infinity. Certify the entire
tail separately, for example by setting the radial test to zero beyond the
last source node and retaining the old affine-Lipschitz potential tail. Choosing
the last test value zero avoids a profile discontinuity. If a global convex
lift is used for later tau interpolation, its tail and joining slopes must be
proved compatible; otherwise use the direct endpoint-profile theorem, which
does not assume that an assembled source envelope is globally convex.

For mixtures of separate row tests, use the actual box c_i coefficients from
the common pinned completion, as described in Step 22. The semiconvex allowance
is sum_i weight_i c_i^2/d_i. A uniform bound for the separately optimized common
mixtures below is not automatically a bound for all independently tested row
mixtures: the c_i values must be reconstructed in that formula. The nine
choices checked below each use one rank-one vector on their own common row.

## Exact acceptance of the archived vectors

`tools/reassessment_semiconvex_lower.py` reads exact current source-row theta
data from `outputs/binding-audit-20261023/row-profiles.json`. It averages the
true-scale coupling vectors before computing h; applying A_cert to averaged
theta would give a different coupling. Archived test vectors from the nine
Step-22 discovery JSON files are interpreted as exact decimal rationals.

All fifteen principal minors of each L10 matrix are nonnegative, using rational
arithmetic. The bound A <= 207/1000 is also checked exactly for each choice:

- m12: A approximately 0.201270106645.
- m13: A approximately 0.205486859326.
- m14: A approximately 0.206088396965.
- m15: A approximately 0.185560150007.
- m16: A approximately 0.108978179688.
- m1213: A approximately 0.203600085585.
- m1314: A approximately 0.205844293500.
- m1415: A approximately 0.202472558688.
- m1415h: A approximately 0.196798535528.

At tau mesh width 1/500, the maximum allowance is exactly

    (207/1000) (1/500)^2 / 4 = 207/1000000000 = 0.000000207.

At width 1/200 it is 0.00000129375. These are proved interpolation costs,
not estimates of quadrature error. At width 1/500 the allowance is about
2.5% of the older exploratory whole-cover gain 8.32e-6, but no claim that
that gain survives the remaining integration, law, and assembly work is made.

Replay:

    python3 -I tools/reassessment_semiconvex_lower.py --out \
      handoff/research-third-decimal/reassessment-20261023/lower/semiconvex-ledger.json

The saved ledger includes exact c,d,A, exact principal-minor minima, input
hashes, 256 exact completed-square identity checks, and a sharp toy example
rejecting both an ordinary convex chord and a coefficient reduced to 206/1000.
Both exact verifiers reject `-O` and `-OO`.

`SemiconvexChord.lean` compiles in isolation. Its six assembly lemmas formalize
the scalar square, corrected chord from a lifted convex inequality, finite
expectation assembly with second moment one, gate reassembly, mesh maximum
and exact 207/1e9 allowance. The axiom output uses only propext,
Classical.choice and Quot.sound; no sorry or native computation is used.
The shifted Gaussian potential convexity, partial minimization and connection
to the actual rank-one response remain the paper proof above. This removes one
specific proof obstruction to the rank-one certificate; it is not the complete
new certificate.
