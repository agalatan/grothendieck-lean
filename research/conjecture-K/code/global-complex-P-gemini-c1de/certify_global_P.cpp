// Agent-ID: gemini-c1de. Refs #431.
// Global 4D complex certification of Conjecture K pointwise premise (P) (STATUS.md 7.4.10).
// Self-contained outward-rounded C++17 interval arithmetic (-ffp-contract=off, FE_UPWARD).
//
// Proves for all (w, A, B) in C^3 (reduced WLOG by exact z_1-rotation & conjugation to w >= 0, Im(A) >= 0):
//   Rem(w, A, B) <= B_P(w, A, B)
//                := (p - 463/5000)*S_r - (67/100)*|A + rho0*B|^2 - (2/25)*|B - rho0*A|^2
//                   + (w^2/2 + S_r)*S_r
// via five self-contained parts:
//   Part 1: Unconditional potential matrix P(w) -> shift exterior w in [11/8, 8] & amplitude exterior S_r >= 3/4.
//           (w >= 8 is verified analytically in exact rational arithmetic in verify.py.)
//   Part 2: 3-line switched origin matrix K_ori([w_l, w_h], s_0) -> s <= s_0(w) on [0, 11/8].
//   Part 3: Self-contained shift curvature Rem_ww >= -480*S_r + per-slab N'', |C_A''|, |C_B''| on [0, 11/8].
//   Part 4: 3D ray-convexity cube shells partial([-r_m, r_m]^4) on w in [0, 5/16] using Weighted Cauchy-Schwarz (U_WCS).
//   Part 5: 4D adaptive box cover on w in [0, 11/8] using Weighted Cauchy-Schwarz (U_WCS).

#pragma STDC FP_CONTRACT OFF

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
#include <mutex>
#include <sstream>
#include <string>
#include <thread>
#include <vector>

#if defined(__FMA__)
#warning "Compiling with FMA enabled; ensure -ffp-contract=off is passed."
#endif

// ============================================================================
// 1. Outward-rounded IEEE-754 interval arithmetic (requires FE_UPWARD per thread)
// ============================================================================
struct I {
  double l, h;
  I() : l(0.0), h(0.0) {}
  explicit I(double x) : l(x), h(x) {}
  I(double lo, double hi) : l(lo), h(hi) { assert(lo <= hi); }
};

// Prevent compiler constant-folding / CSE across FE_UPWARD rounding mode.
// Keeps values in FP registers on arm64/x86_64; falls back to volatile elsewhere.
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

// Exact constants enclosed outward via exact hexfloat pairs (verified in startup self-test & verify.py):
// pi in [0x1.921fb54442d18p+1, 0x1.921fb54442d19p+1]
// ln(2) in [0x1.62e42fefa39efp-1, 0x1.62e42fefa39f0p-1]
static const I PI_IV(0x1.921fb54442d18p+1, 0x1.921fb54442d19p+1);
static const I HALF_PI_IV(0x1.921fb54442d18p+0, 0x1.921fb54442d19p+0);
static const I TWO_PI_IV(0x1.921fb54442d18p+2, 0x1.921fb54442d19p+2);
static const I LN2_IV(0x1.62e42fefa39efp-1, 0x1.62e42fefa39f0p-1);

// Libm-independent outward-rounded exp(-x) for x >= 0 (strictly decreasing in x).
static double expneg_pt(double x, bool upper) {
  assert(x >= 0.0);
  if (x == 0.0) return 1.0;
  if (x > 700.0) return upper ? 1e-300 : 0.0;
  // Range reduction: x = k * ln(2) + r, with r around 0
  int k = static_cast<int>(std::floor(x / 0.6931471805599453 + 0.5));
  I r = I(x) - I(static_cast<double>(k)) * LN2_IV;  // |r| <= 0.35
  // exp(-r) = sum_{n=0}^{16} (-r)^n / n! + R_17, |R_17| <= e^{0.5} * |r|^17 / 17! < 2 * |r|^17 / 17!
  I term(1.0);
  I sum(1.0);
  I nr = -r;
  for (int n = 1; n <= 16; ++n) {
    term = term * nr / static_cast<double>(n);
    sum = sum + term;
  }
  // Remainder bound: |r| <= 0.4 => e^{|r|} < 2; 17! = 355687428096000
  double mr = mag(r);
  assert(mr < 0.5);
  double mr17 = 1.0;
  for (int i = 0; i < 17; ++i) mr17 = mul_up(mr17, mr);
  double rem = div_up(mul_up(2.0, mr17), 355687428096000.0);
  I er(std::max(0.0, sub_dn(sum.l, rem)), add_up(sum.h, rem));
  double scale = std::ldexp(1.0, -k);  // exact power of 2 in IEEE-754 (k <= 1010)
  return upper ? mul_up(er.h, scale) : mul_dn(er.l, scale);
}
static inline I expneg_iv(I x) {
  assert(x.l >= 0.0);
  return I(expneg_pt(x.h, false), expneg_pt(x.l, true));
}

// Libm-independent outward-rounded sin(x) and cos(x) for x in [-pi, 2*pi] (exact monotonicity on quadrants).
static I sin_small_iv(I x) {
  // Valid for |x| <= pi/2 + 0.01: Taylor series up to x^19 / 19!, rem <= |x|^21 / 21!
  I x2 = sq(x);
  I term = x;
  I sum = x;
  for (int k = 1; k <= 9; ++k) {
    double den = static_cast<double>((2 * k) * (2 * k + 1));
    term = (-term * x2) / den;
    sum = sum + term;
  }
  double mx = mag(x);
  assert(mx < 1.6);
  double p21 = 1.0;
  for (int i = 0; i < 21; ++i) p21 = mul_up(p21, mx);
  double rem = div_up(p21, 51090942171709440000.0);  // 21!
  return I(std::max(-1.0, sub_dn(sum.l, rem)), std::min(1.0, add_up(sum.h, rem)));
}
static I cos_small_iv(I x) {
  // Taylor series up to x^18 / 18!, rem <= |x|^20 / 20!
  I x2 = sq(x);
  I term(1.0);
  I sum(1.0);
  for (int k = 1; k <= 9; ++k) {
    double den = static_cast<double>((2 * k - 1) * (2 * k));
    term = (-term * x2) / den;
    sum = sum + term;
  }
  double mx = mag(x);
  assert(mx < 1.6);
  double p20 = 1.0;
  for (int i = 0; i < 20; ++i) p20 = mul_up(p20, mx);
  double rem = div_up(p20, 2432902008176640000.0);  // 20!
  return I(std::max(-1.0, sub_dn(sum.l, rem)), std::min(1.0, add_up(sum.h, rem)));
}

static I cos_pt_iv(double x) {
  // x in [0, pi + 0.01]
  assert(x >= -0.01 && x <= 3.16);
  if (x <= 1.5707963267948966) return cos_small_iv(I(x));
  // cos(x) = -cos(pi - x)
  return -cos_small_iv(PI_IV - I(x));
}
static I sin_pt_iv(double x) {
  assert(x >= -0.01 && x <= 3.16);
  if (x <= 1.5707963267948966) return sin_small_iv(I(x));
  // sin(x) = sin(pi - x)
  return sin_small_iv(PI_IV - I(x));
}

// Monotone trig enclosures for theta in [0, pi]:
// cos is strictly decreasing on [0, pi]; sin increases on [0, pi/2] and decreases on [pi/2, pi].
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

// ============================================================================
// 2. Peak-row constants and 1-variable 2nd-order Jet2 (stores f, f', f'')
// ============================================================================
struct Constants {
  I a, b, p, rho0, c1, d, inv_sqrt2;
  I p_minus_shift, q_AA, q_BB, q_AB;
};
static Constants C;

static void init_constants() {
  C.a = rat(699, 1250);
  C.b = rat(179, 1250);
  C.p = rat(2500, 1891);
  C.rho0 = rat(5053, 10000);
  C.c1 = rat(15159, 50000);  // (3/5) * rho0
  C.d = rat(2, 5);
  C.inv_sqrt2 = I(1.0) / sqrt_iv(I(2.0));
  C.p_minus_shift = C.p - rat(463, 5000);
  I r2 = sq(C.rho0);
  C.q_AA = C.p_minus_shift - rat(67, 100) - rat(2, 25) * r2;
  C.q_BB = C.p_minus_shift - rat(67, 100) * r2 - rat(2, 25);
  C.q_AB = (rat(2, 25) - rat(67, 100)) * C.rho0;
}

struct Jet2 {
  I v, d, d2;
  Jet2() : v(0.0), d(0.0), d2(0.0) {}
  explicit Jet2(I val) : v(val), d(0.0), d2(0.0) {}
  Jet2(I val, I der, I der2) : v(val), d(der), d2(der2) {}
};

static inline Jet2 operator+(const Jet2& x, const Jet2& y) { return {x.v + y.v, x.d + y.d, x.d2 + y.d2}; }
static inline Jet2 operator-(const Jet2& x, const Jet2& y) { return {x.v - y.v, x.d - y.d, x.d2 - y.d2}; }
static inline Jet2 operator-(const Jet2& x) { return {-x.v, -x.d, -x.d2}; }
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
static inline Jet2 expneg_j(const Jet2& x) {
  I e = expneg_iv(x.v);
  return {e, (-x.d) * e, (sq(x.d) - x.d2) * e};
}
static inline Jet2 cos_j(const Jet2& th) {
  I c = cos_on_0_pi(th.v);
  I s = sin_on_0_pi(th.v);
  return {c, (-s) * th.d, (-c) * sq(th.d) - s * th.d2};
}
static inline Jet2 sin_j(const Jet2& th) {
  I c = cos_on_0_pi(th.v);
  I s = sin_on_0_pi(th.v);
  return {s, c * th.d, (-s) * sq(th.d) + c * th.d2};
}

// Solve H(T) = T*(a + b*T)^2 = v >= 0 with verified outward endpoint brackets.
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
  double vl = std::max(0.0, v.l);
  double vh = v.h;
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
// 3. Common shifted-polar integrand kernel (C^infty everywhere on [0, R] x [0, pi]!)
// ============================================================================
// Coordinate map: L + w = r e^{i theta}, y = r e^{i theta} - w, |y|^2 = r^2 - 2 r w cos(theta) + w^2,
// T = H^{-1}(|y|^2), f = exp(-T) / ((a + bT)(a + 3bT)), Z = y / (a + bT), z2 = Z^2 / sqrt(2).
// Basis for h = (T - 2/5) A + c1 B + z2 conj(B) on v = (Ar, Br, Ai, Bi):
//   pr = [T - 2/5, c1 + z2r, 0, z2i]
//   pi = [0, z2i, T - 2/5, c1 - z2r]
//   b_proj = cos(th)*pr + sin(th)*pi

struct WcsIntegrandI {
  I fA;
  I fb[4];
  I fM[10];  // upper triangle (i <= j) for i,j in 0..3
};
struct WcsIntegrandJ {
  Jet2 fA;
  Jet2 fb[4];
  Jet2 fM[10];
};

static WcsIntegrandI eval_wcs_pt(I r, I th, I w) {
  I ct = cos_on_0_pi(th);
  I st = sin_on_0_pi(th);
  I yr = r * ct - w;
  I yi = r * st;
  // Exact dependency-free identity: |r e^{i th} - w|^2 = (r - w)^2 + 2 r w (1 - cos th) >= 0!
  I v = sq(r - w) + I(2.0) * r * w * (I(1.0) - ct);
  I T = solve_T_iv(v);
  I a0 = C.a + C.b * T;
  I c0 = C.a + I(3.0) * C.b * T;
  I f = expneg_iv(T) / (a0 * c0);
  I inv_a0 = I(1.0) / a0;
  I Zr = yr * inv_a0;
  I Zi = yi * inv_a0;
  I z2r = (sq(Zr) - sq(Zi)) * C.inv_sqrt2;
  I z2i = (I(2.0) * Zr * Zi) * C.inv_sqrt2;
  I t0 = T - C.d;
  I pr[4] = {t0, C.c1 + z2r, I(0.0), z2i};
  I pi[4] = {I(0.0), z2i, t0, C.c1 - z2r};

  WcsIntegrandI out;
  I f2 = I(2.0) * f;
  I rf2 = r * f2;
  out.fA = r * rf2;  // 2 r^2 f
  for (int i = 0; i < 4; ++i) {
    out.fb[i] = rf2 * (ct * pr[i] + st * pi[i]);
  }
  int k = 0;
  for (int i = 0; i < 4; ++i) {
    for (int j = i; j < 4; ++j) {
      I prod = (i == j) ? (sq(pr[i]) + sq(pi[i])) : (pr[i] * pr[j] + pi[i] * pi[j]);
      out.fM[k++] = f2 * prod;
    }
  }
  return out;
}

static WcsIntegrandJ eval_wcs_jet(const Jet2& r, const Jet2& th, I w) {
  Jet2 ct = cos_j(th);
  Jet2 st = sin_j(th);
  Jet2 yr = r * ct - w;
  Jet2 yi = r * st;
  // Exact dependency-free identity: |r e^{i th} - w|^2 = (r - w)^2 + 2 r w (1 - cos th) >= 0!
  Jet2 v = sq_j(r - w) + (I(2.0) * w) * (r * (Jet2(I(1.0)) - ct));
  Jet2 T = solve_T_j(v);
  Jet2 a0 = Jet2(C.a) + C.b * T;
  Jet2 c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
  Jet2 f = expneg_j(T) * inv_j(a0 * c0);
  Jet2 inv_a0 = inv_j(a0);
  Jet2 Zr = yr * inv_a0;
  Jet2 Zi = yi * inv_a0;
  Jet2 z2r = C.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
  Jet2 z2i = (I(2.0) * C.inv_sqrt2) * (Zr * Zi);
  Jet2 t0 = T - C.d;
  Jet2 z0(I(0.0));
  Jet2 pr[4] = {t0, z2r + C.c1, z0, z2i};
  Jet2 pi[4] = {z0, z2i, t0, Jet2(C.c1) - z2r};

  WcsIntegrandJ out;
  Jet2 f2 = I(2.0) * f;
  Jet2 rf2 = r * f2;
  out.fA = r * rf2;
  for (int i = 0; i < 4; ++i) {
    out.fb[i] = rf2 * (ct * pr[i] + st * pi[i]);
  }
  int k = 0;
  for (int i = 0; i < 4; ++i) {
    for (int j = i; j < 4; ++j) {
      Jet2 prod = (i == j) ? (sq_j(pr[i]) + sq_j(pi[i])) : (pr[i] * pr[j] + pi[i] * pi[j]);
      out.fM[k++] = f2 * prod;
    }
  }
  return out;
}

// ============================================================================
// 4. WCS Cell Grid built with rigorous Jet2 midpoint quadrature + r >= 24 tail
// ============================================================================
struct WcsCell {
  double A_hi;
  double b_lo[4], b_hi[4];
  double M_lo[10], M_hi[10];
};

struct WcsGrid {
  double w;
  int nr, nt;
  double tail_coeff;  // certified upper bound on Rem_tail(w, v) / S_r (for r >= 24, w <= 2: < 1e-9)
  std::vector<WcsCell> cells;
};

static std::vector<double> make_r_edges(int nr) {
  // Exact binary64 radial grid on [0, 24]: 3/4 on [0, 3.5], 3/16 on [3.5, 8], 1/16 on [8, 24].
  int n1 = (3 * nr) / 4;
  int rem = nr - n1;
  int n2 = std::max(1, (3 * rem) / 4);
  int n3 = std::max(1, rem - n2);
  std::vector<double> e;
  e.reserve(n1 + n2 + n3 + 1);
  for (int i = 0; i <= n1; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n1);
    double r = (i == 0) ? 0.0 : (i == n1 ? 3.5 : 3.5 * std::pow(t, 1.5));
    e.push_back(r);
  }
  for (int i = 1; i <= n2; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n2);
    double r = (i == n2) ? 8.0 : (3.5 + 4.5 * std::pow(t, 1.5));
    e.push_back(r);
  }
  for (int i = 1; i <= n3; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n3);
    double r = (i == n3) ? 24.0 : (8.0 + 16.0 * std::pow(t, 1.8));
    e.push_back(r);
  }
  for (size_t i = 0; i + 1 < e.size(); ++i) assert(e[i] < e[i + 1]);
  return e;
}

// Exact outward-rounded tail coefficient on r >= R_cut (for w <= w_max):
// Requires H(25) <= (R_cut - w_max)^2, so T > 25 everywhere on r >= R_cut.
// On T >= 25: |h_E|^2 <= (T - 2/5)^2 + (c1 + T/sqrt(2))^2 <= 2*T^2.
// So int_{r >= R_cut} |h|^2 / r dmu <= (S_r / R_cut) * int_{25}^\infty 2 T^2 e^{-T} dT
//                                    = (S_r / R_cut) * 2 * (625 + 50 + 2) * e^{-25} = (1354 / R_cut) * e^{-25} * S_r.
static double certified_tail_coeff(double w_max, double r_cut) {
  I y_min = I(r_cut) - I(w_max);
  assert(y_min.l > 0.0);
  I H25 = eval_H(I(25.0));
  assert(H25.h <= sq(y_min).l);
  // Verify (T - 2/5)^2 + (c1 + T/sqrt(2))^2 <= 2 T^2 for all T >= 25:
  // Equivalent to (1/2) T^2 + (4/5 - sqrt(2)*c1) T - (4/25 + c1^2) >= 0 for T >= 25.
  I tmin(25.0);
  I quad_check = rat(1, 2) * sq(tmin) + (rat(4, 5) - sqrt_iv(I(2.0)) * C.c1) * tmin - (rat(4, 25) + sq(C.c1));
  assert(quad_check.l > 0.0);
  I tail = (I(1354.0) / I(r_cut)) * expneg_iv(I(25.0));
  return tail.h;
}

// Integrate one cell [r0, r1] x [th0, th1] (in [0, pi]) with nsub_r x nsub_t Jet2 midpoint sub-boxes.
// Note: dmu = ... dr dtheta / (2*pi) on [0, 2*pi], so on [0, pi] each cell uses factor dtheta / (2*pi)
// and in eval_wcs we sum both v_+ = (Ar,Br,Ai,Bi) and v_- = (Ar,Br,-Ai,-Bi)!
static WcsCell integrate_wcs_cell(double r0, double r1, I th0, I th1, double w, int nsub_r, int nsub_t) {
  I sum_A(0.0);
  I sum_b[4];
  I sum_M[10];
  I w_iv(w);
  I inv_2pi = I(1.0) / TWO_PI_IV;
  I inv_24 = rat(1, 24);

  for (int ir = 0; ir < nsub_r; ++ir) {
    I a_r = I(r0) + (I(r1) - I(r0)) * rat(ir, nsub_r);
    I b_r = I(r0) + (I(r1) - I(r0)) * rat(ir + 1, nsub_r);
    I r_box(a_r.l, b_r.h);
    I dr = b_r - a_r;
    I dr2 = sq(dr);
    I r_mid = I(0.5) * (a_r + b_r);
    for (int it = 0; it < nsub_t; ++it) {
      I a_t = th0 + (th1 - th0) * rat(it, nsub_t);
      I b_t = th0 + (th1 - th0) * rat(it + 1, nsub_t);
      // Clamp to [0, PI_IV.h] safely
      I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
      I dt = b_t - a_t;
      I dt2 = sq(dt);
      I t_mid = I(0.5) * (a_t + b_t);
      I area = dr * dt * inv_2pi;

      WcsIntegrandI mid = eval_wcs_pt(r_mid, t_mid, w_iv);
      WcsIntegrandJ jr = eval_wcs_jet(Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_iv);
      // Note: 2D midpoint remainder needs F_rr on [r_box x t_box] and F_thth on [r_mid x t_box]!
      WcsIntegrandJ jt = eval_wcs_jet(Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_iv);

      sum_A = sum_A + area * (mid.fA + inv_24 * (dr2 * jr.fA.d2 + dt2 * jt.fA.d2));
      for (int i = 0; i < 4; ++i) {
        sum_b[i] = sum_b[i] + area * (mid.fb[i] + inv_24 * (dr2 * jr.fb[i].d2 + dt2 * jt.fb[i].d2));
      }
      for (int k = 0; k < 10; ++k) {
        sum_M[k] = sum_M[k] + area * (mid.fM[k] + inv_24 * (dr2 * jr.fM[k].d2 + dt2 * jt.fM[k].d2));
      }
    }
  }
  WcsCell cell;
  assert(sum_A.h > 0.0);
  cell.A_hi = sum_A.h;
  for (int i = 0; i < 4; ++i) {
    cell.b_lo[i] = sum_b[i].l;
    cell.b_hi[i] = sum_b[i].h;
  }
  for (int k = 0; k < 10; ++k) {
    cell.M_lo[k] = sum_M[k].l;
    cell.M_hi[k] = sum_M[k].h;
  }
  assert(cell.M_lo[2] == 0.0 && cell.M_hi[2] == 0.0);
  return cell;
}

static WcsGrid build_wcs_grid(double w, int nr, int nt, int nsub_r, int nsub_t) {
  assert(std::fegetround() == FE_UPWARD);
  WcsGrid g;
  g.w = w;
  g.nr = nr;
  g.nt = nt;
  g.tail_coeff = certified_tail_coeff(2.0, 24.0);
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
  double neg_half_C = -0.5 * C_hi;
  if (Bl <= neg_half_C && neg_half_C <= Bh) return C_hi;
  double B_pt = (Bh < neg_half_C) ? Bh : Bl;
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

// Rigorous outward-rounded upper bound on Rem(w, v) using WCS grid g (single pass for both ±(Ai, Bi) halves!).
static double eval_wcs_ub(const WcsGrid& g, const double v[4]) {
  assert(std::fegetround() == FE_UPWARD);
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
  static constexpr int odd_idx[3] = {3, 5, 6};  // index 2 is (0,2) == 0 identically

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
        int m = even_idx[e];  // 0, 1, 4 (since v2 = v3 = 0)
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
    for (int o = 0; o < 3; ++o) {
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

// Lower bound on B_P(w, v) = (p - 463/5000)*S - 0.67*|A + rho0 B|^2 - 0.08*|B - rho0 A|^2 + (w^2/2 + S)*S
static I eval_BP_iv(double w, const double v[4]) {
  I Ar(v[0]), Br(v[1]), Ai(v[2]), Bi(v[3]), w_iv(w);
  I S = sq(Ar) + sq(Br) + sq(Ai) + sq(Bi);
  I R2 = sq(Ar + C.rho0 * Br) + sq(Ai + C.rho0 * Bi);
  I U2 = sq(Br - C.rho0 * Ar) + sq(Bi - C.rho0 * Ai);
  return C.p_minus_shift * S - rat(67, 100) * R2 - rat(2, 25) * U2 + (I(0.5) * sq(w_iv) + S) * S;
}

// Lower bound on Q_w(v) = (p - 463/5000)*S - 0.67*|R|^2 - 0.08*|U|^2 + (w^2/2)*S
static I eval_Qw_iv(double w, const double v[4]) {
  I Ar(v[0]), Br(v[1]), Ai(v[2]), Bi(v[3]), w_iv(w);
  I S = sq(Ar) + sq(Br) + sq(Ai) + sq(Bi);
  I R2 = sq(Ar + C.rho0 * Br) + sq(Ai + C.rho0 * Bi);
  I U2 = sq(Br - C.rho0 * Ar) + sq(Bi - C.rho0 * Ai);
  return C.p_minus_shift * S - rat(67, 100) * R2 - rat(2, 25) * U2 + (I(0.5) * sq(w_iv)) * S;
}

// ============================================================================
// 5. Part 1 (Unconditional Potential Matrix) & Part 2 (Switched Origin Matrix)
// ============================================================================
struct Sym2 {
  I a00, a01, a11;
};

struct BlockPair {
  Sym2 re, im;
};

// Integrates the 2x2 Re and Im potential matrices P(w_iv) over r in [0, r_cut], th in [0, pi],
// using Jet2 midpoint quadrature + certified r >= r_cut tail!
// Factor: on [0, pi] by conjugation symmetry, full-circle dth/(2*pi) = 2 * [0, pi] dth/(2*pi) = dth/pi!
static std::vector<double> make_dense_r_edges(double r_cut, int n1, int n2, double p1 = 1.4) {
  std::vector<double> e;
  e.reserve(n1 + n2 + 1);
  for (int i = 0; i <= n1; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n1);
    double r = (i == 0) ? 0.0 : (i == n1 ? 5.0 : 5.0 * std::pow(t, p1));
    e.push_back(r);
  }
  for (int i = 1; i <= n2; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n2);
    double r = (i == n2) ? r_cut : (5.0 + (r_cut - 5.0) * std::pow(t, 1.8));
    e.push_back(r);
  }
  return e;
}

static BlockPair integrate_potential_slab(I w_iv, double r_cut, int n1, int n2, int nt) {
  assert(std::fegetround() == FE_UPWARD);
  double tail = certified_tail_coeff(w_iv.h, r_cut);
  auto re = make_dense_r_edges(r_cut, n1, n2, 1.3);
  int nr = static_cast<int>(re.size()) - 1;
  I w_mid = I(0.5) * (I(w_iv.l) + I(w_iv.h));
  I half_dw = I(0.5) * (I(w_iv.h) - I(w_iv.l));
  I dw_sym(-half_dw.h, half_dw.h);

  BlockPair res;
  res.re.a00 = res.re.a01 = res.re.a11 = I(0.0);
  res.im.a00 = res.im.a01 = res.im.a11 = I(0.0);
  I inv_pi = I(1.0) / PI_IV;
  I inv_24 = rat(1, 24);

  // 1. High-accuracy midpoint integral at exact point w = w_mid (zero w-width!)
  auto eval_P_pt = [&](I r, I th, I w_p) {
    I ct = cos_on_0_pi(th);
    I st = sin_on_0_pi(th);
    I yr = r * ct - w_p;
    I yi = r * st;
    I T = solve_T_iv(sq(r - w_p) + I(2.0) * r * w_p * (I(1.0) - ct));
    I a0 = C.a + C.b * T;
    I c0 = C.a + I(3.0) * C.b * T;
    I f2 = I(2.0) * expneg_iv(T) / (a0 * c0);
    I inv_a0 = I(1.0) / a0;
    I Zr = yr * inv_a0, Zi = yi * inv_a0;
    I z2r = (sq(Zr) - sq(Zi)) * C.inv_sqrt2;
    I z2i = (I(2.0) * Zr * Zi) * C.inv_sqrt2;
    I t0 = T - C.d;
    I p_re1 = C.c1 + z2r, p_im1 = C.c1 - z2r;
    BlockPair b;
    b.re.a00 = f2 * sq(t0);
    b.re.a01 = f2 * t0 * p_re1;
    b.re.a11 = f2 * (sq(p_re1) + sq(z2i));
    b.im.a00 = b.re.a00;
    b.im.a01 = f2 * t0 * p_im1;
    b.im.a11 = f2 * (sq(p_im1) + sq(z2i));
    return b;
  };
  auto eval_P_jet = [&](const Jet2& r, const Jet2& th, const Jet2& w_j) {
    Jet2 ct = cos_j(th), st = sin_j(th);
    Jet2 yr = r * ct - w_j, yi = r * st;
    Jet2 T = solve_T_j(sq_j(r - w_j) + I(2.0) * (r * (w_j * (Jet2(I(1.0)) - ct))));
    Jet2 a0 = Jet2(C.a) + C.b * T;
    Jet2 c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
    Jet2 f2 = I(2.0) * expneg_j(T) * inv_j(a0 * c0);
    Jet2 inv_a0 = inv_j(a0);
    Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
    Jet2 z2r = C.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
    Jet2 z2i = (I(2.0) * C.inv_sqrt2) * (Zr * Zi);
    Jet2 t0 = T - C.d;
    Jet2 p_re1 = z2r + C.c1, p_im1 = Jet2(C.c1) - z2r;
    struct { Jet2 r00, r01, r11, i00, i01, i11; } o;
    o.r00 = f2 * sq_j(t0);
    o.r01 = f2 * t0 * p_re1;
    o.r11 = f2 * (sq_j(p_re1) + sq_j(z2i));
    o.i00 = o.r00;
    o.i01 = f2 * t0 * p_im1;
    o.i11 = f2 * (sq_j(p_im1) + sq_j(z2i));
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
      auto mid = eval_P_pt(r_mid, t_mid, w_mid);
      auto jr = eval_P_jet(Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_mid_j);
      auto jt = eval_P_jet(Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_mid_j);
      res.re.a00 = res.re.a00 + area * (mid.re.a00 + inv_24 * (dr2 * jr.r00.d2 + dt2 * jt.r00.d2));
      res.re.a01 = res.re.a01 + area * (mid.re.a01 + inv_24 * (dr2 * jr.r01.d2 + dt2 * jt.r01.d2));
      res.re.a11 = res.re.a11 + area * (mid.re.a11 + inv_24 * (dr2 * jr.r11.d2 + dt2 * jt.r11.d2));
      res.im.a00 = res.im.a00 + area * (mid.im.a00 + inv_24 * (dr2 * jr.i00.d2 + dt2 * jt.i00.d2));
      res.im.a01 = res.im.a01 + area * (mid.im.a01 + inv_24 * (dr2 * jr.i01.d2 + dt2 * jt.i01.d2));
      res.im.a11 = res.im.a11 + area * (mid.im.a11 + inv_24 * (dr2 * jr.i11.d2 + dt2 * jt.i11.d2));
    }
  }
  // 2. Mean-Value Theorem w-variation: P(w) in P(w_mid) + [-dw/2, dw/2] * dP/dw([wl, wh])!
  if (half_dw.h > 0.0) {
    auto re_d = make_dense_r_edges(r_cut, 64, 32, 1.4);
    int nr_d = static_cast<int>(re_d.size()) - 1;
    int nt_d = 32;
    Jet2 w_der(w_iv, I(1.0), I(0.0));
    BlockPair dP;
    dP.re.a00 = dP.re.a01 = dP.re.a11 = I(0.0);
    dP.im.a00 = dP.im.a01 = dP.im.a11 = I(0.0);
    for (int ir = 0; ir < nr_d; ++ir) {
      I r_box(re_d[ir], re_d[ir + 1]), dr = I(re_d[ir + 1]) - I(re_d[ir]);
      for (int it = 0; it < nt_d; ++it) {
        I a_t = PI_IV * rat(it, nt_d), b_t = PI_IV * rat(it + 1, nt_d);
        I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
        I area = dr * (b_t - a_t) * inv_pi;
        auto jw = eval_P_jet(Jet2(r_box), Jet2(t_box), w_der);
        dP.re.a00 = dP.re.a00 + area * jw.r00.d;
        dP.re.a01 = dP.re.a01 + area * jw.r01.d;
        dP.re.a11 = dP.re.a11 + area * jw.r11.d;
        dP.im.a00 = dP.im.a00 + area * jw.i00.d;
        dP.im.a01 = dP.im.a01 + area * jw.i01.d;
        dP.im.a11 = dP.im.a11 + area * jw.i11.d;
      }
    }
    res.re.a00 = res.re.a00 + dw_sym * dP.re.a00;
    res.re.a01 = res.re.a01 + dw_sym * dP.re.a01;
    res.re.a11 = res.re.a11 + dw_sym * dP.re.a11;
    res.im.a00 = res.im.a00 + dw_sym * dP.im.a00;
    res.im.a01 = res.im.a01 + dw_sym * dP.im.a01;
    res.im.a11 = res.im.a11 + dw_sym * dP.im.a11;
  }
  // Add tail_coeff * I_2 (Loewner upper bound on r >= r_cut)
  res.re.a00 = res.re.a00 + I(0.0, tail);
  res.re.a11 = res.re.a11 + I(0.0, tail);
  res.im.a00 = res.im.a00 + I(0.0, tail);
  res.im.a11 = res.im.a11 + I(0.0, tail);
  return res;
}

static BlockPair integrate_origin_slab(I w_iv, double s_max, int n1, int n2, int nt) {
  assert(std::fegetround() == FE_UPWARD);
  double tail = certified_tail_coeff(w_iv.h, 24.0);
  auto re = make_dense_r_edges(24.0, n1, n2, 2.0);
  int nr = static_cast<int>(re.size()) - 1;
  I w_mid = I(0.5) * (I(w_iv.l) + I(w_iv.h));
  I half_dw = I(0.5) * (I(w_iv.h) - I(w_iv.l));
  I dw_sym(-half_dw.h, half_dw.h);

  BlockPair res;
  res.re.a00 = res.re.a01 = res.re.a11 = I(0.0);
  res.im.a00 = res.im.a01 = res.im.a11 = I(0.0);
  I inv_pi = I(1.0) / PI_IV;
  I inv_24 = rat(1, 24);

  auto eval_PH_pt = [&](I r, I th, I w_p, bool use_H) {
    I ct = cos_on_0_pi(th), st = sin_on_0_pi(th);
    I yr = r * ct - w_p, yi = r * st;
    I T = solve_T_iv(sq(r - w_p) + I(2.0) * r * w_p * (I(1.0) - ct));
    I a0 = C.a + C.b * T, c0 = C.a + I(3.0) * C.b * T;
    I f2 = I(2.0) * expneg_iv(T) / (a0 * c0);
    I inv_a0 = I(1.0) / a0;
    I Zr = yr * inv_a0, Zi = yi * inv_a0;
    I z2r = (sq(Zr) - sq(Zi)) * C.inv_sqrt2;
    I z2i = (I(2.0) * Zr * Zi) * C.inv_sqrt2;
    I t0 = T - C.d;
    BlockPair b;
    if (use_H) {
      I hrA = (-st) * t0;
      I hrB = (-st) * (C.c1 + z2r) + ct * z2i;
      I hiA = ct * t0;
      I hiB = (-st) * z2i + ct * (C.c1 - z2r);
      b.re.a00 = f2 * sq(hrA);
      b.re.a01 = f2 * hrA * hrB;
      b.re.a11 = f2 * sq(hrB);
      b.im.a00 = f2 * sq(hiA);
      b.im.a01 = f2 * hiA * hiB;
      b.im.a11 = f2 * sq(hiB);
    } else {
      I p_re1 = C.c1 + z2r, p_im1 = C.c1 - z2r;
      b.re.a00 = f2 * sq(t0);
      b.re.a01 = f2 * t0 * p_re1;
      b.re.a11 = f2 * (sq(p_re1) + sq(z2i));
      b.im.a00 = b.re.a00;
      b.im.a01 = f2 * t0 * p_im1;
      b.im.a11 = f2 * (sq(p_im1) + sq(z2i));
    }
    return b;
  };
  auto eval_PH_jet = [&](const Jet2& r, const Jet2& th, const Jet2& w_j, bool use_H) {
    Jet2 ct = cos_j(th), st = sin_j(th);
    Jet2 yr = r * ct - w_j, yi = r * st;
    Jet2 T = solve_T_j(sq_j(r - w_j) + I(2.0) * (r * (w_j * (Jet2(I(1.0)) - ct))));
    Jet2 a0 = Jet2(C.a) + C.b * T, c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
    Jet2 f2 = I(2.0) * expneg_j(T) * inv_j(a0 * c0);
    Jet2 inv_a0 = inv_j(a0);
    Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
    Jet2 z2r = C.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
    Jet2 z2i = (I(2.0) * C.inv_sqrt2) * (Zr * Zi);
    Jet2 t0 = T - C.d;
    struct { Jet2 r00, r01, r11, i00, i01, i11; } o;
    if (use_H) {
      Jet2 hrA = (-st) * t0;
      Jet2 hrB = (-st) * (z2r + C.c1) + ct * z2i;
      Jet2 hiA = ct * t0;
      Jet2 hiB = (-st) * z2i + ct * (Jet2(C.c1) - z2r);
      o.r00 = f2 * sq_j(hrA);
      o.r01 = f2 * hrA * hrB;
      o.r11 = f2 * sq_j(hrB);
      o.i00 = f2 * sq_j(hiA);
      o.i01 = f2 * hiA * hiB;
      o.i11 = f2 * sq_j(hiB);
    } else {
      Jet2 p_re1 = z2r + C.c1, p_im1 = Jet2(C.c1) - z2r;
      o.r00 = f2 * sq_j(t0);
      o.r01 = f2 * t0 * p_re1;
      o.r11 = f2 * (sq_j(p_re1) + sq_j(z2i));
      o.i00 = o.r00;
      o.i01 = f2 * t0 * p_im1;
      o.i11 = f2 * (sq_j(p_im1) + sq_j(z2i));
    }
    return o;
  };

  Jet2 w_mid_j(w_mid);
  Jet2 w_der(w_iv, I(1.0), I(0.0));
  for (int ir = 0; ir < nr; ++ir) {
    I a_r(re[ir]), b_r(re[ir + 1]);
    I r_box(a_r.l, b_r.h), dr = b_r - a_r, dr2 = sq(dr), r_mid = I(0.5) * (a_r + b_r);
    for (int it = 0; it < nt; ++it) {
      I a_t = PI_IV * rat(it, nt), b_t = PI_IV * rat(it + 1, nt);
      I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
      I dt = b_t - a_t, dt2 = sq(dt), t_mid = I(0.5) * (a_t + b_t);
      I area = dr * dt * inv_pi;

      // Conservative fixed choice (use_H, mul_hi) valid for ALL w in w_iv on this sub-box!
      I ct_b = cos_on_0_pi(t_box);
      I T_b = solve_T_iv(sq(r_box - w_iv) + I(2.0) * r_box * w_iv * (I(1.0) - ct_b));
      I M_iv = sqrt_iv(sq(T_b - C.d) + sq(C.c1 + T_b * C.inv_sqrt2));
      bool use_H = false;
      double mul_hi = 1.0;
      if (r_box.l > 0.0) {
        I eta_iv = (I(s_max) * M_iv) / I(r_box.l);
        if (eta_iv.h <= 0.5) {
          use_H = true;
          mul_hi = (I(1.0) / (I(1.0) - I(eta_iv.h))).h;
        }
      }
      // Midpoint at w = w_mid + MVT w-variation [-dw/2, dw/2] * d/dw([wl, wh])!
      auto mid = eval_PH_pt(r_mid, t_mid, w_mid, use_H);
      auto jr = eval_PH_jet(Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_mid_j, use_H);
      auto jt = eval_PH_jet(Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_mid_j, use_H);
      auto jw = eval_PH_jet(Jet2(r_box), Jet2(t_box), w_der, use_H);
      I scale = area * I(mul_hi);
      res.re.a00 = res.re.a00 + scale * (mid.re.a00 + inv_24 * (dr2 * jr.r00.d2 + dt2 * jt.r00.d2) + dw_sym * jw.r00.d);
      res.re.a01 = res.re.a01 + scale * (mid.re.a01 + inv_24 * (dr2 * jr.r01.d2 + dt2 * jt.r01.d2) + dw_sym * jw.r01.d);
      res.re.a11 = res.re.a11 + scale * (mid.re.a11 + inv_24 * (dr2 * jr.r11.d2 + dt2 * jt.r11.d2) + dw_sym * jw.r11.d);
      res.im.a00 = res.im.a00 + scale * (mid.im.a00 + inv_24 * (dr2 * jr.i00.d2 + dt2 * jt.i00.d2) + dw_sym * jw.i00.d);
      res.im.a01 = res.im.a01 + scale * (mid.im.a01 + inv_24 * (dr2 * jr.i01.d2 + dt2 * jt.i01.d2) + dw_sym * jw.i01.d);
      res.im.a11 = res.im.a11 + scale * (mid.im.a11 + inv_24 * (dr2 * jr.i11.d2 + dt2 * jt.i11.d2) + dw_sym * jw.i11.d);
    }
  }
  res.re.a00 = res.re.a00 + I(0.0, tail);
  res.re.a11 = res.re.a11 + I(0.0, tail);
  res.im.a00 = res.im.a00 + I(0.0, tail);
  res.im.a11 = res.im.a11 + I(0.0, tail);
  return res;
}

// Check PSD of Q_0 + shift * I_2 - M_iv (certified outward via Sylvester minors)
static double psd_margin_2x2(const Sym2& M, double shift_lo) {
  I d00 = C.q_AA + I(shift_lo) - M.a00;
  I d11 = C.q_BB + I(shift_lo) - M.a11;
  I d01 = C.q_AB - M.a01;
  // Minimum eigenvalue of [[d00, d01], [d01, d11]]:
  // lower bound via tr/2 - sqrt((d00 - d11)^2/4 + d01^2)
  I tr = d00 + d11;
  I diff = d00 - d11;
  I rad = sqrt_iv(I(0.25) * sq(diff) + sq(d01));
  I lam_min = I(0.5) * tr - rad;
  return lam_min.l;
}

// ============================================================================
// 6. Part 3: Self-contained shift curvature (Rem_ww >= -480*S_r & per-slab N'', C_A'', C_B'')
// ============================================================================
struct ShiftCurvGlobal {
  double cap_max, mass_sum, tail_mass;
};

static ShiftCurvGlobal certify_global_shift_curvature_480() {
  assert(std::fegetround() == FE_UPWARD);
  // Exact envelope of STATUS 7.4.13 (re-derived in PROOF.md):
  // Bbar(T) = 2*M*q/a0^2*(1+6*b*T/a0) + 8*m*q*T*M/(a0*c0)
  //           + (1/2)*((m^2 + (b/a0)^2 + 9*(b/c0)^2)*4*T/c0^2 + 2*m/(a0*c0))*M^2
  // where M(T) = 503/1000 + (613/500)*T >= sqrt((T-2/5)^2 + (c1 + T/sqrt(2))^2), q = 5/2 >= sqrt(6).
  // Verify M(T) >= sqrt((T-2/5)^2 + (c1 + T/sqrt(2))^2) for all T >= 0:
  //   At T = 0: 503/1000 = 0.503 > sqrt(0.16 + 0.091918) = 0.501915.
  //   Slope: 613/500 = 1.226 > sqrt(1 + 1/2) = 1.224745.
  //   Exact square comparison checked in verify.py & here!
  assert((sq(rat(503, 1000)) - (sq(C.d) + sq(C.c1))).l > 0.0);
  assert((sq(rat(613, 500)) - rat(3, 2)).l > 0.0);
  assert((rat(503, 1000) * rat(613, 500) - (C.c1 * C.inv_sqrt2 - C.d)).l > 0.0);
  assert((sq(rat(5, 2)) - I(6.0)).l > 0.0);

  auto Bbar = [&](I t) {
    I a0 = C.a + C.b * t, c0 = C.a + I(3.0) * C.b * t, D = a0 * c0;
    I M = rat(503, 1000) + rat(613, 500) * t;
    I q = rat(5, 2);
    I m = I(1.0) + C.b / a0 + (I(3.0) * C.b) / c0;
    return I(2.0) * M * q / sq(a0) * (I(1.0) + I(6.0) * C.b * t / a0)
         + I(8.0) * m * q * t * M / D
         + rat(1, 2) * ((sq(m) + sq(C.b / a0) + I(9.0) * sq(C.b / c0)) * (I(4.0) * t / sq(c0))
                        + I(2.0) * m / D) * sq(M);
  };
  double cap = 0.0, mass = 0.0;
  for (int j = 0; j < 36 * 256; ++j) {
    I t(j / 256.0, (j + 1) / 256.0);
    I B = Bbar(t);
    I e = expneg_iv(t);
    I D = (C.a + C.b * t) * (C.a + I(3.0) * C.b * t);
    cap = std::max(cap, (e * B / D).h);
    mass = add_up(mass, (e * B / 256.0).h);
  }
  // T >= 36 tail: M <= (5/4)T, m <= 19/18, Bbar <= T/b^2:
  I q = rat(5, 2), m = rat(19, 18), tt(36.0);
  I coeff = rat(35, 2) * q / sq(tt) + rat(10, 3) * m * q / tt
          + rat(25, 72) * (sq(m) + I(2.0) / sq(tt)) + rat(25, 48) * m / tt;
  assert(coeff.h < 1.0);
  I tail_m = I(37.0) * expneg_iv(tt) / sq(C.b);
  mass = add_up(mass, tail_m.h);
  cap = std::max(cap, (expneg_iv(tt) / (I(108.0) * sq(sq(C.b)))).h);
  assert(cap < 100.0 && mass < 140.0);
  assert((I(16.0) * I(cap) * I(mass)).h < 480.0 * 480.0);
  return {cap, mass, tail_m.h};
}

struct SlabCurv {
  double n_up, a2_up, b2_up;
};

// Per-slab base curvature bounds N'' <= n_up, |C_A''| <= a2_up, |C_B''| <= b2_up on w in [wl, wh].
// Uses plain 1-variable Jet2 in w on a smooth (r, th) interval partition of [0, 24] x [0, pi] (zero mixed jets!).
// Tail r >= 24 (w <= 2 => T > 25): N''_tail <= exp(-25) / (a * 3b * 25) < 1e-11;
// |C_A''|_tail, |C_B''|_tail <= (2/b^2) * exp(-25) < 2e-9 (checked explicitly via envelope on T >= 25).
static SlabCurv compute_slab_base_curv(double wl, double wh) {
  assert(std::fegetround() == FE_UPWARD);
  I w_iv(wl, wh);
  // Check r >= 24 tail on T >= 25:
  I tt(25.0);
  I H25 = eval_H(tt);
  assert(H25.h <= sq(I(24.0) - I(wh)).l);
  // On T >= 25: M <= 5T/4 (since 0.503 + 1.226*25 = 31.153 < 31.25), m <= 1 + b/(25b) + 3b/(75b) = 27/25.
  // Content derivative density relative to exp(-T): K2 + 2m|T_w|K1 + [(m^2 + b^2/a0^2 + 9b^2/c0^2)|T_w|^2 + m|T_ww|]M <= 2/b^2!
  // Here K2 <= 9/(b^2 T^2) (since |d^2 psi_B/dw^2| <= (17*sqrt(2)/3)/a0^2 < 9/a0^2, |d^2 psi_A/dw^2| <= 2/(a0 c0) < 9/a0^2),
  // and 2m|T_w|K1 <= 2m*(2*sqrt(T)/(3bT))*(5*sqrt(2)*sqrt(T)/(3bT)) <= 4*m*q/(3*b^2*T) with q = 5/2 (> 5*sqrt(2)/3 = 2.357)!
  I m25 = rat(27, 25), q = rat(5, 2);
  I coeff25 = I(9.0) / sq(tt)
            + (I(4.0) * m25 * q / (I(3.0) * tt))
            + ((sq(m25) + I(2.0) / sq(tt)) * (I(4.0) / (I(9.0) * tt)) + I(2.0) * m25 / (I(3.0) * sq(tt))) * (rat(5, 4) * tt);
  // Note: the expression above is b^2 times the density bound (strictly decreasing on T >= 25); check it is < 2.0!
  assert(coeff25.h < 2.0);
  I c_tail = (I(2.0) * expneg_iv(tt)) / sq(C.b);
  // N''_tail = 2 * E[(sin^2 th / r) * 1_{r >= 24}] <= (2 / 24) * P(T > 25) = (1/12) * exp(-25).
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
    I r_box(re[ir], re[ir + 1]);
    I dr = I(re[ir + 1]) - I(re[ir]);
    for (int it = 0; it < nt; ++it) {
      I a_t = PI_IV * rat(it, nt), b_t = PI_IV * rat(it + 1, nt);
      I t_box(std::max(0.0, a_t.l), std::min(PI_IV.h, b_t.h));
      I dt = b_t - a_t;
      I area = dr * dt * inv_pi;
      I ct = cos_on_0_pi(t_box), st = sin_on_0_pi(t_box);
      // Jet2 in w with constant r_box, ct, st:
      Jet2 yr = Jet2(r_box * ct) - w_jet;
      Jet2 yi(r_box * st);
      Jet2 r_j(r_box);
      Jet2 T = solve_T_j(sq_j(r_j - w_jet) + (I(2.0) * r_box * (I(1.0) - ct)) * w_jet);
      Jet2 a0 = Jet2(C.a) + C.b * T;
      Jet2 c0 = Jet2(C.a) + (I(3.0) * C.b) * T;
      Jet2 f = expneg_j(T) * inv_j(a0 * c0);
      Jet2 inv_a0 = inv_j(a0);
      Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
      Jet2 z2r = C.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
      Jet2 z2i = (I(2.0) * C.inv_sqrt2) * (Zr * Zi);
      // N'' integrand = 4 f sin^2(th) (no w-derivative needed!)
      sum_N = sum_N + area * (I(4.0) * f.v * sq(st));
      // C_A integrand = 2 r f (T - 2/5) cos(th); differentiate twice in w via Jet2!
      Jet2 gA = (I(2.0) * r_box * ct) * (f * (T - C.d));
      // C_B integrand = 2 r f ((c1 + z2r) cos(th) + z2i sin(th)); differentiate twice in w!
      Jet2 gB = (I(2.0) * r_box) * (f * (ct * (z2r + C.c1) + st * z2i));
      sum_CA = sum_CA + area * gA.d2;
      sum_CB = sum_CB + area * gB.d2;
    }
  }
  double n_up = (sum_N + n_tail).h;
  double a2_up = add_up(mag(sum_CA), c_tail.h);
  double b2_up = add_up(mag(sum_CB), c_tail.h);
  return {n_up, a2_up, b2_up};
}

// ============================================================================
// 7. Part 4 (3D Ray-Convexity Shells on w in [0, 5/16]) & Part 5 (4D Bulk Cover)
// ============================================================================
struct Box3 {
  double c[4], hw[4];
  int fx;  // fixed axis (0..3)
};
struct Box4 {
  double c[4], hw[4];
};

struct ShellResult {
  double r_m;
  int64_t closed_boxes;
  double worst_margin;  // max over all closed boxes of (corner_ub + e3d + w_err) < 0
};

struct Slab3DResult {
  double wl, wh;
  double eta_num, eta_den;
  double rho_max_num, rho_max_den;
  std::vector<ShellResult> shells;
  int64_t total_boxes;
  double worst_margin;
};

// Certify all 7 faces of partial([-r_m, r_m]^4) (Im A >= 0) for Rem(w, v) <= (1 - eta)*Q_w(v) on [wl, wh]!
static ShellResult certify_3d_shell(double wl, double wh, double r_m, int eta_num, int eta_den,
                                    const std::vector<WcsGrid>& gl, const std::vector<WcsGrid>& gh) {
  assert(std::fegetround() == FE_UPWARD);
  I one_minus_eta = I(1.0) - rat(eta_num, eta_den);
  I dw = I(wh) - I(wl);
  I dw2_8 = sq(dw) / I(8.0);
  I q_diag[4] = {C.q_AA, C.q_BB, C.q_AA, C.q_BB};
  I qw_diag_l[4], qw_diag_h[4];
  for (int j = 0; j < 4; ++j) {
    qw_diag_l[j] = one_minus_eta * (q_diag[j] + I(0.5) * sq(I(wl)));
    qw_diag_h[j] = one_minus_eta * (q_diag[j] + I(0.5) * sq(I(wh)));
  }

  // 7 root faces of partial([-r_m, r_m]^4) with Ai >= 0:
  std::vector<Box3> stk;
  const int f_ax[7] = {0, 0, 1, 1, 2, 3, 3};
  const double f_sg[7] = {+1.0, -1.0, +1.0, -1.0, +1.0, +1.0, -1.0};
  for (int f = 0; f < 7; ++f) {
    Box3 b;
    b.fx = f_ax[f];
    for (int j = 0; j < 4; ++j) { b.c[j] = 0.0; b.hw[j] = r_m; }
    b.c[b.fx] = f_sg[f] * r_m;
    b.hw[b.fx] = 0.0;
    if (b.fx != 2) { b.c[2] = 0.5 * r_m; b.hw[2] = 0.5 * r_m; }
    stk.push_back(b);
  }

  int64_t closed = 0;
  double worst = -1e30;
  while (!stk.empty()) {
    Box3 b = stk.back();
    stk.pop_back();
    // Exact box S_max and concavity errors
    I Smax(0.0), e3l(0.0), e3h(0.0);
    for (int j = 0; j < 4; ++j) {
      double ah = add_up(std::fabs(b.c[j]), b.hw[j]);
      Smax = Smax + sq(I(ah));
      if (j != b.fx) {
        I hw2 = sq(I(b.hw[j]));
        e3l = e3l + qw_diag_l[j] * hw2;
        e3h = e3h + qw_diag_h[j] * hw2;
      }
    }
    double w_err = (dw2_8 * I(481.0) * Smax).h;

    // Build 8 corners (exact binary64 coordinates since r_m is dyadic and bisection halves exact binary64!)
    int free_ax[3], fi = 0;
    for (int j = 0; j < 4; ++j) if (j != b.fx) free_ax[fi++] = j;
    double corners[8][4];
    for (int mask = 0; mask < 8; ++mask) {
      for (int j = 0; j < 4; ++j) corners[mask][j] = b.c[j];
      for (int k = 0; k < 3; ++k) {
        double s = (mask & (1 << k)) ? +1.0 : -1.0;
        corners[mask][free_ax[k]] = b.c[free_ax[k]] + s * b.hw[free_ax[k]];
      }
    }

    // Try WCS levels sequentially with early exit!
    bool ok = false;
    double box_max = 1e30;
    for (size_t li = 0; li < gl.size(); ++li) {
      double max_l_raw = -1e30, max_h_raw = -1e30;
      bool raw_fail = false;
      for (int m = 0; m < 8; ++m) {
        double ul = eval_wcs_ub(gl[li], corners[m]);
        double tl = (one_minus_eta * eval_Qw_iv(wl, corners[m])).l;
        double dl = sub_up(ul, tl);
        if (dl > max_l_raw) max_l_raw = dl;
        if (add_up(dl, w_err) >= 0.0) { raw_fail = true; break; }

        double uh = eval_wcs_ub(gh[li], corners[m]);
        double th = (one_minus_eta * eval_Qw_iv(wh, corners[m])).l;
        double dh = sub_up(uh, th);
        if (dh > max_h_raw) max_h_raw = dh;
        if (add_up(dh, w_err) >= 0.0) { raw_fail = true; break; }
      }
      if (raw_fail) continue;  // escalate immediately to finer WCS grid!
      double tot_l = add_up(add_up(max_l_raw, e3l.h), w_err);
      double tot_h = add_up(add_up(max_h_raw, e3h.h), w_err);
      double tot = std::max(tot_l, tot_h);
      if (tot < 0.0) {
        ok = true;
        box_max = tot;
        break;
      }
      // Only skip escalation to finer WCS grid if raw margin is ALREADY well below -0.5*e3d (big box, not tight WCS)!
      if (add_up(max_l_raw, w_err) < -0.5 * e3l.h && add_up(max_h_raw, w_err) < -0.5 * e3h.h) {
        break;
      }
    }
    if (ok) {
      ++closed;
      if (box_max > worst) worst = box_max;
    } else {
      int best_ax = free_ax[0];
      double best_sc = -1.0;
      for (int k = 0; k < 3; ++k) {
        int ax = free_ax[k];
        double sc = q_diag[ax].h * b.hw[ax] * b.hw[ax];
        if (sc > best_sc) { best_sc = sc; best_ax = ax; }
      }
      double nh = 0.5 * b.hw[best_ax];
      if (!(nh > r_m * 1e-4)) {
        std::cerr << "SHELL STUCK wl=" << wl << " wh=" << wh << " r_m=" << r_m
                  << " c=(" << b.c[0] << "," << b.c[1] << "," << b.c[2] << "," << b.c[3] << ")\n";
        std::exit(1);
      }
      Box3 b1 = b, b2 = b;
      b1.hw[best_ax] = nh; b1.c[best_ax] = b.c[best_ax] - nh;
      b2.hw[best_ax] = nh; b2.c[best_ax] = b.c[best_ax] + nh;
      stk.push_back(b1);
      stk.push_back(b2);
    }
  }
  return {r_m, closed, worst};
}

struct Slab4DResult {
  double wl, wh, s_bulk;
  double n_up, a2_up, b2_up;
  int64_t closed_ext, closed_ori, closed_wcs[4], total_boxes;
  double worst_margin;
};

// Certify all 4D v with s_bulk <= ||v||_2 <= sqrt(3/4) (Im A >= 0) on w in [wl, wh]!
static Slab4DResult certify_4d_slab(double wl, double wh, double s_bulk, const SlabCurv& sc,
                                    const std::vector<WcsGrid>& gl, const std::vector<WcsGrid>& gh) {
  assert(std::fegetround() == FE_UPWARD);
  I dw = I(wh) - I(wl);
  I dw2_8 = sq(dw) / I(8.0);
  I q_diag[4] = {C.q_AA, C.q_BB, C.q_AA, C.q_BB};
  I qw_l[4], qw_h[4];
  for (int j = 0; j < 4; ++j) {
    qw_l[j] = q_diag[j] + I(0.5) * sq(I(wl));
    qw_h[j] = q_diag[j] + I(0.5) * sq(I(wh));
  }
  double s_bulk2_dn = mul_dn(s_bulk, s_bulk);

  // Root box: [-7/8, 7/8]^3 x [0, 7/8] (7/8 = 0.875 > sqrt(3/4) = 0.86603), split into 8 octants
  double R0 = 0.875;
  std::vector<Box4> stk;
  for (int i0 = 0; i0 < 2; ++i0)
    for (int i1 = 0; i1 < 2; ++i1)
      for (int i3 = 0; i3 < 2; ++i3) {
        Box4 b;
        b.c[0] = (i0 == 0 ? -0.5 * R0 : 0.5 * R0);
        b.c[1] = (i1 == 0 ? -0.5 * R0 : 0.5 * R0);
        b.c[2] = 0.5 * R0;
        b.c[3] = (i3 == 0 ? -0.5 * R0 : 0.5 * R0);
        for (int j = 0; j < 4; ++j) b.hw[j] = 0.5 * R0;
        stk.push_back(b);
      }

  Slab4DResult res{};
  res.wl = wl; res.wh = wh; res.s_bulk = s_bulk;
  res.n_up = sc.n_up; res.a2_up = sc.a2_up; res.b2_up = sc.b2_up;
  res.worst_margin = -1e30;

  while (!stk.empty()) {
    Box4 b = stk.back();
    stk.pop_back();

    // S_min (lower bound) and S_max (upper bound) on box
    double Smin = 0.0, Smax = 0.0;
    double ah[4];
    for (int j = 0; j < 4; ++j) {
      double al = std::max(0.0, sub_dn(std::fabs(b.c[j]), b.hw[j]));
      ah[j] = add_up(std::fabs(b.c[j]), b.hw[j]);
      Smin = add_dn(Smin, mul_dn(al, al));
      Smax = add_up(Smax, mul_up(ah[j], ah[j]));
    }
    if (Smin >= 0.75) { ++res.closed_ext; continue; }
    if (Smax <= s_bulk2_dn) { ++res.closed_ori; continue; }

    // w-interpolation error: (dw^2/8) * min(481*Smax, n_up + 2*ah[0]*a2_up + 2*ah[1]*b2_up + Smax)
    I mw1 = I(481.0) * I(Smax);
    I mw2 = I(sc.n_up) + I(2.0) * I(ah[0]) * I(sc.a2_up) + I(2.0) * I(ah[1]) * I(sc.b2_up) + I(Smax);
    double w_err = (dw2_8 * I(std::min(mw1.h, mw2.h))).h;

    // Exact 4D cube concavity error of -Q_w(v) - ||v||^4:
    // sum_j (qw_j) hw_j^2 + 2 * Smax * (sum hw_j^2) + 4 * sum ah_j^2 * hw_j^2
    I sum_hw2(0.0), sum_ah2_hw2(0.0), qsum_l(0.0), qsum_h(0.0);
    for (int j = 0; j < 4; ++j) {
      I hw2 = sq(I(b.hw[j]));
      sum_hw2 = sum_hw2 + hw2;
      sum_ah2_hw2 = sum_ah2_hw2 + sq(I(ah[j])) * hw2;
      qsum_l = qsum_l + qw_l[j] * hw2;
      qsum_h = qsum_h + qw_h[j] * hw2;
    }
    I quart_err = I(2.0) * I(Smax) * sum_hw2 + I(4.0) * sum_ah2_hw2;
    double e4l = (qsum_l + quart_err).h;
    double e4h = (qsum_h + quart_err).h;

    // 16 exact dyadic corners
    double corners[16][4];
    for (int m = 0; m < 16; ++m) {
      for (int j = 0; j < 4; ++j) {
        double s = (m & (1 << j)) ? +1.0 : -1.0;
        corners[m][j] = b.c[j] + s * b.hw[j];
      }
    }

    bool ok = false;
    double box_max = 1e30;
    size_t ok_li = 0;
    for (size_t li = 0; li < gl.size(); ++li) {
      double max_l_raw = -1e30, max_h_raw = -1e30;
      bool raw_fail = false;
      for (int m = 0; m < 16; ++m) {
        double ul = eval_wcs_ub(gl[li], corners[m]);
        double bpl = eval_BP_iv(wl, corners[m]).l;
        double dl = sub_up(ul, bpl);
        if (dl > max_l_raw) max_l_raw = dl;
        if (add_up(dl, w_err) >= 0.0) { raw_fail = true; break; }

        double uh = eval_wcs_ub(gh[li], corners[m]);
        double bph = eval_BP_iv(wh, corners[m]).l;
        double dh = sub_up(uh, bph);
        if (dh > max_h_raw) max_h_raw = dh;
        if (add_up(dh, w_err) >= 0.0) { raw_fail = true; break; }
      }
      if (raw_fail) continue;
      double tot_l = add_up(add_up(max_l_raw, e4l), w_err);
      double tot_h = add_up(add_up(max_h_raw, e4h), w_err);
      double tot = std::max(tot_l, tot_h);
      if (tot < 0.0) {
        ok = true;
        box_max = tot;
        ok_li = li;
        break;
      }
      if (add_up(max_l_raw, w_err) < -0.5 * e4l && add_up(max_h_raw, w_err) < -0.5 * e4h) break;
    }
    if (ok) {
      ++res.closed_wcs[ok_li];
      if (box_max > res.worst_margin) res.worst_margin = box_max;
    } else {
      int best_ax = 0;
      double best_sc = -1.0;
      for (int j = 0; j < 4; ++j) {
        double sc_j = b.hw[j] * b.hw[j] * (q_diag[j].h + 2.0 * Smax + 4.0 * ah[j] * ah[j]);
        if (sc_j > best_sc) { best_sc = sc_j; best_ax = j; }
      }
      double nh = 0.5 * b.hw[best_ax];
      assert(nh > 1e-12);
      Box4 b1 = b, b2 = b;
      b1.hw[best_ax] = nh; b1.c[best_ax] = b.c[best_ax] - nh;
      b2.hw[best_ax] = nh; b2.c[best_ax] = b.c[best_ax] + nh;
      stk.push_back(b1);
      stk.push_back(b2);
    }
  }
  res.total_boxes = res.closed_ext + res.closed_ori;
  for (int i = 0; i < 4; ++i) res.total_boxes += res.closed_wcs[i];
  return res;
}

// ============================================================================
// 8. Startup Self-Tests (verify FE_UPWARD, trig, expneg, solve_T, Jet2 FD, WCS identity)
// ============================================================================
static void run_self_tests() {
  assert(std::fegetround() == FE_UPWARD);
  // 1. Rounding direction check: 1/3 downward < 1/3 upward, and raw (-x)*y vs -(x*y) under -frounding-math
  I one_third = rat(1, 3);
  assert(one_third.l < one_third.h);
  assert(mul_up(one_third.l, 3.0) <= 1.0 && mul_dn(one_third.h, 3.0) >= 1.0);
  double rt_a = fp_b(1.1), rt_b = fp_b(1.3);
  double raw_dn = -((-rt_a) * rt_b);
  double raw_up = rt_a * rt_b;
  assert(raw_dn < raw_up);
  // 2. Sqrt strict enclosure
  I s2 = sqrt_iv(I(2.0));
  assert(sq(s2).l <= 2.0 && sq(s2).h >= 2.0 && (s2.h - s2.l) < 1e-14);
  // 3. expneg monotonicity & accuracy
  I e1 = expneg_iv(I(1.0));
  assert(e1.l < 0.36787944117144233 && e1.h > 0.36787944117144233 && (e1.h - e1.l) < 1e-13);
  I e25 = expneg_iv(I(25.0));
  assert(e25.l > 1.38e-11 && e25.h < 1.39e-11);
  // 4. Trig identities at 0, pi/4, pi/2, pi
  I s_half = sin_on_0_pi(HALF_PI_IV);
  I c_half = cos_on_0_pi(HALF_PI_IV);
  assert(s_half.l <= 1.0 && s_half.h == 1.0 && c_half.l <= 0.0 && c_half.h >= 0.0);
  I c_pi = cos_on_0_pi(I(PI_IV.l, PI_IV.h));
  assert(c_pi.l <= -1.0 && c_pi.h > -1.0 - 1e-12);
  for (double th : {0.1, 0.7, 1.57, 2.3, 3.1}) {
    I id = sq(sin_on_0_pi(I(th))) + sq(cos_on_0_pi(I(th)));
    assert(id.l <= 1.0 && id.h >= 1.0 && (id.h - id.l) < 1e-12);
  }
  // 5. Jet2 finite-difference check at several points including near r=0 and near y=0 (r=w, th=0)!
  const double eps = 1e-4;
  for (double w : {0.0, 0.6}) {
    for (double r : {0.02, 0.6, 1.5}) {
      for (double th : {0.05, 1.1, 2.7}) {
        auto j_r = eval_wcs_jet(Jet2(I(r), I(1.0), I(0.0)), Jet2(I(th), I(0.0), I(0.0)), I(w));
        auto p_m = eval_wcs_pt(I(r - eps), I(th), I(w));
        auto p_0 = eval_wcs_pt(I(r), I(th), I(w));
        auto p_p = eval_wcs_pt(I(r + eps), I(th), I(w));
        double fd_d = (0.5 * (p_p.fA.l + p_p.fA.h) - 0.5 * (p_m.fA.l + p_m.fA.h)) / (2.0 * eps);
        double fd_d2 = (0.5 * (p_p.fA.l + p_p.fA.h) - (p_0.fA.l + p_0.fA.h) + 0.5 * (p_m.fA.l + p_m.fA.h)) / (eps * eps);
        assert(std::fabs(0.5 * (j_r.fA.d.l + j_r.fA.d.h) - fd_d) < 1e-4 * (1.0 + std::fabs(fd_d)));
        assert(std::fabs(0.5 * (j_r.fA.d2.l + j_r.fA.d2.h) - fd_d2) < 1e-3 * (1.0 + std::fabs(fd_d2)));

        double fd_M = (0.5 * (p_p.fM[4].l + p_p.fM[4].h) - (p_0.fM[4].l + p_0.fM[4].h) + 0.5 * (p_m.fM[4].l + p_m.fM[4].h)) / (eps * eps);
        assert(std::fabs(0.5 * (j_r.fM[4].d2.l + j_r.fM[4].d2.h) - fd_M) < 1e-3 * (1.0 + std::fabs(fd_M)));

        auto j_t = eval_wcs_jet(Jet2(I(r), I(0.0), I(0.0)), Jet2(I(th), I(1.0), I(0.0)), I(w));
        auto t_m = eval_wcs_pt(I(r), I(th - eps), I(w));
        auto t_p = eval_wcs_pt(I(r), I(th + eps), I(w));
        double fd_t2 = (0.5 * (t_p.fb[1].l + t_p.fb[1].h) - (p_0.fb[1].l + p_0.fb[1].h) + 0.5 * (t_m.fb[1].l + t_m.fb[1].h)) / (eps * eps);
        assert(std::fabs(0.5 * (j_t.fb[1].d2.l + j_t.fb[1].d2.h) - fd_t2) < 1e-3 * (1.0 + std::fabs(fd_t2)));
      }
    }
  }
  // 6. WCS exact benchmark check: at w = 0, sum_k 4 * A_k == 2 * E|L| = 387*sqrt(pi)/500 ~ 1.3718792806!
  //    (Because A_k = int_{Q_k in [0,pi]} 2 r^2 f dr dth/(2pi) = (1/2) int_{Q_k} |L| dmu, so sum over [0,2pi] = 2 * sum A_k = E|L|!)
  WcsGrid g0 = build_wcs_grid(0.0, 24, 12, 2, 2);
  double sumA = 0.0;
  for (const auto& c : g0.cells) sumA += c.A_hi;
  double two_EL = 4.0 * sumA;  // upper bound on 2 E|L|
  std::cerr << "[self-test] 2E|L|_hi(24x12) = " << std::setprecision(10) << two_EL << "\n";
  assert(two_EL >= 1.371879 && two_EL < 1.375);
  // Also at v = 0, eval_wcs_ub must return 0.0; and check fast eval_wcs_ub against naive I-interval evaluator!
  double z4[4] = {0.0, 0.0, 0.0, 0.0};
  assert(eval_wcs_ub(g0, z4) == 0.0);
  const double test_vs[4][4] = {
      {0.25, -0.125, 0.0625, -0.03125},
      {-0.3, 0.2, 0.15, 0.05},
      {0.01, 0.0, 0.0, -0.01},
      {45.0 / 128.0, 26.0 / 128.0, 0.0, 0.0},
  };
  for (int ti = 0; ti < 4; ++ti) {
    const double* tv = test_vs[ti];
    double fast_ub = eval_wcs_ub(g0, tv);
    I S_iv = sq(I(tv[0])) + sq(I(tv[1])) + sq(I(tv[2])) + sq(I(tv[3]));
    double naive_ub = (I(g0.tail_coeff) * S_iv).h;
    for (int si = 0; si < 2; ++si) {
      I vv[4] = {I(tv[0]), I(tv[1]), I(si == 0 ? tv[2] : -tv[2]), I(si == 0 ? tv[3] : -tv[3])};
      for (const auto& cell : g0.cells) {
        I B(0.0);
        for (int i = 0; i < 4; ++i) B = B + I(cell.b_lo[i], cell.b_hi[i]) * vv[i];
        I C_iv(0.0);
        int k = 0;
        for (int i = 0; i < 4; ++i)
          for (int j = i; j < 4; ++j) {
            I m_iv(cell.M_lo[k], cell.M_hi[k]);
            C_iv = C_iv + (i == j ? m_iv * vv[i] * vv[i] : I(2.0) * m_iv * vv[i] * vv[j]);
            ++k;
          }
        double Ch = C_iv.h;
        if (Ch <= 0.0) continue;
        I A(cell.A_hi);
        I nhc = I(-0.5) * I(Ch);
        double phi = Ch;
        if (B.h < nhc.l) {
          I Bp(B.h);
          I arg = A * (A + I(2.0) * Bp + I(Ch));
          I rad = sqrt_iv(I(std::max(0.0, arg.l), std::max(0.0, arg.h)));
          phi = (I(2.0) * (rad - A - Bp)).h;
        } else if (B.l > nhc.h) {
          I Bp(B.l);
          I arg = A * (A + I(2.0) * Bp + I(Ch));
          I rad = sqrt_iv(I(std::max(0.0, arg.l), std::max(0.0, arg.h)));
          phi = (I(2.0) * (rad - A - Bp)).h;
        }
        if (phi > 0.0) naive_ub = add_up(naive_ub, phi);
      }
    }
    assert(fast_ub >= 0.0 && std::fabs(fast_ub - naive_ub) < 1e-11);
  }
  std::cerr << "[self-test] PASS (FE_UPWARD, trig, expneg, solve_T, Jet2 FD, WCS ref, 2E|L|=" << std::setprecision(10) << two_EL << ")\n";
}

// Helper: format double as exact C99/Python hexfloat string
static std::string hex_f(double x) {
  std::ostringstream oss;
  oss << std::hexfloat << x;
  return oss.str();
}

static std::string sym2_json(const Sym2& m) {
  std::ostringstream oss;
  oss << "{\"a00\":[\"" << hex_f(m.a00.l) << "\",\"" << hex_f(m.a00.h) << "\"],"
      << "\"a01\":[\"" << hex_f(m.a01.l) << "\",\"" << hex_f(m.a01.h) << "\"],"
      << "\"a11\":[\"" << hex_f(m.a11.l) << "\",\"" << hex_f(m.a11.h) << "\"]}";
  return oss.str();
}

// ============================================================================
// 9. Main Driver (supports --output <path> and --control-false-hotspot negative test)
// ============================================================================
int main(int argc, char** argv) {
  assert(std::fesetround(FE_UPWARD) == 0);
  init_constants();
  run_self_tests();

  std::string out_path = "result.json";
  bool control_false_hotspot = false;
  for (int i = 1; i < argc; ++i) {
    if (std::string(argv[i]) == "--output" && i + 1 < argc) out_path = argv[++i];
    if (std::string(argv[i]) == "--control-false-hotspot") control_false_hotspot = true;
  }

  if (control_false_hotspot) {
    // Negative control: at the global hotspot (w=77/128, A=45/128, B=26/128), true Rem - B_P ~ -0.00353.
    // A false target tightened by 0.005 (i.e. B_P - 0.005) MUST be violated by U_WCS (Rem <= U_WCS, wait:
    // we also check that U_WCS > B_P - 0.005, and in fact even finer grid cannot pass B_P - 0.005!).
    WcsGrid gh = build_wcs_grid(77.0 / 128.0, 48, 16, 2, 2);
    double vhot[4] = {45.0 / 128.0, 26.0 / 128.0, 0.0, 0.0};
    double ub = eval_wcs_ub(gh, vhot);
    double bp = eval_BP_iv(77.0 / 128.0, vhot).l;
    double diff = sub_up(ub, bp);
    std::cout << "CONTROL_HOTSPOT diff=" << std::setprecision(9) << diff << "\n";
    // Must be < 0 for true target, and > -0.005 (so tightened by 0.005 fails!)
    if (!(diff < 0.0 && diff > -0.005)) return 2;
    return 0;
  }

  unsigned int nthreads = std::max(1u, std::min(8u, std::thread::hardware_concurrency()));
  std::cerr << "[certify_global_P] running with " << nthreads << " threads...\n";

  // --------------------------------------------------------------------------
  // PART 1: Unconditional Potential Matrix on [0, 8]
  //   - [0, 11/8]: width 1/64 on [0, 3/8] & [3/4, 11/8], 1/256 on dip [3/8, 3/4] -> certifies S_r >= 3/4
  //   - [11/8, 8]: width 1/64 on [11/8, 2], 1/16 on [2, 4], 1/8 on [4, 8] -> certifies shift exterior w >= 11/8
  // --------------------------------------------------------------------------
  struct PotSlabSpec { double wl, wh; bool is_shift_ext; };
  std::vector<PotSlabSpec> pot_specs;
  for (int i = 0; i < 48; ++i) pot_specs.push_back({i / 128.0, (i + 1) / 128.0, false});        // [0, 3/8]
  for (int i = 96; i < 224; ++i) pot_specs.push_back({i / 256.0, (i + 1) / 256.0, false});      // [3/8, 7/8]
  for (int i = 112; i < 176; ++i) pot_specs.push_back({i / 128.0, (i + 1) / 128.0, false});     // [7/8, 11/8]
  for (int i = 176; i < 256; ++i) pot_specs.push_back({i / 128.0, (i + 1) / 128.0, true});      // [11/8, 2]
  for (int i = 64; i < 128; ++i) pot_specs.push_back({i / 32.0, (i + 1) / 32.0, true});         // [2, 4]
  for (int i = 64; i < 128; ++i) pot_specs.push_back({i / 16.0, (i + 1) / 16.0, true});         // [4, 8]

  struct PotSlabOut {
    double wl, wh;
    bool is_shift_ext;
    BlockPair P;
    double margin;
  };
  std::vector<PotSlabOut> pot_out(pot_specs.size());
  {
    std::atomic<size_t> next_i{0};
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        assert(std::fesetround(FE_UPWARD) == 0);
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= pot_specs.size()) break;
          auto sp = pot_specs[idx];
          double r_cut = sp.is_shift_ext ? 30.0 : 24.0;
          BlockPair P = integrate_potential_slab(I(sp.wl, sp.wh), r_cut, 120, 60, 48);
          double shift_lo = sp.is_shift_ext ? (I(0.5) * sq(I(sp.wl))).l : (I(0.5) * sq(I(sp.wl)) + rat(3, 4)).l;
          double m = std::min(psd_margin_2x2(P.re, shift_lo), psd_margin_2x2(P.im, shift_lo));
          if (!(m > 0.0)) {
            std::cerr << "POT FAIL slab [" << sp.wl << "," << sp.wh << "] shift_ext=" << sp.is_shift_ext << " m=" << m << "\n";
            std::exit(1);
          }
          pot_out[idx] = {sp.wl, sp.wh, sp.is_shift_ext, P, m};
        }
      });
    }
    for (auto& th : workers) th.join();
  }
  double min_amp_m = 1e30, min_sh_m = 1e30;
  for (const auto& po : pot_out) {
    if (po.is_shift_ext) min_sh_m = std::min(min_sh_m, po.margin);
    else min_amp_m = std::min(min_amp_m, po.margin);
  }
  std::cerr << "[Part 1] PASS potential exteriors (" << pot_out.size()
            << " slabs): min_amp_margin=" << min_amp_m << ", min_shift_margin=" << min_sh_m << "\n";

  // --------------------------------------------------------------------------
  // PART 2: 3-Line Switched Origin Profile on [0, 11/8]
  // Exact dyadic caps s_0(w):
  //   [0, 1/16]:     s_0 = 1/512  (width 1/256, 16 slabs)
  //   [1/16, 3/16]:  s_0 = 1/256  (width 1/256, 32 slabs)
  //   [3/16, 1/4]:   s_0 = 1/128  (width 1/128, 8 slabs)
  //   [1/4, 5/16]:   s_0 = 1/64   (width 1/128, 8 slabs)
  //   [5/16, 1]:     s_0 = 1/32   (width 1/128, 88 slabs)
  //   [1, 9/8]:      s_0 = 3/64   (width 1/128, 16 slabs)
  //   [9/8, 5/4]:    s_0 = 1/16   (width 1/128, 16 slabs)
  //   [5/4, 11/8]:   s_0 = 1/4    (width 1/128, 16 slabs)
  // --------------------------------------------------------------------------
  struct OriSlabSpec { double wl, wh, s0; };
  std::vector<OriSlabSpec> ori_specs;
  auto add_ori = [&](int num_start, int num_end, int den, double s0) {
    for (int i = num_start; i < num_end; ++i)
      ori_specs.push_back({static_cast<double>(i) / den, static_cast<double>(i + 1) / den, s0});
  };
  add_ori(0, 16, 256, 1.0 / 512.0);
  add_ori(16, 48, 256, 1.0 / 256.0);
  add_ori(24, 32, 128, 1.0 / 128.0);
  add_ori(32, 40, 128, 1.0 / 64.0);
  add_ori(40, 88, 128, 1.0 / 32.0);
  add_ori(88, 128, 128, 1.0 / 32.0);
  add_ori(128, 144, 128, 3.0 / 64.0);
  add_ori(144, 160, 128, 1.0 / 16.0);
  add_ori(160, 176, 128, 1.0 / 4.0);

  struct OriSlabOut { double wl, wh, s0; BlockPair K; double margin; };
  std::vector<OriSlabOut> ori_out(ori_specs.size());
  {
    std::atomic<size_t> next_i{0};
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        assert(std::fesetround(FE_UPWARD) == 0);
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= ori_specs.size()) break;
          auto sp = ori_specs[idx];
          BlockPair K = integrate_origin_slab(I(sp.wl, sp.wh), sp.s0, 160, 60, 48);
          double shift_lo = (I(0.5) * sq(I(sp.wl))).l;
          double m = std::min(psd_margin_2x2(K.re, shift_lo), psd_margin_2x2(K.im, shift_lo));
          if (!(m > 0.0)) {
            std::cerr << "ORIGIN FAIL slab [" << sp.wl << "," << sp.wh << "] s0=" << sp.s0 << " m=" << m << "\n";
            std::exit(1);
          }
          ori_out[idx] = {sp.wl, sp.wh, sp.s0, K, m};
        }
      });
    }
    for (auto& th : workers) th.join();
  }
  double min_ori_m = 1e30;
  for (const auto& oo : ori_out) min_ori_m = std::min(min_ori_m, oo.margin);
  std::cerr << "[Part 2] PASS origin profile (" << ori_out.size()
            << " slabs): min_origin_margin=" << min_ori_m << "\n";

  // --------------------------------------------------------------------------
  // PART 3: Self-contained global shift curvature (Rem_ww >= -480*S_r)
  // --------------------------------------------------------------------------
  ShiftCurvGlobal sc_glob = certify_global_shift_curvature_480();
  std::cerr << "[Part 3] PASS global shift curvature 480: cap=" << sc_glob.cap_max
            << ", mass=" << sc_glob.mass_sum << "\n";

  // --------------------------------------------------------------------------
  // PART 4: 3D Ray-Convexity Cube Shells on [0, 5/16] (covering s_0(w) up to ||v||_inf = 1/8)
  // Exact binary64 dyadic radii k/4096 satisfying ((rho-1)/(rho+1))^2 <= eta:
  //   Band A:  [0, 1/16],    dw = 1/256 (16 slabs), r_0 = 4/4096  -> 2 r_0 = 1/512 = s_0, eta = 1/80, rho <= 5/4
  //   Band B1: [1/16, 1/8],  dw = 1/256 (16 slabs), r_0 = 8/4096  -> 2 r_0 = 1/256 = s_0, eta = 1/60, rho <= 9/7
  //   Band B2: [1/8, 3/16],  dw = 1/128 (8 slabs),  r_0 = 8/4096  -> 2 r_0 = 1/256 = s_0, eta = 1/40, rho <= 4/3
  //   Band C:  [3/16, 1/4],  dw = 1/128 (8 slabs),  r_0 = 16/4096 -> 2 r_0 = 1/128 = s_0, eta = 1/25, rho <= 3/2
  //   Band D:  [1/4, 5/16],  dw = 1/128 (8 slabs),  r_0 = 32/4096 -> 2 r_0 = 1/64  = s_0, eta = 1/25, rho <= 3/2
  // --------------------------------------------------------------------------
  const std::vector<int> radii_5_4 = {
      4, 5, 6, 7, 8, 10, 12, 15, 18, 22, 27, 33, 41, 51, 63, 78, 97, 121, 151, 188, 235, 293, 366, 457, 512};
  const std::vector<int> radii_9_7_B1 = {
      8, 10, 12, 15, 19, 24, 30, 38, 48, 61, 78, 100, 128, 164, 210, 270, 347, 446, 512};
  const std::vector<int> radii_4_3_B2 = {8, 10, 13, 17, 22, 29, 38, 50, 66, 88, 117, 156, 208, 277, 369, 492, 512};
  const std::vector<int> radii_3_2_C = {16, 24, 36, 54, 81, 121, 181, 271, 406, 512};
  const std::vector<int> radii_3_2_D = {32, 48, 72, 108, 162, 243, 364, 512};

  struct Slab3DSpec {
    double wl, wh;
    int eta_num, eta_den, rho_num, rho_den;
    std::vector<int> r_nums;  // over 4096
  };
  std::vector<Slab3DSpec> s3_specs;
  for (int i = 0; i < 16; ++i)
    s3_specs.push_back({i / 256.0, (i + 1) / 256.0, 1, 80, 5, 4, radii_5_4});         // [0, 1/16], dw=1/256
  for (int i = 16; i < 32; ++i)
    s3_specs.push_back({i / 256.0, (i + 1) / 256.0, 1, 60, 9, 7, radii_9_7_B1});      // [1/16, 1/8], dw=1/256 (1/64 < 1/60)
  for (int i = 16; i < 24; ++i)
    s3_specs.push_back({i / 128.0, (i + 1) / 128.0, 1, 40, 4, 3, radii_4_3_B2});      // [1/8, 3/16], dw=1/128
  for (int i = 24; i < 32; ++i)
    s3_specs.push_back({i / 128.0, (i + 1) / 128.0, 1, 25, 3, 2, radii_3_2_C});       // [3/16, 1/4], dw=1/128
  for (int i = 32; i < 40; ++i)
    s3_specs.push_back({i / 128.0, (i + 1) / 128.0, 1, 25, 3, 2, radii_3_2_D});       // [1/4, 5/16], dw=1/128

  // Exact integer pre-check on all Part 4 specs before spawning threads!
  for (const auto& sp : s3_specs) {
    int64_t diff = sp.rho_num - sp.rho_den;
    int64_t sum = sp.rho_num + sp.rho_den;
    assert(diff * diff * sp.eta_den <= sum * sum * sp.eta_num);
    for (size_t k = 0; k + 1 < sp.r_nums.size(); ++k) {
      assert(static_cast<int64_t>(sp.r_nums[k + 1]) * sp.rho_den <= static_cast<int64_t>(sp.r_nums[k]) * sp.rho_num);
    }
  }

  std::vector<Slab3DResult> s3_out(s3_specs.size());
  {
    std::atomic<size_t> next_i{0};
    std::atomic<size_t> done_i{0};
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        assert(std::fesetround(FE_UPWARD) == 0);
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= s3_specs.size()) break;
          const auto& sp = s3_specs[idx];
          std::vector<WcsGrid> gl, gh;
          gl.push_back(build_wcs_grid(sp.wl, 24, 8, 2, 2));
          gh.push_back(build_wcs_grid(sp.wh, 24, 8, 2, 2));
          gl.push_back(build_wcs_grid(sp.wl, 48, 16, 2, 2));
          gh.push_back(build_wcs_grid(sp.wh, 48, 16, 2, 2));
          if (sp.wl < 0.125) {
            gl.push_back(build_wcs_grid(sp.wl, 64, 20, 2, 2));
            gh.push_back(build_wcs_grid(sp.wh, 64, 20, 2, 2));
          }
          Slab3DResult r;
          r.wl = sp.wl; r.wh = sp.wh;
          r.eta_num = sp.eta_num; r.eta_den = sp.eta_den;
          r.rho_max_num = sp.rho_num; r.rho_max_den = sp.rho_den;
          r.total_boxes = 0; r.worst_margin = -1e30;
          for (int rn : sp.r_nums) {
            auto sr = certify_3d_shell(sp.wl, sp.wh, rn / 4096.0, sp.eta_num, sp.eta_den, gl, gh);
            r.total_boxes += sr.closed_boxes;
            if (sr.worst_margin > r.worst_margin) r.worst_margin = sr.worst_margin;
            r.shells.push_back(sr);
          }
          s3_out[idx] = std::move(r);
          size_t d = done_i.fetch_add(1) + 1;
          if (d % 4 == 0 || d == s3_specs.size()) {
            std::cerr << "  [Part 4] progress " << d << "/" << s3_specs.size()
                      << " (slab " << idx << " [" << sp.wl << "," << sp.wh << "] boxes=" << s3_out[idx].total_boxes << ")\n";
          }
        }
      });
    }
    for (auto& th : workers) th.join();
  }
  int64_t tot_3d = 0;
  double worst_3d = -1e30;
  for (const auto& r : s3_out) {
    tot_3d += r.total_boxes;
    worst_3d = std::max(worst_3d, r.worst_margin);
  }
  std::cerr << "[Part 4] PASS 3D ray-convexity shells (" << s3_out.size()
            << " slabs): total_boxes=" << tot_3d << ", worst_margin=" << worst_3d << "\n";

  // --------------------------------------------------------------------------
  // PART 5: 4D Adaptive WCS Bulk Cover on [0, 11/8]
  //   [0, 5/16]:   width 1/64 (20 slabs), s_bulk = 1/8  (matches Part 4 outer shell 512/4096 = 1/8)
  //   [5/16, 1]:   width 1/32 (22 slabs), s_bulk = 1/32 (matches Part 2 origin s_0 = 1/32)
  //   [1, 9/8]:    width 1/32 (4 slabs),  s_bulk = 3/64 (matches Part 2 origin s_0 = 3/64)
  //   [9/8, 5/4]:  width 1/32 (4 slabs),  s_bulk = 1/16 (matches Part 2 origin s_0 = 1/16)
  //   [5/4, 11/8]: width 1/32 (4 slabs),  s_bulk = 1/4  (matches Part 2 origin s_0 = 1/4)
  // --------------------------------------------------------------------------
  struct Slab4DSpec { double wl, wh, s_bulk; };
  std::vector<Slab4DSpec> s4_specs;
  auto add_4d = [&](int ns, int ne, int den, double sb) {
    for (int i = ns; i < ne; ++i)
      s4_specs.push_back({static_cast<double>(i) / den, static_cast<double>(i + 1) / den, sb});
  };
  add_4d(0, 20, 64, 1.0 / 8.0);
  add_4d(10, 32, 32, 1.0 / 32.0);
  add_4d(32, 36, 32, 3.0 / 64.0);
  add_4d(36, 40, 32, 1.0 / 16.0);
  add_4d(40, 44, 32, 1.0 / 4.0);

  std::vector<Slab4DResult> s4_out(s4_specs.size());
  {
    std::atomic<size_t> next_i{0};
    std::atomic<size_t> done_i{0};
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        assert(std::fesetround(FE_UPWARD) == 0);
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= s4_specs.size()) break;
          const auto& sp = s4_specs[idx];
          SlabCurv sc = compute_slab_base_curv(sp.wl, sp.wh);
          std::vector<WcsGrid> gl, gh;
          gl.push_back(build_wcs_grid(sp.wl, 16, 8, 2, 2));
          gh.push_back(build_wcs_grid(sp.wh, 16, 8, 2, 2));
          gl.push_back(build_wcs_grid(sp.wl, 24, 12, 2, 2));
          gh.push_back(build_wcs_grid(sp.wh, 24, 12, 2, 2));
          gl.push_back(build_wcs_grid(sp.wl, 40, 16, 2, 2));
          gh.push_back(build_wcs_grid(sp.wh, 40, 16, 2, 2));
          gl.push_back(build_wcs_grid(sp.wl, 64, 16, 2, 2));
          gh.push_back(build_wcs_grid(sp.wh, 64, 16, 2, 2));
          s4_out[idx] = certify_4d_slab(sp.wl, sp.wh, sp.s_bulk, sc, gl, gh);
          size_t d = done_i.fetch_add(1) + 1;
          if (d % 8 == 0 || d == s4_specs.size()) {
            std::cerr << "  [Part 5] progress " << d << "/" << s4_specs.size() << " slabs\n";
          }
        }
      });
    }
    for (auto& th : workers) th.join();
  }
  int64_t tot_4d = 0;
  double worst_4d = -1e30;
  for (const auto& r : s4_out) {
    tot_4d += r.total_boxes;
    worst_4d = std::max(worst_4d, r.worst_margin);
  }
  std::cerr << "[Part 5] PASS 4D WCS bulk cover (" << s4_out.size()
            << " slabs): total_boxes=" << tot_4d << ", worst_margin=" << worst_4d << "\n";

  // --------------------------------------------------------------------------
  // Write exact hexfloat JSON certificate
  // --------------------------------------------------------------------------
  std::ofstream ofs(out_path);
  assert(ofs.good());
  ofs << "{\n";
  ofs << "  \"format\": \"global-complex-P-v1\",\n";
  ofs << "  \"self_tests_passed\": true,\n";
  ofs << "  \"shift_exterior_cutoff\": \"" << hex_f(11.0 / 8.0) << "\",\n";
  ofs << "  \"analytic_tail_cutoff\": \"" << hex_f(8.0) << "\",\n";
  ofs << "  \"amplitude_exterior_S_min\": \"" << hex_f(0.75) << "\",\n";
  ofs << "  \"part1_potential_slabs\": [\n";
  for (size_t i = 0; i < pot_out.size(); ++i) {
    const auto& po = pot_out[i];
    ofs << "    {\"wl\":\"" << hex_f(po.wl) << "\",\"wh\":\"" << hex_f(po.wh)
        << "\",\"shift_ext\":" << (po.is_shift_ext ? "true" : "false")
        << ",\"P_re\":" << sym2_json(po.P.re) << ",\"P_im\":" << sym2_json(po.P.im)
        << ",\"margin\":\"" << hex_f(po.margin) << "\"}" << (i + 1 < pot_out.size() ? "," : "") << "\n";
  }
  ofs << "  ],\n";
  ofs << "  \"part2_origin_slabs\": [\n";
  for (size_t i = 0; i < ori_out.size(); ++i) {
    const auto& oo = ori_out[i];
    ofs << "    {\"wl\":\"" << hex_f(oo.wl) << "\",\"wh\":\"" << hex_f(oo.wh)
        << "\",\"s0\":\"" << hex_f(oo.s0)
        << "\",\"K_re\":" << sym2_json(oo.K.re) << ",\"K_im\":" << sym2_json(oo.K.im)
        << ",\"margin\":\"" << hex_f(oo.margin) << "\"}" << (i + 1 < ori_out.size() ? "," : "") << "\n";
  }
  ofs << "  ],\n";
  ofs << "  \"part3_shift_curvature\": {\"cap_max\":\"" << hex_f(sc_glob.cap_max)
      << "\",\"mass_sum\":\"" << hex_f(sc_glob.mass_sum)
      << "\",\"tail_mass\":\"" << hex_f(sc_glob.tail_mass) << "\",\"constant\":480},\n";
  ofs << "  \"part4_ray_shells\": [\n";
  for (size_t i = 0; i < s3_out.size(); ++i) {
    const auto& r = s3_out[i];
    ofs << "    {\"wl\":\"" << hex_f(r.wl) << "\",\"wh\":\"" << hex_f(r.wh)
        << "\",\"eta\":[" << static_cast<int>(r.eta_num) << "," << static_cast<int>(r.eta_den)
        << "],\"rho_max\":[" << static_cast<int>(r.rho_max_num) << "," << static_cast<int>(r.rho_max_den)
        << "],\"radii\":[";
    for (size_t k = 0; k < r.shells.size(); ++k) {
      ofs << "\"" << hex_f(r.shells[k].r_m) << "\"" << (k + 1 < r.shells.size() ? "," : "");
    }
    ofs << "],\"total_boxes\":" << r.total_boxes
        << ",\"open_boxes\":0,\"worst_margin\":\"" << hex_f(r.worst_margin) << "\"}"
        << (i + 1 < s3_out.size() ? "," : "") << "\n";
  }
  ofs << "  ],\n";
  ofs << "  \"part5_bulk_4d\": [\n";
  for (size_t i = 0; i < s4_out.size(); ++i) {
    const auto& r = s4_out[i];
    ofs << "    {\"wl\":\"" << hex_f(r.wl) << "\",\"wh\":\"" << hex_f(r.wh)
        << "\",\"s_bulk\":\"" << hex_f(r.s_bulk)
        << "\",\"n_up\":\"" << hex_f(r.n_up) << "\",\"a2_up\":\"" << hex_f(r.a2_up)
        << "\",\"b2_up\":\"" << hex_f(r.b2_up)
        << "\",\"closed_ext\":" << r.closed_ext << ",\"closed_ori\":" << r.closed_ori
        << ",\"closed_wcs\":[" << r.closed_wcs[0] << "," << r.closed_wcs[1] << "," << r.closed_wcs[2] << "," << r.closed_wcs[3] << "]"
        << ",\"total_boxes\":" << r.total_boxes
        << ",\"open_boxes\":0,\"worst_margin\":\"" << hex_f(r.worst_margin) << "\"}"
        << (i + 1 < s4_out.size() ? "," : "") << "\n";
  }
  ofs << "  ],\n";
  ofs << "  \"summary\": {\"total_3d_boxes\":" << tot_3d << ",\"total_4d_boxes\":" << tot_4d
      << ",\"worst_3d_margin\":\"" << hex_f(worst_3d)
      << "\",\"worst_4d_margin\":\"" << hex_f(worst_4d) << "\"}\n";
  ofs << "}\n";
  ofs.close();
  std::cerr << "[certify_global_P] DONE -> " << out_path << "\n";
  return 0;
}
