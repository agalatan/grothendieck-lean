# Exact fifth-chaos projection for normalized conditional-Gaussian responses

23 October 2026. Paper derivation. Repository history only; no other chats
or main-checkout commands. Work is isolated on codex/quintic-projection-20261023.
No numerical maximum or Grothendieck endpoint is asserted.

## 1. Main conclusion

Use independent proper complex Gaussian Z, X in C^m and Y in Sym²(C^m),
m>=2, with d=m(m+1)/2. Write

    RX=||X||², RY=||Y||²,
    q_m=X^T bar(M)X/sqrt(m(m+1)),
    G=sqrt(m(m+1))q_m/RX,

where the symmetric matrix M has diagonal entries Y_ii and off-diagonal
entries Y_ij/sqrt(2). Its Frobenius squared norm is RY. Exactly,

    RX~Gamma(m,1), G~CN(0,1), V~Gamma(d-1,1), Z~CN(0,1),
    independently, and RY=|G|²+V.

The actual full U(m)-invariant H_(3,2) space has dimension **13** for
m>=2, and dimension **10** at m=1. The special responses F(Z,G) use
only eight mutually orthogonal local-Hermite channels of that projection.
An exact conditional Mehler calculation gives their full finite signed
coefficient without assigning actual Gaussian degree one to G.

For the phase pair

    f=phase(Z+c H21(Z)+bG), g=phase(Z+c H21(Z)-bG),

define eight local coefficients below. Its actual fifth cross coefficient is

    s5_m=v²-kappa²(A²+B²)-A4*q²+B2*n²
                 +(1/d)*hN²-C2*ell²+D0*zN2²,            (1.1)

where

    kappa²=m/(m+1),
    A4=m/((m+1)(m+2)),
    B2=4(m-1)/((m+1)(m+2)),
    C2=12m/((m+1)(m+2)(m+3)),
    D0=24/(m(m+1)(m+2)(m+3)).                           (1.2)

The three-channel limit is

    s5_infinity=v²-A²-B²,
    |s5_m-s5_infinity|<=4/m.                            (1.3)

For m>=3 the sharper absolute error is B2<4/m. Thus a three-integral
directed certificate suffices to establish the finite sign at m=10^12,
with error below 4e-12. The identity, not a central-limit theorem,
justifies the finite transfer.

## 2. The complete invariant space and explicit stable polynomial bases

Let V=C^m, W=Sym²V, H=V⊕W, with auxiliary action

    X↦UX, M↦UMU^T, U in U(m).

The auxiliary center has weights one on V and two on W. Physical
simultaneous phase rotation of all original Gaussian coordinates is a
different action; q_m and G both have physical charge one.

Remote H22 is End_U(Sym²H). The three central-weight blocks decompose as

    weight 2: Sym²V=W;
    weight 3: V tensor W = S_(3)V ⊕ S_(2,1)V;
    weight 4: Sym²W = S_(4)V ⊕ S_(2,2)V.

For m>=2 all five listed irreducibles are nonzero, pairwise inequivalent
within each block, and have multiplicity one. Hence remote H22 has five
invariants. For remote H32, identify invariants with
Hom_U(Sym²H,Sym³H). Matching central weights gives

    weight 3: source V tensor W, target Sym³V;
              common irrep S_(3), multiplicity one;
    weight 4: source Sym²W, target Sym²V tensor W=W tensor W;
              W tensor W=S_(4)⊕S_(3,1)⊕S_(2,2),
              common irreps S_(4),S_(2,2), each once.

Thus the remote H32 invariant multiplicity is three. At m=1 the
two-row partitions vanish, leaving remote dimensions three for H22
and two for H32. Full U(m), rather than SU(m), is essential to this
central-weight argument.

Here are concrete bases, without an orthonormality claim. Wick ordering
is relative to the actual independent coordinates X,Y. Set

    Q=X^T bar(M)X, q=Q/sqrt(m(m+1)),
    L=X* Mbar(M)X, J=tr((Mbar(M))²).

A remote H22 basis for m>=2 is

    R1=RX²-2(m+1)RX+m(m+1),
    R2=(RX-m)(RY-d),
    R3=L-RY-(m+1)RX/2+d,
    R4=RY²-2(d+1)RY+d(d+1),
    R5=J-2(m+1)RY+(m+1)d.                              (2.1)

These are the Wick forms of RX², RX RY, L, RY², J. The symmetric Gaussian
covariance is

    E[M_ab bar(M_cd)]=(delta_ac delta_bd+delta_ad delta_bc)/2.

It gives E[Mbar(M)]=(m+1)I/2, E L=d, and E J=(m+1)d, yielding the
subtractions above. For R5, four single contractions give
2(m+1)RY and the double-contraction correction is (m+1)d. The mixed
leading forms RX RY,L are independent for m>=2, as are RY²,J; different
X/Y multidegrees separate the remaining blocks. This proves independence
in addition to the representation dimension count.

A remote H32 basis is

    U1=q(RX-m-2),
    U2=q(RY-d-1),
    U3=[X^T bar(M)Mbar(M)X-(m+1)Q]/sqrt(m(m+1)).          (2.2)

The first two are the Wick products q RX and q RY. In the third,
the two possible contractions of its one holomorphic Y slot with an
antiholomorphic Y slot each produce (m+1)Q/2. There are no X/Y
contractions because those are disjoint coordinate sets. U1 has a
different X/Y multidegree from U2,U3. For m>=2, varying a second diagonal
entry of M while keeping X=e1 separates the leading forms of U2,U3.
At m=1, U2=U3 and the two remaining forms span the remote invariant space.

Let Hpq denote normalized one-variable complex Hermites. The complete
full H32 invariant basis consists of

    H32(Z);                                                1 mode
    H21(Z) AX, H21(Z) AY;                                  2 modes
    Z Rj, j=1,...,5;                                       5 modes
    H11(Z) q;                                             1 mode
    H20(Z) bar(q);                                        1 mode
    U1,U2,U3.                                            3 modes

Here AX=(RX-m)/sqrt(m), AY=(RY-d)/sqrt(d). This follows by splitting
visible and remote bidegrees in H32; all remaining remote sectors have
nonzero central weight and no invariant. The total is 13. At m=1,
R3=R2, R5=R4 and U3=U2, leaving 10 independent modes. The particular
response F(Z,G) has zero or dependent coefficients in several of these
directions. Computing its exact projection through Mehler is simpler
than inverting their Gram matrix.

## 3. Conditional Mehler identity in the actual Gaussian space

Take an actual Gaussian Mehler coupling with real |rho|<1:

    Z'=rho Z+sqrt(1-rho²)Ztilde,
    X'=rho X+sqrt(1-rho²)Xtilde,
    Y'=rho Y+sqrt(1-rho²)Ytilde.

Write u(X)=Q(X)/RX as a unit vector in Sym²V, and set

    gamma=〈X,X'〉/sqrt(RX RX'),
    G=〈Y,u(X)〉, G'=〈Y',u(X')〉.

Conditional on X,X', G,G' are standard proper complex Gaussians with

    E[bar(G)G'|X,X']=rho〈u(X),u(X')〉=rho gamma².         (3.1)

They are independent of Z,Z'. The square is exact because the normalized
quadratic Veronese vector has inner product
〈Q(X),Q(X')〉=〈X,X'〉². No concentration of gamma is assumed.

Use normalized complex Hermites

    Hpq(w)=sum_(j=0..min(p,q))
      (-1)^j j! binom(p,j)binom(q,j) w^(p-j)bar(w)^(q-j)
      /sqrt(p!q!).

For a charge-one function F(Z,G), expand in the orthonormal product basis

    F=sum F_(ab;cd) Hab(Z)Hcd(G),
    F_(ab;cd)=〈Hab(Z)Hcd(G),F〉.

Only a-b+c-d=1 can occur. The conditional complex Hermite identity and
(3.1) give, for arbitrary such F,H in L²,

    E[bar(F(Z,G))H(Z',G')]
      =sum_(ab;cd) bar(F_(ab;cd)) H_(ab;cd)
          rho^(a+b+c+d) K_cd(rho),
    K_cd(rho)=E[gamma^(2c)bar(gamma)^(2d)].               (3.2)

The actual functions are physical charge one, so the left side also has
the actual Wick expansion

    sum_(k>=0) rho^(2k+1)〈P_(k+1,k)F,P_(k+1,k)H〉.       (3.3)

Comparing rho^5 will therefore produce the actual H32 coefficient.

There is no interchange problem hidden in that comparison. By Bessel
and Cauchy--Schwarz, sum|bar(F_alpha)H_alpha|<=||F||2||H||2. Since
|gamma|<=1, the terms of local total degree greater than five contribute
O(|rho|^6) uniformly. Only finitely many local degrees remain. Their
angular moments are real analytic near zero, as shown next, so extracting
their fifth coefficient is exact. Equivariance is essential when using
the real Mehler degree to identify specifically H32 rather than the sum
of all actual degree-five bidegrees.

## 4. Exact angular Taylor coefficients

At rho=0 write X=sqrt(R)U, X'=sqrt(S)V, with independent Gamma(m,1)
R,S and independent uniform unit vectors U,V. Put gamma=〈U,V〉 and
w=sqrt(RS)gamma. The exact joint correlated Gaussian density, relative
to this independent law, is

    L_rho=(1-rho²)^(-m)
       exp[-rho²(R+S)/(1-rho²)
               +rho(w+bar(w))/(1-rho²)].                (4.1)

The independent angular moments satisfy

    E[gamma^a bar(gamma)^b]=0 if a!=b,
    E|gamma|^(2j)=j!/(m)_j.                             (4.2)

They follow from the beta law |gamma|²~Beta(1,m-1), including its
degenerate m=1 interpretation. The needed radial moments are

    E RS=m²,
    E RS(R+S)=2m²(m+1),
    E(RS)²=m²(m+1)².

Expansion of the exact density gives

    K10(rho)=kappa² rho²+A4 rho⁴+O(rho⁶),
    K11(rho)=1/d+B2 rho²+O(rho⁴),
    K21(rho)=C2 rho²+O(rho⁴),
    K22(0)=D0.                                         (4.3)

For transparency, the only angularly surviving contributions for K10
are

    [rho²] K10=E[gamma² bar(w)²/2]=m/(m+1),
    [rho⁴] K10=E[gamma² {
       (m-R-S)bar(w)²/2+bar(w)²+w bar(w)³/6}]
       =m(m+2)/(m+1)-2m+m(m+1)/(m+2)
       =m/((m+1)(m+2)).

Similarly

    [rho²] K11
       =-m E|gamma|⁴+m² E|gamma|⁶
       =4(m-1)/((m+1)(m+2)),
    [rho²] K21=(m²/2)E|gamma|⁸
       =12m/((m+1)(m+2)(m+3)),
    K22(0)=E|gamma|⁸=24/(m(m+1)(m+2)(m+3)).

These are Taylor identities for finite m. Differentiation is justified
by Gaussian domination on any compact |rho|<=r0<1: derivatives of the
joint density are bounded by polynomials times an integrable Gaussian
quadratic form. Gamma itself is bounded by one. Parity under X'↦-X'
makes these angular moments even, explaining the displayed remainder
orders. No CLT or unproved uniform phase-tail estimate enters (4.3).

## 5. The eight local channels and the general bilinear bridge

Define local moments for any charge-one F(Z,G):

    q(F)=〈G,F〉,
    n(F)=〈Z H11(G),F〉,
    v(F)=〈H32(Z),F〉,
    A(F)=〈H11(Z)G,F〉,
    B(F)=〈H20(Z)bar(G),F〉,
    hN(F)=〈H21(Z)H11(G),F〉,
    ell(F)=〈H21(G),F〉,
    zN2(F)=〈Z H22(G),F〉.                               (5.1)

The eight local basis functions in (5.1) are orthonormal. Substitution
of (4.3) in (3.2), with the charge condition, gives exactly

    〈P32 F,P32 H〉
       =bar(vF)vH+kappa²[bar(AF)AH+bar(BF)BH]
        +A4 bar(qF)qH+B2 bar(nF)nH+(1/d)bar(hNF)hNH
        +C2 bar(ellF)ellH+D0 bar(zN2F)zN2H.             (5.2)

The only possible channels are those eight. For example a G10 local
factor has minimum actual degree three, because K10 starts with rho²;
a G11 factor contributes at degrees two and four through K11; G21
starts at actual degree five. Local indices with total degree <=5 but
different charge patterns either vanish by equivariance or have angular
order too high to contribute rho^5.

When H(Z,G)=F(Z,-G), each coefficient changes by (-1)^(c+d) in its G
Hermite degree. The G-odd channels q,A,B,ell therefore acquire negative
cross signs, while v,n,hN,zN2 keep positive signs. This proves (1.1).
The main real phase profiles also make all moments real by conjugation.

For general F,H, define the three-channel limit bilinear form

    C5_infinity(F,H)=bar(vF)vH+bar(AF)AH+bar(BF)BH.

Subtracting it from (5.2) is a diagonal multiplier in the eight local
orthonormal channels, with entries

    0,-1/(m+1),-1/(m+1),A4,B2,1/d,C2,D0.

Thus for disk-valued F,H,

    |C5_m(F,H)-C5_infinity(F,H)|
      <=max{1/(m+1),A4,B2,1/d,C2,D0}<=4/m.              (5.3)

For m>=3 the maximum is B2. At m=2 it is C2=2/5, still below 4/m.
For a sign-flipped pair one can also use separate one-sided errors:
positive error is at most max{1/(m+1),B2,1/d,D0}, and negative error
at most max{A4,C2}. No uncontrolled coefficient is set to zero.

The cubic identity generalizes to arbitrary F,H as

    〈P21 F,P21 H〉
       =bar(hF)hH+kappa² bar(qF)qH+(1/d)bar(nF)nH,
    h(F)=〈H21(Z),F〉.

Consequently the cubic finite/limit difference is at most
max{1/(m+1),1/d}<=1/(m+1) for m>=2. The first-chaos pairing agrees
exactly. Therefore a six-local-feature oracle for
P10-epsilon P21+eta P32 has the rigorous bridge

    |J_m(F,H)-J_infinity(F,H)|
       <=|epsilon|/(m+1)+4|eta|/m.                      (5.4)

This legitimizes any frozen charge-one bounded oracle responses as
actual finite Gaussian columns. It is a feasible-value transfer, not
a cap on all responses or a theorem that the oracle is globally optimal.

## 6. Three one-dimensional Bessel integrals sufficient for the sign

For F=phase(Z+cH21(Z)+bG), c real and b>0, put

    t=r[1+c(r²-2)/sqrt(2)]/b, x=t²/2,
    psi(t)=sqrt(pi)/2*t exp(-x)[I0(x)+I1(x)],
    zeta(t)=sqrt(pi)/2 exp(-x)I0(x),
    eta(t)=E[G phase(t+G)]= -sqrt(pi)/2 exp(-x)I1(x).

The eta identity follows from complex Gaussian integration by parts:
eta=psi'-zeta, and Bessel recurrence gives
psi'=sqrt(pi)/2 exp(-x)[I0(x)-I1(x)]. It is real-even and nonpositive.
For large |t| it is approximately -1/(2|t|), checking the sign.

With proper radial density 2r exp(-r²), the three moments are

    v=integral_0^infinity 2r² exp(-r²)
          (r⁴-6r²+6)/sqrt(12) psi(t) dr,
    A=integral_0^infinity 2r exp(-r²)(r²-1)zeta(t) dr,
    B=integral_0^infinity 2r³ exp(-r²)/sqrt(2) eta(t) dr. (6.1)

The signed t must be retained in psi. Gaussian integration and scaled
integer-order Bessel functions give entire contour callbacks as in the
cubic certificate. Simple full tails beyond R are

    |tail(v)| <= [Gamma(7/2,R²)+6Gamma(5/2,R²)
                              +6Gamma(3/2,R²)]/sqrt(12),
    |tail(A)| <= (sqrt(pi)/2)[Gamma(2,R²)+Gamma(1,R²)],
    |tail(B)| <= sqrt(pi/8) Gamma(2,R²).                 (6.2)

They use |psi|<=1, |zeta|<=sqrt(pi)/2 and |eta|<=sqrt(pi)/2.
A directed certificate for v²-A²-B², widened by 4/m, supplies the
actual finite sign for either rational c=b profile from the cubic
ceiling. This does not require integrating n,hN,ell,zN2.

## 7. Quantitative status and next falsifier

The analytic identities above are exact for finite m. An independent
128-bit Arb replay, including (6.2), supplies these coefficient balls:

    c=b=119623/500000:
      v= .1453848245372687159 +/-2.49e-20,
      A=-.1413612799888708503 +/-4.38e-20,
      B=-.0720889871937787722 +/-7.82e-20,
      s5_infinity=-.0040430863489843264 +/-3.35e-20;

    c=b=14953/62500:
      v= .1453839405396088523 +/-4.96e-20,
      A=-.1413625425393473604 +/-2.92e-20,
      B=-.0720894401381678196 +/-3.10e-20,
      s5_infinity=-.0040437656457987513 +/-6.46e-20.

The finite rational enclosure uses the sharper separate positive and
negative errors from section 5. At m=10^12 both actual finite coefficients
satisfy the strict certified inequalities

    -.004045 < s5_m < -.004042.                          (7.1)

The same inequalities hold for the exact zero-cubic convex payoff mixture,
because its actual finite mixing weight lies between zero and one.
Thus the signed fifth coordinate is genuinely nonzero; the cubic-zero
mixture does not extend its constant floor to arbitrary fifth multipliers.

The production verifier is `tools/verify_quintic_coefficient.py`, with
input `tools/quintic_sign.json`. Its fresh replay, all source hashes, and
`MEHLER_AUDIT.md` are included in the output package. Run:

```sh
python -I tools/verify_quintic_coefficient.py tools/quintic_sign.json --out sign-replay.json
```

The related three-response cancellation verifier is
`tools/verify_quintic_bank.py`, input `tools/quintic_bank.json`. The frozen
endpoint certificate and all its original hashed dependencies are under
`research/quintic_projection_20261023/`. See the continuation report for
exact proof boundaries and replay commands. Historical prototype hashes
are preserved in those source-specific replays; the package manifest gives
the production source hashes.

These are external exact integral certificates under the analytic
projection and Bessel identities. No completed Lean formalization of
the new thirteen-mode representation or Mehler argument is claimed.

A negative fifth cross coefficient means a positive eta lowers these
particular adversary payoffs. It does not supply a global norm upper cap:
a different response can become active, and the old endpoint obstruction
already shows substantial higher-chaos mass. The immediate checkable
experiment is actual-response separation with both cubic and fifth
coordinates, using (5.4) to transfer every frozen oracle column. The first
falsifier is a new actual response restoring the old support level after
eta is introduced. The complete thirteen-mode invariant projection must
be retained if the optimizer is allowed general finite invariant responses;
the six local features describe a legitimate inner family, not all responses.


## 8. Conjugation and phase-zero convention for the numerical oracles

Throughout, define phase(0)=0. This is disk-valued and charge-one even
when a recursively defined numerator vanishes on a set of positive measure.
The analytic bridge does not require unimodularity or differentiability.

For a complex response F define F^sharp(Z,G)=conj(F(conj(Z),conj(G))).
The actual Hermite projectors commute with this reflection. Mixing the
pair (F,H) equally with (F^sharp,H^sharp) replaces every mixed coefficient
by its real part and is a genuine probability mixture of kernels. All
real spectra reported by the complex-coefficient numerical tools refer
to this mixture. The endpoint likewise becomes Re E[conj(F)H].
For a spectral payoff its real part is also a feasible lower value for
the original absolute scalar norm.

A frozen phase-feedback circuit only combines these local features and
the previous charge-one phases. Induction preserves measurability, disk
boundedness and charge. Thus (5.4) applies to it, without any claim that
its full tail is determined by the retained local coefficients.
