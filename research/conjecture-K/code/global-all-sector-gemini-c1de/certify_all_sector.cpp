// Agent-ID: gemini-c1de. Refs #436.
// Global All-Sector Pointwise Certification of Conjecture K: F_joint(c*) <= 0 on ALL of C^6.
// Self-contained outward-rounded C++17 interval arithmetic (-ffp-contract=off, -frounding-math, FE_UPWARD).
//
// Proves for ALL (q, r_A, r_B, Q, P, nu) in C^6 (reduced WLOG by exact sample-dependent U(1)
// rotation z_1 = e^{i phi} zeta and conjugation symmetry to w = |q| >= 0, Im(A) >= 0) with the
// global phase-invariant rational visible shift c* = -(7/25) nu and zero-mean compensating form
// C_inv(Q, nu) = 2 * c_1 * Re(Q conj(nu)) (c_1 = -11/20 - p*(-7/25) = -6801/37820, E[C_inv] = 0):
//
//   F_joint(c*) := R_joint(L + w, K, O') + |c*|^2 - B_P(w, A, B) - p*omega - C_inv(Q, nu) <= 0
//
// via three self-contained parts + exact rational audit in verify.py:
//   Part 1: Potential exteriors on [0, 8] (240 amplitude slabs on [0, 11/8] -> S_r >= 25/16 via
//           constant pivot mu_0 = 61/50; 272 shift slabs on [11/8, 8] -> both even & odd L=1
//           potentials pass; w >= 8 proved analytically in zero-float exact rationals in verify.py).
//   Part 2: Smooth-Split H_{5,delta} + zero-overlap local pullback origin strip (244 exact-dyadic
//           slabs on [0, 11/8]) -> M_odd(w, v; 0) <= B_odd for all 0 <= ||v||_2 <= s_odd(w)
//           (C_0 = 0 identically, closing via Global (P) of 7.4.16).
//   Part 3: Adaptive 5D Box5 bulk cover (98 exact-dyadic slabs on [0, 11/8], s_odd(w) <= ||v||_2 <= 5/4,
//           Im A >= 0, with on-demand w-bisection near the origin shell), pairing Weighted Cauchy-Schwarz
//           U_WCS (for Rem(w, v)) with the Sharp Anisotropic Capped 2-Sign Inequality (radial polynomial
//           q(T) = sig2 + T*(c0 + 2*c1*f_nu + c2*f_nu^2) >= sig2) and 2nd-order cell-exact 2x2 factored
//           integration of M_odd(w, v; q) (using ||D_X A||_op <= 1/mu^2 and lambda_max(D_X^2 A[h,h]) <= 2/mu^3).

#pragma STDC FP_CONTRACT OFF

#ifdef NDEBUG
#error "certify_all_sector.cpp must not be compiled with -DNDEBUG (interval and rounding assertions are required)"
#endif

#include <algorithm>
#include <array>
#include <atomic>
#include <cassert>
#include <cfenv>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <map>
#include <mutex>
#include <sstream>
#include <string>
#include <thread>
#include <unordered_map>
#include <vector>

#if defined(__FMA__)
#warning "Compiling with FMA enabled; ensure -ffp-contract=off is passed."
#endif

// ============================================================================
// 1. Outward-rounded IEEE-754 interval arithmetic (requires FE_UPWARD per thread)
// ============================================================================
static inline void set_fe_upward() {
  if (std::fesetround(FE_UPWARD) != 0 || std::fegetround() != FE_UPWARD) {
    std::fprintf(stderr, "FATAL: failed to enable FE_UPWARD rounding mode\n");
    std::abort();
  }
}
static inline void require_fe_upward() {
  if (std::fegetround() != FE_UPWARD) {
    std::fprintf(stderr, "FATAL: rounding mode is not FE_UPWARD\n");
    std::abort();
  }
}

struct I {
  double l, h;
  I() : l(0.0), h(0.0) {}
  explicit I(double x) : l(x), h(x) {}
  I(double lo, double hi) : l(lo), h(hi) { assert(lo <= hi); }
};

static inline double fp_b(double x) {
#if defined(__aarch64__)
  asm volatile("" : "+w"(x));
  return x;
#elif defined(__x86_64__)
  asm volatile("" : "+x"(x));
  return x;
#else
  volatile double v = x;
  return v;
#endif
}

static inline double add_up(double a, double b) { return fp_b(fp_b(a) + fp_b(b)); }
static inline double add_dn(double a, double b) { return -fp_b(fp_b(-a) + fp_b(-b)); }
static inline double sub_up(double a, double b) { return fp_b(fp_b(a) + fp_b(-b)); }
static inline double sub_dn(double a, double b) { return -fp_b(fp_b(-a) + fp_b(b)); }
static inline double mul_up(double a, double b) { return fp_b(fp_b(a) * fp_b(b)); }
static inline double mul_dn(double a, double b) { return -fp_b(fp_b(-a) * fp_b(b)); }
static inline double div_up(double a, double b) { return fp_b(fp_b(a) / fp_b(b)); }
static inline double div_dn(double a, double b) { return -fp_b(fp_b(-a) / fp_b(b)); }

static inline I operator+(I a, I b) { return I(add_dn(a.l, b.l), add_up(a.h, b.h)); }
static inline I operator-(I a, I b) { return I(sub_dn(a.l, b.h), sub_up(a.h, b.l)); }
static inline I operator-(I a) { return I(-a.h, -a.l); }

static inline I operator*(I a, I b) {
  double lo = std::min({mul_dn(a.l, b.l), mul_dn(a.l, b.h), mul_dn(a.h, b.l), mul_dn(a.h, b.h)});
  double hi = std::max({mul_up(a.l, b.l), mul_up(a.l, b.h), mul_up(a.h, b.l), mul_up(a.h, b.h)});
  return I(lo, hi);
}

static inline I sq(I a) {
  if (a.l <= 0.0 && a.h >= 0.0) {
    double m = std::max(-a.l, a.h);
    return I(0.0, mul_up(m, m));
  }
  double lo_m = std::min(std::fabs(a.l), std::fabs(a.h));
  double hi_m = std::max(std::fabs(a.l), std::fabs(a.h));
  return I(mul_dn(lo_m, lo_m), mul_up(hi_m, hi_m));
}

static inline I operator/(I a, I b) {
  assert(b.l > 0.0 || b.h < 0.0);
  double lo = std::min({div_dn(a.l, b.l), div_dn(a.l, b.h), div_dn(a.h, b.l), div_dn(a.h, b.h)});
  double hi = std::max({div_up(a.l, b.l), div_up(a.l, b.h), div_up(a.h, b.l), div_up(a.h, b.h)});
  return I(lo, hi);
}
static inline I operator/(I a, double c) { return a / I(c); }

static inline I rat(int64_t num, int64_t den) {
  assert(den > 0);
  double n = static_cast<double>(num);
  double d = static_cast<double>(den);
  assert(static_cast<int64_t>(n) == num && static_cast<int64_t>(d) == den);
  return I(div_dn(n, d), div_up(n, d));
}

static inline double sqrt_up_strict(double x) {
  assert(x >= 0.0);
  if (x == 0.0) return 0.0;
  double r = std::sqrt(x);
  while (mul_dn(r, r) < x) r = std::nextafter(r, std::numeric_limits<double>::infinity());
  return r;
}
static inline double sqrt_dn_strict(double x) {
  assert(x >= 0.0);
  if (x == 0.0) return 0.0;
  double r = std::sqrt(x);
  while (r > 0.0 && mul_up(r, r) > x) r = std::nextafter(r, 0.0);
  return r;
}
static inline I sqrt_iv(I a) {
  assert(a.h >= 0.0);
  double lo = a.l <= 0.0 ? 0.0 : sqrt_dn_strict(a.l);
  double hi = sqrt_up_strict(a.h);
  return I(lo, hi);
}
static inline double mag(I a) { return std::max(std::fabs(a.l), std::fabs(a.h)); }

static const I PI_IV(0x1.921fb54442d18p+1, 0x1.921fb54442d19p+1);
static const I HALF_PI_IV(0x1.921fb54442d18p+0, 0x1.921fb54442d19p+0);
static const I TWO_PI_IV(0x1.921fb54442d18p+2, 0x1.921fb54442d19p+2);
static const I LN2_IV(0x1.62e42fefa39efp-1, 0x1.62e42fefa39f0p-1);

// Libm-independent outward-rounded exp(x) for x in R (via range reduction by ln(2)):
static double exp_pt(double x, bool upper) {
  if (x == 0.0) return 1.0;
  if (x < -700.0) return upper ? 1e-300 : 0.0;
  assert(x < 700.0);
  int k = static_cast<int>(std::floor(x / 0.6931471805599453 + 0.5));
  I r = I(x) - I(static_cast<double>(k)) * LN2_IV;
  I term(1.0), sum(1.0);
  for (int n = 1; n <= 16; ++n) {
    term = term * r / static_cast<double>(n);
    sum = sum + term;
  }
  double mr = mag(r);
  assert(mr < 0.5);
  double mr17 = 1.0;
  for (int i = 0; i < 17; ++i) mr17 = mul_up(mr17, mr);
  double rem = div_up(mul_up(2.0, mr17), 355687428096000.0);
  I er(std::max(0.0, sub_dn(sum.l, rem)), add_up(sum.h, rem));
  double scale = std::ldexp(1.0, k);
  return upper ? mul_up(er.h, scale) : mul_dn(er.l, scale);
}
static inline I expneg_iv(I x) {
  assert(x.l >= 0.0);
  return I(exp_pt(-x.h, false), exp_pt(-x.l, true));
}
static inline I exppos_iv(I x) {
  assert(x.l >= 0.0);
  return I(exp_pt(x.l, false), exp_pt(x.h, true));
}

// Libm-independent outward-rounded sin/cos for arbitrary angle via 2*pi / pi reduction.
static I sin_small_iv(I x) {
  I x2 = sq(x), term = x, sum = x;
  for (int k = 1; k <= 9; ++k) {
    term = (-term * x2) / static_cast<double>((2 * k) * (2 * k + 1));
    sum = sum + term;
  }
  double mx = mag(x);
  assert(mx < 1.6);
  double p21 = 1.0;
  for (int i = 0; i < 21; ++i) p21 = mul_up(p21, mx);
  double rem = div_up(p21, 51090942171709440000.0);
  return I(std::max(-1.0, sub_dn(sum.l, rem)), std::min(1.0, add_up(sum.h, rem)));
}
static I cos_small_iv(I x) {
  I x2 = sq(x), term(1.0), sum(1.0);
  for (int k = 1; k <= 9; ++k) {
    term = (-term * x2) / static_cast<double>((2 * k - 1) * (2 * k));
    sum = sum + term;
  }
  double mx = mag(x);
  assert(mx < 1.6);
  double p20 = 1.0;
  for (int i = 0; i < 20; ++i) p20 = mul_up(p20, mx);
  double rem = div_up(p20, 2432902008176640000.0);
  return I(std::max(-1.0, sub_dn(sum.l, rem)), std::min(1.0, add_up(sum.h, rem)));
}
static I cos_pt_iv(double x) {
  // General x in [-0.01, 4*pi + 0.05]
  I xi(x);
  while (xi.l > PI_IV.h) xi = xi - TWO_PI_IV;
  if (xi.h <= 0.0) xi = -xi;
  if (xi.l < 0.0 && xi.h > 0.0) {
    return cos_small_iv(xi);
  }
  if (xi.h <= 1.5707963267948966) return cos_small_iv(xi);
  if (xi.l >= 1.5707963267948966 && xi.h <= PI_IV.h + 0.02) return -cos_small_iv(PI_IV - xi);
  // Straddles pi/2 or pi: reduce by pi/2
  if (xi.h <= PI_IV.h + 0.02) {
    I u = xi - HALF_PI_IV;
    return -sin_small_iv(u);
  }
  I u = xi - PI_IV;
  return -cos_small_iv(u);
}
static I sin_pt_iv(double x) {
  I xi(x);
  while (xi.l > PI_IV.h) xi = xi - TWO_PI_IV;
  if (xi.h <= -1.5707963267948966) return -sin_small_iv(PI_IV + xi);
  if (xi.l >= -1.5707963267948966 && xi.h <= 1.5707963267948966) return sin_small_iv(xi);
  if (xi.l >= 1.5707963267948966) return sin_small_iv(PI_IV - xi);
  // Straddles +/- pi/2:
  if (xi.l >= 0.0) return cos_small_iv(xi - HALF_PI_IV);
  return -cos_small_iv(xi + HALF_PI_IV);
}
static inline I cos_on_0_pi(I th) {
  assert(th.l >= 0.0 && th.h <= PI_IV.h);
  I c_lo = cos_pt_iv(th.h);
  I c_hi = cos_pt_iv(th.l);
  return I(c_lo.l, c_hi.h);
}
static inline I sin_on_0_pi(I th) {
  assert(th.l >= 0.0 && th.h <= PI_IV.h);
  I s1 = sin_pt_iv(th.l);
  I s2 = sin_pt_iv(th.h);
  double lo = std::min(s1.l, s2.l);
  double hi = std::max(s1.h, s2.h);
  if (th.l <= HALF_PI_IV.h && th.h >= HALF_PI_IV.l) hi = 1.0;
  return I(lo, hi);
}
// Rational-multiple angle trig: cos(2*pi*k/N), sin(2*pi*k/N) via exact interval I = 2*pi * rat(k, N).
static void sincos_angle_iv(I ang, I& s_out, I& c_out) {
  // Reduces ang in [0, 4*pi + 0.05] to quadrants; exact for tight point intervals.
  I a = ang;
  while (a.l > PI_IV.h) a = a - TWO_PI_IV;
  while (a.h < -PI_IV.h) a = a + TWO_PI_IV;
  if (a.l >= -1.55 && a.h <= 1.55) {
    s_out = sin_small_iv(a);
    c_out = cos_small_iv(a);
  } else if (a.l >= 0.02 && a.h <= PI_IV.h - 0.02) {
    I u = a - HALF_PI_IV;
    s_out = cos_small_iv(u);
    c_out = -sin_small_iv(u);
  } else if (a.l >= -PI_IV.h + 0.02 && a.h <= -0.02) {
    I u = a + HALF_PI_IV;
    s_out = -cos_small_iv(u);
    c_out = sin_small_iv(u);
  } else if (a.l >= 1.55) {
    I u = PI_IV - a;
    s_out = sin_small_iv(u);
    c_out = -cos_small_iv(u);
  } else {
    I u = PI_IV + a;
    s_out = -sin_small_iv(u);
    c_out = -cos_small_iv(u);
  }
}

// Outward-rounded atan(x) upper bound for x >= 0 (strictly increasing in x).
// Uses elementary argument reduction + alternating series remainder (0 <= atan(u) <= u - u^3/3 + ... + u^{13}/13).
static double atan_up_pt(double x) {
  assert(x >= 0.0);
  if (x == 0.0) return 0.0;
  if (x > 1.0) {
    // atan(x) = pi/2 - atan(1/x), need lower bound on atan(1/x)
    I u = I(1.0) / I(x);
    // Reduce u in (0, 1] via u <= tan(pi/12)? Simple: use half-angle u -> u / (1 + sqrt(1 + u^2)) twice!
    // atan(u) = 2 * atan(u / (1 + sqrt(1 + u^2))), so u1 <= 0.415, u2 <= 0.20!
    I u1 = u / (I(1.0) + sqrt_iv(I(1.0) + sq(u)));
    I u2 = u1 / (I(1.0) + sqrt_iv(I(1.0) + sq(u1)));
    // Alternating series for atan(u2) (0 < u2 < 0.21): lower bound stops at negative term -u2^{11}/11
    I t2 = sq(u2);
    I p3 = u2 * t2, p5 = p3 * t2, p7 = p5 * t2, p9 = p7 * t2, p11 = p9 * t2, p13 = p11 * t2, p15 = p13 * t2;
    I at_u2 = u2 - p3 / 3.0 + p5 / 5.0 - p7 / 7.0 + p9 / 9.0 - p11 / 11.0 + p13 / 13.0 - p15 / 15.0;
    I at_u = I(4.0) * at_u2;
    return (HALF_PI_IV - at_u).h;
  }
  // x in (0, 1]: half-angle twice => u2 <= 0.20, upper bound stops at positive term +u2^{17}/17
  I u(x);
  I u1 = u / (I(1.0) + sqrt_iv(I(1.0) + sq(u)));
  I u2 = u1 / (I(1.0) + sqrt_iv(I(1.0) + sq(u1)));
  I t2 = sq(u2);
  I p3 = u2 * t2, p5 = p3 * t2, p7 = p5 * t2, p9 = p7 * t2, p11 = p9 * t2, p13 = p11 * t2, p15 = p13 * t2, p17 = p15 * t2;
  I at_u2 = u2 - p3 / 3.0 + p5 / 5.0 - p7 / 7.0 + p9 / 9.0 - p11 / 11.0 + p13 / 13.0 - p15 / 15.0 + p17 / 17.0;
  return (I(4.0) * at_u2).h;
}

// Rigorous upper bound on int_0^1 (Delta / (max(0, r0 - t*Delta)^2 + q0)) dt (exact L1 = 1/mu^2!).
// Uses exact zero-cancellation formula:
//   - If r0 >= Delta: (1/sqrt(q0)) * atan(sqrt(q0)*Delta / (q0 + r0*(r0 - Delta)))
//   - If r0 <  Delta: (1/sqrt(q0)) * atan(r0 / sqrt(q0)) + (Delta - r0) / q0
// Monotone decreasing in r0 >= 0, increasing in Delta >= 0, decreasing in q0 > 0.
static double exact_lip_shift_up(double r0_dn, double Delta_up, double q0_dn) {
  assert(r0_dn >= 0.0 && Delta_up >= 0.0 && q0_dn > 0.0);
  if (Delta_up == 0.0) return 0.0;
  double sq_dn = sqrt_dn_strict(q0_dn);
  double sq_up = sqrt_up_strict(q0_dn);
  if (r0_dn >= Delta_up) {
    double rem = sub_dn(r0_dn, Delta_up);
    double den = add_dn(q0_dn, mul_dn(r0_dn, rem));
    double arg = div_up(mul_up(sq_up, Delta_up), den);
    // Note: atan(arg)/sq <= min(Delta_up / den, atan_up_pt(arg) / sq_dn)!
    double fast = div_up(Delta_up, den);
    if (arg < 0.25) return fast;
    return std::min(fast, div_up(atan_up_pt(arg), sq_dn));
  } else {
    double arg = div_up(r0_dn, sq_dn);
    double t1 = div_up(atan_up_pt(arg), sq_dn);
    double t2 = div_up(sub_up(Delta_up, r0_dn), q0_dn);
    return add_up(t1, t2);
  }
}

// ============================================================================
// 2. Peak-row & global odd-sector constants + Jet2 + solve_T
// ============================================================================
struct Constants {
  I a, b, p, rho0, c1, d, inv_sqrt2, sqrt2, sqrt3, sqrt6;
  I p_minus_shift, q_AA, q_BB, q_AB;
  // Global phase-invariant isotropic odd shift & budget:
  // c* = -(7/25) nu, C_inv(Q, nu) = -(6801/18910) Re(Q conj(nu)) => k1 = k2 = -11/20,
  // d_nu = p + 2*k1*alpha - (p+1)*alpha^2 = 3422717/2363750
  I alpha_nu, k_comp, d_nu;
};
static Constants C;

static void init_constants() {
  C.a = rat(699, 1250);
  C.b = rat(179, 1250);
  C.p = rat(2500, 1891);
  C.rho0 = rat(5053, 10000);
  C.c1 = rat(15159, 50000);
  C.d = rat(2, 5);
  C.sqrt2 = sqrt_iv(I(2.0));
  C.inv_sqrt2 = I(1.0) / C.sqrt2;
  C.sqrt3 = sqrt_iv(I(3.0));
  C.sqrt6 = sqrt_iv(I(6.0));
  C.p_minus_shift = C.p - rat(463, 5000);
  I r2 = sq(C.rho0);
  C.q_AA = C.p_minus_shift - rat(67, 100) - rat(2, 25) * r2;
  C.q_BB = C.p_minus_shift - rat(67, 100) * r2 - rat(2, 25);
  C.q_AB = (rat(2, 25) - rat(67, 100)) * C.rho0;
  C.alpha_nu = rat(-7, 25);
  C.k_comp = rat(-11, 20);
  C.d_nu = rat(3422717, 2363750);
}

struct Jet2 {
  I v, d, d2;
  Jet2() : v(0.0), d(0.0), d2(0.0) {}
  explicit Jet2(I val) : v(val), d(0.0), d2(0.0) {}
  Jet2(I val, I der, I der2) : v(val), d(der), d2(der2) {}
};
static inline Jet2 operator+(const Jet2& x, const Jet2& y) { return {x.v + y.v, x.d + y.d, x.d2 + y.d2}; }
static inline Jet2 operator-(const Jet2& x, const Jet2& y) { return {x.v - y.v, x.d - y.d, x.d2 - y.d2}; }
static inline Jet2 operator+(const Jet2& x, I c) { return {x.v + c, x.d, x.d2}; }
static inline Jet2 operator-(const Jet2& x, I c) { return {x.v - c, x.d, x.d2}; }
static inline Jet2 operator*(I c, const Jet2& x) { return {c * x.v, c * x.d, c * x.d2}; }
static inline Jet2 operator*(const Jet2& x, const Jet2& y) {
  return {x.v * y.v, x.d * y.v + x.v * y.d, x.d2 * y.v + I(2.0) * (x.d * y.d) + x.v * y.d2};
}
static inline Jet2 sq_j(const Jet2& x) {
  return {sq(x.v), I(2.0) * (x.v * x.d), I(2.0) * (sq(x.d) + x.v * x.d2)};
}
static inline Jet2 inv_j(const Jet2& x) {
  I u = I(1.0) / x.v;
  I u2 = sq(u);
  return {u, (-x.d) * u2, (I(2.0) * sq(x.d) * u - x.d2) * u2};
}
static inline Jet2 sqrt_j(const Jet2& x) {
  assert(x.v.l > 0.0);
  I s = sqrt_iv(x.v);
  I inv_2s = I(0.5) / s;
  I d = x.d * inv_2s;
  return {s, d, (x.d2 - I(2.0) * sq(d)) * inv_2s};
}
static inline Jet2 expneg_j(const Jet2& x) {
  I e = expneg_iv(x.v);
  return {e, (-x.d) * e, (sq(x.d) - x.d2) * e};
}
static inline Jet2 cos_j(const Jet2& th) {
  I c = cos_on_0_pi(th.v), s = sin_on_0_pi(th.v);
  return {c, (-s) * th.d, (-c) * sq(th.d) - s * th.d2};
}
static inline Jet2 sin_j(const Jet2& th) {
  I c = cos_on_0_pi(th.v), s = sin_on_0_pi(th.v);
  return {s, c * th.d, (-s) * sq(th.d) + c * th.d2};
}

static inline I eval_H(I t) {
  I ab = C.a + C.b * t;
  return t * sq(ab);
}
static double solve_T_scalar_guess(double v) {
  if (v <= 0.0) return 0.0;
  double y = std::sqrt(v);
  double a0 = 0.5592, b0 = 0.1432;
  double u = std::min(y / a0, std::cbrt(y / b0));
  for (int it = 0; it < 12; ++it) {
    double f = u * (a0 + b0 * u * u) - y;
    double fp = a0 + 3.0 * b0 * u * u;
    u = std::max(0.0, u - f / fp);
  }
  return u * u;
}
static I solve_T_iv(I v) {
  assert(v.h >= 0.0);
  double vl = std::max(0.0, v.l), vh = v.h;
  double tl = 0.0;
  if (vl > 0.0) {
    tl = solve_T_scalar_guess(vl);
    double step = std::max(1e-14, tl * 1e-13);
    while (tl > 0.0 && eval_H(I(tl)).h > vl) {
      tl = std::max(0.0, tl - step);
      step *= 2.0;
    }
    assert(eval_H(I(tl)).h <= vl);
  }
  double th = 0.0;
  if (vh > 0.0) {
    th = solve_T_scalar_guess(vh);
    double step = std::max(1e-14, th * 1e-13);
    while (eval_H(I(th)).l < vh) {
      th = th + step;
      step *= 2.0;
    }
    assert(eval_H(I(th)).l >= vh);
  }
  if (tl > th) tl = th;
  return I(tl, th);
}
static inline Jet2 solve_T_j(const Jet2& v) {
  I T0 = solve_T_iv(v.v);
  I a0 = C.a + C.b * T0;
  I c0 = C.a + I(3.0) * C.b * T0;
  I hp = a0 * c0;
  I hpp = I(4.0) * C.a * C.b + I(6.0) * sq(C.b) * T0;
  I td = v.d / hp;
  I td2 = (v.d2 - hpp * sq(td)) / hp;
  return {T0, td, td2};
}

// ============================================================================
// 3. Exact 3x3 & 6x6 symmetric matrix PSD verification (outward-rounded Cholesky)
// ============================================================================
struct Sym2 {
  I a00, a01, a11;
};
struct Sym3 {
  // Indices: 0=(0,0), 1=(0,1), 2=(0,2), 3=(1,1), 4=(1,2), 5=(2,2)
  I e[6];
  Sym3() { for (int i = 0; i < 6; ++i) e[i] = I(0.0); }
};
static inline Sym3 sym3_add(const Sym3& A, const Sym3& B) {
  Sym3 R;
  for (int i = 0; i < 6; ++i) R.e[i] = A.e[i] + B.e[i];
  return R;
}
static inline Sym3 sym3_scale(I c, const Sym3& A) {
  Sym3 R;
  for (int i = 0; i < 6; ++i) R.e[i] = c * A.e[i];
  return R;
}

// Convert symmetric interval matrix M_iv (6x6 upper triangle, 21 entries) to a deterministic
// scalar upper bound matrix M_ub >= M for all M in M_iv (via off-diagonal half-width absorption):
//   M_ub(i, j) = mid(M_iv(i, j)) for i != j,
//   M_ub(i, i) = M_iv(i, i).h + sum_{j != i} (M_iv(i, j).h - M_iv(i, j).l) / 2.
// Then check B_odd - M_ub > 0 via outward-rounded 6x6 Cholesky: returns min Cholesky pivot^2 (> 0 => PD!).
static double check_Bodd_minus_M6_pd(const I M_iv[21], double diag_shift = 0.0) {
  static const int idx6[6][6] = {
      {0, 1, 2, 3, 4, 5},
      {1, 6, 7, 8, 9, 10},
      {2, 7, 11, 12, 13, 14},
      {3, 8, 12, 15, 16, 17},
      {4, 9, 13, 16, 18, 19},
      {5, 10, 14, 17, 19, 20},
  };
  // Build interval matrix D = B_odd - M_ub (with exact outward enclosure of B_odd and M_ub):
  // Note: for each (i, j) with i < j, let m_ij = 0.5*(l + h) (exact midpoint in R enclosed by I(mid_dn, mid_up)),
  // rad_ij = max(h - mid_dn, mid_up - l) >= |M_ij - m_ij|.
  I D[6][6];
  // Initialize D = B_odd
  for (int i = 0; i < 6; ++i)
    for (int j = 0; j < 6; ++j) D[i][j] = I(0.0);
  D[0][0] = C.p; D[1][1] = C.p; D[2][2] = C.d_nu;
  D[0][2] = D[2][0] = C.k_comp;
  D[3][3] = C.p; D[4][4] = C.p; D[5][5] = C.d_nu;
  D[3][5] = D[5][3] = C.k_comp;

  for (int i = 0; i < 6; ++i) {
    double rad_sum = 0.0;
    for (int j = 0; j < 6; ++j) {
      if (i == j) continue;
      I m = M_iv[idx6[i][j]];
      double mid = 0.5 * add_up(m.l, m.h);  // scalar point choice!
      double rad = std::max(sub_up(m.h, mid), sub_up(mid, m.l));
      rad_sum = add_up(rad_sum, rad);
      D[i][j] = D[i][j] - I(mid);
    }
    I diag_m = M_iv[idx6[i][i]];
    D[i][i] = D[i][i] - I(add_up(diag_m.h, rad_sum));
  }

  // Outward-rounded LDL^T / Cholesky: D = L diag(d) L^T.
  // If all d[i].l > 0, then EVERY matrix in D (in particular B_odd - diag_shift*I_6 - M_ub) is strictly positive definite!
  if (diag_shift != 0.0) {
    I sh(diag_shift);
    for (int i = 0; i < 6; ++i) D[i][i] = D[i][i] - sh;
  }
  I L[6][6];
  I d[6];
  double min_piv = 1e30;
  for (int i = 0; i < 6; ++i) {
    I s = D[i][i];
    for (int k = 0; k < i; ++k) s = s - sq(L[i][k]) * d[k];
    d[i] = s;
    if (d[i].l <= 0.0) return d[i].l;
    min_piv = std::min(min_piv, d[i].l);
    L[i][i] = I(1.0);
    for (int j = i + 1; j < 6; ++j) {
      I t = D[j][i];
      for (int k = 0; k < i; ++k) t = t - L[j][k] * L[i][k] * d[k];
      L[j][i] = t / d[i];
    }
  }
  return min_piv;
}

// Check B_3 - M_3 > 0 for a 3x3 symmetric interval matrix (returns min pivot > 0 iff PD!).
static double check_B3_minus_M3_pd(const Sym3& M) {
  static const int idx3[3][3] = {{0, 1, 2}, {1, 3, 4}, {2, 4, 5}};
  I D[3][3];
  for (int i = 0; i < 3; ++i)
    for (int j = 0; j < 3; ++j) D[i][j] = I(0.0);
  D[0][0] = C.p; D[1][1] = C.p; D[2][2] = C.d_nu;
  D[0][2] = D[2][0] = C.k_comp;
  for (int i = 0; i < 3; ++i) {
    double rad_sum = 0.0;
    for (int j = 0; j < 3; ++j) {
      if (i == j) continue;
      I m = M.e[idx3[i][j]];
      double mid = 0.5 * add_up(m.l, m.h);
      double rad = std::max(sub_up(m.h, mid), sub_up(mid, m.l));
      rad_sum = add_up(rad_sum, rad);
      D[i][j] = D[i][j] - I(mid);
    }
    D[i][i] = D[i][i] - I(add_up(M.e[idx3[i][i]].h, rad_sum));
  }
  I L[3][3], d[3];
  double min_piv = 1e30;
  for (int i = 0; i < 3; ++i) {
    I s = D[i][i];
    for (int k = 0; k < i; ++k) s = s - sq(L[i][k]) * d[k];
    d[i] = s;
    if (d[i].l <= 0.0) return d[i].l;
    min_piv = std::min(min_piv, d[i].l);
    L[i][i] = I(1.0);
    for (int j = i + 1; j < 3; ++j) {
      I t = D[j][i];
      for (int k = 0; k < i; ++k) t = t - L[j][k] * L[i][k] * d[k];
      L[j][i] = t / d[i];
    }
  }
  return min_piv;
}

// ============================================================================
// 4. WCS Cell Grid (from 7.4.16) for Rem(w, v) <= U_WCS(w, v)
// ============================================================================
struct WcsIntegrandI {
  I fA, fb[4], fM[10];
};
struct WcsIntegrandJ {
  Jet2 fA, fb[4], fM[10];
};

static WcsIntegrandI eval_wcs_pt(I r, I th, I w) {
  I ct = cos_on_0_pi(th), st = sin_on_0_pi(th);
  I yr = r * ct - w, yi = r * st;
  I T = solve_T_iv(sq(r - w) + I(2.0) * r * w * (I(1.0) - ct));
  I a0 = C.a + C.b * T, c0 = C.a + I(3.0) * C.b * T;
  I f = expneg_iv(T) / (a0 * c0);
  I inv_a0 = I(1.0) / a0;
  I Zr = yr * inv_a0, Zi = yi * inv_a0;
  I z2r = (sq(Zr) - sq(Zi)) * C.inv_sqrt2, z2i = (I(2.0) * Zr * Zi) * C.inv_sqrt2;
  I t0 = T - C.d;
  I pr[4] = {t0, C.c1 + z2r, I(0.0), z2i};
  I pi[4] = {I(0.0), z2i, t0, C.c1 - z2r};
  WcsIntegrandI out;
  I f2 = I(2.0) * f, rf2 = r * f2;
  out.fA = r * rf2;
  for (int i = 0; i < 4; ++i) out.fb[i] = rf2 * (ct * pr[i] + st * pi[i]);
  int k = 0;
  for (int i = 0; i < 4; ++i)
    for (int j = i; j < 4; ++j) {
      I prod = (i == j) ? (sq(pr[i]) + sq(pi[i])) : (pr[i] * pr[j] + pi[i] * pi[j]);
      out.fM[k++] = f2 * prod;
    }
  return out;
}

static WcsIntegrandJ eval_wcs_jet(const Jet2& r, const Jet2& th, I w) {
  Jet2 ct = cos_j(th), st = sin_j(th);
  Jet2 yr = r * ct - w, yi = r * st;
  Jet2 T = solve_T_j(sq_j(r - w) + (I(2.0) * w) * (r * (Jet2(I(1.0)) - ct)));
  Jet2 a0 = Jet2(C.a) + C.b * T, c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
  Jet2 f = expneg_j(T) * inv_j(a0 * c0);
  Jet2 inv_a0 = inv_j(a0);
  Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
  Jet2 z2r = C.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi)), z2i = (I(2.0) * C.inv_sqrt2) * (Zr * Zi);
  Jet2 t0 = T - C.d, z0(I(0.0));
  Jet2 pr[4] = {t0, z2r + C.c1, z0, z2i};
  Jet2 pi[4] = {z0, z2i, t0, Jet2(C.c1) - z2r};
  WcsIntegrandJ out;
  Jet2 f2 = I(2.0) * f, rf2 = r * f2;
  out.fA = r * rf2;
  for (int i = 0; i < 4; ++i) out.fb[i] = rf2 * (ct * pr[i] + st * pi[i]);
  int k = 0;
  for (int i = 0; i < 4; ++i)
    for (int j = i; j < 4; ++j) {
      Jet2 prod = (i == j) ? (sq_j(pr[i]) + sq_j(pi[i])) : (pr[i] * pr[j] + pi[i] * pi[j]);
      out.fM[k++] = f2 * prod;
    }
  return out;
}

struct WcsCell {
  double A_hi;
  double b_lo[4], b_hi[4];
  double M_lo[10], M_hi[10];
};
struct WcsGrid {
  double w;
  int nr, nt;
  double tail_coeff;
  std::vector<WcsCell> cells;
};

static std::vector<double> make_r_edges(int nr) {
  int n1 = (3 * nr) / 4;
  int rem = nr - n1;
  int n2 = std::max(1, (3 * rem) / 4);
  int n3 = std::max(1, rem - n2);
  std::vector<double> e;
  e.reserve(n1 + n2 + n3 + 1);
  for (int i = 0; i <= n1; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n1);
    e.push_back((i == 0) ? 0.0 : (i == n1 ? 3.5 : 3.5 * std::pow(t, 1.5)));
  }
  for (int i = 1; i <= n2; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n2);
    e.push_back((i == n2) ? 8.0 : (3.5 + 4.5 * std::pow(t, 1.5)));
  }
  for (int i = 1; i <= n3; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n3);
    e.push_back((i == n3) ? 24.0 : (8.0 + 16.0 * std::pow(t, 1.8)));
  }
  return e;
}

static double certified_even_tail_coeff(double w_max, double r_cut) {
  I y_min = I(r_cut) - I(w_max);
  assert(y_min.l > 0.0);
  I H25 = eval_H(I(25.0));
  assert(H25.h <= sq(y_min).l);
  I tmin(25.0);
  I qc = rat(1, 2) * sq(tmin) + (rat(4, 5) - C.sqrt2 * C.c1) * tmin - (rat(4, 25) + sq(C.c1));
  assert(qc.l > 0.0);
  return ((I(1354.0) / I(r_cut)) * expneg_iv(I(25.0))).h;
}

// Certified tail coeff for odd potential on r >= r_cut (w <= w_max):
// H(25) <= (r_cut - w_max)^2 => T >= 25. On T >= 25, ||G_iso||_op <= T*(2 + (T-2)^2/2) <= T^3/2 + 2*T <= T^3.
// Actually exact check: 2*T + T*(T-2)^2/2 = T^3/2 - 2*T^2 + 4*T <= T^3/2 for T >= 2!
// int_25^inf (T^3/2) e^{-T} dT = (1/2)*(15625 + 1875 + 150 + 6)*e^{-25} = 8828 * e^{-25}!
static double certified_odd_tail_coeff(double w_max, double r_cut) {
  I y_min = I(r_cut) - I(w_max);
  assert(y_min.l > 0.0);
  assert(eval_H(I(25.0)).h <= sq(y_min).l);
  // Check 4*T <= 2*T^2 for T >= 25 (obvious: 25 >= 2).
  // Exact int_{25}^\infty (T^3/2) e^{-T} dT = (25^3 + 3*25^2 + 6*25 + 6)/2 * e^{-25} = 8828 * e^{-25}.
  // Dividing by r_cut (since 1/|L+w| <= 1/r_cut on r >= r_cut):
  return ((I(8828.0) / I(r_cut)) * expneg_iv(I(25.0))).h;
}

static WcsCell integrate_wcs_cell(double r0, double r1, I th0, I th1, double w, int nsub_r, int nsub_t) {
  I sum_A(0.0), sum_b[4], sum_M[10];
  I w_iv(w), inv_2pi = I(1.0) / TWO_PI_IV, inv_24 = rat(1, 24);
  for (int ir = 0; ir < nsub_r; ++ir) {
    I a_r = I(r0) + (I(r1) - I(r0)) * rat(ir, nsub_r);
    I b_r = I(r0) + (I(r1) - I(r0)) * rat(ir + 1, nsub_r);
    I r_box(a_r.l, b_r.h), dr = b_r - a_r, dr2 = sq(dr), r_mid = I(0.5) * (a_r + b_r);
    for (int it = 0; it < nsub_t; ++it) {
      I a_t = th0 + (th1 - th0) * rat(it, nsub_t);
      I b_t = th0 + (th1 - th0) * rat(it + 1, nsub_t);
      I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
      I dt = b_t - a_t, dt2 = sq(dt), t_mid = I(0.5) * (a_t + b_t);
      I area = dr * dt * inv_2pi;
      WcsIntegrandI mid = eval_wcs_pt(r_mid, t_mid, w_iv);
      WcsIntegrandJ jr = eval_wcs_jet(Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_iv);
      WcsIntegrandJ jt = eval_wcs_jet(Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_iv);
      sum_A = sum_A + area * (mid.fA + inv_24 * (dr2 * jr.fA.d2 + dt2 * jt.fA.d2));
      for (int i = 0; i < 4; ++i)
        sum_b[i] = sum_b[i] + area * (mid.fb[i] + inv_24 * (dr2 * jr.fb[i].d2 + dt2 * jt.fb[i].d2));
      for (int k = 0; k < 10; ++k)
        sum_M[k] = sum_M[k] + area * (mid.fM[k] + inv_24 * (dr2 * jr.fM[k].d2 + dt2 * jt.fM[k].d2));
    }
  }
  WcsCell cell;
  cell.A_hi = sum_A.h;
  for (int i = 0; i < 4; ++i) { cell.b_lo[i] = sum_b[i].l; cell.b_hi[i] = sum_b[i].h; }
  for (int k = 0; k < 10; ++k) { cell.M_lo[k] = sum_M[k].l; cell.M_hi[k] = sum_M[k].h; }
  return cell;
}

static WcsGrid build_wcs_grid(double w, int nr, int nt, int nsub_r, int nsub_t) {
  require_fe_upward();
  WcsGrid g;
  g.w = w; g.nr = nr; g.nt = nt;
  g.tail_coeff = certified_even_tail_coeff(w, 24.0);
  auto re = make_r_edges(nr);
  int nrings = static_cast<int>(re.size()) - 1;
  g.cells.reserve(static_cast<size_t>(nrings) * static_cast<size_t>(nt));
  for (int ir = 0; ir < nrings; ++ir) {
    // Tight radial sub-box width on [0, 5] (<= 0.04) and [5, 24] (<= 0.20) so Jet2 error < 1e-4!
    double dr_cell = re[ir + 1] - re[ir];
    double max_dr = (re[ir] < 5.0) ? 0.04 : 0.20;
    int sr = std::max(nsub_r, static_cast<int>(std::ceil(dr_cell / max_dr)));
    // Adaptive angular resolution: full nt on [0, 3.5], nt/2 on [3.5, 8], nt/4 on [8, 24]
    int nt_ring = (re[ir] < 3.5) ? nt : ((re[ir] < 8.0) ? std::max(4, nt / 2) : std::max(2, nt / 4));
    int st = std::max(nsub_t, static_cast<int>(std::ceil(48.0 / static_cast<double>(nt_ring))));
    for (int it = 0; it < nt_ring; ++it) {
      I th0 = PI_IV * rat(it, nt_ring);
      I th1 = PI_IV * rat(it + 1, nt_ring);
      g.cells.push_back(integrate_wcs_cell(re[ir], re[ir + 1], th0, th1, w, sr, st));
    }
  }
  return g;
}

// Exact outward upper bound on Phi(A, B, C) = 2*(sqrt(A*(A + 2B + C)) - A - B) for B in [Bl, Bh], C <= C_hi.
static inline double eval_phi_hi(double A, double Bl, double Bh, double C_hi) {
  if (C_hi <= 0.0) return 0.0;
  double nhc_lo = mul_dn(-0.5, C_hi), nhc_hi = mul_up(-0.5, C_hi);
  if (Bl <= nhc_hi && nhc_lo <= Bh) return C_hi;
  double B_pt = (Bh < nhc_lo) ? Bh : Bl;
  double AB_lo = add_dn(A, B_pt);
  if (AB_lo > 0.0) {
    // Rationalized form: 2 * (A*C - B^2) / (sqrt(A*(A + 2B + C)) + A + B)
    double b2_lo = mul_dn(B_pt, B_pt);
    double num_hi = add_up(mul_up(A, C_hi), -b2_lo);
    if (num_hi <= 0.0) return 0.0;
    double inner_lo = add_dn(add_dn(A, mul_dn(2.0, B_pt)), C_hi);
    double rad_lo = 0.0;
    if (inner_lo > 0.0) {
      double disc_lo = mul_dn(A, inner_lo);
      if (disc_lo > 0.0) rad_lo = sqrt_dn_strict(disc_lo);
    }
    double den_lo = add_dn(rad_lo, AB_lo);
    return div_up(mul_up(2.0, num_hi), den_lo);
  } else {
    double inner_hi = add_up(add_up(A, mul_up(2.0, B_pt)), C_hi);
    double rad_hi = (inner_hi > 0.0) ? sqrt_up_strict(mul_up(A, inner_hi)) : 0.0;
    double phi = mul_up(2.0, add_up(rad_hi, -AB_lo));
    return (phi > 0.0) ? phi : 0.0;
  }
}

// Rigorous outward-rounded upper bound on Rem(w, v) at point v in R^4 (single pass for both +/-(Ai, Bi) halves!).
static double eval_wcs_ub(const WcsGrid& g, const double v[4]) {
  require_fe_upward();
  double S_up = add_up(add_up(mul_up(v[0], v[0]), mul_up(v[1], v[1])),
                       add_up(mul_up(v[2], v[2]), mul_up(v[3], v[3])));
  double total = mul_up(g.tail_coeff, S_up);
  double vv[4] = {fp_b(v[0]), fp_b(v[1]), fp_b(v[2]), fp_b(v[3])};
  double nvv[4] = {fp_b(-vv[0]), fp_b(-vv[1]), fp_b(-vv[2]), fp_b(-vv[3])};
  bool v_nonneg[4] = {vv[0] >= 0.0, vv[1] >= 0.0, vv[2] >= 0.0, vv[3] >= 0.0};
  bool real_only = (vv[2] == 0.0 && vv[3] == 0.0);

  double q_lo[10], q_hi[10], nq_lo[10], nq_hi[10];
  bool q_nonneg[10];
  int k = 0;
  for (int i = 0; i < 4; ++i) {
    for (int j = i; j < 4; ++j) {
      if (i == j) {
        q_lo[k] = mul_dn(vv[i], vv[i]);
        q_hi[k] = mul_up(vv[i], vv[i]);
        q_nonneg[k] = true;
      } else {
        double a2 = fp_b(2.0 * vv[i]);
        q_lo[k] = mul_dn(a2, vv[j]);
        q_hi[k] = mul_up(a2, vv[j]);
        q_nonneg[k] = (vv[i] >= 0.0) == (vv[j] >= 0.0);
      }
      nq_lo[k] = -q_hi[k];
      nq_hi[k] = -q_lo[k];
      ++k;
    }
  }
  const size_t ncells = g.cells.size();
  const WcsCell* cells = g.cells.data();
  static constexpr int even_idx[6] = {0, 1, 4, 7, 8, 9};
  static constexpr int odd_idx[4] = {2, 3, 5, 6};

  if (real_only) {
    double sum_half = 0.0;
    for (size_t ci = 0; ci < ncells; ++ci) {
      const WcsCell& cell = cells[ci];
      double neg_Bl = 0.0, Bh = 0.0;
      for (int i = 0; i < 2; ++i) {
        if (v_nonneg[i]) {
          neg_Bl += (-cell.b_lo[i]) * vv[i];
          Bh += cell.b_hi[i] * vv[i];
        } else {
          neg_Bl += cell.b_hi[i] * nvv[i];
          Bh += cell.b_lo[i] * vv[i];
        }
      }
      double C_hi = 0.0;
      for (int e = 0; e < 3; ++e) {
        int m = even_idx[e];
        if (q_nonneg[m]) {
          double mh = cell.M_hi[m];
          C_hi += mh * (mh >= 0.0 ? q_hi[m] : q_lo[m]);
        } else {
          double ml = cell.M_lo[m];
          C_hi += ml * (ml <= 0.0 ? q_lo[m] : q_hi[m]);
        }
      }
      sum_half += eval_phi_hi(cell.A_hi, -neg_Bl, Bh, C_hi);
    }
    total = add_up(total, mul_up(2.0, sum_half));
    return total;
  }

  for (size_t ci = 0; ci < ncells; ++ci) {
    const WcsCell& cell = cells[ci];
    double neg_Bel = 0.0, Beh = 0.0, neg_Bol = 0.0, Boh = 0.0;
    for (int i = 0; i < 2; ++i) {
      if (v_nonneg[i]) {
        neg_Bel += (-cell.b_lo[i]) * vv[i];
        Beh += cell.b_hi[i] * vv[i];
      } else {
        neg_Bel += cell.b_hi[i] * nvv[i];
        Beh += cell.b_lo[i] * vv[i];
      }
    }
    for (int i = 2; i < 4; ++i) {
      if (v_nonneg[i]) {
        neg_Bol += (-cell.b_lo[i]) * vv[i];
        Boh += cell.b_hi[i] * vv[i];
      } else {
        neg_Bol += cell.b_hi[i] * nvv[i];
        Boh += cell.b_lo[i] * vv[i];
      }
    }
    double C_even_hi = 0.0;
    for (int e = 0; e < 6; ++e) {
      int m = even_idx[e];
      if (q_nonneg[m]) {
        double mh = cell.M_hi[m];
        C_even_hi += mh * (mh >= 0.0 ? q_hi[m] : q_lo[m]);
      } else {
        double ml = cell.M_lo[m];
        C_even_hi += ml * (ml <= 0.0 ? q_lo[m] : q_hi[m]);
      }
    }
    double C_odd_hi = 0.0, C_odd_neg = 0.0;
    for (int o = 0; o < 4; ++o) {
      int m = odd_idx[o];
      if (q_nonneg[m]) {
        double mh = cell.M_hi[m];
        double ml = cell.M_lo[m];
        C_odd_hi += mh * (mh >= 0.0 ? q_hi[m] : q_lo[m]);
        C_odd_neg += ml * (ml <= 0.0 ? nq_lo[m] : nq_hi[m]);
      } else {
        double ml = cell.M_lo[m];
        double mh = cell.M_hi[m];
        C_odd_hi += ml * (ml <= 0.0 ? q_lo[m] : q_hi[m]);
        C_odd_neg += mh * (mh >= 0.0 ? nq_hi[m] : nq_lo[m]);
      }
    }
    double Bl_p = -(neg_Bel + neg_Bol);
    double Bh_p = Beh + Boh;
    double Bl_m = -(neg_Bel + Boh);
    double Bh_m = Beh + neg_Bol;
    total += eval_phi_hi(cell.A_hi, Bl_p, Bh_p, C_even_hi + C_odd_hi);
    total += eval_phi_hi(cell.A_hi, Bl_m, Bh_m, C_even_hi + C_odd_neg);
  }
  return total;
}

static I eval_BP_iv(double w, const double v[4]) {
  I Ar(v[0]), Br(v[1]), Ai(v[2]), Bi(v[3]), w_iv(w);
  I S = sq(Ar) + sq(Br) + sq(Ai) + sq(Bi);
  I R2 = sq(Ar + C.rho0 * Br) + sq(Ai + C.rho0 * Bi);
  I U2 = sq(Br - C.rho0 * Ar) + sq(Bi - C.rho0 * Ai);
  return C.p_minus_shift * S - rat(67, 100) * R2 - rat(2, 25) * U2 + (I(0.5) * sq(w_iv) + S) * S;
}

// ============================================================================
// 5. Part 1: Shift Exterior [11/8, 8] (even + odd L=1) & Amplitude Exterior [0, 11/8]
// ============================================================================
struct Part1Slab {
  double wl, wh;
  bool shift_ext;
  Sym2 P_re, P_im;
  Sym3 O_iso;  // only populated when shift_ext == true (O_re == O_im identically!)
  double even_margin;
  double odd_margin;
};

static std::vector<double> make_dense_r_edges(double r_cut, int n1, int n2, double p1 = 1.4) {
  std::vector<double> e;
  e.reserve(n1 + n2 + 1);
  for (int i = 0; i <= n1; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n1);
    e.push_back((i == 0) ? 0.0 : (i == n1 ? 5.0 : 5.0 * std::pow(t, p1)));
  }
  for (int i = 1; i <= n2; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n2);
    e.push_back((i == n2) ? r_cut : (5.0 + (r_cut - 5.0) * std::pow(t, 1.8)));
  }
  return e;
}

static Part1Slab certify_part1_slab(double wl, double wh, bool shift_ext, double r_cut, int n1, int n2, int nt) {
  require_fe_upward();
  I w_iv(wl, wh);
  I w_mid = I(0.5) * (I(wl) + I(wh));
  I half_dw = I(0.5) * (I(wh) - I(wl));
  I dw_sym(-half_dw.h, half_dw.h);
  double even_tail = certified_even_tail_coeff(wh, r_cut);
  double odd_tail = shift_ext ? certified_odd_tail_coeff(wh, r_cut) : 0.0;

  auto re = make_dense_r_edges(r_cut, n1, n2, 1.3);
  int nr = static_cast<int>(re.size()) - 1;
  I inv_pi = I(1.0) / PI_IV, inv_24 = rat(1, 24);

  Sym2 P_re{I(0.0), I(0.0), I(0.0)}, P_im{I(0.0), I(0.0), I(0.0)};
  // Odd L=1 isotropic potential O_iso (identical for Re and Im 3x3 blocks!):
  // Integrand for (2/pi)*exp(-T)/(h*h3) * G_iso(z_1) on theta in [0, pi]:
  //   (0,0) = (1,1) = T; (2,2) = T*f_nu^2; (0,2) = T*f_nu;
  //   (0,1) = Re(z_1^2) = Zr^2 - Zi^2; (1,2) = (Zr^2 - Zi^2)*f_nu.
  // Note: full Gaussian density on [-pi, pi] is (1/pi)*exp(-T)/(h*h3) * r dr dth;
  //   folding reflection-even integrands to [0, pi] multiplies by 2, and r cancels 1/r -> factor f2 = 2*exp(-T)/(h*h3)!
  Sym3 O_iso;

  auto eval_pt = [&](I r, I th, I w_p) {
    I ct = cos_on_0_pi(th), st = sin_on_0_pi(th);
    I yr = r * ct - w_p, yi = r * st;
    I T = solve_T_iv(sq(r - w_p) + I(2.0) * r * w_p * (I(1.0) - ct));
    I a0 = C.a + C.b * T, c0 = C.a + I(3.0) * C.b * T;
    I f = expneg_iv(T) / (a0 * c0);
    I f2 = I(2.0) * f;
    I inv_a0 = I(1.0) / a0;
    I Zr = yr * inv_a0, Zi = yi * inv_a0;
    I z2r_raw = sq(Zr) - sq(Zi);
    I z2r = z2r_raw * C.inv_sqrt2, z2i = (I(2.0) * Zr * Zi) * C.inv_sqrt2;
    I t0 = T - C.d;
    I p_re1 = C.c1 + z2r, p_im1 = C.c1 - z2r;
    struct { Sym2 re, im; Sym3 odd; } out;
    out.re = {f2 * sq(t0), f2 * t0 * p_re1, f2 * (sq(p_re1) + sq(z2i))};
    out.im = {out.re.a00, f2 * t0 * p_im1, f2 * (sq(p_im1) + sq(z2i))};
    if (shift_ext) {
      I fn = (T - I(2.0)) * C.inv_sqrt2;
      I fT = f2 * T;
      out.odd.e[0] = fT;
      out.odd.e[1] = f2 * z2r_raw;
      out.odd.e[2] = fT * fn;
      out.odd.e[3] = fT;
      out.odd.e[4] = f2 * z2r_raw * fn;
      out.odd.e[5] = fT * sq(fn);
    }
    return out;
  };
  auto eval_jet = [&](const Jet2& r, const Jet2& th, const Jet2& w_j) {
    Jet2 ct = cos_j(th), st = sin_j(th);
    Jet2 yr = r * ct - w_j, yi = r * st;
    Jet2 T = solve_T_j(sq_j(r - w_j) + I(2.0) * (r * (w_j * (Jet2(I(1.0)) - ct))));
    Jet2 a0 = Jet2(C.a) + C.b * T, c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
    Jet2 f = expneg_j(T) * inv_j(a0 * c0);
    Jet2 f2 = I(2.0) * f;
    Jet2 inv_a0 = inv_j(a0);
    Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
    Jet2 z2r_raw = sq_j(Zr) - sq_j(Zi);
    Jet2 z2r = C.inv_sqrt2 * z2r_raw, z2i = (I(2.0) * C.inv_sqrt2) * (Zr * Zi);
    Jet2 t0 = T - C.d;
    Jet2 p_re1 = z2r + C.c1, p_im1 = Jet2(C.c1) - z2r;
    struct { Jet2 r00, r01, r11, i00, i01, i11, o[6]; } o;
    o.r00 = f2 * sq_j(t0); o.r01 = f2 * t0 * p_re1; o.r11 = f2 * (sq_j(p_re1) + sq_j(z2i));
    o.i00 = o.r00; o.i01 = f2 * t0 * p_im1; o.i11 = f2 * (sq_j(p_im1) + sq_j(z2i));
    if (shift_ext) {
      Jet2 fn = C.inv_sqrt2 * (T - I(2.0));
      Jet2 fT = f2 * T;
      o.o[0] = fT;
      o.o[1] = f2 * z2r_raw;
      o.o[2] = fT * fn;
      o.o[3] = fT;
      o.o[4] = f2 * z2r_raw * fn;
      o.o[5] = fT * sq_j(fn);
    }
    return o;
  };

  Jet2 w_mid_j(w_mid);
  for (int ir = 0; ir < nr; ++ir) {
    I a_r(re[ir]), b_r(re[ir + 1]);
    I r_box(a_r.l, b_r.h), dr = b_r - a_r, dr2 = sq(dr), r_mid = I(0.5) * (a_r + b_r);
    for (int it = 0; it < nt; ++it) {
      I a_t = PI_IV * rat(it, nt), b_t = PI_IV * rat(it + 1, nt);
      I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
      I dt = b_t - a_t, dt2 = sq(dt), t_mid = I(0.5) * (a_t + b_t);
      I area = dr * dt * inv_pi;
      auto mid = eval_pt(r_mid, t_mid, w_mid);
      auto jr = eval_jet(Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_mid_j);
      auto jt = eval_jet(Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_mid_j);
      P_re.a00 = P_re.a00 + area * (mid.re.a00 + inv_24 * (dr2 * jr.r00.d2 + dt2 * jt.r00.d2));
      P_re.a01 = P_re.a01 + area * (mid.re.a01 + inv_24 * (dr2 * jr.r01.d2 + dt2 * jt.r01.d2));
      P_re.a11 = P_re.a11 + area * (mid.re.a11 + inv_24 * (dr2 * jr.r11.d2 + dt2 * jt.r11.d2));
      P_im.a00 = P_im.a00 + area * (mid.im.a00 + inv_24 * (dr2 * jr.i00.d2 + dt2 * jt.i00.d2));
      P_im.a01 = P_im.a01 + area * (mid.im.a01 + inv_24 * (dr2 * jr.i01.d2 + dt2 * jt.i01.d2));
      P_im.a11 = P_im.a11 + area * (mid.im.a11 + inv_24 * (dr2 * jr.i11.d2 + dt2 * jt.i11.d2));
      if (shift_ext) {
        for (int k = 0; k < 6; ++k)
          O_iso.e[k] = O_iso.e[k] + area * (mid.odd.e[k] + inv_24 * (dr2 * jr.o[k].d2 + dt2 * jt.o[k].d2));
      }
    }
  }
  if (half_dw.h > 0.0) {
    auto re_d = make_dense_r_edges(r_cut, 64, shift_ext ? 80 : 40, 1.25);
    int nr_d = static_cast<int>(re_d.size()) - 1, nt_d = shift_ext ? 40 : 32;
    Jet2 w_der(w_iv, I(1.0), I(0.0));
    Sym2 dPr{I(0.0), I(0.0), I(0.0)}, dPi{I(0.0), I(0.0), I(0.0)};
    Sym3 dO;
    for (int ir = 0; ir < nr_d; ++ir) {
      I r_box(re_d[ir], re_d[ir + 1]), dr = I(re_d[ir + 1]) - I(re_d[ir]);
      for (int it = 0; it < nt_d; ++it) {
        I a_t = PI_IV * rat(it, nt_d), b_t = PI_IV * rat(it + 1, nt_d);
        I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
        I area = dr * (b_t - a_t) * inv_pi;
        auto jw = eval_jet(Jet2(r_box), Jet2(t_box), w_der);
        dPr.a00 = dPr.a00 + area * jw.r00.d; dPr.a01 = dPr.a01 + area * jw.r01.d; dPr.a11 = dPr.a11 + area * jw.r11.d;
        dPi.a00 = dPi.a00 + area * jw.i00.d; dPi.a01 = dPi.a01 + area * jw.i01.d; dPi.a11 = dPi.a11 + area * jw.i11.d;
        if (shift_ext) {
          for (int k = 0; k < 6; ++k) dO.e[k] = dO.e[k] + area * jw.o[k].d;
        }
      }
    }
    P_re.a00 = P_re.a00 + dw_sym * dPr.a00; P_re.a01 = P_re.a01 + dw_sym * dPr.a01; P_re.a11 = P_re.a11 + dw_sym * dPr.a11;
    P_im.a00 = P_im.a00 + dw_sym * dPi.a00; P_im.a01 = P_im.a01 + dw_sym * dPi.a01; P_im.a11 = P_im.a11 + dw_sym * dPi.a11;
    if (shift_ext) {
      for (int k = 0; k < 6; ++k) O_iso.e[k] = O_iso.e[k] + dw_sym * dO.e[k];
    }
  }
  P_re.a00 = P_re.a00 + I(0.0, even_tail); P_re.a11 = P_re.a11 + I(0.0, even_tail);
  P_im.a00 = P_im.a00 + I(0.0, even_tail); P_im.a11 = P_im.a11 + I(0.0, even_tail);
  if (shift_ext) {
    O_iso.e[0] = O_iso.e[0] + I(0.0, odd_tail);
    O_iso.e[3] = O_iso.e[3] + I(0.0, odd_tail);
    O_iso.e[5] = O_iso.e[5] + I(0.0, odd_tail);
  }

  // Check PSD margins:
  I shift_diag = I(0.5) * sq(I(wl)) + (shift_ext ? I(0.0) : rat(3, 4));
  auto check_even_2x2 = [&](const Sym2& P) {
    I d00 = (C.q_AA + shift_diag) - P.a00;
    I d11 = (C.q_BB + shift_diag) - P.a11;
    I d01 = C.q_AB - P.a01;
    I det = d00 * d11 - sq(d01);
    return std::min({d00.l, d11.l, det.l});
  };
  Part1Slab res;
  res.wl = wl; res.wh = wh; res.shift_ext = shift_ext;
  res.P_re = P_re; res.P_im = P_im; res.O_iso = O_iso;
  res.even_margin = std::min(check_even_2x2(P_re), check_even_2x2(P_im));
  res.odd_margin = shift_ext ? check_B3_minus_M3_pd(O_iso) : 1.0;
  return res;
}

// ============================================================================
// 6. Part 2: Hybrid Local-Pullback + Theorem 2(b) Origin Strip on [0, 11/8]
// ============================================================================
// Certifies M_odd(w, v; 0) <= B_odd for ALL w in [wl, wh] and ALL ||v||_2 <= s_odd.
// Decomposition (exact operator inequality, see PROOF.md sec 4):
//   M_odd(w, v; 0) <= M_0(w) + M_ring(w, delta, s)
//                   + eps_cs * M_in0(w, delta, s) + (1 + eps_cs) * dM_in(w, delta, s)
//                   + (1 + 1/eps_cs) * M_in_dE(w, delta, s) + M_out_eta(w, delta, s) + tail_24
// where M_0(w) = M_odd(w, 0; 0) is integrated by smooth shifted-polar Jet2 midpoint + MVT w-variation,
// and all small nonnegative excess blocks are enclosed directly by outward interval Riemann sums.
// Note: by conjugation symmetry th -> -th, ALL matrices decouple into 3x3 Re & Im blocks!
static I gamma_tail_iv(int k, I t);

struct Part2Slab {
  double wl, wh, s_odd, delta, eps_cs, R_in, lam;
  Sym3 M_re, M_im;
  double margin;
};

static Part2Slab certify_part2_slab(double wl, double wh, double s_odd, double delta, double eps_cs,
                                    double R_in_override = 0.0) {
  require_fe_upward();
  assert(wl >= 0.0 && wl <= wh && wh <= 1.375);
  assert(s_odd > 0.0 && s_odd <= 0.125 && delta > 0.0 && delta <= 0.5 && eps_cs > 0.0);
  double R_in = (R_in_override > 0.0) ? R_in_override : (3.0 * delta);
  assert(R_in > delta && R_in <= 2.0);

  I w_iv(wl, wh);
  I w_mid = I(0.5) * (I(wl) + I(wh));
  I half_dw = I(0.5) * (I(wh) - I(wl));
  I dw_sym(-half_dw.h, half_dw.h);
  I s_iv(s_odd), del_iv(delta), del2_iv = sq(del_iv), eps_iv(eps_cs);
  I inv_pi = I(1.0) / PI_IV, inv_24 = rat(1, 24);
  double odd_tail = certified_odd_tail_coeff(wh, 24.0);

  // ------------------------------------------------------------------------
  // 0. Rigorous global disk enclosure |Phi(z)| <= R_in => |z|^2 <= T_glob
  //    and global injectivity sqrt(6) * sqrt(T_glob) * s < a!
  //    Since MK(T) = sqrt((T-2/5)^2 + (c1 + T/sqrt2)^2) <= (2/5+c1) + (1+1/sqrt2)*T < 3/4 + (7/4)*T:
  // ------------------------------------------------------------------------
  assert((C.d + C.c1).h < 0.75);
  assert((I(1.0) + C.inv_sqrt2).h < 1.75);
  double T_glob = std::max(1.0, solve_T_iv(sq(I(wh) + I(R_in) + I(0.5))).h);
  for (int it = 0; it < 12; ++it) {
    I sTg = sqrt_iv(I(T_glob));
    I deriv_lo = C.b * sTg - rat(7, 4) * s_iv;
    I lhs_lo = sTg * (C.a + C.b * I(T_glob)) - (rat(3, 4) + rat(7, 4) * I(T_glob)) * s_iv;
    if (deriv_lo.l > 0.0 && lhs_lo.l > add_up(R_in, wh)) break;
    T_glob = mul_up(T_glob, 1.35);
  }
  {
    I sTg = sqrt_iv(I(T_glob));
    assert((C.b * sTg - rat(7, 4) * s_iv).l > 0.0);
    assert((sTg * (C.a + C.b * I(T_glob)) - (rat(3, 4) + rat(7, 4) * I(T_glob)) * s_iv).l > add_up(R_in, wh));
    assert((C.sqrt6 * sTg * s_iv).h < C.a.l);
  }

  // Exact r >= 24 (=> T >= 25) tails for M_0, D_k, E_H, E_tail:
  // On T >= 25: |L+w| >= b*T^{3/2} >= 24, MK(T) <= (5/4)*T, MK*s/|L+w| <= 2*s < 1/2 => r_lo >= 12.
  // Also G_iso <= T*(2 + (T-2)^2/2) = 4T - 2T^2 + (1/2)T^3 <= (1/2)T^3 on T >= 25!
  // On r >= 24, delta <= 0.5: phi_d(r^2) < 2/r^3, |phi_d'(r^2)| < 2/r^5 => ||DH_5(y)||_op <= 10/r^2 <= 10/576!
  // On r_lo >= 12, delta <= 0.5: phi_d(r_lo^2) <= (144 + 0.625)/144^{5/2} < 2/12^3!
  assert((C.a * I(5.0) - I(wh)).l > 0.0);
  I mk_slope_25 = sqrt_iv(I(1.0) + sq(C.c1 / I(25.0) + C.inv_sqrt2));
  assert(mk_slope_25.h < 1.25);
  assert((mk_slope_25 / (I(5.0) * C.b)).h < 2.0);
  assert((I(2.0) * s_iv).h < 0.5);
  I g3_25 = gamma_tail_iv(3, I(25.0));
  I g4_25 = gamma_tail_iv(4, I(25.0));
  I g5_25 = gamma_tail_iv(5, I(25.0));
  I tail_D = (rat(10, 576) * rat(5, 4) * s_iv * rat(1, 2)) * g4_25;
  I tail_EH = (rat(25, 16) * rat(2, 1728) * sq(s_iv) * rat(1, 2)) * g5_25;
  I tail_chi = (rat(15, 8) * sq(del2_iv) / I(248832.0) * rat(1, 2)) * g3_25;
  double odd_tail_tot = add_up(odd_tail, add_up(tail_D.h, add_up(tail_EH.h, tail_chi.h)));

  // ------------------------------------------------------------------------
  // Step 1: Unperturbed M_0(w) = M_odd(w, 0; 0) on r in [0, 24], th in [0, pi]
  // Full Gaussian density on [-pi, pi] is (1/pi)*exp(-T)/(a0*c0) * r dr dth;
  // folding reflection-even integrands onto [0, pi] gives (2/pi)*exp(-T)/(a0*c0) * r dr dth,
  // and 1/r in A(y, 0) cancels r, leaving factor f2 = 2*exp(-T)/(a0*c0) with area = dr*dt/pi.
  // ------------------------------------------------------------------------
  auto eval_M0_pt = [&](I r, I th, I w_p) {
    I ct = cos_on_0_pi(th), st = sin_on_0_pi(th);
    I yr = r * ct - w_p, yi = r * st;
    I T = solve_T_iv(sq(r - w_p) + I(2.0) * r * w_p * (I(1.0) - ct));
    I a0 = C.a + C.b * T, c0 = C.a + I(3.0) * C.b * T;
    I f = I(2.0) * expneg_iv(T) / (a0 * c0);
    I inv_a0 = I(1.0) / a0;
    I Zr = yr * inv_a0, Zi = yi * inv_a0;
    I z2r = sq(Zr) - sq(Zi);
    I fn = (T - I(2.0)) * C.inv_sqrt2;
    I u_qr = Zr * ct + Zi * st, u_pr = Zr * ct - Zi * st, u_nr = u_qr * fn;
    I u_qi = Zr * st - Zi * ct, u_pi = Zi * ct + Zr * st, u_ni = u_qi * fn;
    I half = I(0.5);
    struct { Sym3 re, im; } out;
    I g0 = T, g1 = z2r, g2 = T * fn, g4 = z2r * fn, g5 = T * sq(fn);
    out.re.e[0] = f * (g0 - half * sq(u_qr));
    out.re.e[1] = f * (g1 - half * u_qr * u_pr);
    out.re.e[2] = f * (g2 - half * u_qr * u_nr);
    out.re.e[3] = f * (g0 - half * sq(u_pr));
    out.re.e[4] = f * (g4 - half * u_pr * u_nr);
    out.re.e[5] = f * (g5 - half * sq(u_nr));
    out.im.e[0] = f * (g0 - half * sq(u_qi));
    out.im.e[1] = f * (g1 - half * u_qi * u_pi);
    out.im.e[2] = f * (g2 - half * u_qi * u_ni);
    out.im.e[3] = f * (g0 - half * sq(u_pi));
    out.im.e[4] = f * (g4 - half * u_pi * u_ni);
    out.im.e[5] = f * (g5 - half * sq(u_ni));
    return out;
  };
  auto eval_M0_jet = [&](const Jet2& r, const Jet2& th, const Jet2& w_j) {
    Jet2 ct = cos_j(th), st = sin_j(th);
    Jet2 yr = r * ct - w_j, yi = r * st;
    Jet2 T = solve_T_j(sq_j(r - w_j) + I(2.0) * (r * (w_j * (Jet2(I(1.0)) - ct))));
    Jet2 a0 = Jet2(C.a) + C.b * T, c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
    Jet2 f = I(2.0) * (expneg_j(T) * inv_j(a0 * c0));
    Jet2 inv_a0 = inv_j(a0);
    Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
    Jet2 z2r = sq_j(Zr) - sq_j(Zi);
    Jet2 fn = C.inv_sqrt2 * (T - I(2.0));
    Jet2 u_qr = Zr * ct + Zi * st, u_pr = Zr * ct - Zi * st, u_nr = u_qr * fn;
    Jet2 u_qi = Zr * st - Zi * ct, u_pi = Zi * ct + Zr * st, u_ni = u_qi * fn;
    I half = I(0.5);
    Jet2 g0 = T, g1 = z2r, g2 = T * fn, g4 = z2r * fn, g5 = T * sq_j(fn);
    struct { Jet2 re[6], im[6]; } o;
    o.re[0] = f * (g0 - half * sq_j(u_qr));
    o.re[1] = f * (g1 - half * (u_qr * u_pr));
    o.re[2] = f * (g2 - half * (u_qr * u_nr));
    o.re[3] = f * (g0 - half * sq_j(u_pr));
    o.re[4] = f * (g4 - half * (u_pr * u_nr));
    o.re[5] = f * (g5 - half * sq_j(u_nr));
    o.im[0] = f * (g0 - half * sq_j(u_qi));
    o.im[1] = f * (g1 - half * (u_qi * u_pi));
    o.im[2] = f * (g2 - half * (u_qi * u_ni));
    o.im[3] = f * (g0 - half * sq_j(u_pi));
    o.im[4] = f * (g4 - half * (u_pi * u_ni));
    o.im[5] = f * (g5 - half * sq_j(u_ni));
    return o;
  };

  Sym3 M_re, M_im;
  {
    auto re = make_dense_r_edges(24.0, 64, 24, 1.5);
    int nr = static_cast<int>(re.size()) - 1, nt = 40;
    Jet2 w_mid_j(w_mid);
    for (int ir = 0; ir < nr; ++ir) {
      I a_r(re[ir]), b_r(re[ir + 1]);
      I r_box(a_r.l, b_r.h), dr = b_r - a_r, dr2 = sq(dr), r_mid = I(0.5) * (a_r + b_r);
      for (int it = 0; it < nt; ++it) {
        I a_t = PI_IV * rat(it, nt), b_t = PI_IV * rat(it + 1, nt);
        I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
        I dt = b_t - a_t, dt2 = sq(dt), t_mid = I(0.5) * (a_t + b_t);
        I area = dr * dt * inv_pi;
        auto mid = eval_M0_pt(r_mid, t_mid, w_mid);
        auto jr = eval_M0_jet(Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_mid_j);
        auto jt = eval_M0_jet(Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_mid_j);
        for (int k = 0; k < 6; ++k) {
          M_re.e[k] = M_re.e[k] + area * (mid.re.e[k] + inv_24 * (dr2 * jr.re[k].d2 + dt2 * jt.re[k].d2));
          M_im.e[k] = M_im.e[k] + area * (mid.im.e[k] + inv_24 * (dr2 * jr.im[k].d2 + dt2 * jt.im[k].d2));
        }
      }
    }
    if (half_dw.h > 0.0) {
      auto re_d = make_dense_r_edges(24.0, 48, 20, 1.5);
      int nr_d = static_cast<int>(re_d.size()) - 1, nt_d = 32;
      Jet2 w_der(w_iv, I(1.0), I(0.0));
      Sym3 dMr, dMi;
      for (int ir = 0; ir < nr_d; ++ir) {
        I r_box(re_d[ir], re_d[ir + 1]), dr = I(re_d[ir + 1]) - I(re_d[ir]);
        for (int it = 0; it < nt_d; ++it) {
          I a_t = PI_IV * rat(it, nt_d), b_t = PI_IV * rat(it + 1, nt_d);
          I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
          I area = dr * (b_t - a_t) * inv_pi;
          auto jw = eval_M0_jet(Jet2(r_box), Jet2(t_box), w_der);
          for (int k = 0; k < 6; ++k) {
            dMr.e[k] = dMr.e[k] + area * jw.re[k].d;
            dMi.e[k] = dMi.e[k] + area * jw.im[k].d;
          }
        }
      }
      for (int k = 0; k < 6; ++k) {
        M_re.e[k] = M_re.e[k] + dw_sym * dMr.e[k];
        M_im.e[k] = M_im.e[k] + dw_sym * dMi.e[k];
      }
    }
  }

  // ------------------------------------------------------------------------
  // Step 2: Smooth-split H_{5,delta}(y) = phi_d(|y|^2) * (|y|^2 I - (1/2) y y^T) on r in [0, 24], th in [0, pi]:
  //   phi_d(R) = (R + 2.5*d^2) / (R + d^2)^{5/2},  chi_d(r) = 1 - r^3 * phi_d(r^2) in (0, 1].
  //   By exact Bernstein-Mobius algebra: lambda_max(D^2 (u^T H_{5,d}(y) u)) <= 2 * phi_d(|y|^2) EVERYWHERE,
  //   so H_{5,d}(y + K) <= H_{5,d}(y) + DH_{5,d}(y)[K] + |K|^2 * phi_d(r_lo^2) * I_2!
  //   (a) Linear matrices D0..D3 integrated via smooth Jet2 midpoint + MVT w-variation (tight to ~1e-3!)
  //   (b) Quadratic remainder E_H + outer singular tail E_tail (nonnegative PSD, direct interval sums).
  // ------------------------------------------------------------------------
  Sym3 S_re, S_im;
  double lin_rad_add = 0.0;
  {
    I c25_d2 = rat(5, 2) * del2_iv;
    I c525_d2 = rat(21, 4) * del2_iv;
    I chi_tail_num = rat(15, 8) * sq(del2_iv);
    I half = I(0.5);

    struct DJetOut { Jet2 d0r[6], d0i[6], d1r[6], d1i[6], d2c[9], d3c[9]; };
    auto eval_D_jet = [&](const Jet2& r, const Jet2& th, const Jet2& w_j) {
      Jet2 ct = cos_j(th), st = sin_j(th);
      Jet2 yr = r * ct - w_j, yi = r * st;
      Jet2 T = solve_T_j(sq_j(r - w_j) + I(2.0) * (r * (w_j * (Jet2(I(1.0)) - ct))));
      Jet2 a0 = Jet2(C.a) + C.b * T, c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
      Jet2 W = (I(2.0) * r) * (expneg_j(T) * inv_j(a0 * c0));
      Jet2 inv_a0 = inv_j(a0);
      Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
      Jet2 fn = C.inv_sqrt2 * (T - I(2.0));
      Jet2 z2r = C.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
      Jet2 z2i = (I(2.0) * C.inv_sqrt2) * (Zr * Zi);
      Jet2 Td = T - C.d;

      Jet2 r2 = sq_j(r);
      Jet2 s2 = r2 + del2_iv;
      Jet2 inv_s2 = inv_j(s2);
      Jet2 inv_s = sqrt_j(inv_s2);
      Jet2 inv_s5 = sq_j(inv_s2) * inv_s;
      Jet2 inv_s7 = inv_s5 * inv_s2;
      Jet2 phi_v = (r2 + c25_d2) * inv_s5;
      Jet2 dphi = (I(-1.0) * (rat(3, 2) * r2 + c525_d2)) * inv_s7;

      Jet2 Xx = r * ct, Xy = r * st;
      Jet2 h00_n = half * sq_j(Xx) + sq_j(Xy);
      Jet2 h11_n = sq_j(Xx) + half * sq_j(Xy);
      Jet2 h01_n = (-half) * (Xx * Xy);
      Jet2 two_x_dp = (I(2.0) * Xx) * dphi, two_y_dp = (I(2.0) * Xy) * dphi;
      Jet2 dh00_x = phi_v * Xx + two_x_dp * h00_n;
      Jet2 dh00_y = phi_v * (I(2.0) * Xy) + two_y_dp * h00_n;
      Jet2 dh11_x = phi_v * (I(2.0) * Xx) + two_x_dp * h11_n;
      Jet2 dh11_y = phi_v * Xy + two_y_dp * h11_n;
      Jet2 dh01_x = phi_v * ((-half) * Xy) + two_x_dp * h01_n;
      Jet2 dh01_y = phi_v * ((-half) * Xx) + two_y_dp * h01_n;

      Jet2 bx[6] = {Zr, Zr, Zr * fn, Jet2(I(0.0)) - Zi, Jet2(I(0.0)) - Zi, (Jet2(I(0.0)) - Zi) * fn};
      Jet2 by[6] = {Zi, Jet2(I(0.0)) - Zi, Zi * fn, Zr, Jet2(I(0.0)) - Zr, Zr * fn};

      DJetOut o;
      auto fill_diag = [&](const Jet2& k00, const Jet2& k11, const Jet2& k01, Jet2 dr[6], Jet2 di[6]) {
        Jet2 w00 = W * k00, w11 = W * k11, w01 = W * k01;
        int idx = 0;
        for (int i = 0; i < 3; ++i)
          for (int j = i; j < 3; ++j) {
            dr[idx] = w00 * (bx[i] * bx[j]) + w11 * (by[i] * by[j]) + w01 * (bx[i] * by[j] + by[i] * bx[j]);
            di[idx] = w00 * (bx[i + 3] * bx[j + 3]) + w11 * (by[i + 3] * by[j + 3])
                    + w01 * (bx[i + 3] * by[j + 3] + by[i + 3] * bx[j + 3]);
            idx++;
          }
      };
      auto fill_cross = [&](const Jet2& k00, const Jet2& k11, const Jet2& k01, Jet2 dc[9]) {
        Jet2 w00 = W * k00, w11 = W * k11, w01 = W * k01;
        for (int i = 0; i < 3; ++i)
          for (int j = 0; j < 3; ++j) {
            dc[3 * i + j] = w00 * (bx[i] * bx[j + 3]) + w11 * (by[i] * by[j + 3])
                          + w01 * (bx[i] * by[j + 3] + by[i] * bx[j + 3]);
          }
      };
      fill_diag(dh00_x * Td, dh11_x * Td, dh01_x * Td, o.d0r, o.d0i);
      Jet2 u1x = z2r + C.c1, u1y = z2i;
      fill_diag(dh00_x * u1x + dh00_y * u1y, dh11_x * u1x + dh11_y * u1y, dh01_x * u1x + dh01_y * u1y, o.d1r, o.d1i);
      fill_cross(dh00_y * Td, dh11_y * Td, dh01_y * Td, o.d2c);
      Jet2 u3x = z2i, u3y = Jet2(C.c1) - z2r;
      fill_cross(dh00_x * u3x + dh00_y * u3y, dh11_x * u3x + dh11_y * u3y, dh01_x * u3x + dh01_y * u3y, o.d3c);
      return o;
    };

    std::vector<double> r_sm;
    double r1 = std::min(0.4, 3.0 * delta);
    double r2 = 2.0, r3 = 6.5;
    for (int i = 0; i <= 24; ++i) r_sm.push_back(r1 * std::pow(static_cast<double>(i) / 24.0, 1.3));
    for (int i = 1; i <= 72; ++i) r_sm.push_back(r1 + (r2 - r1) * std::pow(static_cast<double>(i) / 72.0, 1.4));
    for (int i = 1; i <= 56; ++i) r_sm.push_back(r2 + (r3 - r2) * std::pow(static_cast<double>(i) / 56.0, 1.4));
    for (int i = 1; i <= 24; ++i) r_sm.push_back(r3 + (24.0 - r3) * std::pow(static_cast<double>(i) / 24.0, 1.8));
    int nr_sm = static_cast<int>(r_sm.size()) - 1, nt_sm = 20;

    Sym3 D0_re, D0_im, D1_re, D1_im;
    I D2_c[3][3], D3_c[3][3];
    Sym3 dD0_re, dD0_im, dD1_re, dD1_im;
    I dD2_c[3][3], dD3_c[3][3];
    for (int i = 0; i < 3; ++i)
      for (int j = 0; j < 3; ++j) {
        D2_c[i][j] = I(0.0); D3_c[i][j] = I(0.0);
        dD2_c[i][j] = I(0.0); dD3_c[i][j] = I(0.0);
      }

    Jet2 w_mid_j(w_mid);
    Jet2 w_der(w_iv, I(1.0), I(0.0));
    for (int ir = 0; ir < nr_sm; ++ir) {
      I a_r(r_sm[ir]), b_r(r_sm[ir + 1]);
      I r_box(a_r.l, b_r.h), dr = b_r - a_r, dr2 = sq(dr), r_mid = I(0.5) * (a_r + b_r);
      for (int it = 0; it < nt_sm; ++it) {
        I a_t = PI_IV * rat(it, nt_sm), b_t = PI_IV * rat(it + 1, nt_sm);
        I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
        I dt = b_t - a_t, dt2 = sq(dt), t_mid = I(0.5) * (a_t + b_t);
        I area = dr * dt * inv_pi;

        // (a) Smooth Jet2 midpoint + 2nd-order quadrature for D0..D3 at w_mid:
        auto dm = eval_D_jet(Jet2(r_mid), Jet2(t_mid), w_mid_j);
        auto dr_j = eval_D_jet(Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_mid_j);
        auto dt_j = eval_D_jet(Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_mid_j);
        for (int k = 0; k < 6; ++k) {
          D0_re.e[k] = D0_re.e[k] + area * (dm.d0r[k].v + inv_24 * (dr2 * dr_j.d0r[k].d2 + dt2 * dt_j.d0r[k].d2));
          D0_im.e[k] = D0_im.e[k] + area * (dm.d0i[k].v + inv_24 * (dr2 * dr_j.d0i[k].d2 + dt2 * dt_j.d0i[k].d2));
          D1_re.e[k] = D1_re.e[k] + area * (dm.d1r[k].v + inv_24 * (dr2 * dr_j.d1r[k].d2 + dt2 * dt_j.d1r[k].d2));
          D1_im.e[k] = D1_im.e[k] + area * (dm.d1i[k].v + inv_24 * (dr2 * dr_j.d1i[k].d2 + dt2 * dt_j.d1i[k].d2));
        }
        for (int idx = 0; idx < 9; ++idx) {
          int i = idx / 3, j = idx % 3;
          D2_c[i][j] = D2_c[i][j] + area * (dm.d2c[idx].v + inv_24 * (dr2 * dr_j.d2c[idx].d2 + dt2 * dt_j.d2c[idx].d2));
          D3_c[i][j] = D3_c[i][j] + area * (dm.d3c[idx].v + inv_24 * (dr2 * dr_j.d3c[idx].d2 + dt2 * dt_j.d3c[idx].d2));
        }
        if (half_dw.h > 0.0) {
          auto dw_j = eval_D_jet(Jet2(r_box), Jet2(t_box), w_der);
          for (int k = 0; k < 6; ++k) {
            dD0_re.e[k] = dD0_re.e[k] + area * dw_j.d0r[k].d;
            dD0_im.e[k] = dD0_im.e[k] + area * dw_j.d0i[k].d;
            dD1_re.e[k] = dD1_re.e[k] + area * dw_j.d1r[k].d;
            dD1_im.e[k] = dD1_im.e[k] + area * dw_j.d1i[k].d;
          }
          for (int idx = 0; idx < 9; ++idx) {
            int i = idx / 3, j = idx % 3;
            dD2_c[i][j] = dD2_c[i][j] + area * dw_j.d2c[idx].d;
            dD3_c[i][j] = dD3_c[i][j] + area * dw_j.d3c[idx].d;
          }
        }

        // (b) Quadratic remainder E_H + (c) Outer singular tail E_tail (both PSD multiples of G_iso!):
        I ct = cos_on_0_pi(t_box), st = sin_on_0_pi(t_box);
        I yr = r_box * ct - w_iv, yi = r_box * st;
        I T = solve_T_iv(sq(r_box - w_iv) + I(2.0) * r_box * w_iv * (I(1.0) - ct));
        I a0 = C.a + C.b * T, c0 = C.a + I(3.0) * C.b * T;
        I f2 = I(2.0) * expneg_iv(T) / (a0 * c0);
        I W_iv = area * r_box * f2;
        I inv_a0 = I(1.0) / a0;
        I Zr = yr * inv_a0, Zi = yi * inv_a0;
        I z2r_iso = sq(Zr) - sq(Zi);
        I fn = (T - I(2.0)) * C.inv_sqrt2;
        I Td = T - C.d;
        I MK = sqrt_iv(sq(Td) + sq(C.c1 + T * C.inv_sqrt2));
        double r_lo = std::max(0.0, sub_dn(r_box.l, mul_up(MK.h, s_odd)));
        I rlo2 = sq(I(r_lo));
        I s2_lo = rlo2 + del2_iv;
        I s5_lo = sq(s2_lo) * sqrt_iv(s2_lo);
        double rem_H_hi = (sq(MK * s_iv) * (rlo2 + c25_d2) / s5_lo).h;
        double chi_t_hi = 0.0;
        if (add_up(r_box.h, mul_up(MK.h, s_odd)) > R_in) {
          double r_eff = std::max(R_in, r_lo);
          I r_eff_iv(r_eff);
          I re5 = sq(sq(r_eff_iv)) * r_eff_iv;
          chi_t_hi = (chi_tail_num / re5).h;
        }
        I fac_iso = W_iv * I(add_up(rem_H_hi, chi_t_hi));
        Sym3 g;
        g.e[0] = fac_iso * T;
        g.e[1] = fac_iso * z2r_iso;
        g.e[2] = fac_iso * T * fn;
        g.e[3] = fac_iso * T;
        g.e[4] = fac_iso * z2r_iso * fn;
        g.e[5] = fac_iso * T * sq(fn);
        M_re = sym3_add(M_re, g);
        M_im = sym3_add(M_im, g);
      }
    }
    if (half_dw.h > 0.0) {
      for (int k = 0; k < 6; ++k) {
        D0_re.e[k] = D0_re.e[k] + dw_sym * dD0_re.e[k];
        D0_im.e[k] = D0_im.e[k] + dw_sym * dD0_im.e[k];
        D1_re.e[k] = D1_re.e[k] + dw_sym * dD1_re.e[k];
        D1_im.e[k] = D1_im.e[k] + dw_sym * dD1_im.e[k];
      }
      for (int i = 0; i < 3; ++i)
        for (int j = 0; j < 3; ++j) {
          D2_c[i][j] = D2_c[i][j] + dw_sym * dD2_c[i][j];
          D3_c[i][j] = D3_c[i][j] + dw_sym * dD3_c[i][j];
        }
    }

    auto split_sym3 = [&](const Sym3& D, double mid[3][3], double& rad_sq_sum) {
      static const int map[3][3] = {{0, 1, 2}, {1, 3, 4}, {2, 4, 5}};
      for (int i = 0; i < 3; ++i)
        for (int j = 0; j < 3; ++j) {
          const I& iv = D.e[map[i][j]];
          double m = 0.5 * (iv.l + iv.h);
          double r = std::max(sub_up(iv.h, m), sub_up(m, iv.l));
          mid[i][j] = m;
          rad_sq_sum = add_up(rad_sq_sum, mul_up(r, r));
        }
    };
    auto add_sq_sym = [&](const double M[3][3], Sym3& dst) {
      int idx = 0;
      for (int i = 0; i < 3; ++i)
        for (int j = i; j < 3; ++j) {
          I s_acc(0.0);
          for (int k = 0; k < 3; ++k) s_acc = s_acc + I(M[i][k]) * I(M[j][k]);
          dst.e[idx] = dst.e[idx] + s_acc;
          idx++;
        }
    };
    auto add_sq_cross = [&](const double C_m[3][3], Sym3& dst_re, Sym3& dst_im) {
      int idx = 0;
      for (int i = 0; i < 3; ++i)
        for (int j = i; j < 3; ++j) {
          I sr(0.0), si(0.0);
          for (int k = 0; k < 3; ++k) {
            sr = sr + I(C_m[i][k]) * I(C_m[j][k]);
            si = si + I(C_m[k][i]) * I(C_m[k][j]);
          }
          dst_re.e[idx] = dst_re.e[idx] + sr;
          dst_im.e[idx] = dst_im.e[idx] + si;
          idx++;
        }
    };
    double m0r[3][3], m0i[3][3], m1r[3][3], m1i[3][3], m2c[3][3], m3c[3][3];
    double r0sq = 0.0, r1sq = 0.0, r2sq = 0.0, r3sq = 0.0;
    split_sym3(D0_re, m0r, r0sq); split_sym3(D0_im, m0i, r0sq);
    split_sym3(D1_re, m1r, r1sq); split_sym3(D1_im, m1i, r1sq);
    for (int i = 0; i < 3; ++i)
      for (int j = 0; j < 3; ++j) {
        double m2 = 0.5 * (D2_c[i][j].l + D2_c[i][j].h);
        double r2 = std::max(sub_up(D2_c[i][j].h, m2), sub_up(m2, D2_c[i][j].l));
        m2c[i][j] = m2; r2sq = add_up(r2sq, mul_up(2.0, mul_up(r2, r2)));
        double m3 = 0.5 * (D3_c[i][j].l + D3_c[i][j].h);
        double r3 = std::max(sub_up(D3_c[i][j].h, m3), sub_up(m3, D3_c[i][j].l));
        m3c[i][j] = m3; r3sq = add_up(r3sq, mul_up(2.0, mul_up(r3, r3)));
      }
    add_sq_sym(m0r, S_re); add_sq_sym(m0i, S_im);
    add_sq_sym(m1r, S_re); add_sq_sym(m1i, S_im);
    add_sq_cross(m2c, S_re, S_im);
    add_sq_cross(m3c, S_re, S_im);
    lin_rad_add = mul_up(s_odd, sqrt_up_strict(add_up(add_up(r0sq, r1sq), add_up(r2sq, r3sq))));
  }

  // ------------------------------------------------------------------------
  // Step 3: Exact Zero-Overlap Inner Pullback on |y| <= R_in, th in [0, pi]:
  //   Domain {|Phi(z)| <= R_in} maps bijectively onto {|y| <= R_in} -> ZERO overlap ring!
  //   Weighted by chi_{5,delta}(r) = 1 - r^3*(r^2+2.5*d^2)/(r^2+d^2)^{5/2} (strictly decreasing in r).
  // ------------------------------------------------------------------------
  {
    int nr_in = 36, nt_in = 28;
    std::vector<double> r_in_e(nr_in + 1);
    for (int i = 0; i <= nr_in; ++i) {
      double u = static_cast<double>(i) / static_cast<double>(nr_in);
      r_in_e[i] = R_in * std::pow(u, 1.8);
    }
    I one_p_eps = I(1.0) + eps_iv;
    I one_p_inveps = I(1.0) + I(1.0) / eps_iv;
    I c25_d2 = rat(5, 2) * del2_iv;

    double d_QP_hi = 0.0, d_nu_hi = 0.0;
    for (int ir = 0; ir < nr_in; ++ir) {
      I r_box(r_in_e[ir], r_in_e[ir + 1]), dr = I(r_in_e[ir + 1]) - I(r_in_e[ir]);
      I rl_iv(r_box.l), rl2 = sq(rl_iv), s2l = rl2 + del2_iv;
      I s5l = sq(s2l) * sqrt_iv(s2l);
      double chi_hi = (I(1.0) - (rl_iv * rl2) * (rl2 + c25_d2) / s5l).h;
      if (chi_hi <= 0.0) continue;

      for (int it = 0; it < nt_in; ++it) {
        I a_t = PI_IV * rat(it, nt_in), b_t = PI_IV * rat(it + 1, nt_in);
        I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
        I area = dr * (b_t - a_t) * inv_pi;
        I ct = cos_on_0_pi(t_box);
        I v = sq(r_box - w_iv) + I(2.0) * r_box * w_iv * (I(1.0) - ct);
        I L_t = sqrt_iv(v);
        I T_t = solve_T_iv(v);
        I h = C.a + C.b * T_t, h3 = C.a + I(3.0) * C.b * T_t;

        double T_hi = T_glob;
        for (int fp = 0; fp < 6; ++fp) {
          I T_rng(0.0, T_hi);
          I MK_fp = sqrt_iv(sq(T_rng - C.d) + sq(C.c1 + T_rng * C.inv_sqrt2));
          double L_hi_new = add_up(L_t.h, mul_up(MK_fp.h, s_odd));
          double T_new = solve_T_iv(sq(I(L_hi_new))).h;
          if (T_new < T_hi) T_hi = T_new;
          else break;
        }
        I T_rng_hi(0.0, T_hi);
        I MK_hi = sqrt_iv(sq(T_rng_hi - C.d) + sq(C.c1 + T_rng_hi * C.inv_sqrt2));
        double L_lo_val = std::max(0.0, sub_dn(L_t.l, mul_up(MK_hi.h, s_odd)));
        double T_lo = solve_T_iv(sq(I(L_lo_val))).l;
        if (T_lo > T_hi) T_lo = T_hi;
        double r_hi = sqrt_up_strict(T_hi);

        I T_loc(T_lo, T_hi);
        I MK_loc = sqrt_iv(sq(T_loc - C.d) + sq(C.c1 + T_loc * C.inv_sqrt2));
        I delta_z = MK_loc * s_iv / (C.a + C.b * I(0.5) * (I(T_lo) + I(T_t.l)));

        double T_max_both = std::max(T_hi, T_t.h);
        I rhop_min1 = sqrt_iv(I(3.0) * C.a * C.b);
        I rhop_min2 = (C.a + I(3.0) * C.b * I(T_lo)) / (I(2.0) * sqrt_iv(I(T_max_both)));
        double rhop_dn = std::max(rhop_min1.l, rhop_min2.l);
        assert(rhop_dn > 0.0);
        double dT_ub = div_up(mul_up(MK_loc.h, s_odd), rhop_dn);

        double r_over_h_hi = std::min((I(0.5) / sqrt_iv(C.a * C.b)).h,
                                      (I(r_hi) / (C.a + C.b * I(T_lo))).h);
        double r_over_h3_hi = std::min((I(0.5) / sqrt_iv(I(3.0) * C.a * C.b)).h,
                                       (I(r_hi) / (C.a + I(3.0) * C.b * I(T_lo))).h);
        double den1_dn = sub_dn(1.0, mul_up(mul_up((C.sqrt3 + I(1.0)).h, s_odd), r_over_h_hi));
        double den2_dn = sub_dn(1.0, mul_up(mul_up(C.sqrt2.h, s_odd), r_over_h3_hi));
        assert(den1_dn > 0.0 && den2_dn > 0.0);
        double num1_up = add_up(1.0, (C.b * I(dT_ub) / (C.a + C.b * I(T_lo))).h);
        double num2_up = add_up(1.0, (I(3.0) * C.b * I(dT_ub) / (C.a + I(3.0) * C.b * I(T_lo))).h);
        double exp_diff_hi = exppos_iv(I(dT_ub)).h;
        double W_hi = div_up(mul_up(exp_diff_hi, mul_up(num1_up, num2_up)), mul_dn(den1_dn, den2_dn));
        I W_ratio(1.0, std::max(1.0, W_hi));
        I mult_A = one_p_eps * W_ratio - I(1.0);
        assert(mult_A.l >= 0.0);

        auto m0 = eval_M0_pt(r_box, t_box, w_iv);
        I fac = area * I(mul_up(chi_hi, mult_A.h));
        M_re = sym3_add(M_re, sym3_scale(fac, m0.re));
        M_im = sym3_add(M_im, sym3_scale(fac, m0.im));

        I Lip_nu(std::max(((I(2.0) - I(T_lo)) * C.inv_sqrt2).h, ((I(3.0) * I(T_hi) - I(2.0)) * C.inv_sqrt2).h));
        I f_w = I(2.0) * expneg_iv(T_t) / (h * h3);
        I dE_cell = area * I(chi_hi) * f_w * I(W_ratio.h) * sq(delta_z) * (I(2.0) + Lip_nu);
        d_QP_hi = add_up(d_QP_hi, dE_cell.h);
        d_nu_hi = add_up(d_nu_hi, (dE_cell * Lip_nu).h);
      }
    }
    double add_QP = mul_up(one_p_inveps.h, d_QP_hi);
    double add_nu = mul_up(one_p_inveps.h, d_nu_hi);
    M_re.e[0] = M_re.e[0] + I(0.0, add_QP);
    M_re.e[3] = M_re.e[3] + I(0.0, add_QP);
    M_re.e[5] = M_re.e[5] + I(0.0, add_nu);
    M_im.e[0] = M_im.e[0] + I(0.0, add_QP);
    M_im.e[3] = M_im.e[3] + I(0.0, add_QP);
    M_im.e[5] = M_im.e[5] + I(0.0, add_nu);
  }

  // Add r >= 24 outer tail + Frobenius radius of linear matrices D_k:
  double diag_add = add_up(odd_tail_tot, lin_rad_add);
  M_re.e[0] = M_re.e[0] + I(0.0, diag_add);
  M_re.e[3] = M_re.e[3] + I(0.0, diag_add);
  M_re.e[5] = M_re.e[5] + I(0.0, diag_add);
  M_im.e[0] = M_im.e[0] + I(0.0, diag_add);
  M_im.e[3] = M_im.e[3] + I(0.0, diag_add);
  M_im.e[5] = M_im.e[5] + I(0.0, diag_add);

  // Step 4: Choose best AM-GM weight lambda > 0 for sum_k v_k D_hat_k <= (s/2)*(lam*I + (1/lam)*S):
  static constexpr double lam_grid[14] = {0.02, 0.05, 0.1, 0.2, 0.35, 0.5, 0.75, 1.0, 1.35, 1.8, 2.5, 3.5, 5.0, 8.0};
  double best_m = -1e30, best_lam = 1.0;
  Sym3 best_re = M_re, best_im = M_im;
  for (double lam : lam_grid) {
    I c_id = I(0.5) * s_iv * I(lam);
    I c_S = (I(0.5) * s_iv) / I(lam);
    Sym3 Tr = sym3_add(M_re, sym3_scale(c_S, S_re));
    Sym3 Ti = sym3_add(M_im, sym3_scale(c_S, S_im));
    Tr.e[0] = Tr.e[0] + c_id; Tr.e[3] = Tr.e[3] + c_id; Tr.e[5] = Tr.e[5] + c_id;
    Ti.e[0] = Ti.e[0] + c_id; Ti.e[3] = Ti.e[3] + c_id; Ti.e[5] = Ti.e[5] + c_id;
    double m = std::min(check_B3_minus_M3_pd(Tr), check_B3_minus_M3_pd(Ti));
    if (m > best_m) { best_m = m; best_lam = lam; best_re = Tr; best_im = Ti; }
  }

  Part2Slab out;
  out.wl = wl; out.wh = wh; out.s_odd = s_odd; out.delta = delta; out.eps_cs = eps_cs;
  out.R_in = R_in; out.lam = best_lam;
  out.M_re = best_re; out.M_im = best_im;
  out.margin = best_m;
  return out;
}

// ============================================================================
// 7. Part 3: 2nd-Order Cell-Exact 2x2 Factored M_odd + C0 Engine on Polar Grid
// ============================================================================
// Exact Gamma-tail moment F_k(t) = int_t^inf u^k e^{-u} du for k = 0..5:
static I gamma_tail_iv(int k, I t) {
  I e = expneg_iv(t);
  if (k == 0) return e;
  if (k == 1) return e * (t + I(1.0));
  I t2 = sq(t);
  if (k == 2) return e * (t2 + I(2.0) * t + I(2.0));
  I t3 = t2 * t;
  if (k == 3) return e * (t3 + I(3.0) * t2 + I(6.0) * t + I(6.0));
  I t4 = sq(t2);
  if (k == 4) return e * (t4 + I(4.0) * t3 + I(12.0) * t2 + I(24.0) * t + I(24.0));
  return e * (t4 * t + I(5.0) * t4 + I(20.0) * t3 + I(60.0) * t2 + I(120.0) * t + I(120.0));
}

struct RingGeom {
  double Tl, Th, Tm, hT;
  I rl, rh, rm, L_l, L_h, gp_max, gpp_max, MK_max;
  I fl, fh;
  I wt_T;      // exp(-Tl) - exp(-Th)
  I wt_T1;     // int (T - Tm) e^{-T} dT
  I wt_T2;     // int (T - Tm)^2 e^{-T} dT
  I Imom[3];   // int T * [1, f, f^2] e^{-T} dT
  I Jmom[3];   // int (T - Tm) * T * [1, f, f^2] e^{-T} dT
  I Kmom[3];   // int (T - Tm)^2 * T * [1, f, f^2] e^{-T} dT
};

struct AngGeom {
  I df;                     // exact outward-rounded (num_h - num_l) / den
  I pl, ph, pm, hp;
  I wt_p2;                  // (1/(2pi)) int_{-hp}^{hp} v^2 dv = hp^3 / (3*pi)
  I cp, sp, c2p, s2p;       // cos(pm), sin(pm), cos(2*pm), sin(2*pm)
  I ang0[3];                // (1/(2pi)) int [cos^2, sin^2, cos*sin] dphi
  I ang1[3];                // (1/(2pi)) int (phi - pm) * [cos^2, sin^2, cos*sin] dphi
  I ang2[3];                // (1/(2pi)) int (phi - pm)^2 * [cos^2, sin^2, cos*sin] dphi
};

static RingGeom make_ring_geom(double Tl, double Th) {
  RingGeom g;
  g.Tl = Tl; g.Th = Th;
  g.Tm = 0.5 * add_up(Tl, Th);
  g.hT = std::max(sub_up(g.Tm, Tl), sub_up(Th, g.Tm));
  assert(sub_dn(g.hT, sub_up(g.Tm, Tl)) >= 0.0 && sub_dn(g.hT, sub_up(Th, g.Tm)) >= 0.0);
  I Tli(Tl), Thi(Th), Tmi(g.Tm);
  g.rl = sqrt_iv(Tli); g.rh = sqrt_iv(Thi); g.rm = sqrt_iv(Tmi);
  g.L_l = g.rl * (C.a + C.b * Tli);
  g.L_h = g.rh * (C.a + C.b * Thi);
  if (Tl > 0.0) {
    g.gp_max = I(0.5) * C.a / g.rl + I(1.5) * C.b * g.rh;
    g.gpp_max = I(0.25) * C.a / (Tli * g.rl) + I(0.75) * C.b / g.rl;
  } else {
    g.gp_max = I(0.0); g.gpp_max = I(0.0);
  }
  I T_iv(Tl, Th);
  g.MK_max = sqrt_iv(sq(T_iv - C.d) + sq(C.c1 + Thi * C.inv_sqrt2));
  g.fl = (Tli - I(2.0)) * C.inv_sqrt2;
  g.fh = (Thi - I(2.0)) * C.inv_sqrt2;
  g.wt_T = expneg_iv(Tli) - expneg_iv(Thi);
  if (g.wt_T.l < 0.0) g.wt_T = I(0.0, g.wt_T.h);

  I m[6];
  for (int k = 1; k <= 5; ++k) m[k] = gamma_tail_iv(k, Tli) - gamma_tail_iv(k, Thi);
  I Tm2 = sq(Tmi);
  g.wt_T1 = m[1] - Tmi * g.wt_T;
  g.wt_T2 = m[2] - I(2.0) * Tmi * m[1] + Tm2 * g.wt_T;
  g.Imom[0] = m[1];
  g.Imom[1] = (m[2] - I(2.0) * m[1]) * C.inv_sqrt2;
  g.Imom[2] = I(0.5) * (m[3] - I(4.0) * m[2] + I(4.0) * m[1]);
  g.Jmom[0] = m[2] - Tmi * m[1];
  g.Jmom[1] = ((m[3] - I(2.0) * m[2]) - Tmi * (m[2] - I(2.0) * m[1])) * C.inv_sqrt2;
  g.Jmom[2] = I(0.5) * ((m[4] - I(4.0) * m[3] + I(4.0) * m[2]) - Tmi * (m[3] - I(4.0) * m[2] + I(4.0) * m[1]));
  // Exact int (T - Tm)^2 * T * [1, f, f^2] e^{-T} dT:
  I u2_1 = m[3] - I(2.0) * Tmi * m[2] + Tm2 * m[1];
  I u2_2 = m[4] - I(2.0) * Tmi * m[3] + Tm2 * m[2];
  I u2_3 = m[5] - I(2.0) * Tmi * m[4] + Tm2 * m[3];
  g.Kmom[0] = u2_1;
  g.Kmom[1] = (u2_2 - I(2.0) * u2_1) * C.inv_sqrt2;
  g.Kmom[2] = I(0.5) * (u2_3 - I(4.0) * u2_2 + I(4.0) * u2_1);
  return g;
}

static AngGeom make_ang_geom_rat(int64_t num_l, int64_t num_h, int64_t den) {
  AngGeom g;
  I fl = rat(num_l, den), fh = rat(num_h, den), fm = rat(num_l + num_h, 2 * den);
  I df = rat(num_h - num_l, den);
  assert(df.l <= df.h && mul_up(df.h, static_cast<double>(den)) >= static_cast<double>(num_h - num_l));
  g.df = df;
  g.pl = TWO_PI_IV * fl;
  g.ph = TWO_PI_IV * fh;
  g.pm = TWO_PI_IV * fm;
  g.hp = TWO_PI_IV * rat(num_h - num_l, 2 * den);
  g.wt_p2 = (g.hp * sq(g.hp)) / (I(3.0) * PI_IV);
  sincos_angle_iv(g.pm, g.sp, g.cp);
  sincos_angle_iv(TWO_PI_IV * rat(num_l + num_h, den), g.s2p, g.c2p);

  I s2l, c2l, s2h, c2h;
  sincos_angle_iv(TWO_PI_IV * rat(2 * num_l, den), s2l, c2l);
  sincos_angle_iv(TWO_PI_IV * rat(2 * num_h, den), s2h, c2h);
  I inv2pi = I(1.0) / TWO_PI_IV;
  I dp = g.ph - g.pl;
  I half_dp = I(0.5) * dp;
  // Exact angular integrals divided by 2*pi:
  g.ang0[0] = I(0.5) * df + I(0.25) * (s2h - s2l) * inv2pi;
  g.ang0[1] = I(0.5) * df - I(0.25) * (s2h - s2l) * inv2pi;
  g.ang0[2] = I(-0.25) * (c2h - c2l) * inv2pi;
  I ic2 = (I(0.5) * half_dp * (s2h + s2l) + I(0.25) * (c2h - c2l)) * inv2pi;
  I is2 = (I(-0.5) * half_dp * (c2h + c2l) + I(0.25) * (s2h - s2l)) * inv2pi;
  g.ang1[0] = I(0.5) * ic2;
  g.ang1[1] = I(-0.5) * ic2;
  g.ang1[2] = I(0.5) * is2;

  // Exact J2(h) = int_{-h}^h v^2 cos(2v) dv via zero-cancellation alternating series (for h <= 0.4):
  //   J2(h) = sum_{k>=0} (-1)^k * 2^{2k+1} / ((2k)!*(2k+3)) * h^{2k+3}
  //         = (2/3)h^3 - (4/5)h^5 + (4/21)h^7 - (8/405)h^9 + (4/3465)h^11 - (8/184275)h^13 + ...
  assert(g.hp.h < 0.5);
  I h = g.hp, h2 = sq(h), h3 = h2 * h, h5 = h3 * h2, h7 = h5 * h2, h9 = h7 * h2, h11 = h9 * h2, h13 = h11 * h2;
  I j2_lo = rat(2, 3) * h3 - rat(4, 5) * h5 + rat(4, 21) * h7 - rat(8, 405) * h9 + rat(4, 3465) * h11 - rat(8, 184275) * h13;
  I j2_hi = rat(2, 3) * h3 - rat(4, 5) * h5 + rat(4, 21) * h7 - rat(8, 405) * h9 + rat(4, 3465) * h11;
  I J2(j2_lo.l, j2_hi.h);
  I h3_3 = h3 / I(3.0);
  g.ang2[0] = (h3_3 + I(0.5) * g.c2p * J2) * inv2pi;
  g.ang2[1] = (h3_3 - I(0.5) * g.c2p * J2) * inv2pi;
  g.ang2[2] = (I(0.5) * g.s2p * J2) * inv2pi;
  return g;
}

// Radial polynomial q(T) = sig2 + T*(c0 + 2*c1*f_nu + c2*f_nu^2) >= sig2 > 0
struct QPoly {
  double sig2, c0, c1, c2;
};

static inline void eval_q_bounds(const QPoly& q, const RingGeom& rg, double& q_lo, double& q_hi) {
  // Certified check that c0 >= 0, c2 >= 0, c1^2 <= c0*c2 (so c0 + 2*c1*f + c2*f^2 >= 0 everywhere!).
  assert(q.sig2 > 0.0 && q.c0 >= 0.0 && q.c2 >= 0.0);
  if (q.c1 != 0.0) assert(mul_up(q.c1, q.c1) <= mul_dn(q.c0, q.c2));
  if (q.c0 == 0.0 && q.c2 == 0.0) {
    q_lo = q_hi = q.sig2;
    return;
  }
  I c0i(q.c0), c1i(q.c1), c2i(q.c2);
  auto qf = [&](I f) { return c0i + I(2.0) * c1i * f + c2i * sq(f); };
  I ql = qf(rg.fl), qh = qf(rg.fh);
  double qf_lo = std::min(ql.l, qh.l);
  double qf_hi = std::max(ql.h, qh.h);
  if (q.c2 > 0.0) {
    I fstar = (-c1i) / c2i;
    if (fstar.h >= rg.fl.l && fstar.l <= rg.fh.h) {
      I qv = c0i - sq(c1i) / c2i;
      qf_lo = std::min(qf_lo, qv.l);
    }
  }
  qf_lo = std::max(0.0, qf_lo);
  q_lo = add_dn(q.sig2, mul_dn(rg.Tl, qf_lo));
  q_hi = add_up(q.sig2, mul_up(rg.Th, qf_hi));
}

// Accumulate 9 angular-weighted scalars into a 6x6 symmetric interval matrix M[21] using RingGeom's Imom[3]!
// S4(i, j) = sum of 3 angular moments (c2, s2, cs) weighted by (a00, a11, a01):
//   M6_idx(a, b) = S4[idx4[a]][idx4[b]] * Imom[powf[a] + powf[b]]!
static void add_ring_accum_to_M6(const I acc_a[3], const I acc_b[3], const I acc_g[3],
                                 const I Imom[3], I M[21]) {
  // acc_a = sum_m a00_m * [c2, s2, cs], acc_b = sum_m a11_m * [c2, s2, cs], acc_g = sum_m a01_m * [c2, s2, cs].
  // Build 4x4 symmetric matrix S4 on (u_Q, v_Q, u_P, v_P):
  //   r = [c, -s, c, s], i = [s, c, -s, c]
  // Exact closed-form formulas for all 10 upper-triangle entries of S4:
  //   (0,0): a*c2 + b*s2 + 2*g*cs
  //   (0,1): -a*cs + b*cs + g*(c2 - s2)
  //   (0,2): a*c2 - b*s2
  //   (0,3): a*cs + b*cs + g*(c2 + s2)
  //   (1,1): a*s2 + b*c2 - 2*g*cs
  //   (1,2): -a*cs - b*cs + g*(c2 + s2)
  //   (1,3): -a*s2 + b*c2
  //   (2,2): a*c2 + b*s2 - 2*g*cs
  //   (2,3): a*cs - b*cs + g*(c2 - s2)
  //   (3,3): a*s2 + b*c2 + 2*g*cs
  I S4[4][4];
  I c2a = acc_a[0], s2a = acc_a[1], csa = acc_a[2];
  I c2b = acc_b[0], s2b = acc_b[1], csb = acc_b[2];
  I c2g = acc_g[0], s2g = acc_g[1], csg = acc_g[2];
  I two_csg = I(2.0) * csg;
  I g_diff = c2g - s2g, g_sum = c2g + s2g;

  S4[0][0] = c2a + s2b + two_csg;
  S4[0][1] = S4[1][0] = (csb - csa) + g_diff;
  S4[0][2] = S4[2][0] = c2a - s2b;
  S4[0][3] = S4[3][0] = (csa + csb) + g_sum;
  S4[1][1] = s2a + c2b - two_csg;
  S4[1][2] = S4[2][1] = -(csa + csb) + g_sum;
  S4[1][3] = S4[3][1] = c2b - s2a;
  S4[2][2] = c2a + s2b - two_csg;
  S4[2][3] = S4[3][2] = (csa - csb) + g_diff;
  S4[3][3] = s2a + c2b + two_csg;

  static const int idx4[6] = {0, 2, 0, 1, 3, 1};
  static const int powf[6] = {0, 0, 1, 0, 0, 1};
  int k = 0;
  for (int i = 0; i < 6; ++i)
    for (int j = i; j < 6; ++j) {
      M[k] = M[k] + S4[idx4[i]][idx4[j]] * Imom[powf[i] + powf[j]];
      ++k;
    }
}

struct PolarGridLevel {
  double T_cut;
  std::vector<RingGeom> rings;
  std::vector<AngGeom> angs;
  // Precomputed mdepth=1 half-rings (2*rings.size()) and half-angles (2*angs.size()) for zero-alloc adaptive split!
  std::vector<RingGeom> sub_rings;
  std::vector<AngGeom> sub_angs;
  // Exact T >= T_cut Gamma tails: F0, F1, F2, F3
  I F0, F1, F2, F3;
};

static PolarGridLevel build_polar_grid(const std::vector<double>& T_edges, int nP) {
  PolarGridLevel gl;
  gl.T_cut = T_edges.back();
  gl.rings.reserve(T_edges.size() - 1);
  gl.sub_rings.reserve(2 * (T_edges.size() - 1));
  for (size_t j = 0; j + 1 < T_edges.size(); ++j) {
    gl.rings.push_back(make_ring_geom(T_edges[j], T_edges[j + 1]));
    double Tm = 0.5 * (T_edges[j] + T_edges[j + 1]);
    gl.sub_rings.push_back(make_ring_geom(T_edges[j], Tm));
    gl.sub_rings.push_back(make_ring_geom(Tm, T_edges[j + 1]));
  }
  gl.angs.reserve(nP);
  gl.sub_angs.reserve(2 * nP);
  for (int m = 0; m < nP; ++m) {
    gl.angs.push_back(make_ang_geom_rat(m, m + 1, nP));
    gl.sub_angs.push_back(make_ang_geom_rat(2 * m, 2 * m + 1, 2 * nP));
    gl.sub_angs.push_back(make_ang_geom_rat(2 * m + 1, 2 * m + 2, 2 * nP));
  }
  I Tc(gl.T_cut);
  gl.F0 = gamma_tail_iv(0, Tc);
  gl.F1 = gamma_tail_iv(1, Tc);
  gl.F2 = gamma_tail_iv(2, Tc);
  gl.F3 = gamma_tail_iv(3, Tc);
  return gl;
}

// Exact 2nd-order cell upper bound for int_{cell} psi(|X(T,phi)|, q(T)) e^{-T} dT dphi/(2pi),
// where psi(r, q) = q^2 / (mu*(mu + r)^2) = 2*mu - 2*r - q/mu, mu = sqrt(r^2 + q):
//   d(psi)/dq = q/(2 mu^3) > 0,  -psi'(r) = q^2*(2*mu + r)/(mu^3*(mu + r)^2) > 0 (zero cancellation!),
//   psi''(r) = 3*q^2/mu^5 > 0, tangential eig psi'(r)/r < 0, negative jump at X = 0.
static inline double eval_c0_cell_ub(const RingGeom& rg, const AngGeom& ag, bool first_ring,
                                     I X0x, I X0y, I r2, I r0_iv, I XT0x, I XT0y,
                                     double rl_cell, double rl_box, double dX_box,
                                     double q_hi, bool same_q, I mu_in, double mu_c_dn_in,
                                     double XT_max, double Xp_max,
                                     double XTT_max, double XTp_max, double Xpp_max,
                                     double alpha, double beta) {
  double df_hi = ag.df.h;
  double wt_cell_hi = mul_up(rg.wt_T.h, df_hi);
  double mu_b_dn = (same_q && dX_box == 0.0) ? mu_c_dn_in : sqrt_dn_strict(add_dn(mul_dn(rl_box, rl_box), q_hi));
  double smr_b = add_dn(mu_b_dn, rl_box);
  double psi_box_up = div_up(mul_up(q_hi, q_hi), mul_dn(mu_b_dn, mul_dn(smr_b, smr_b)));
  double c0_zero_hi = mul_up(wt_cell_hi, psi_box_up);
  if (first_ring || r0_iv.l <= 0.0 || c0_zero_hi <= 1e-7) return c0_zero_hi;

  I qi(q_hi), q2 = sq(qi);
  I mu0 = same_q ? mu_in : sqrt_iv(r2 + qi);
  I smr0 = mu0 + r0_iv;
  I smr0_sq = sq(smr0);
  I psi0 = q2 / (mu0 * smr0_sq);
  I abs_grad = (q2 * (I(2.0) * mu0 + r0_iv)) / (mu0 * sq(mu0) * smr0_sq);
  I lin_T = (-(abs_grad / r0_iv)) * (X0x * XT0x + X0y * XT0y);
  I base_int = (rg.wt_T * psi0 + rg.wt_T1 * lin_T) * ag.df;

  double mu_c_dn = same_q ? mu_c_dn_in : sqrt_dn_strict(add_dn(mul_dn(rl_cell, rl_cell), q_hi));
  double m2 = mul_dn(mu_c_dn, mu_c_dn);
  double m5 = mul_dn(mul_dn(m2, m2), mu_c_dn);
  double h_fac = div_up(mul_up(1.5, mul_up(q_hi, q_hi)), m5);
  double g_half = mul_up(0.5, abs_grad.h);
  double cuu_c = add_up(mul_up(h_fac, mul_up(add_up(1.0, alpha), mul_up(XT_max, XT_max))),
                        mul_up(g_half, add_up(XTT_max, mul_up(beta, XTp_max))));
  double cvv_c = add_up(mul_up(h_fac, mul_up(add_up(1.0, div_up(1.0, alpha)), mul_up(Xp_max, Xp_max))),
                        mul_up(g_half, add_up(Xpp_max, div_up(XTp_max, beta))));
  double rem_u = mul_up(cuu_c, mul_up(rg.wt_T2.h, df_hi));
  double rem_v = mul_up(cvv_c, mul_up(rg.wt_T.h, ag.wt_p2.h));

  double box_add = 0.0;
  if (dX_box > 0.0) {
    double mu_c_up = sqrt_up_strict(add_up(mul_up(rl_cell, rl_cell), q_hi));
    double smr_c_up = add_up(mu_c_up, rl_cell);
    double psi_cell_dn = div_dn(mul_dn(q_hi, q_hi), mul_up(mu_c_up, mul_up(smr_c_up, smr_c_up)));
    box_add = mul_up(wt_cell_hi, std::max(0.0, sub_up(psi_box_up, psi_cell_dn)));
  }
  double c0_2nd_hi = add_up(add_up(base_int.h, add_up(rem_u, rem_v)), box_add);
  return std::min(c0_zero_hi, c0_2nd_hi);
}

// Recursive 2D cell evaluation (depth > 0 only for cells near a zero of X where err_2nd is non-negligible):
static void eval_odd_subcell(const RingGeom& rg, const AngGeom& ag,
                             int64_t num_l, int64_t num_h, int64_t den,
                             I wc, double rw, I Arc, I Aic, I Brc, I Bic,
                             I absAc, I absBc, double rv, const QPoly& q,
                             int depth, int max_depth, double split_tol,
                             I M_out[21], double& C0_hi) {
  double q_lo, q_hi;
  eval_q_bounds(q, rg, q_lo, q_hi);

  // Center X0 = L(Tm, pm) + wc + K(Tm, pm; Ac, Bc):
  I Lr0 = rg.rm * (C.a + C.b * I(rg.Tm));
  I L0x = Lr0 * ag.cp, L0y = Lr0 * ag.sp;
  I Td = I(rg.Tm) - C.d;
  I Ts2 = I(rg.Tm) * C.inv_sqrt2;
  I K0x = Td * Arc + C.c1 * Brc + Ts2 * (ag.c2p * Brc + ag.s2p * Bic);
  I K0y = Td * Aic + C.c1 * Bic + Ts2 * (ag.s2p * Brc - ag.c2p * Bic);
  I X0x = L0x + wc + K0x;
  I X0y = L0y + K0y;
  I r0_iv = sqrt_iv(sq(X0x) + sq(X0y));

  // Upper bound on cell variation dX_cell and box variation dX_box:
  double dL_rad = std::max(sub_up(rg.L_h.h, Lr0.l), sub_up(Lr0.h, rg.L_l.l));
  double dL_ang = mul_up(rg.L_h.h, ag.hp.h);
  double dK_cell = add_up(mul_up(rg.hT, absAc.h),
                          mul_up(add_up(rg.hT, mul_up(2.0, mul_up(rg.Th, ag.hp.h))), mul_up(absBc.h, C.inv_sqrt2.h)));
  double dX_cell = add_up(add_up(dL_rad, dL_ang), dK_cell);
  double dX_box = add_up(rw, mul_up(rg.MK_max.h, rv));

  double rl_cell = std::max(0.0, sub_dn(r0_iv.l, dX_cell));
  double rl_box = std::max(0.0, sub_dn(rl_cell, dX_box));
  double mu_min_cell_dn = sqrt_dn_strict(add_dn(mul_dn(rl_cell, rl_cell), q_lo));
  double mu_min_box_dn = sqrt_dn_strict(add_dn(mul_dn(rl_box, rl_box), q_lo));
  double inv_mu_box_up = div_up(1.0, mu_min_box_dn);

  double lip_box = exact_lip_shift_up(rl_cell, dX_box, q_lo);

  double err_cell_first = 0.0;
  double cuu = 0.0, cvv = 0.0, err_avg = 0.0;
  double XT_max = 0.0, Xp_max = 0.0, XTT_max = 0.0, XTp_max = 0.0, Xpp_max = 0.0;
  double alpha = 1.0, beta = 1.0;
  bool first_ring = (rg.Tl == 0.0);
  if (first_ring) {
    err_cell_first = exact_lip_shift_up(r0_iv.l, dX_cell, q_lo);
    err_avg = err_cell_first;
  } else {
    // Exact cell-integrated 2nd-order remainder using Bernstein-certified C1 = 1, C2 = 2 and AM-GM:
    //   rem(u, v) <= cuu * u^2 + cvv * v^2  (exact 3x smaller cell integral via Kmom & ang2!).
    XT_max = add_up(add_up(rg.gp_max.h, absAc.h), mul_up(absBc.h, C.inv_sqrt2.h));
    Xp_max = add_up(rg.L_h.h, mul_up(mul_up(C.sqrt2.h, rg.Th), absBc.h));
    XTT_max = rg.gpp_max.h;
    XTp_max = add_up(rg.gp_max.h, mul_up(C.sqrt2.h, absBc.h));
    Xpp_max = add_up(rg.L_h.h, mul_up(mul_up(2.0, C.sqrt2.h), mul_up(rg.Th, absBc.h)));

    alpha = std::max(1e-12, std::min(1e12, (ag.hp.h * Xp_max) / std::max(1e-30, rg.hT * XT_max)));
    beta = std::max(1e-12, std::min(1e12, ag.hp.h / std::max(1e-30, rg.hT)));
    double m2 = mul_dn(mu_min_cell_dn, mu_min_cell_dn);
    double m3 = mul_dn(m2, mu_min_cell_dn);
    double two_m2 = mul_dn(2.0, m2);
    cuu = add_up(div_up(mul_up(add_up(1.0, alpha), mul_up(XT_max, XT_max)), m3),
                 div_up(add_up(XTT_max, mul_up(beta, XTp_max)), two_m2));
    cvv = add_up(div_up(mul_up(add_up(1.0, div_up(1.0, alpha)), mul_up(Xp_max, Xp_max)), m3),
                 div_up(add_up(Xpp_max, div_up(XTp_max, beta)), two_m2));
    err_avg = mul_up(1.0 / 3.0, add_up(mul_up(cuu, mul_up(rg.hT, rg.hT)),
                                       mul_up(cvv, mul_up(ag.hp.h, ag.hp.h))));
  }

  double err_eff = std::min(err_avg, inv_mu_box_up);
  // Adaptive 2D split if cell error * cell mass is above split_tol:
  double wt_cell_hi = mul_up(rg.wt_T.h, ag.df.h);
  if (depth < max_depth && !first_ring) {
    double fmax = std::max(std::fabs(rg.fl.l), std::fabs(rg.fh.h));
    double weight_G = mul_up(wt_cell_hi, mul_up(rg.Th, add_up(2.0, mul_up(0.5, mul_up(fmax, fmax)))));
    if (mul_up(weight_G, err_eff) > split_tol) {
      double Tm = rg.Tm;
      RingGeom rg0 = make_ring_geom(rg.Tl, Tm), rg1 = make_ring_geom(Tm, rg.Th);
      int64_t n2l = 2 * num_l, n2m = num_l + num_h, n2h = 2 * num_h, d2 = 2 * den;
      AngGeom ag0 = make_ang_geom_rat(n2l, n2m, d2), ag1 = make_ang_geom_rat(n2m, n2h, d2);
      eval_odd_subcell(rg0, ag0, n2l, n2m, d2, wc, rw, Arc, Aic, Brc, Bic, absAc, absBc, rv, q, depth + 1, max_depth, split_tol, M_out, C0_hi);
      eval_odd_subcell(rg0, ag1, n2m, n2h, d2, wc, rw, Arc, Aic, Brc, Bic, absAc, absBc, rv, q, depth + 1, max_depth, split_tol, M_out, C0_hi);
      eval_odd_subcell(rg1, ag0, n2l, n2m, d2, wc, rw, Arc, Aic, Brc, Bic, absAc, absBc, rv, q, depth + 1, max_depth, split_tol, M_out, C0_hi);
      eval_odd_subcell(rg1, ag1, n2m, n2h, d2, wc, rw, Arc, Aic, Brc, Bic, absAc, absBc, rv, q, depth + 1, max_depth, split_tol, M_out, C0_hi);
      return;
    }
  }

  // Compute center mu once and share with 2nd-order C0 when q_lo == q_hi!
  I r2 = sq(X0x) + sq(X0y);
  I q0i(q_lo);
  I mu2 = r2 + q0i;
  I mu = sqrt_iv(mu2);
  I inv_mu = I(1.0) / mu;

  // Exact 2nd-order cell-integrated C0 upper bound (capped by 0th-order bound):
  I gpm_s = first_ring ? I(0.0) : (I(0.5) * C.a / rg.rm + I(1.5) * C.b * rg.rm);
  I XT0x_s = first_ring ? I(0.0) : (gpm_s * ag.cp + Arc + C.inv_sqrt2 * (ag.c2p * Brc + ag.s2p * Bic));
  I XT0y_s = first_ring ? I(0.0) : (gpm_s * ag.sp + Aic + C.inv_sqrt2 * (ag.s2p * Brc - ag.c2p * Bic));
  C0_hi = add_up(C0_hi, eval_c0_cell_ub(rg, ag, first_ring, X0x, X0y, r2, r0_iv, XT0x_s, XT0y_s,
                                        rl_cell, rl_box, dX_box, q_hi, (q_lo == q_hi), mu, mu_min_cell_dn,
                                        XT_max, Xp_max, XTT_max, XTp_max, Xpp_max, alpha, beta));

  // Fall back to universal Loewner cap A(X, q) <= (1/mu_min_box)*I_2 on singular/high-error cells!
  if (rl_cell == 0.0 || add_up(err_avg, lip_box) >= mul_dn(0.60, inv_mu_box_up)) {
    I cap_iv(inv_mu_box_up);
    I acc_a[3] = {cap_iv * ag.ang0[0], cap_iv * ag.ang0[1], cap_iv * ag.ang0[2]};
    I acc_g[3] = {I(0.0), I(0.0), I(0.0)};
    add_ring_accum_to_M6(acc_a, acc_a, acc_g, rg.Imom, M_out);
    return;
  }

  // Center matrix A(X0, q_lo) + (first_ring ? err_cell_first : 0) + lip_box:
  I s = mu2 + r2;
  I inv_s = I(1.0) / s;
  I inv_den = inv_mu * inv_s;
  I err_const(first_ring ? add_up(err_cell_first, lip_box) : lip_box);

  I a00 = inv_mu - sq(X0x) * inv_den + err_const;
  I a11 = inv_mu - sq(X0y) * inv_den + err_const;
  I a01 = -(X0x * X0y) * inv_den;

  I acc_a[3] = {a00 * ag.ang0[0], a00 * ag.ang0[1], a00 * ag.ang0[2]};
  I acc_b[3] = {a11 * ag.ang0[0], a11 * ag.ang0[1], a11 * ag.ang0[2]};
  I acc_g[3] = {a01 * ag.ang0[0], a01 * ag.ang0[1], a01 * ag.ang0[2]};
  add_ring_accum_to_M6(acc_a, acc_b, acc_g, rg.Imom, M_out);

  if (!first_ring) {
    // Add cell-integrated 2nd-order remainder: cuu * u^2 * I_2 (Kmom x ang0) + cvv * v^2 * I_2 (Imom x ang2)!
    I zero3[3] = {I(0.0), I(0.0), I(0.0)};
    I eu[3] = {I(cuu) * ag.ang0[0], I(cuu) * ag.ang0[1], I(cuu) * ag.ang0[2]};
    I ev[3] = {I(cvv) * ag.ang2[0], I(cvv) * ag.ang2[1], I(cvv) * ag.ang2[2]};
    add_ring_accum_to_M6(eu, eu, zero3, rg.Kmom, M_out);
    add_ring_accum_to_M6(ev, ev, zero3, rg.Imom, M_out);
    I inv_mu3 = inv_mu * sq(inv_mu);
    I dfac = -(s + I(4.0) * mu2) * (inv_mu3 * sq(inv_s));
    I x2 = sq(X0x), y2 = sq(X0y), xy = X0x * X0y;
    I da00_x = -X0x * inv_mu3 - I(2.0) * X0x * inv_den - x2 * X0x * dfac;
    I da00_y = -X0y * inv_mu3 - x2 * X0y * dfac;
    I da11_x = -X0x * inv_mu3 - y2 * X0x * dfac;
    I da11_y = -X0y * inv_mu3 - I(2.0) * X0y * inv_den - y2 * X0y * dfac;
    I da01_x = -X0y * inv_den - x2 * X0y * dfac;
    I da01_y = -X0x * inv_den - xy * X0y * dfac;

    I gpm = I(0.5) * C.a / rg.rm + I(1.5) * C.b * rg.rm;
    I XT0x = gpm * ag.cp + Arc + C.inv_sqrt2 * (ag.c2p * Brc + ag.s2p * Bic);
    I XT0y = gpm * ag.sp + Aic + C.inv_sqrt2 * (ag.s2p * Brc - ag.c2p * Bic);
    // Xp0 = i*L0 + i*sqrt(2)*Tm*e^{2i pm}*conj(B)
    I k2x = C.sqrt2 * I(rg.Tm) * (ag.c2p * Brc + ag.s2p * Bic);
    I k2y = C.sqrt2 * I(rg.Tm) * (ag.s2p * Brc - ag.c2p * Bic);
    I Xp0x = -(L0y + k2y);
    I Xp0y = L0x + k2x;

    I a00_T = da00_x * XT0x + da00_y * XT0y;
    I a11_T = da11_x * XT0x + da11_y * XT0y;
    I a01_T = da01_x * XT0x + da01_y * XT0y;
    I a00_p = da00_x * Xp0x + da00_y * Xp0y;
    I a11_p = da11_x * Xp0x + da11_y * Xp0y;
    I a01_p = da01_x * Xp0x + da01_y * Xp0y;

    I ta[3] = {a00_T * ag.ang0[0], a00_T * ag.ang0[1], a00_T * ag.ang0[2]};
    I tb[3] = {a11_T * ag.ang0[0], a11_T * ag.ang0[1], a11_T * ag.ang0[2]};
    I tg[3] = {a01_T * ag.ang0[0], a01_T * ag.ang0[1], a01_T * ag.ang0[2]};
    add_ring_accum_to_M6(ta, tb, tg, rg.Jmom, M_out);

    I pa[3] = {a00_p * ag.ang1[0], a00_p * ag.ang1[1], a00_p * ag.ang1[2]};
    I pb[3] = {a11_p * ag.ang1[0], a11_p * ag.ang1[1], a11_p * ag.ang1[2]};
    I pg[3] = {a01_p * ag.ang1[0], a01_p * ag.ang1[1], a01_p * ag.ang1[2]};
    add_ring_accum_to_M6(pa, pb, pg, rg.Imom, M_out);
  }
}

struct OddEvalRes {
  double pd_piv;  // > 0 iff B_odd - M_odd_ub > 0
  double C0_hi;
};

static OddEvalRes eval_odd_box(const PolarGridLevel& gl, I w_iv, const I v_iv[4], const QPoly& q,
                               int max_depth, double split_tol, double diag_shift = 0.0) {
  require_fe_upward();
  I wc = I(0.5) * (I(w_iv.l) + I(w_iv.h));
  double rw = mul_up(0.5, sub_up(w_iv.h, w_iv.l));
  I Arc = I(0.5) * (I(v_iv[0].l) + I(v_iv[0].h));
  I Brc = I(0.5) * (I(v_iv[1].l) + I(v_iv[1].h));
  I Aic = I(0.5) * (I(v_iv[2].l) + I(v_iv[2].h));
  I Bic = I(0.5) * (I(v_iv[3].l) + I(v_iv[3].h));
  I absAc = sqrt_iv(sq(Arc) + sq(Aic));
  I absBc = sqrt_iv(sq(Brc) + sq(Bic));
  double d0 = sub_up(v_iv[0].h, v_iv[0].l), d1 = sub_up(v_iv[1].h, v_iv[1].l);
  double d2 = sub_up(v_iv[2].h, v_iv[2].l), d3 = sub_up(v_iv[3].h, v_iv[3].l);
  double rv = mul_up(0.5, sqrt_up_strict(add_up(add_up(mul_up(d0, d0), mul_up(d1, d1)),
                                                add_up(mul_up(d2, d2), mul_up(d3, d3)))));

  I M_tot[21];
  for (int i = 0; i < 21; ++i) M_tot[i] = I(0.0);
  double C0_hi = 0.0;
  int nP = static_cast<int>(gl.angs.size());

  for (size_t j = 0; j < gl.rings.size(); ++j) {
    const RingGeom& rg = gl.rings[j];
    double q_lo, q_hi;
    eval_q_bounds(q, rg, q_lo, q_hi);
    bool first_ring = (rg.Tl == 0.0);
    double dX_box = add_up(rw, mul_up(rg.MK_max.h, rv));
    I Lr0 = rg.rm * (C.a + C.b * I(rg.Tm));
    double dL_rad = std::max(sub_up(rg.L_h.h, Lr0.l), sub_up(Lr0.h, rg.L_l.l));
    I Td = I(rg.Tm) - C.d;
    I Ts2 = I(rg.Tm) * C.inv_sqrt2;
    I gpm = first_ring ? I(0.0) : (I(0.5) * C.a / rg.rm + I(1.5) * C.b * rg.rm);
    double XT_max = first_ring ? 0.0 : add_up(add_up(rg.gp_max.h, absAc.h), mul_up(absBc.h, C.inv_sqrt2.h));
    double Xp_max = first_ring ? 0.0 : add_up(rg.L_h.h, mul_up(mul_up(C.sqrt2.h, rg.Th), absBc.h));
    double XTT_max = rg.gpp_max.h;
    double XTp_max = first_ring ? 0.0 : add_up(rg.gp_max.h, mul_up(C.sqrt2.h, absBc.h));
    double Xpp_max = first_ring ? 0.0 : add_up(rg.L_h.h, mul_up(mul_up(2.0, C.sqrt2.h), mul_up(rg.Th, absBc.h)));
    double fmax = std::max(std::fabs(rg.fl.l), std::fabs(rg.fh.h));
    double G_fac = mul_up(rg.Th, add_up(2.0, mul_up(0.5, mul_up(fmax, fmax))));

    // Ring-level accumulators (10x speedup: build 6x6 ONCE per ring instead of per angle!)
    I acc_a0[3], acc_b0[3], acc_g0[3];
    I acc_aT[3], acc_bT[3], acc_gT[3];
    I acc_ap[3], acc_bp[3], acc_gp[3];
    I acc_eu[3], acc_ev[3];
    for (int k = 0; k < 3; ++k) {
      acc_a0[k] = acc_b0[k] = acc_g0[k] = I(0.0);
      acc_aT[k] = acc_bT[k] = acc_gT[k] = I(0.0);
      acc_ap[k] = acc_bp[k] = acc_gp[k] = I(0.0);
      acc_eu[k] = acc_ev[k] = I(0.0);
    }

    for (int m = 0; m < nP; ++m) {
      const AngGeom& ag = gl.angs[m];
      I L0x = Lr0 * ag.cp, L0y = Lr0 * ag.sp;
      I K0x = Td * Arc + C.c1 * Brc + Ts2 * (ag.c2p * Brc + ag.s2p * Bic);
      I K0y = Td * Aic + C.c1 * Bic + Ts2 * (ag.s2p * Brc - ag.c2p * Bic);
      I X0x = L0x + wc + K0x, X0y = L0y + K0y;
      I r2 = sq(X0x) + sq(X0y);
      I r0_iv = sqrt_iv(r2);

      double dL_ang = mul_up(rg.L_h.h, ag.hp.h);
      double dK_cell = add_up(mul_up(rg.hT, absAc.h),
                              mul_up(add_up(rg.hT, mul_up(2.0, mul_up(rg.Th, ag.hp.h))), mul_up(absBc.h, C.inv_sqrt2.h)));
      double dX_cell = add_up(add_up(dL_rad, dL_ang), dK_cell);
      double rl_cell = std::max(0.0, sub_dn(r0_iv.l, dX_cell));
      double rl_box = std::max(0.0, sub_dn(rl_cell, dX_box));
      double mu_min_dn = sqrt_dn_strict(add_dn(mul_dn(rl_cell, rl_cell), q_lo));
      double mu_min_box_dn = sqrt_dn_strict(add_dn(mul_dn(rl_box, rl_box), q_lo));
      double inv_mu_box_up = div_up(1.0, mu_min_box_dn);

      double err_cell_first = 0.0, cuu = 0.0, cvv = 0.0, err_avg = 0.0;
      double alpha = 1.0, beta = 1.0;
      if (first_ring) {
        err_cell_first = exact_lip_shift_up(r0_iv.l, dX_cell, q_lo);
        err_avg = err_cell_first;
      } else {
        alpha = std::max(1e-12, std::min(1e12, (ag.hp.h * Xp_max) / std::max(1e-30, rg.hT * XT_max)));
        beta = std::max(1e-12, std::min(1e12, ag.hp.h / std::max(1e-30, rg.hT)));
        double m2 = mul_dn(mu_min_dn, mu_min_dn);
        double m3 = mul_dn(m2, mu_min_dn);
        double two_m2 = mul_dn(2.0, m2);
        cuu = add_up(div_up(mul_up(add_up(1.0, alpha), mul_up(XT_max, XT_max)), m3),
                     div_up(add_up(XTT_max, mul_up(beta, XTp_max)), two_m2));
        cvv = add_up(div_up(mul_up(add_up(1.0, div_up(1.0, alpha)), mul_up(Xp_max, Xp_max)), m3),
                     div_up(add_up(Xpp_max, div_up(XTp_max, beta)), two_m2));
        err_avg = mul_up(1.0 / 3.0, add_up(mul_up(cuu, mul_up(rg.hT, rg.hT)),
                                           mul_up(cvv, mul_up(ag.hp.h, ag.hp.h))));
      }

      double err_eff = std::min(err_avg, inv_mu_box_up);
      double wt_cell_hi = mul_up(rg.wt_T.h, ag.df.h);
      if (max_depth > 0 && !first_ring && mul_up(mul_up(wt_cell_hi, G_fac), err_eff) > split_tol) {
        // Delegate ONLY this singular cell using precomputed mdepth=1 sub_rings & sub_angs (zero trig/exp rebuild!)
        const RingGeom& rg0 = gl.sub_rings[2 * j];
        const RingGeom& rg1 = gl.sub_rings[2 * j + 1];
        const AngGeom& ag0 = gl.sub_angs[2 * m];
        const AngGeom& ag1 = gl.sub_angs[2 * m + 1];
        int64_t n2l = 2 * m, n2m = 2 * m + 1, n2h = 2 * m + 2, d2 = 2 * nP;
        eval_odd_subcell(rg0, ag0, n2l, n2m, d2, wc, rw, Arc, Aic, Brc, Bic, absAc, absBc, rv, q, 1, max_depth, split_tol, M_tot, C0_hi);
        eval_odd_subcell(rg0, ag1, n2m, n2h, d2, wc, rw, Arc, Aic, Brc, Bic, absAc, absBc, rv, q, 1, max_depth, split_tol, M_tot, C0_hi);
        eval_odd_subcell(rg1, ag0, n2l, n2m, d2, wc, rw, Arc, Aic, Brc, Bic, absAc, absBc, rv, q, 1, max_depth, split_tol, M_tot, C0_hi);
        eval_odd_subcell(rg1, ag1, n2m, n2h, d2, wc, rw, Arc, Aic, Brc, Bic, absAc, absBc, rv, q, 1, max_depth, split_tol, M_tot, C0_hi);
        continue;
      }

      // Compute center mu once and share with 2nd-order C0 when q_lo == q_hi!
      double lip_box = exact_lip_shift_up(rl_cell, dX_box, q_lo);
      I q0i(q_lo), mu2 = r2 + q0i, mu = sqrt_iv(mu2);
      I inv_mu = I(1.0) / mu;

      // Accumulate exact 2nd-order cell-integrated C0 upper bound:
      I XT0x = first_ring ? I(0.0) : (gpm * ag.cp + Arc + C.inv_sqrt2 * (ag.c2p * Brc + ag.s2p * Bic));
      I XT0y = first_ring ? I(0.0) : (gpm * ag.sp + Aic + C.inv_sqrt2 * (ag.s2p * Brc - ag.c2p * Bic));
      C0_hi = add_up(C0_hi, eval_c0_cell_ub(rg, ag, first_ring, X0x, X0y, r2, r0_iv, XT0x, XT0y,
                                            rl_cell, rl_box, dX_box, q_hi, (q_lo == q_hi), mu, mu_min_dn,
                                            XT_max, Xp_max, XTT_max, XTp_max, Xpp_max, alpha, beta));

      // Accumulate A0 + err into ring scalars (fall back to Loewner cap on singular/high-error cells!):
      if (rl_cell == 0.0 || add_up(err_avg, lip_box) >= mul_dn(0.60, inv_mu_box_up)) {
        I cap_iv(inv_mu_box_up);
        for (int k = 0; k < 3; ++k) {
          I term = cap_iv * ag.ang0[k];
          acc_a0[k] = acc_a0[k] + term;
          acc_b0[k] = acc_b0[k] + term;
        }
        continue;
      }
      I s = mu2 + r2, inv_s = I(1.0) / s, inv_den = inv_mu * inv_s;
      I err_const(first_ring ? add_up(err_cell_first, lip_box) : lip_box);
      I a00 = inv_mu - sq(X0x) * inv_den + err_const;
      I a11 = inv_mu - sq(X0y) * inv_den + err_const;
      I a01 = -(X0x * X0y) * inv_den;
      for (int k = 0; k < 3; ++k) {
        acc_a0[k] = acc_a0[k] + a00 * ag.ang0[k];
        acc_b0[k] = acc_b0[k] + a11 * ag.ang0[k];
        acc_g0[k] = acc_g0[k] + a01 * ag.ang0[k];
      }
      if (!first_ring) {
        I cuui(cuu), cvvi(cvv);
        for (int k = 0; k < 3; ++k) {
          acc_eu[k] = acc_eu[k] + cuui * ag.ang0[k];
          acc_ev[k] = acc_ev[k] + cvvi * ag.ang2[k];
        }
        I inv_mu3 = inv_mu * sq(inv_mu);
        I dfac = -(s + I(4.0) * mu2) * (inv_mu3 * sq(inv_s));
        I x2 = sq(X0x), y2 = sq(X0y), xy = X0x * X0y;
        I da00_x = -X0x * inv_mu3 - I(2.0) * X0x * inv_den - x2 * X0x * dfac;
        I da00_y = -X0y * inv_mu3 - x2 * X0y * dfac;
        I da11_x = -X0x * inv_mu3 - y2 * X0x * dfac;
        I da11_y = -X0y * inv_mu3 - I(2.0) * X0y * inv_den - y2 * X0y * dfac;
        I da01_x = -X0y * inv_den - x2 * X0y * dfac;
        I da01_y = -X0x * inv_den - xy * X0y * dfac;

        I k2x = C.sqrt2 * I(rg.Tm) * (ag.c2p * Brc + ag.s2p * Bic);
        I k2y = C.sqrt2 * I(rg.Tm) * (ag.s2p * Brc - ag.c2p * Bic);
        I Xp0x = -(L0y + k2y), Xp0y = L0x + k2x;

        I a00_T = da00_x * XT0x + da00_y * XT0y;
        I a11_T = da11_x * XT0x + da11_y * XT0y;
        I a01_T = da01_x * XT0x + da01_y * XT0y;
        I a00_p = da00_x * Xp0x + da00_y * Xp0y;
        I a11_p = da11_x * Xp0x + da11_y * Xp0y;
        I a01_p = da01_x * Xp0x + da01_y * Xp0y;

        for (int k = 0; k < 3; ++k) {
          acc_aT[k] = acc_aT[k] + a00_T * ag.ang0[k];
          acc_bT[k] = acc_bT[k] + a11_T * ag.ang0[k];
          acc_gT[k] = acc_gT[k] + a01_T * ag.ang0[k];
          acc_ap[k] = acc_ap[k] + a00_p * ag.ang1[k];
          acc_bp[k] = acc_bp[k] + a11_p * ag.ang1[k];
          acc_gp[k] = acc_gp[k] + a01_p * ag.ang1[k];
        }
      }
    }
    add_ring_accum_to_M6(acc_a0, acc_b0, acc_g0, rg.Imom, M_tot);
    if (!first_ring) {
      I zero3[3] = {I(0.0), I(0.0), I(0.0)};
      add_ring_accum_to_M6(acc_eu, acc_eu, zero3, rg.Kmom, M_tot);
      add_ring_accum_to_M6(acc_ev, acc_ev, zero3, rg.Imom, M_tot);
      add_ring_accum_to_M6(acc_aT, acc_bT, acc_gT, rg.Jmom, M_tot);
      add_ring_accum_to_M6(acc_ap, acc_bp, acc_gp, rg.Imom, M_tot);
    }
  }

  // Exact T >= T_cut tails for C0 and M_odd (valid for ALL X in C since mu >= sqrt(q(T)) >= sigma!):
  // 1. C0 tail: sqrt(q(T)) <= sigma + sqrt(c0)*T + sqrt(c2/2)*T^2 for T >= 2!
  double sig_up = sqrt_up_strict(q.sig2);
  double sc0_up = sqrt_up_strict(q.c0);
  double sc2_up = sqrt_up_strict(div_up(q.c2, 2.0));
  I c0_tail = I(sig_up) * gl.F0 + I(sc0_up) * gl.F1 + I(sc2_up) * gl.F2;
  C0_hi = add_up(C0_hi, c0_tail.h);

  // 2. M_odd tail: A(X, q) <= (1/sigma) I_2, and E[1_{T>=T_cut} G_iso] is block-diagonal (two 3x3 blocks)
  //    whose operator norm is <= F1 + (1/2)(F3 - 4*F2 + 4*F1) (trace of the (Q', nu) 2x2 block; P block is F1)!
  double sig_dn = sqrt_dn_strict(q.sig2);
  I G_tail_tr = gl.F1 + I(0.5) * (gl.F3 - I(4.0) * gl.F2 + I(4.0) * gl.F1);
  double m_tail = div_up(G_tail_tr.h, sig_dn);
  static const int diag21[6] = {0, 6, 11, 15, 18, 20};
  for (int i = 0; i < 6; ++i) M_tot[diag21[i]] = M_tot[diag21[i]] + I(0.0, m_tail);

  return {check_Bodd_minus_M6_pd(M_tot, diag_shift), C0_hi};
}

// ============================================================================
// 8. Fast double-precision heuristic q(T) proposer (NOT trusted; only proposes exact QPoly!)
// ============================================================================
// Lightweight 20x24 point grid used solely to find a near-optimal nonnegative QPoly (sig2, c0, c1, c2)
// for a 4D box center before rigorous outward-rounded verification!
struct FastHeurGrid {
  static constexpr int NT = 14;
  static constexpr int NP = 18;
  double T[NT], r[NT], fnu[NT], wT[NT], Lr[NT];
  double cp[NP], sp[NP], c2p[NP], s2p[NP];
  double B_odd[6][6];
  void init() {
    double Tmax = 18.0, em = std::exp(-Tmax);
    for (int j = 0; j < NT; ++j) {
      double s0 = (1.0 - em) * j / NT, s1 = (1.0 - em) * (j + 1) / NT;
      double tm = -std::log(1.0 - 0.5 * (s0 + s1));
      T[j] = tm;
      r[j] = std::sqrt(tm);
      fnu[j] = (tm - 2.0) / std::sqrt(2.0);
      wT[j] = (1.0 - em) / (NT * NP);
      Lr[j] = r[j] * (0.5592 + 0.1432 * tm);
    }
    for (int m = 0; m < NP; ++m) {
      double ph = (m + 0.5) * (2.0 * 3.14159265358979323846 / NP);
      cp[m] = std::cos(ph); sp[m] = std::sin(ph);
      c2p[m] = std::cos(2.0 * ph); s2p[m] = std::sin(2.0 * ph);
    }
    double p0 = 2500.0 / 1891.0, k1 = -0.55, dn = 3422717.0 / 2363750.0;
    for (int i = 0; i < 6; ++i) for (int j = 0; j < 6; ++j) B_odd[i][j] = 0.0;
    B_odd[0][0] = B_odd[1][1] = B_odd[3][3] = B_odd[4][4] = p0;
    B_odd[2][2] = B_odd[5][5] = dn;
    B_odd[0][2] = B_odd[2][0] = B_odd[3][5] = B_odd[5][3] = k1;
  }
  // Simple Jacobi eigenvalue solver for 6x6 symmetric matrix (returns max eig & eigenvector)
  static double top_eig6(const double A_in[6][6], double v_out[6]) {
    double A[6][6], V[6][6];
    for (int i = 0; i < 6; ++i)
      for (int j = 0; j < 6; ++j) { A[i][j] = A_in[i][j]; V[i][j] = (i == j ? 1.0 : 0.0); }
    for (int sweep = 0; sweep < 12; ++sweep) {
      for (int p = 0; p < 6; ++p) {
        for (int q = p + 1; q < 6; ++q) {
          double apq = A[p][q];
          if (std::fabs(apq) < 1e-13) continue;
          double tau = (A[q][q] - A[p][p]) / (2.0 * apq);
          double t = (tau >= 0.0 ? 1.0 / (tau + std::sqrt(1.0 + tau * tau))
                                 : -1.0 / (-tau + std::sqrt(1.0 + tau * tau)));
          double c = 1.0 / std::sqrt(1.0 + t * t), s = t * c;
          A[p][p] -= t * apq; A[q][q] += t * apq; A[p][q] = A[q][p] = 0.0;
          for (int k = 0; k < 6; ++k) {
            if (k != p && k != q) {
              double akp = A[k][p], akq = A[k][q];
              A[k][p] = A[p][k] = c * akp - s * akq;
              A[k][q] = A[q][k] = s * akp + c * akq;
            }
            double vkp = V[k][p], vkq = V[k][q];
            V[k][p] = c * vkp - s * vkq;
            V[k][q] = s * vkp + c * vkq;
          }
        }
      }
    }
    int best = 0;
    for (int i = 1; i < 6; ++i) if (A[i][i] > A[best][i == best ? i : best]) best = i;
    best = 0;
    for (int i = 1; i < 6; ++i) if (A[i][i] > A[best][best]) best = i;
    for (int i = 0; i < 6; ++i) v_out[i] = V[i][best];
    return A[best][best];
  }

  // Run 10-step radial Euler-Lagrange dual ascent to propose QPoly (c0, c1, c2) with safety margin!
  QPoly propose_q(double wc, double Ar, double Br, double Ai, double Bi, double dp_lo, double box_rad) const {
    // Precompute X(j, m) on 20x24 grid
    double Xx[NT][NP], Xy[NT][NP], r2[NT][NP];
    double c1c = 15159.0 / 50000.0, invs2 = 0.7071067811865475;
    for (int j = 0; j < NT; ++j) {
      double td = T[j] - 0.4, ts2 = T[j] * invs2;
      for (int m = 0; m < NP; ++m) {
        double x = Lr[j] * cp[m] + wc + td * Ar + c1c * Br + ts2 * (c2p[m] * Br + s2p[m] * Bi);
        double y = Lr[j] * sp[m] + td * Ai + c1c * Bi + ts2 * (s2p[m] * Br - c2p[m] * Bi);
        Xx[j][m] = x; Xy[j][m] = y; r2[j][m] = x * x + y * y;
      }
    }
    // Start with small positive radial floor scaled to dp_lo:
    double sig2 = std::max(1e-6, std::min(0.40, 0.25 * dp_lo));
    double c0 = 0.0, c1 = 0.0, c2 = 0.0;
    // Track radial dual PSD 2x2 matrix L_rad = [[l00, l01], [l01, l11]] on (1, f_nu) + P weight lP:
    // tr(L_rad G_iso) = T * ( (l00 + lP) + 2*l01*f_nu + l11*f_nu^2 )!
    double l00 = 0.0, l01 = 0.0, l11 = 0.0;
    double target_eig = -std::min(0.10, 0.02 + 1.5 * box_rad);

    for (int it = 0; it < 14; ++it) {
      double M[6][6];
      for (int i = 0; i < 6; ++i) for (int k = 0; k < 6; ++k) M[i][k] = -B_odd[i][k];
      for (int j = 0; j < NT; ++j) {
        double qT = sig2 + T[j] * (l00 + 2.0 * l01 * fnu[j] + l11 * fnu[j] * fnu[j]);
        double fj = fnu[j], rj = r[j], wt = wT[j];
        for (int m = 0; m < NP; ++m) {
          double mu2 = r2[j][m] + qT;
          double mu = std::sqrt(mu2);
          double inv_mu = wt / mu;
          double inv_den = wt / (mu * (mu2 + r2[j][m]));
          double z1x = rj * cp[m], z1y = rj * sp[m];
          double bx[6] = {z1x, z1x, z1x * fj, -z1y, -z1y, -z1y * fj};
          double by[6] = {z1y, -z1y, z1y * fj, z1x, -z1x, z1x * fj};
          double dX[6];
          for (int i = 0; i < 6; ++i) dX[i] = bx[i] * Xx[j][m] + by[i] * Xy[j][m];
          for (int i = 0; i < 6; ++i) {
            for (int k = i; k < 6; ++k) {
              double g_ik = bx[i] * bx[k] + by[i] * by[k];
              M[i][k] += g_ik * inv_mu - dX[i] * dX[k] * inv_den;
            }
          }
        }
      }
      for (int i = 0; i < 6; ++i) for (int k = 0; k < i; ++k) M[i][k] = M[k][i];
      double v[6];
      double me = top_eig6(M, v);
      if (me <= target_eig) break;
      double step = std::max(0.001, 0.25 * (me - target_eig));
      // Radial projection of v v^T onto (Q, nu) and P:
      // v = [Qr, Pr, nur, Qi, Pi, nui]
      l00 += step * (v[0] * v[0] + v[3] * v[3] + v[1] * v[1] + v[4] * v[4]);
      l01 += step * (v[0] * v[2] + v[3] * v[5]);
      l11 += step * (v[2] * v[2] + v[5] * v[5]);
    }
    // Enforce exact rigorous condition c1^2 <= c0 * c2 cleanly:
    c0 = std::max(0.0, l00);
    c2 = std::max(0.0, l11);
    double max_c1 = std::sqrt(mul_dn(c0, c2)) * 0.9999;
    c1 = std::max(-max_c1, std::min(max_c1, l01));
    if (mul_up(c1, c1) > mul_dn(c0, c2)) c1 = 0.0;
    return {sig2, c0, c1, c2};
  }
};
static FastHeurGrid HEUR;

// ============================================================================
// 9. Part 3: 4D Adaptive Bulk Cover on [wl, wh], s_odd <= ||v||_2 <= 5/4
// ============================================================================
struct SlabCurv {
  double wl, wh;
  double n_up, a2_up, b2_up;
};

// Per-slab base curvature bounds N'' <= n_up, |C_A''| <= a2_up, |C_B''| <= b2_up on w in [wl, wh]
// (exact smooth (r, th) Jet2 integration matching 7.4.16!).
static SlabCurv compute_slab_base_curv(double wl, double wh) {
  require_fe_upward();
  I w_iv(wl, wh);
  I tt(25.0);
  assert(eval_H(tt).h <= sq(I(24.0) - I(wh)).l);
  I m25 = rat(27, 25), q = rat(5, 2);
  I coeff25 = I(9.0) / sq(tt)
            + (I(4.0) * m25 * q / (I(3.0) * tt))
            + ((sq(m25) + I(2.0) / sq(tt)) * (I(4.0) / (I(9.0) * tt)) + I(2.0) * m25 / (I(3.0) * sq(tt))) * (rat(5, 4) * tt);
  assert(coeff25.h < 2.0);
  I c_tail = (I(2.0) * expneg_iv(tt)) / sq(C.b);
  I n_tail = rat(1, 12) * expneg_iv(tt);

  int nr = 96, nt = 48;
  std::vector<double> re(nr + 1);
  for (int i = 0; i <= nr; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(nr);
    re[i] = (i == nr) ? 24.0 : (24.0 * std::pow(t, 1.8));
  }
  I inv_pi = I(1.0) / PI_IV;
  I sum_N(0.0), sum_CA(0.0), sum_CB(0.0);
  Jet2 w_jet(w_iv, I(1.0), I(0.0));
  for (int ir = 0; ir < nr; ++ir) {
    I r_box(re[ir], re[ir + 1]), dr = I(re[ir + 1]) - I(re[ir]);
    for (int it = 0; it < nt; ++it) {
      I a_t = PI_IV * rat(it, nt), b_t = PI_IV * rat(it + 1, nt);
      I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
      I area = dr * (b_t - a_t) * inv_pi;
      I ct = cos_on_0_pi(t_box), st = sin_on_0_pi(t_box);
      Jet2 yr = Jet2(r_box * ct) - w_jet;
      Jet2 yi(r_box * st);
      Jet2 r_j(r_box);
      Jet2 T = solve_T_j(sq_j(r_j - w_jet) + (I(2.0) * r_box * (I(1.0) - ct)) * w_jet);
      Jet2 a0 = Jet2(C.a) + C.b * T, c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
      Jet2 f = expneg_j(T) * inv_j(a0 * c0);
      Jet2 inv_a0 = inv_j(a0);
      Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
      Jet2 z2r = C.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
      Jet2 z2i = (I(2.0) * C.inv_sqrt2) * (Zr * Zi);
      sum_N = sum_N + area * (I(4.0) * f.v * sq(st));
      Jet2 gA = (I(2.0) * r_box * ct) * (f * (T - C.d));
      Jet2 gB = (I(2.0) * r_box) * (f * (ct * (z2r + C.c1) + st * z2i));
      sum_CA = sum_CA + area * gA.d2;
      sum_CB = sum_CB + area * gB.d2;
    }
  }
  SlabCurv sc;
  sc.wl = wl; sc.wh = wh;
  sc.n_up = (sum_N + n_tail).h;
  sc.a2_up = add_up(mag(sum_CA), c_tail.h);
  sc.b2_up = add_up(mag(sum_CB), c_tail.h);
  return sc;
}

struct Slab4DResult {
  double wl, wh, s_odd;
  int closed_ext = 0, closed_ori = 0, closed_piv = 0, w_splits = 0;
  int closed_g[3] = {0, 0, 0};  // boxes closed via 16-corner convexity (binned by worst corner grid level 0/1/2)
  int unique_corners = 0;
  int total_boxes = 0, open_boxes = 0;
  double worst_even_c0_margin = -1e30;
  double min_odd_piv = 1e30;
};

struct PtKey {
  uint64_t b[4];
  bool operator==(const PtKey& o) const {
    return b[0] == o.b[0] && b[1] == o.b[1] && b[2] == o.b[2] && b[3] == o.b[3];
  }
};
struct PtKeyHash {
  size_t operator()(const PtKey& k) const {
    uint64_t h = k.b[0] ^ (k.b[1] * 0x9e3779b97f4a7c15ULL);
    h ^= (k.b[2] * 0xbf58476d1ce4e5b9ULL) ^ (k.b[3] * 0x94d049bb133111ebULL);
    h ^= (h >> 30);
    h *= 0xbf58476d1ce4e5b9ULL;
    return static_cast<size_t>(h ^ (h >> 27));
  }
};
static inline PtKey make_pt_key(const double c[4]) {
  PtKey k;
  for (int j = 0; j < 4; ++j) {
    double v = (c[j] == 0.0) ? 0.0 : c[j];  // canonicalize -0.0 -> +0.0
    std::memcpy(&k.b[j], &v, sizeof(uint64_t));
  }
  return k;
}

struct PtVal {
  double f_ub;       // certified upper bound on sup_{Q,P,nu} F_joint(c*)(w_e, c; Q,P,nu)
  double odd_piv;    // certified min Cholesky pivot (> 0), or <= 0 if not yet closed
  int grid_lvl;      // 0 (coarse/analytic), 1 (med), 2 (fine)
  int stage_done;    // -1=WCS only, 0=g0, 1=g1, 2=g2, 3=g2+md1, 4=g3+md1/g2+md2, 5=g2+md3, 6=g2+md4
  double dp_pt;      // best certified even slack B_P.l - U_WCS so far
  double bp_lo;      // exact lower bound B_P(w_e, c).l
  double s_warm;     // warm-started scale for prof_base
  uint8_t wcs_used;  // number of WCS grids already evaluated at this corner
  double fail_req;   // req_f at which highest stage cut early via monotonicity (-1e30 if not cut)
};

// Exact 5D Convexity-Semiconvexity Point-Corner Certifier on [wl, wh] x {s_odd <= ||v||_2 <= 5/4, Im A >= 0}.
// For EVERY fixed (Q, P, nu) in C^3:
//   1. H(w, v) = E[|L+w+K(v)+O'| + |L+w+K(v)-O'|] is CONVEX in (w, v), while the remaining terms
//      -N(w) - 2*Ar*CA(w) - 2*Br*CB(w) - B_P(w, v) - <B_odd y, y> are independent of (Q,P,nu)
//      with w-second-derivative >= -(n_up + 2*|Ar|*a2_up + 2*|Br|*b2_up + S_r).
//   2. At each fixed w_e in {wl, wh}, v -> F_joint(c*)(w_e, v; Q,P,nu) has exact 4D cube concavity
//      defect <= e4(w_e) from -B_P(w_e, v).
//   3. Hence sup_{Q,P,nu} F_joint(c*)(w, v) <= max_{w_e, m=0..15} [sup_{Q,P,nu} F_joint(c*)(w_e, c^(m)) + e4(w_e)] + w_err!
// Every odd-sector evaluation occurs at an EXACT POINT (w_e, c^(m)) with ZERO box Lipschitz (rw=0, rv=0)
// and is cached across neighboring 4D boxes!
using CornerCache = std::unordered_map<PtKey, PtVal, PtKeyHash>;

static Slab4DResult certify_4d_slab(double wl, double wh, double s_odd, double p2_margin, const SlabCurv& sc,
                                    std::vector<WcsGrid>& wcs_l, bool& built_fine_l, CornerCache& cache_l,
                                    std::vector<WcsGrid>& wcs_h, bool& built_fine_h, CornerCache& cache_h,
                                    const std::vector<PolarGridLevel>& pgrids, bool verbose = false) {
  require_fe_upward();
  assert(p2_margin > 0.0);

  I q_diag[4] = {C.q_AA, C.q_BB, C.q_AA, C.q_BB};

  // Exact constant-pivot rule (mu_0 = 61/50): C_0 <= 61/50 and M_odd <= (50/61)*I_6 < B_odd everywhere!
  double mu0_up = rat(61, 50).h;
  Sym3 mu0_inv;
  I inv61 = rat(50, 61);
  mu0_inv.e[0] = inv61; mu0_inv.e[3] = inv61; mu0_inv.e[5] = inv61;
  double piv_61_50 = check_B3_minus_M3_pd(mu0_inv);
  assert(piv_61_50 > 0.0);

  double s_odd2_dn = mul_dn(s_odd, s_odd);
  double S_ext_up = 25.0 / 16.0;  // exact binary64 = 1.5625

  if (cache_l.empty()) cache_l.reserve(4096);
  if (cache_h.empty()) cache_h.reserve(4096);

  // Lazy interior w-slices for adaptive on-demand w-bisection near the origin shell:
  struct MidSlice {
    std::vector<WcsGrid> wcs;
    CornerCache cache;
    bool built_fine = false;
  };
  std::map<double, MidSlice> mid_slices;
  auto get_slice = [&](double w_e, std::vector<WcsGrid>*& wcs_p, bool*& bf_p, CornerCache*& c_p) {
    if (w_e == wl) { wcs_p = &wcs_l; bf_p = &built_fine_l; c_p = &cache_l; return; }
    if (w_e == wh) { wcs_p = &wcs_h; bf_p = &built_fine_h; c_p = &cache_h; return; }
    auto it = mid_slices.find(w_e);
    if (it == mid_slices.end()) {
      MidSlice ms;
      ms.wcs.push_back(build_wcs_grid(w_e, 10, 8, 2, 2));
      ms.wcs.push_back(build_wcs_grid(w_e, 22, 14, 2, 2));
      ms.cache.reserve(512);
      it = mid_slices.emplace(w_e, std::move(ms)).first;
    }
    wcs_p = &it->second.wcs;
    bf_p = &it->second.built_fine;
    c_p = &it->second.cache;
  };

  auto eval_corner_pt = [&](double w_e, const double c[4], double req_f, int max_stage,
                            std::vector<WcsGrid>& wcs, bool& built_fine,
                            std::unordered_map<PtKey, PtVal, PtKeyHash>& cache) -> PtVal {
    PtKey key = make_pt_key(c);
    auto it = cache.find(key);
    if (it != cache.end()) {
      const PtVal& cv = it->second;
      if (cv.odd_piv > 0.0 && cv.f_ub < req_f) return cv;
      if (cv.stage_done >= max_stage && req_f <= cv.fail_req) return cv;
      // Fast WCS-only impossibility short-circuit: even C_0 = 0 cannot beat req_f if -dp_pt >= req_f!
      if (cv.wcs_used >= 3 && -cv.dp_pt >= req_f) return cv;
      if (max_stage <= 2 && cv.wcs_used >= 2 && -cv.dp_pt >= req_f) return cv;
    }

    double S_dn = 0.0, S_up = 0.0;
    for (int j = 0; j < 4; ++j) {
      S_dn = add_dn(S_dn, mul_dn(c[j], c[j]));
      S_up = add_up(S_up, mul_up(c[j], c[j]));
    }

    PtVal pv;
    bool existed = (it != cache.end());
    if (existed) {
      pv = it->second;
      if (pv.stage_done >= max_stage && req_f > pv.fail_req) {
        pv.stage_done = max_stage - 1;
        pv.fail_req = -1e30;
      }
    } else {
      double bp_lo = eval_BP_iv(w_e, c).l;
      double dp_p1 = (S_dn > 0.75) ? mul_dn(sub_dn(S_dn, 0.75), S_dn) : -1.0;

      // Case 1: Part 2 origin strip ||c||_2 <= s_odd -> C_0 = 0 identically!
      if (S_up <= s_odd2_dn) {
        if (S_up == 0.0) {
          pv = {0.0, 1e9, 0, 6, 0.0, bp_lo, 0.0, 3, -1e30};
          cache.emplace(key, pv);
          return pv;
        }
        double best_dp = dp_p1;
        for (size_t gi = 0; gi < wcs.size(); ++gi) {
          double cand = sub_dn(bp_lo, eval_wcs_ub(wcs[gi], c));
          if (cand > best_dp) best_dp = cand;
          if (-best_dp < req_f && best_dp > 0.01 * S_dn) break;
        }
        if ((-best_dp >= req_f || best_dp <= 0.005 * S_dn) && !built_fine) {
          wcs.push_back(build_wcs_grid(w_e, 44, 24, 2, 2));
          built_fine = true;
          double cand = sub_dn(bp_lo, eval_wcs_ub(wcs.back(), c));
          if (cand > best_dp) best_dp = cand;
        }
        double f_c = -best_dp;
        pv = {f_c, 1e9, 0, 6, best_dp, bp_lo, 0.0, 3, -1e30};
        cache.emplace(key, pv);
        return pv;
      }

      pv = {1e30, -1.0, 2, -1, dp_p1, bp_lo, 0.0, 0, -1e30};
      // Instant constant-pivot shortcut when Part 1 dp_p1 alone beats req_f!
      if (dp_p1 > mu0_up) {
        double f_piv = sub_up(mu0_up, dp_p1);
        pv.f_ub = f_piv;
        pv.odd_piv = piv_61_50;
        pv.grid_lvl = 0;
        if (f_piv < req_f) {
          cache.emplace(key, pv);
          return pv;
        }
      }
    }

    auto upgrade_wcs = [&](bool allow_build_fine) {
      while (pv.wcs_used < wcs.size()) {
        double cand = sub_dn(pv.bp_lo, eval_wcs_ub(wcs[pv.wcs_used], c));
        pv.wcs_used++;
        if (cand > pv.dp_pt) {
          if (pv.odd_piv > 0.0 && pv.f_ub < 1e20) {
            pv.f_ub = sub_up(pv.f_ub, sub_dn(cand, pv.dp_pt));
          }
          pv.dp_pt = cand;
        }
        if (pv.dp_pt > mu0_up) {
          double f_piv = sub_up(mu0_up, pv.dp_pt);
          if (f_piv < pv.f_ub) { pv.f_ub = f_piv; pv.odd_piv = piv_61_50; pv.grid_lvl = 0; }
        }
        // Stop upgrading WCS once dp_pt is comfortably above |req_f| (or already closed via constant pivot)
        if (pv.odd_piv > 0.0 && pv.f_ub < req_f) return;
        if (pv.dp_pt > std::max(0.20 * S_up, 1.8 * (-req_f))) return;
      }
      if (allow_build_fine && !built_fine && pv.wcs_used < 3) {
        wcs.push_back(build_wcs_grid(w_e, 44, 24, 2, 2));
        built_fine = true;
        double cand = sub_dn(pv.bp_lo, eval_wcs_ub(wcs.back(), c));
        pv.wcs_used = static_cast<uint8_t>(wcs.size());
        if (cand > pv.dp_pt) {
          if (pv.odd_piv > 0.0 && pv.f_ub < 1e20) {
            pv.f_ub = sub_up(pv.f_ub, sub_dn(cand, pv.dp_pt));
          }
          pv.dp_pt = cand;
        }
        if (pv.dp_pt > mu0_up) {
          double f_piv = sub_up(mu0_up, pv.dp_pt);
          if (f_piv < pv.f_ub) { pv.f_ub = f_piv; pv.odd_piv = piv_61_50; pv.grid_lvl = 0; }
        }
      }
    };

    // Always ensure at least wcs[0] (and wcs[1] if needed) is evaluated BEFORE running any odd grid!
    upgrade_wcs(false);
    if (pv.odd_piv > 0.0 && pv.f_ub < req_f) { cache[key] = pv; return pv; }

    // WCS-first short-circuit: if -dp_pt >= req_f even on wcs[0..1], only build fine WCS if close (dp_pt > 0.70*|req_f|)!
    if (-pv.dp_pt >= req_f) {
      if (pv.dp_pt > 0.70 * (-req_f) || pv.dp_pt <= 0.0) upgrade_wcs(true);
      if ((pv.odd_piv > 0.0 && pv.f_ub < req_f) || -pv.dp_pt >= req_f) {
        cache[key] = pv;
        return pv;
      }
    }

    if (pv.dp_pt <= 0.0) {
      pv.stage_done = 6;
      pv.fail_req = 1e30;
      cache[key] = pv;
      return pv;
    }

    // Demand-driven target: aim slightly below req_f so adjacent boxes also hit cache without re-escalating!
    double stop_goal = std::min(req_f - 1e-6, 1.10 * req_f);
    double s_init_floor = std::max(1e-6, std::min(1.0, 0.25 * std::pow(pv.dp_pt, 0.65)));
    if (pv.s_warm <= 0.0) {
      pv.s_warm = std::max(1e-5, std::min(1.0, 0.45 * std::pow(pv.dp_pt, 0.65)));
    }

    I w_pt(w_e);
    I v_pt[4] = {I(c[0]), I(c[1]), I(c[2]), I(c[3])};
    auto record = [&](const OddEvalRes& oer, int gl_idx) {
      if (oer.pd_piv > 0.0) {
        double f_c = sub_up(oer.C0_hi, pv.dp_pt);
        if (f_c < pv.f_ub) {
          pv.f_ub = f_c;
          pv.odd_piv = oer.pd_piv;
          pv.grid_lvl = gl_idx;
        }
      }
    };

    bool cut_by_req = false;
    auto eval_ray_bisect = [&](int gl_idx, const QPoly& base_q, double& scale_warm,
                               int max_steps, double stop_target, int mdepth = 0, double stol = 1e-5) {
      int gl_bin = std::min(gl_idx, 2);
      double lo_f = 0.0, hi_f = 0.0, s = scale_warm;
      for (int st = 0; st < max_steps && (pv.odd_piv <= 0.0 || pv.f_ub > stop_target); ++st) {
        QPoly qp{base_q.sig2 * s, base_q.c0 * s, base_q.c1 * s, base_q.c2 * s};
        if (qp.c1 != 0.0 && mul_up(qp.c1, qp.c1) > mul_dn(qp.c0, qp.c2)) qp.c1 = 0.0;
        OddEvalRes r = eval_odd_box(pgrids[gl_idx], w_pt, v_pt, qp, mdepth, stol);
        record(r, gl_bin);
        if (pv.odd_piv > 0.0 && pv.f_ub <= stop_target) { scale_warm = s; break; }
        // Monotonicity shortcut: since psi(r, q) increases with s, if pd_piv <= 0 AND C0_hi - dp_pt >= req_f,
        // NO larger s (which is needed to get pd_piv > 0) can possibly beat req_f on this grid!
        if (r.pd_piv <= 0.0 && sub_up(r.C0_hi, pv.dp_pt) >= req_f) {
          scale_warm = std::max((mdepth == 0) ? s_init_floor : 1e-7, s * 0.65);
          cut_by_req = true;
          break;
        }
        if (r.pd_piv <= 0.0) {
          lo_f = s;
          s = (hi_f > 0.0) ? std::sqrt(lo_f * hi_f) : std::min(20.0, s * 2.4);
          if (s <= lo_f * 1.01) break;
        } else {
          hi_f = s;
          scale_warm = s;
          s = (lo_f > 0.0) ? std::sqrt(lo_f * hi_f) : std::max(1e-7, s * 0.45);
          if (s >= hi_f * 0.99) break;
        }
      }
      if (lo_f > 0.0 && hi_f > 0.0) scale_warm = std::sqrt(lo_f * hi_f);
      else if (lo_f > 0.0 && hi_f == 0.0) scale_warm = std::min(20.0, lo_f * 1.5);
    };

    const QPoly prof_base{0.15, 1.0, 0.0, 0.10};

    // Stage 0: Fast 1D profile on pgrids[0] (15x24, 3 super-cheap steps)
    if (pv.stage_done < 0 && max_stage >= 0 && (pv.odd_piv <= 0.0 || pv.f_ub >= req_f)) {
      cut_by_req = false;
      eval_ray_bisect(0, prof_base, pv.s_warm, 3, stop_goal);
      pv.stage_done = 0;
      pv.fail_req = cut_by_req ? req_f : -1e30;
    }

    // Stage 1: Upgrade WCS[1] if not yet done, then warm-started profile on pgrids[1] (27x40, 4 steps)
    if (pv.stage_done < 1 && max_stage >= 1 && (pv.odd_piv <= 0.0 || pv.f_ub >= req_f)) {
      cut_by_req = false;
      if (pv.wcs_used < wcs.size()) upgrade_wcs(false);
      if (pv.odd_piv <= 0.0 || pv.f_ub >= req_f) {
        eval_ray_bisect(1, prof_base, pv.s_warm, 4, stop_goal);
      }
      pv.stage_done = 1;
      pv.fail_req = cut_by_req ? req_f : -1e30;
    }

    // Stage 2: Warm-started profile on pgrids[2] (46x56, 4 steps)
    if (pv.stage_done < 2 && max_stage >= 2 && (pv.odd_piv <= 0.0 || pv.f_ub >= req_f)) {
      cut_by_req = false;
      eval_ray_bisect(2, prof_base, pv.s_warm, 4, stop_goal);
      pv.stage_done = 2;
      pv.fail_req = cut_by_req ? req_f : -1e30;
    }

    // Stage 3: Upgrade to fine WCS (44x24), then fast precomputed-subcell g2(mdepth=1, tol=5e-4)!
    if (pv.stage_done < 3 && max_stage >= 3 && (pv.odd_piv <= 0.0 || pv.f_ub >= req_f)) {
      cut_by_req = false;
      upgrade_wcs(true);
      if (pv.odd_piv <= 0.0 || pv.f_ub >= req_f) {
        eval_ray_bisect(2, prof_base, pv.s_warm, 6, stop_goal, 1, 5e-4);
      }
      pv.stage_done = 3;
      pv.fail_req = cut_by_req ? req_f : -1e30;
    }

    // Stage 4: Precomputed-subcell g3(mdepth=1, tol=3e-4) + g2(mdepth=2, tol=2e-4) with prof_base & HEUR EL!
    if (pv.stage_done < 4 && max_stage >= 4 && (pv.odd_piv <= 0.0 || pv.f_ub >= req_f)) {
      cut_by_req = false;
      eval_ray_bisect(3, prof_base, pv.s_warm, 6, stop_goal, 1, 3e-4);
      if (pv.odd_piv <= 0.0 || pv.f_ub >= req_f) {
        eval_ray_bisect(2, prof_base, pv.s_warm, 6, stop_goal, 2, 2e-4);
      }
      if (pv.odd_piv <= 0.0 || pv.f_ub >= req_f) {
        QPoly el = HEUR.propose_q(w_e, c[0], c[1], c[2], c[3], pv.dp_pt, 0.0);
        double el_sc = 1.5;
        eval_ray_bisect(3, el, el_sc, 5, stop_goal, 1, 3e-4);
      }
      pv.stage_done = 4;
      pv.fail_req = cut_by_req ? req_f : -1e30;
    }

    // Stage 5: Deep 2D quadtree g2(mdepth=3, tol=2e-5) ONLY for tiny hotspot/near-origin boxes (box_err <= 2.5e-5)!
    if (pv.stage_done < 5 && max_stage >= 5 && (pv.odd_piv <= 0.0 || pv.f_ub >= req_f)) {
      cut_by_req = false;
      eval_ray_bisect(2, prof_base, pv.s_warm, 7, stop_goal, 3, 2e-5);
      if (pv.odd_piv <= 0.0 || pv.f_ub >= req_f) {
        QPoly el = HEUR.propose_q(w_e, c[0], c[1], c[2], c[3], pv.dp_pt, 0.0);
        double el_sc = 1.5;
        eval_ray_bisect(2, el, el_sc, 6, stop_goal, 3, 2e-5);
      }
      pv.stage_done = 5;
      pv.fail_req = cut_by_req ? req_f : -1e30;
    }

    // Stage 6: Ultra-local 2D quadtree g2(mdepth=4, tol=4e-6) ONLY right on s_odd boundary (box_err <= 6e-6)!
    if (pv.stage_done < 6 && max_stage >= 6 && (pv.odd_piv <= 0.0 || pv.f_ub >= req_f)) {
      cut_by_req = false;
      eval_ray_bisect(2, prof_base, pv.s_warm, 8, stop_goal, 4, 4e-6);
      if (pv.odd_piv <= 0.0 || pv.f_ub >= req_f) {
        QPoly el = HEUR.propose_q(w_e, c[0], c[1], c[2], c[3], pv.dp_pt, 0.0);
        double el_sc = 1.5;
        eval_ray_bisect(2, el, el_sc, 6, stop_goal, 4, 4e-6);
      }
      pv.stage_done = 6;
      pv.fail_req = cut_by_req ? req_f : -1e30;
    }

    cache[key] = pv;
    return pv;
  };

  Slab4DResult res;
  res.wl = wl; res.wh = wh; res.s_odd = s_odd;

  struct Box5 { double bwl, bwh, c[4], hw[4]; int depth; };
  std::vector<Box5> stack;
  // Cover [wl, wh] x [-5/4, 5/4] x [-5/4, 5/4] x [0, 5/4] x [-5/4, 5/4] (Im A >= 0 by conjugation symmetry!)
  const double R0 = 1.25;
  for (int s0 = 0; s0 < 2; ++s0)
    for (int s1 = 0; s1 < 2; ++s1)
      for (int s3 = 0; s3 < 2; ++s3) {
        Box5 b;
        b.bwl = wl; b.bwh = wh;
        b.c[0] = s0 ? 0.5 * R0 : -0.5 * R0;
        b.c[1] = s1 ? 0.5 * R0 : -0.5 * R0;
        b.c[2] = 0.5 * R0;
        b.c[3] = s3 ? 0.5 * R0 : -0.5 * R0;
        for (int j = 0; j < 4; ++j) b.hw[j] = 0.5 * R0;
        b.depth = 0;
        stack.push_back(b);
      }

  int visited = 0;
  while (!stack.empty()) {
    Box5 b = stack.back();
    stack.pop_back();
    visited++;
    if (verbose && visited % 2000 == 0) {
      std::fprintf(stderr, "  [prog vis=%d stk=%zu dep=%d ext=%d ori=%d piv=%d ws=%d g=(%d,%d,%d) pts=%zu+%zu+%zu] w=[%.5f,%.5f] c=(%.3f,%.3f,%.3f,%.3f) hw=(%.3f,%.3f,%.3f,%.3f)\n",
                   visited, stack.size(), b.depth, res.closed_ext, res.closed_ori, res.closed_piv, res.w_splits,
                   res.closed_g[0], res.closed_g[1], res.closed_g[2], cache_l.size(), cache_h.size(), mid_slices.size(),
                   b.bwl, b.bwh, b.c[0], b.c[1], b.c[2], b.c[3], b.hw[0], b.hw[1], b.hw[2], b.hw[3]);
    }

    double Smin = 0.0, Smax = 0.0;
    double ah[4];
    for (int j = 0; j < 4; ++j) {
      double al = std::max(0.0, sub_dn(std::fabs(b.c[j]), b.hw[j]));
      ah[j] = add_up(std::fabs(b.c[j]), b.hw[j]);
      Smin = add_dn(Smin, mul_dn(al, al));
      Smax = add_up(Smax, mul_up(ah[j], ah[j]));
    }
    if (Smin >= S_ext_up) { res.closed_ext++; continue; }
    if (Smax <= s_odd2_dn) { res.closed_ori++; continue; }

    // Instant Part 1 constant-pivot box shortcut on the outer shell:
    if (Smin > 0.75) {
      double dp_p1 = mul_dn(sub_dn(Smin, 0.75), Smin);
      if (dp_p1 > mu0_up) {
        double m_piv = sub_up(mu0_up, dp_p1);
        if (m_piv < 0.0) {
          res.closed_piv++;
          res.worst_even_c0_margin = std::max(res.worst_even_c0_margin, m_piv);
          res.min_odd_piv = std::min(res.min_odd_piv, piv_61_50);
          continue;
        }
      }
    }

    // 1. Exact O(1) shift-semiconvexity error for F_joint(c*) on [b.bwl, b.bwh] (valid for ALL Q, P, nu!):
    I dw_b = I(b.bwh) - I(b.bwl);
    I dw2_8_b = sq(dw_b) / I(8.0);
    I mw = I(sc.n_up) + I(2.0) * I(ah[0]) * I(sc.a2_up) + I(2.0) * I(ah[1]) * I(sc.b2_up) + I(Smax);
    double w_err = (dw2_8_b * mw).h;

    // 2. Exact 4D cube concavity defect of -Q_{w_e}(v) - t*||v||^4 for any exact dyadic t in [0, 1]:
    I qw_bl[4], qw_bh[4];
    I half_wl2 = I(0.5) * sq(I(b.bwl)), half_wh2 = I(0.5) * sq(I(b.bwh));
    I sum_hw2(0.0), sum_ah2_hw2(0.0), qsum_l(0.0), qsum_h(0.0);
    for (int j = 0; j < 4; ++j) {
      qw_bl[j] = q_diag[j] + half_wl2;
      qw_bh[j] = q_diag[j] + half_wh2;
      I hw2 = sq(I(b.hw[j]));
      sum_hw2 = sum_hw2 + hw2;
      sum_ah2_hw2 = sum_ah2_hw2 + sq(I(ah[j])) * hw2;
      qsum_l = qsum_l + qw_bl[j] * hw2;
      qsum_h = qsum_h + qw_bh[j] * hw2;
    }
    double qsl_hi = qsum_l.h, qsh_hi = qsum_h.h;
    double qrt_hi = (I(2.0) * I(Smax) * sum_hw2 + I(4.0) * sum_ah2_hw2).h;
    double Smin2_dn = mul_dn(Smin, Smin);

    // Skip evaluating corners when even the quadratic defect + w_err alone exceeds box upper bound on B_P:
    bool closed = false;
    double bp_ub_l = (1.25 + 0.5 * b.bwl * b.bwl + Smax) * Smax;
    double bp_ub_h = (1.25 + 0.5 * b.bwh * b.bwh + Smax) * Smax;
    if (std::max(qsl_hi, qsh_hi) <= 1.0 && add_up(qsl_hi, w_err) < bp_ub_l && add_up(qsh_hi, w_err) < bp_ub_h) {
      std::vector<WcsGrid> *swl_wcs = nullptr, *swh_wcs = nullptr;
      bool *swl_bf = nullptr, *swh_bf = nullptr;
      CornerCache *swl_c = nullptr, *swh_c = nullptr;
      get_slice(b.bwl, swl_wcs, swl_bf, swl_c);
      get_slice(b.bwh, swh_wcs, swh_bf, swh_c);

      double corners[16][4];
      double dS2_up[16];
      double dS2_max = 0.0;
      for (int m = 0; m < 16; ++m) {
        double sc_up = 0.0;
        for (int j = 0; j < 4; ++j) {
          assert(add_up(b.c[j], b.hw[j]) == add_dn(b.c[j], b.hw[j]) &&
                 sub_up(b.c[j], b.hw[j]) == sub_dn(b.c[j], b.hw[j]));
          corners[m][j] = b.c[j] + ((m & (1 << j)) ? b.hw[j] : -b.hw[j]);
          sc_up = add_up(sc_up, mul_up(corners[m][j], corners[m][j]));
        }
        dS2_up[m] = std::max(0.0, sub_up(mul_up(sc_up, sc_up), Smin2_dn));
        if (dS2_up[m] > dS2_max) dS2_max = dS2_up[m];
      }

      static constexpr double t_grid[5] = {0.0, 0.25, 0.5, 0.75, 1.0};
      double max_l_t[5] = {-1e30, -1e30, -1e30, -1e30, -1e30};
      double max_h_t[5] = {-1e30, -1e30, -1e30, -1e30, -1e30};
      double box_min_piv = 1e30;
      int box_max_gl = 0;
      bool ok = true;
      double box_err = std::max(qsl_hi, qsh_hi) + std::min(dS2_max, qrt_hi);
      int max_stage = (box_err > 0.04) ? 1 : (box_err > 0.0015) ? 2 : (box_err > 0.00015) ? 3 : (box_err > 2.5e-5) ? 4 : (box_err > 6e-6) ? 5 : 6;
      for (int m = 0; m < 16; ++m) {
        double qrt_ask = (qrt_hi <= dS2_max) ? qrt_hi : dS2_up[m];
        double qrt_min = std::min(dS2_up[m], qrt_hi);
        double req_l = -add_up(add_up(qsl_hi, qrt_ask), w_err);
        double lim_l = -add_up(add_up(qsl_hi, qrt_min), w_err);
        PtVal pl = eval_corner_pt(b.bwl, corners[m], req_l, max_stage, *swl_wcs, *swl_bf, *swl_c);
        if (pl.odd_piv <= 0.0 || pl.f_ub >= lim_l) { ok = false; break; }
        double piv_l = (pl.odd_piv > 1e8) ? p2_margin : pl.odd_piv;
        if (piv_l < box_min_piv) box_min_piv = piv_l;
        if (pl.grid_lvl > box_max_gl) box_max_gl = pl.grid_lvl;

        double req_h = -add_up(add_up(qsh_hi, qrt_ask), w_err);
        double lim_h = -add_up(add_up(qsh_hi, qrt_min), w_err);
        PtVal ph = eval_corner_pt(b.bwh, corners[m], req_h, max_stage, *swh_wcs, *swh_bf, *swh_c);
        if (ph.odd_piv <= 0.0 || ph.f_ub >= lim_h) { ok = false; break; }
        double piv_h = (ph.odd_piv > 1e8) ? p2_margin : ph.odd_piv;
        if (piv_h < box_min_piv) box_min_piv = piv_h;
        if (ph.grid_lvl > box_max_gl) box_max_gl = ph.grid_lvl;

        bool any_l = false, any_h = false;
        for (int ti = 0; ti < 5; ++ti) {
          double t = t_grid[ti], omt = 1.0 - t;
          double fl_t = add_up(pl.f_ub, mul_up(omt, dS2_up[m]));
          double fh_t = add_up(ph.f_ub, mul_up(omt, dS2_up[m]));
          if (fl_t > max_l_t[ti]) max_l_t[ti] = fl_t;
          if (fh_t > max_h_t[ti]) max_h_t[ti] = fh_t;
          double et_add = mul_up(t, qrt_hi);
          if (add_up(add_up(max_l_t[ti], add_up(qsl_hi, et_add)), w_err) < 0.0) any_l = true;
          if (add_up(add_up(max_h_t[ti], add_up(qsh_hi, et_add)), w_err) < 0.0) any_h = true;
        }
        if (!any_l || !any_h) { ok = false; break; }
      }
      if (ok) {
        double best_l = 1e30, best_h = 1e30;
        for (int ti = 0; ti < 5; ++ti) {
          double et_add = mul_up(t_grid[ti], qrt_hi);
          double tl = add_up(add_up(max_l_t[ti], add_up(qsl_hi, et_add)), w_err);
          double th = add_up(add_up(max_h_t[ti], add_up(qsh_hi, et_add)), w_err);
          if (tl < best_l) best_l = tl;
          if (th < best_h) best_h = th;
        }
        double tot = std::max(best_l, best_h);
        if (tot < 0.0) {
          closed = true;
          res.closed_g[box_max_gl]++;
          res.worst_even_c0_margin = std::max(res.worst_even_c0_margin, tot);
          res.min_odd_piv = std::min(res.min_odd_piv, box_min_piv);
        }
      }
    }

    if (closed) continue;

    if (b.depth >= 48) {
      res.open_boxes++;
      std::fprintf(stderr, "OPEN BOX on [%.6f, %.6f]: c=(%.5f,%.5f,%.5f,%.5f) hw=(%.5f,%.5f,%.5f,%.5f) w_err=%.3e qsum=%.3e qrt=%.3e\n",
                   b.bwl, b.bwh, b.c[0], b.c[1], b.c[2], b.c[3], b.hw[0], b.hw[1], b.hw[2], b.hw[3], w_err, std::max(qsl_hi, qsh_hi), qrt_hi);
      continue;
    }
    // Adaptive 5D bisection: bisect w whenever w_err dominates 4D box concavity error!
    double max_qsum = std::max(qsl_hi, qsh_hi);
    if (w_err > 0.35 * max_qsum && (b.bwh - b.bwl) > 1e-4) {
      double wm = 0.5 * (b.bwl + b.bwh);
      assert(wm > b.bwl && wm < b.bwh);
      assert(sub_up(wm, b.bwl) == sub_dn(wm, b.bwl) && sub_up(b.bwh, wm) == sub_dn(b.bwh, wm));
      Box5 b1 = b, b2 = b;
      b1.bwh = wm; b1.depth = b.depth + 1;
      b2.bwl = wm; b2.depth = b.depth + 1;
      res.w_splits++;
      stack.push_back(b1);
      stack.push_back(b2);
      continue;
    }
    int best_axis = 0;
    double best_sc = -1.0;
    for (int j = 0; j < 4; ++j) {
      double sc_j = b.hw[j] * b.hw[j] * (q_diag[j].h + 2.0 * Smax + 4.0 * ah[j] * ah[j]);
      if (sc_j > best_sc) { best_sc = sc_j; best_axis = j; }
    }
    double nh = 0.5 * b.hw[best_axis];
    assert(nh > 1e-12);
    Box5 b1 = b, b2 = b;
    b1.hw[best_axis] = nh; b1.c[best_axis] = b.c[best_axis] - nh; b1.depth = b.depth + 1;
    b2.hw[best_axis] = nh; b2.c[best_axis] = b.c[best_axis] + nh; b2.depth = b.depth + 1;
    assert(add_up(b1.c[best_axis], nh) == b.c[best_axis] &&
           sub_dn(b1.c[best_axis], nh) == sub_dn(b.c[best_axis], b.hw[best_axis]) &&
           add_up(b2.c[best_axis], nh) == add_up(b.c[best_axis], b.hw[best_axis]) &&
           sub_dn(b2.c[best_axis], nh) == b.c[best_axis]);
    stack.push_back(b1);
    stack.push_back(b2);
  }
  size_t tot_pts = cache_l.size() + cache_h.size();
  for (const auto& kv : mid_slices) tot_pts += kv.second.cache.size();
  res.unique_corners = static_cast<int>(tot_pts);
  res.total_boxes = res.closed_ext + res.closed_ori + res.closed_piv
                    + res.closed_g[0] + res.closed_g[1] + res.closed_g[2] + res.open_boxes;
  return res;
}

// ============================================================================
// 10. Startup Self-Tests & JSON Utilities
// ============================================================================
static void run_self_tests() {
  require_fe_upward();
  I one_third = rat(1, 3);
  assert(one_third.l < one_third.h);
  I e1 = expneg_iv(I(1.0));
  assert(e1.l < 0.36787944117144233 && e1.h > 0.36787944117144233);
  I e1p = exppos_iv(I(1.0));
  assert(e1p.l < 2.718281828459045 && e1p.h > 2.718281828459045);
  I s, c;
  sincos_angle_iv(TWO_PI_IV * rat(1, 6), s, c);  // pi/3: sin = sqrt(3)/2, cos = 1/2
  assert(c.l <= 0.5 && c.h >= 0.5);
  assert(s.l <= 0.8660254037844386 && s.h >= 0.8660254037844386);
  double at1 = atan_up_pt(1.0);
  assert(at1 >= 0.7853981633974483 && at1 <= 0.7853981633975);
  // Check exact B_odd minimum eigenvalue > 50/61 via 3x3 Cholesky:
  Sym3 mu0_inv;
  I inv61 = rat(50, 61);
  mu0_inv.e[0] = inv61; mu0_inv.e[3] = inv61; mu0_inv.e[5] = inv61;
  assert(check_B3_minus_M3_pd(mu0_inv) > 0.0);
  // Check exact Q_2(A, B) positive definiteness (validates exact convex tangent min_Q2_box_dn):
  assert(C.q_AA.l > 0.0 && C.q_BB.l > 0.0 && (C.q_AA * C.q_BB - sq(C.q_AB)).l > 0.0);
  // Check exact RingGeom & AngGeom integral sum = 1:
  auto rg0 = make_ring_geom(0.0, 28.0);
  I f1 = gamma_tail_iv(1, I(28.0));
  I tot_T = rg0.Imom[0] + f1;
  assert(tot_T.l <= 1.0 && tot_T.h >= 1.0);
  I tot_f2 = rg0.Imom[2] + I(0.5) * (gamma_tail_iv(3, I(28.0)) - I(4.0) * gamma_tail_iv(2, I(28.0)) + I(4.0) * f1);
  assert(tot_f2.l <= 1.0 && tot_f2.h >= 1.0);
  // Check Kmom & ang2 exact second moments:
  auto rg1 = make_ring_geom(1.0, 2.0);
  assert(rg1.Kmom[0].l > 0.0 && rg1.Kmom[0].h < 0.125 * rg1.Imom[0].h);  // int (T-1.5)^2 <= (1/4) int, actually ~1/12!
  auto ag1 = make_ang_geom_rat(3, 4, 24);
  I a2_sum = ag1.ang2[0] + ag1.ang2[1];
  I expected_a2 = (I(2.0) / I(3.0)) * (sq(ag1.hp) * ag1.hp) / TWO_PI_IV;
  assert(a2_sum.l <= expected_a2.h && a2_sum.h >= expected_a2.l);
  assert(ag1.wt_p2.l <= expected_a2.h && ag1.wt_p2.h >= expected_a2.l);
  assert(rg1.wt_T1.h < 0.0 && rg1.wt_T2.l > 0.0);
  std::printf("[self-test] PASS (FE_UPWARD, exp, sincos, atan, B_odd > 50/61 I, Q2 PD, Gamma/Ang2/C0 moments)\n");
}

static std::string hex_d(double x) {
  std::ostringstream oss;
  oss << std::hexfloat << x;
  return "\"" + oss.str() + "\"";
}
static std::string iv_json(I x) { return "[" + hex_d(x.l) + "," + hex_d(x.h) + "]"; }
static std::string sym2_json(const Sym2& m) {
  return "{\"a00\":" + iv_json(m.a00) + ",\"a01\":" + iv_json(m.a01) + ",\"a11\":" + iv_json(m.a11) + "}";
}
static std::string sym3_json(const Sym3& m) {
  std::string s = "[";
  for (int i = 0; i < 6; ++i) {
    if (i) s += ",";
    s += iv_json(m.e[i]);
  }
  return s + "]";
}

// ============================================================================
// 11. Main Driver
// ============================================================================
int main(int argc, char** argv) {
  set_fe_upward();
  init_constants();
  HEUR.init();
  run_self_tests();

  std::string out_path = "result.json";
  int single_slab = -1;
  bool control_false_hotspot = false;
  bool test_part1_only = false;
  bool test_part2_only = false;
  for (int i = 1; i < argc; ++i) {
    if (std::strcmp(argv[i], "--output") == 0 && i + 1 < argc) out_path = argv[++i];
    else if (std::strcmp(argv[i], "--test-slab") == 0 && i + 1 < argc) single_slab = std::atoi(argv[++i]);
    else if (std::strcmp(argv[i], "--control-false-hotspot") == 0) control_false_hotspot = true;
    else if (std::strcmp(argv[i], "--test-part1") == 0) test_part1_only = true;
    else if (std::strcmp(argv[i], "--test-part2") == 0) test_part2_only = true;
  }

  // Build 3 PolarGridLevels (coarse 16x24, med 32x40, fine 48x56) ONCE at startup!
  std::vector<PolarGridLevel> pgrids;
  {
    std::vector<double> T0 = {0.0, 0.03125, 0.125, 0.375, 0.75, 1.25, 1.875, 2.625, 3.5, 4.5, 6.0, 8.0, 10.5, 14.0, 19.0, 28.0};
    std::vector<double> T1 = {0.0, 0.0078125, 0.03125, 0.078125, 0.15625, 0.3125, 0.5, 0.75, 1.0, 1.25, 1.5, 1.875, 2.25, 2.75, 3.25, 3.75,
                              4.5, 5.25, 6.0, 7.0, 8.0, 9.5, 11.0, 13.0, 15.5, 19.0, 23.0, 28.0};
    std::vector<double> T2;
    T2.push_back(0.0); T2.push_back(0.0078125); T2.push_back(0.03125); T2.push_back(0.09375); T2.push_back(0.1875);
    for (int i = 1; i <= 20; ++i) T2.push_back(0.1875 + (4.0 - 0.1875) * i / 20.0);
    for (int i = 1; i <= 14; ++i) T2.push_back(4.0 + (12.0 - 4.0) * i / 14.0);
    for (int i = 1; i <= 8; ++i) T2.push_back(12.0 + (28.0 - 12.0) * i / 8.0);
    std::vector<double> T3;
    T3.push_back(0.0); T3.push_back(0.00390625); T3.push_back(0.015625); T3.push_back(0.046875); T3.push_back(0.125);
    for (int i = 1; i <= 32; ++i) T3.push_back(0.125 + (4.0 - 0.125) * i / 32.0);
    for (int i = 1; i <= 24; ++i) T3.push_back(4.0 + (12.0 - 4.0) * i / 24.0);
    for (int i = 1; i <= 12; ++i) T3.push_back(12.0 + (28.0 - 12.0) * i / 12.0);
    pgrids.push_back(build_polar_grid(T0, 24));
    pgrids.push_back(build_polar_grid(T1, 40));
    pgrids.push_back(build_polar_grid(T2, 56));
    pgrids.push_back(build_polar_grid(T3, 88));
  }

  if (control_false_hotspot) {
    // 1. Live even-budget false-target control: at w=0.6004, A=0.3496, B=0.2023,
    //    true B_P - U_WCS > 0, while shrinking B_P by 0.01 fails!
    double v_pt[4] = {0.3496, 0.2023, 0.0, 0.0};
    WcsGrid g = build_wcs_grid(0.6004, 32, 20, 2, 2);
    double rem_ub = eval_wcs_ub(g, v_pt);
    I BP = eval_BP_iv(0.6004, v_pt);
    double dp = sub_dn(BP.l, rem_ub);
    double false_diff = sub_dn(BP.l - 0.01, rem_ub);
    assert(dp > 0.0 && false_diff < 0.0);

    // 2. Live odd-budget false-target control: at w=0, v=0, true B_odd - M_odd(0,0) > 0,
    //    while weakened odd budget B_odd - 0.5*I_6 MUST be rejected (pd_piv < 0)!
    QPoly q0{1e-4, 0.0, 0.0, 0.0};
    I v0[4] = {I(0.0), I(0.0), I(0.0), I(0.0)};
    auto oer_true = eval_odd_box(pgrids[1], I(0.0), v0, q0, 2, 1e-4, 0.0);
    auto oer_false = eval_odd_box(pgrids[1], I(0.0), v0, q0, 2, 1e-4, 0.5);
    assert(oer_true.pd_piv > 0.0 && oer_false.pd_piv < 0.0);

    // 3. Exact Jensen diagonal sanity checks independent of the numerical integrators:
    //    (a) Part 1 at w = 11/8: O_iso[0,0] = E[T/|w+L|] >= 1/sqrt(99227833/25000000) > 1/2!
    Part1Slab s_p1 = certify_part1_slab(1.375, 1.375 + 0.625 / 80.0, true, 30.0, 96, 48, 40);
    assert(s_p1.O_iso.e[0].l > 0.5 && s_p1.O_iso.e[0].h > 0.5 && s_p1.odd_margin > 0.0);
    //    (b) Part 2 at w = 0: M_im[0,0] >= E[sqrt(T)/(a+bT)] >= (250/387)*sqrt(pi) > 1.1!
    Part2Slab s_p2 = certify_part2_slab(0.0, 1.0 / 128.0, 1.0 / 32.0, 0.04, 0.40);
    assert(s_p2.M_im.e[0].l > 1.1 && s_p2.M_im.e[0].h > 1.1 && s_p2.margin > 0.0);

    // 4. Exact Part 3 binary64 outward-rounding regression controls (codex-a7c4):
    //    (a) First T2 ring after 4.0 (ring index 24): hT >= max(Tm - Tl, Th - Tm) > 0.5*(Th - Tl) by 2^-51!
    const RingGeom& rg24 = pgrids[2].rings[24];
    double naive_hT = mul_up(0.5, sub_up(rg24.Th, rg24.Tl));
    assert(rg24.Tl == 4.0 && rg24.hT >= sub_up(rg24.Tm, rg24.Tl) && rg24.hT >= sub_up(rg24.Th, rg24.Tm));
    assert(sub_dn(rg24.hT, naive_hT) == std::ldexp(1.0, -51));
    //    (b) Coarse sector 2 of 24: ag.df encloses 1/24 (24 * df.l <= 1 <= 24 * df.h),
    //        whereas sub_up(div_up(3,24), div_up(2,24)) = 1501199875790165 / 2^55 < 1/24!
    const AngGeom& ag2 = pgrids[0].angs[2];
    double naive_df = sub_up(div_up(3.0, 24.0), div_up(2.0, 24.0));
    assert(mul_dn(ag2.df.l, 24.0) <= 1.0 && mul_up(ag2.df.h, 24.0) >= 1.0 && ag2.df.h > naive_df);

    std::printf("CONTROL_ALL_SECTOR dp=%.9g false_diff=%.9g origin_piv=%.9g false_odd_piv=%.9g p1_O00=[%.6f,%.6f] p2_Mim00=[%.6f,%.6f] hT_gap=%.3e df_gap=%.3e\n",
                dp, false_diff, oer_true.pd_piv, oer_false.pd_piv,
                s_p1.O_iso.e[0].l, s_p1.O_iso.e[0].h, s_p2.M_im.e[0].l, s_p2.M_im.e[0].h,
                sub_dn(rg24.hT, naive_hT), sub_dn(ag2.df.h, naive_df));
    return 0;
  }

  unsigned nthreads = std::max(1u, std::thread::hardware_concurrency());
  if (nthreads > 8) nthreads = 8;
  std::printf("[certify_all_sector] running with %u threads...\n", nthreads);

  // ------------------------------------------------------------------------
  // Slab schedules for Part 2 (208 smooth-split H_5 slabs) & Part 3 (96 adaptive Box5 slabs) on [0, 11/8]:
  // Every s_odd(w) is an exact dyadic binary64 rational, and each Part 3 slab is an exact union
  // of Part 2 slabs with s_odd_p3 <= s_odd_p2!
  // ------------------------------------------------------------------------
  struct BulkSpec { double wl, wh, s_odd, delta, eps_cs; };
  std::vector<BulkSpec> p2_specs, bulk_specs;
  auto add_spec = [&](std::vector<BulkSpec>& dst, double a0, double b0, int n, double s_odd, double delta, double eps_cs) {
    for (int i = 0; i < n; ++i) {
      double wl = a0 + (b0 - a0) * i / n;
      double wh = a0 + (b0 - a0) * (i + 1) / n;
      dst.push_back({wl, wh, s_odd, delta, eps_cs});
    }
  };
  // Part 2 (244 exact-dyadic smooth-split H_5 slabs on [0, 11/8]):
  add_spec(p2_specs, 0.0,     0.0625,   8, 1.0 / 32.0,   0.04, 0.40);
  add_spec(p2_specs, 0.0625,  0.125,    8, 3.0 / 128.0,  0.04, 0.30);
  add_spec(p2_specs, 0.125,   0.1875,   8, 1.0 / 64.0,   0.05, 0.12);
  add_spec(p2_specs, 0.1875,  0.28125, 24, 3.0 / 256.0,  0.05, 0.06);
  add_spec(p2_specs, 0.28125, 0.375,   24, 1.0 / 128.0,  0.05, 0.04);
  add_spec(p2_specs, 0.375,   0.59375, 56, 3.0 / 512.0,  0.05, 0.02);
  add_spec(p2_specs, 0.59375, 0.71875, 32, 1.0 / 128.0,  0.05, 0.03);
  add_spec(p2_specs, 0.71875, 0.8125,  12, 3.0 / 256.0,  0.07, 0.06);
  add_spec(p2_specs, 0.8125,  1.0,     24, 1.0 / 64.0,   0.08, 0.08);
  add_spec(p2_specs, 1.0,     1.375,   48, 1.0 / 64.0,   0.10, 0.12);

  // Part 3 (98 exact-dyadic slabs with on-demand Box5 w-bisection near origin shell):
  add_spec(bulk_specs, 0.0,     0.0625,   4, 1.0 / 32.0,   0.04, 0.40);
  add_spec(bulk_specs, 0.0625,  0.125,    4, 3.0 / 128.0,  0.04, 0.30);
  add_spec(bulk_specs, 0.125,   0.1875,   4, 1.0 / 64.0,   0.05, 0.12);
  add_spec(bulk_specs, 0.1875,  0.28125,  6, 3.0 / 256.0,  0.05, 0.06);
  add_spec(bulk_specs, 0.28125, 0.375,    6, 1.0 / 128.0,  0.05, 0.04);
  add_spec(bulk_specs, 0.375,   0.59375, 28, 3.0 / 512.0,  0.05, 0.02);
  add_spec(bulk_specs, 0.59375, 0.71875, 16, 1.0 / 128.0,  0.05, 0.03);
  add_spec(bulk_specs, 0.71875, 0.8125,   6, 3.0 / 256.0,  0.07, 0.06);
  add_spec(bulk_specs, 0.8125,  1.0,     12, 1.0 / 64.0,   0.08, 0.08);
  add_spec(bulk_specs, 1.0,     1.375,   12, 1.0 / 64.0,   0.10, 0.12);

  if (test_part2_only) {
    std::vector<Part2Slab> p2_test(p2_specs.size());
    std::atomic<size_t> next_i(0);
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        set_fe_upward();
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= p2_specs.size()) break;
          const auto& sp = p2_specs[idx];
          p2_test[idx] = certify_part2_slab(sp.wl, sp.wh, sp.s_odd, sp.delta, sp.eps_cs);
        }
      });
    }
    for (auto& th : workers) th.join();
    int fails = 0;
    double mn = 1e30;
    for (size_t i = 0; i < p2_test.size(); ++i) {
      const auto& r = p2_test[i];
      if (r.margin <= 0.0) {
        std::printf("  FAIL slab %zu [%.5f, %.5f] s=%.6f margin=%.6e\n", i, r.wl, r.wh, r.s_odd, r.margin);
        fails++;
      }
      mn = std::min(mn, r.margin);
    }
    std::printf("[test-part2] slabs=%zu fails=%d min_margin=%.6e\n", p2_test.size(), fails, mn);
    return fails == 0 ? 0 : 1;
  }

  if (single_slab >= 0) {
    assert(single_slab < static_cast<int>(bulk_specs.size()));
    const auto& sp = bulk_specs[single_slab];
    std::printf("[test-slab %d] w=[%.6f, %.6f], s_odd=%.6f\n", single_slab, sp.wl, sp.wh, sp.s_odd);
    double p2_min_m = 1e30;
    for (const auto& p2s : p2_specs) {
      if (p2s.wh > sp.wl && p2s.wl < sp.wh) {
        Part2Slab p2 = certify_part2_slab(p2s.wl, p2s.wh, p2s.s_odd, p2s.delta, p2s.eps_cs);
        p2_min_m = std::min(p2_min_m, p2.margin);
      }
    }
    std::printf("  Part 2 origin strip: margin=%.6e (%s)\n", p2_min_m, p2_min_m > 0 ? "PASS" : "FAIL");
    SlabCurv sc = compute_slab_base_curv(sp.wl, sp.wh);
    std::vector<WcsGrid> gl, gh;
    gl.push_back(build_wcs_grid(sp.wl, 10, 8, 2, 2));
    gh.push_back(build_wcs_grid(sp.wh, 10, 8, 2, 2));
    gl.push_back(build_wcs_grid(sp.wl, 22, 14, 2, 2));
    gh.push_back(build_wcs_grid(sp.wh, 22, 14, 2, 2));
    bool bfl = false, bfh = false;
    CornerCache cl, ch;
    Slab4DResult r4 = certify_4d_slab(sp.wl, sp.wh, sp.s_odd, p2_min_m, sc, gl, bfl, cl, gh, bfh, ch, pgrids, true);
    std::printf("  Part 3 4D cover: total=%d (ext=%d ori=%d piv=%d ws=%d g=[%d,%d,%d], uniq_pts=%d) open=%d worst_m=%.4e min_piv=%.4e\n",
                r4.total_boxes, r4.closed_ext, r4.closed_ori, r4.closed_piv, r4.w_splits,
                r4.closed_g[0], r4.closed_g[1], r4.closed_g[2], r4.unique_corners,
                r4.open_boxes, r4.worst_even_c0_margin, r4.min_odd_piv);
    return (p2_min_m > 0 && r4.open_boxes == 0) ? 0 : 1;
  }

  // ========================================================================
  // FULL RUN: PART 1 + PART 2 + PART 3
  // ========================================================================
  // PART 1: 240 amplitude slabs on [0, 11/8] + 208 shift slabs on [11/8, 8]
  struct PotSpec { double wl, wh; bool shift_ext; double r_cut; int n1, n2, nt; };
  std::vector<PotSpec> p1_specs;
  auto add_p1 = [&](double a0, double b0, int n, bool sext, double rcut, int n1, int n2, int nt) {
    for (int i = 0; i < n; ++i)
      p1_specs.push_back({a0 + (b0 - a0) * i / n, a0 + (b0 - a0) * (i + 1) / n, sext, rcut, n1, n2, nt});
  };
  add_p1(0.0,   0.375, 48,  false, 24.0, 96, 48, 40);
  add_p1(0.375, 0.875, 128, false, 24.0, 96, 48, 40);
  add_p1(0.875, 1.375, 64,  false, 24.0, 96, 48, 40);
  add_p1(1.375, 2.0,   80,  true,  30.0, 96, 48, 40);
  add_p1(2.0,   4.0,   64,  true,  30.0, 96, 64, 40);
  add_p1(4.0,   8.0,   128, true,  30.0, 64, 96, 48);

  std::vector<Part1Slab> p1_res(p1_specs.size());
  {
    std::atomic<size_t> next_i(0);
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        set_fe_upward();
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= p1_specs.size()) break;
          const auto& sp = p1_specs[idx];
          p1_res[idx] = certify_part1_slab(sp.wl, sp.wh, sp.shift_ext, sp.r_cut, sp.n1, sp.n2, sp.nt);
        }
      });
    }
    for (auto& th : workers) th.join();
  }
  double min_p1_amp = 1e30, min_p1_se = 1e30, min_p1_so = 1e30;
  for (const auto& r : p1_res) {
    if (!(r.even_margin > 0.0)) {
      std::fprintf(stderr, "PART 1 EVEN FAIL on [%.6f, %.6f] shift_ext=%d even_m=%.6e\n", r.wl, r.wh, (int)r.shift_ext, r.even_margin);
      return 1;
    }
    if (!r.shift_ext) min_p1_amp = std::min(min_p1_amp, r.even_margin);
    else {
      if (!(r.odd_margin > 0.0)) {
        std::fprintf(stderr, "PART 1 ODD FAIL on [%.6f, %.6f] odd_m=%.6e\n", r.wl, r.wh, r.odd_margin);
        return 1;
      }
      min_p1_se = std::min(min_p1_se, r.even_margin);
      min_p1_so = std::min(min_p1_so, r.odd_margin);
    }
  }
  std::printf("[Part 1] PASS potential exteriors (%zu slabs): amp_m=%.4e, shift_even_m=%.4e, shift_odd_m=%.4e\n",
              p1_res.size(), min_p1_amp, min_p1_se, min_p1_so);
  if (test_part1_only) return 0;

  // PART 2: Smooth-Split H_{5,delta} Origin Strip on all p2_specs slabs (244 exact-dyadic slabs covering [0, 11/8])
  std::vector<Part2Slab> p2_res(p2_specs.size());
  {
    std::atomic<size_t> next_i(0);
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        set_fe_upward();
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= p2_specs.size()) break;
          const auto& sp = p2_specs[idx];
          p2_res[idx] = certify_part2_slab(sp.wl, sp.wh, sp.s_odd, sp.delta, sp.eps_cs);
        }
      });
    }
    for (auto& th : workers) th.join();
  }
  double min_p2_m = 1e30;
  for (const auto& r : p2_res) {
    if (r.margin <= 0.0) {
      std::fprintf(stderr, "PART 2 FAIL on [%.6f, %.6f] s=%.6f margin=%.6e\n", r.wl, r.wh, r.s_odd, r.margin);
      return 1;
    }
    min_p2_m = std::min(min_p2_m, r.margin);
  }
  std::printf("[Part 2] PASS smooth-split origin strip (%zu slabs): min_piv=%.4e\n", p2_res.size(), min_p2_m);

  // Precompute min Part 2 margin overlapping each Part 3 slab (guaranteed exact handoff s_odd_p3 <= s_odd_p2):
  std::vector<double> p3_p2_margin(bulk_specs.size(), 1e30);
  for (size_t idx = 0; idx < bulk_specs.size(); ++idx) {
    const auto& sp = bulk_specs[idx];
    for (const auto& r2 : p2_res) {
      if (r2.wh > sp.wl && r2.wl < sp.wh) {
        assert(sp.s_odd <= r2.s_odd);
        p3_p2_margin[idx] = std::min(p3_p2_margin[idx], r2.margin);
      }
    }
    assert(p3_p2_margin[idx] > 0.0 && p3_p2_margin[idx] < 1e20);
  }

  // PART 3: Adaptive 5D Box5 Bulk Cover on all bulk_specs slabs covering [0, 11/8]
  // Deterministic LPT-ordered fixed contiguous chunks: adjacent slabs with identical s_odd share
  // their endpoint WCS grids and CornerCache, while heavy fold & low-w slabs launch first to
  // eliminate straggler tails. Each chunk starts fresh -> 100% bit-for-bit deterministic!
  std::vector<SlabCurv> p3_curv(bulk_specs.size());
  std::vector<Slab4DResult> p3_res(bulk_specs.size());
  {
    std::vector<std::pair<size_t, size_t>> chunks;
    size_t n_tot = bulk_specs.size();
    auto push_range = [&](size_t a, size_t b, size_t step) {
      for (size_t s = a; s < b; s += step) chunks.push_back({s, std::min(s + step, b)});
    };
    if (n_tot == 98) {
      push_range(24, 52, 2);  // Heavy fold valley [0.375, 0.59375] first (14 chunks of 2)
      push_range(0,  12, 2);  // Low-w [0, 0.1875] second (6 chunks of 2)
      push_range(52, 68, 2);  // Upper fold [0.59375, 0.71875] third (8 chunks of 2)
      push_range(12, 24, 3);  // Mid-low-w [0.1875, 0.375] fourth (4 chunks of 3)
      push_range(68, 98, 5);  // High-w [0.71875, 1.375] last (6 chunks of 5)
    } else {
      push_range(0, n_tot, 4);
    }
    std::atomic<size_t> next_c(0), done_c(0);
    std::mutex log_mtx;
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        set_fe_upward();
        while (true) {
          size_t ci = next_c.fetch_add(1);
          if (ci >= chunks.size()) break;
          size_t start = chunks[ci].first, end = chunks[ci].second;
          std::vector<WcsGrid> prev_wcs;
          CornerCache prev_cache;
          bool prev_fine = false;
          double prev_wh = -1.0, prev_s_odd = -1.0;
          for (size_t idx = start; idx < end; ++idx) {
            const auto& sp = bulk_specs[idx];
            p3_curv[idx] = compute_slab_base_curv(sp.wl, sp.wh);
            std::vector<WcsGrid> gl, gh;
            CornerCache cl, ch;
            bool bfl = false, bfh = false;
            if (prev_wh == sp.wl && prev_s_odd == sp.s_odd) {
              gl = std::move(prev_wcs);
              cl = std::move(prev_cache);
              bfl = prev_fine;
            } else {
              gl.push_back(build_wcs_grid(sp.wl, 10, 8, 2, 2));
              gl.push_back(build_wcs_grid(sp.wl, 22, 14, 2, 2));
            }
            gh.push_back(build_wcs_grid(sp.wh, 10, 8, 2, 2));
            gh.push_back(build_wcs_grid(sp.wh, 22, 14, 2, 2));
            p3_res[idx] = certify_4d_slab(sp.wl, sp.wh, sp.s_odd, p3_p2_margin[idx], p3_curv[idx],
                                          gl, bfl, cl, gh, bfh, ch, pgrids);
            prev_wcs = std::move(gh);
            prev_cache = std::move(ch);
            prev_fine = bfh;
            prev_wh = sp.wh;
            prev_s_odd = sp.s_odd;
            size_t dc = done_c.fetch_add(1) + 1;
            if (dc % 2 == 0 || dc == bulk_specs.size() || p3_res[idx].open_boxes > 0) {
              std::lock_guard<std::mutex> lk(log_mtx);
              std::printf("  [Part 3] progress %zu/%zu (slab %zu [%.5f,%.5f] boxes=%d open=%d worst=%.3e)\n",
                          dc, bulk_specs.size(), idx, sp.wl, sp.wh,
                          p3_res[idx].total_boxes, p3_res[idx].open_boxes, p3_res[idx].worst_even_c0_margin);
              std::fflush(stdout);
            }
          }
        }
      });
    }
    for (auto& th : workers) th.join();
  }

  int64_t tot_4d = 0, tot_open = 0;
  double worst_m = -1e30, min_piv = 1e30;
  for (const auto& r : p3_res) {
    tot_4d += r.total_boxes;
    tot_open += r.open_boxes;
    worst_m = std::max(worst_m, r.worst_even_c0_margin);
    min_piv = std::min(min_piv, r.min_odd_piv);
  }
  assert(tot_open == 0 && worst_m < 0.0 && min_piv > 0.0);
  std::printf("[Part 3] PASS 4D all-sector bulk cover (%zu slabs): total_boxes=%lld, worst_margin=%.6e, min_odd_piv=%.6e\n",
              p3_res.size(), static_cast<long long>(tot_4d), worst_m, min_piv);

  // Write exact hexfloat JSON certificate
  std::ofstream out(out_path);
  out << "{\"format\":\"global-all-sector-v1\",\"self_tests_passed\":true,";
  out << "\"shift_exterior_cutoff\":" << hex_d(1.375) << ",";
  out << "\"analytic_tail_cutoff\":" << hex_d(8.0) << ",";
  out << "\"amplitude_exterior_S_min\":" << hex_d(25.0 / 16.0) << ",";
  {
    const RingGeom& rg24 = pgrids[2].rings[24];
    const AngGeom& ag2 = pgrids[0].angs[2];
    out << "\"rounding_controls\":{\"t2_ring24\":{\"Tl\":" << hex_d(rg24.Tl)
        << ",\"Th\":" << hex_d(rg24.Th) << ",\"Tm\":" << hex_d(rg24.Tm)
        << ",\"hT\":" << hex_d(rg24.hT) << "},\"t0_sector2\":{\"df\":" << iv_json(ag2.df) << "}},";
  }
  out << "\"part1_potential_slabs\":[";
  for (size_t i = 0; i < p1_res.size(); ++i) {
    const auto& r = p1_res[i];
    if (i) out << ",";
    out << "{\"wl\":" << hex_d(r.wl) << ",\"wh\":" << hex_d(r.wh)
        << ",\"shift_ext\":" << (r.shift_ext ? "true" : "false")
        << ",\"P_re\":" << sym2_json(r.P_re)
        << ",\"P_im\":" << sym2_json(r.P_im);
    if (r.shift_ext) out << ",\"O_iso\":" << sym3_json(r.O_iso);
    out << ",\"even_margin\":" << hex_d(r.even_margin)
        << ",\"odd_margin\":" << hex_d(r.odd_margin) << "}";
  }
  out << "],\"part2_origin_strip\":[";
  for (size_t i = 0; i < p2_res.size(); ++i) {
    const auto& r = p2_res[i];
    if (i) out << ",";
    out << "{\"wl\":" << hex_d(r.wl) << ",\"wh\":" << hex_d(r.wh)
        << ",\"s_odd\":" << hex_d(r.s_odd)
        << ",\"delta\":" << hex_d(r.delta)
        << ",\"eps_cs\":" << hex_d(r.eps_cs)
        << ",\"R_in\":" << hex_d(r.R_in)
        << ",\"lam\":" << hex_d(r.lam)
        << ",\"M_re\":" << sym3_json(r.M_re)
        << ",\"M_im\":" << sym3_json(r.M_im)
        << ",\"margin\":" << hex_d(r.margin) << "}";
  }
  out << "],\"part3_bulk_4d\":[";
  for (size_t i = 0; i < p3_res.size(); ++i) {
    const auto& r = p3_res[i];
    const auto& sc = p3_curv[i];
    if (i) out << ",";
    out << "{\"wl\":" << hex_d(r.wl) << ",\"wh\":" << hex_d(r.wh)
        << ",\"s_odd\":" << hex_d(r.s_odd)
        << ",\"n_up\":" << hex_d(sc.n_up) << ",\"a2_up\":" << hex_d(sc.a2_up) << ",\"b2_up\":" << hex_d(sc.b2_up)
        << ",\"closed_ext\":" << r.closed_ext << ",\"closed_ori\":" << r.closed_ori
        << ",\"closed_piv\":" << r.closed_piv << ",\"w_splits\":" << r.w_splits
        << ",\"closed_g\":[" << r.closed_g[0] << "," << r.closed_g[1] << "," << r.closed_g[2] << "]"
        << ",\"total_boxes\":" << r.total_boxes << ",\"open_boxes\":" << r.open_boxes
        << ",\"worst_margin\":" << hex_d(r.worst_even_c0_margin)
        << ",\"min_odd_piv\":" << hex_d(r.min_odd_piv) << "}";
  }
  out << "],\"summary\":{\"total_4d_boxes\":" << tot_4d
      << ",\"worst_margin\":" << hex_d(worst_m)
      << ",\"min_odd_piv\":" << hex_d(min_piv) << "}}\n";
  out.close();
  std::printf("[certify_all_sector] DONE -> %s\n", out_path.c_str());
  return 0;
}
