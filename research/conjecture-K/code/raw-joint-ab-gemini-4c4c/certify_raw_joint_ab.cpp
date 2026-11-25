// Agent-ID: gemini-4c4c. Closes #706, Refs #177.
// Global all-amplitude complex certification of the raw Conjecture K joint A/B bounds
// (STATUS.md 7.4, 7.4.5, 7.4.9, §15 item 5) at the peak, flank, and upper rows.
//
// Self-contained outward-rounded C++17 interval arithmetic (-ffp-contract=off -frounding-math, FE_UPWARD).
//
// At each of the three rows (peak, flank, upper), with L = z_1 (a + b T), T = |z_1|^2, p = 1/eps,
// h(z_1; alpha, beta) = (T - 1)*alpha + (z_1^2 / sqrt(2))*conj(beta), S_0 = |alpha|^2 + |beta|^2,
// and r_x(alpha, beta) = 2 * E_{z_1}[ |L + x + h| - |L + x| - Re(h * conj(ph(L + x))) ]:
//
// Proves for ALL (x, alpha, beta) in C^3 (strict whenever (alpha, beta) != (0, 0)):
//   (Target S, closing 7.4 & 7.4.5 with reserve 1/100 >> 8.07e-5):
//     r_x(alpha, beta) <= Q_s(alpha, beta) - (1/100)*S_0
//                      := (p - 0.25)*|alpha|^2 + (p - 0.27)*|beta|^2 - 0.236*Re(alpha*conj(beta)),
//   (Target D, global common diagonal cost below 7.4.9):
//     r_x(alpha, beta) <= (p - kappa_diag)*S_0,
//     with kappa_diag = 7/25 = 0.28 (peak), 3/10 = 0.30 (flank), 31/100 = 0.31 (upper).
//
// Architecture on x >= 0, Im(alpha) >= 0 (after exact U(1) rotation & conjugation gauge):
//   - Shift exterior x >= 29/10 (overlap [29/10, 3]) and amplitude exterior ||v||_inf >= 4 (S_0 >= 16)
//     are proved in zero-float exact rational arithmetic in verify.py (r_x <= (187/200)*S_0 and
//     r_x < (94/25)*sqrt(S_0) <= (47/50)*S_0 < min(Q_diag, Q_{s,+})).
//   - On x in [0, 3] and ||v||_inf <= 4:
//     Part 1: Continuous rational-secant origin matrix K([xl, xh], s_0) (via KJSEC Theorem 2(a))
//             covering ||v||_2 <= s_0(x) (hence ||v||_inf <= r_0(x) with 2*r_0(x) <= s_0(x)).
//     Part 2: Self-contained global shift curvature -d^2/dx^2 r_x(v) <= C_curv * S_0 (C_curv = 680)
//             and per-slab base curvature bounds N''(x), |C_A''(x)|, |C_B''(x)|.
//     Part 3: 3D ray-convexity cube shells partial([-r_m, r_m]^4) from r_0(x) up to r_M = 4
//             using Weighted Cauchy-Schwarz Cell Gram Matrices (U_WCS), certifying both Target S and Target D.

#pragma STDC FP_CONTRACT OFF

#ifdef NDEBUG
#error "certify_raw_joint_ab.cpp must not be compiled with -DNDEBUG (interval and rounding assertions are required)"
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
#include <mutex>
#include <sstream>
#include <string>
#include <thread>
#include <unordered_map>
#include <utility>
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

static double expneg_pt(double x, bool upper) {
  assert(x >= 0.0);
  if (x == 0.0) return 1.0;
  if (x > 700.0) return upper ? 1e-300 : 0.0;
  int k = static_cast<int>(std::floor(x / 0.6931471805599453 + 0.5));
  I r = I(x) - I(static_cast<double>(k)) * LN2_IV;
  I term(1.0), sum(1.0), nr = -r;
  for (int n = 1; n <= 16; ++n) {
    term = term * nr / static_cast<double>(n);
    sum = sum + term;
  }
  double mr = mag(r);
  assert(mr < 0.5);
  double mr17 = 1.0;
  for (int i = 0; i < 17; ++i) mr17 = mul_up(mr17, mr);
  double rem = div_up(mul_up(2.0, mr17), 355687428096000.0);
  I er(std::max(0.0, sub_dn(sum.l, rem)), add_up(sum.h, rem));
  double scale = std::ldexp(1.0, -k);
  return upper ? mul_up(er.h, scale) : mul_dn(er.l, scale);
}
static inline I expneg_iv(I x) {
  assert(x.l >= 0.0);
  return I(expneg_pt(x.h, false), expneg_pt(x.l, true));
}

static I sin_small_iv(I x) {
  I x2 = sq(x), term = x, sum = x;
  for (int k = 1; k <= 9; ++k) {
    double den = static_cast<double>((2 * k) * (2 * k + 1));
    term = (-term * x2) / den;
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
    double den = static_cast<double>((2 * k - 1) * (2 * k));
    term = (-term * x2) / den;
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
  assert(x >= -0.01 && x <= 3.16);
  if (x <= 1.5707963267948966) return cos_small_iv(I(x));
  return -cos_small_iv(PI_IV - I(x));
}
static I sin_pt_iv(double x) {
  assert(x >= -0.01 && x <= 3.16);
  if (x <= 1.5707963267948966) return sin_small_iv(I(x));
  return sin_small_iv(PI_IV - I(x));
}
static inline I cos_on_0_pi(I th) {
  assert(th.l >= 0.0 && th.h <= PI_IV.h);
  I c_lo = cos_pt_iv(th.h);
  I c_hi = cos_pt_iv(th.l);
  return I(c_lo.l, c_hi.h);
}
static inline I sin_on_0_pi(I th) {
  assert(th.l >= 0.0 && th.h <= PI_IV.h);
  I s1 = sin_pt_iv(th.l), s2 = sin_pt_iv(th.h);
  double lo = std::min(s1.l, s2.l), hi = std::max(s1.h, s2.h);
  if (th.l <= HALF_PI_IV.h && th.h >= HALF_PI_IV.l) hi = 1.0;
  return I(lo, hi);
}

// ============================================================================
// 2. Row configuration & 1-variable 2nd-order Jet2
// ============================================================================
struct RowConfig {
  std::string name;
  int64_t a_num, a_den;
  int64_t b_num, b_den;
  int64_t eps_num, eps_den;
  int64_t kd_num, kd_den;  // global common diagonal cost kappa_diag
  I a, b, p, inv_sqrt2;
  // Target S: Q_{s,+}(v) = (p - 1/4)|alpha|^2 + (p - 27/100)|beta|^2 - (59/250)*Re(alpha*conj(beta))
  //           = Q_s(v) - (1/100)*S_0  (reserve 0.01 >> 8.07e-5!)
  I qs_AA, qs_BB, qs_AB;   // 2x2 block: qs_AA*x^2 + 2*qs_AB*x*y + qs_BB*y^2, qs_AB = -59/500 = -0.118
  // Target D: Q_diag(v) = (p - kd)*S_0
  I qd_diag;
};

static RowConfig make_row(const std::string& name,
                          int64_t an, int64_t ad, int64_t bn, int64_t bd,
                          int64_t en, int64_t ed, int64_t kn, int64_t kd) {
  RowConfig R;
  R.name = name;
  R.a_num = an; R.a_den = ad;
  R.b_num = bn; R.b_den = bd;
  R.eps_num = en; R.eps_den = ed;
  R.kd_num = kn; R.kd_den = kd;
  R.a = rat(an, ad);
  R.b = rat(bn, bd);
  R.p = rat(ed, en);
  R.inv_sqrt2 = I(1.0) / sqrt_iv(I(2.0));
  R.qs_AA = R.p - rat(25, 100);   // (p - 0.24) - 0.01
  R.qs_BB = R.p - rat(27, 100);   // (p - 0.26) - 0.01
  R.qs_AB = -rat(59, 500);        // 2 * (-59/500) = -0.236
  R.qd_diag = R.p - rat(kn, kd);
  return R;
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
static inline Jet2 operator-(const Jet2& x, I c) { return {x.v - c, x.d, x.d2}; }
static inline Jet2 operator*(I c, const Jet2& x) { return {c * x.v, c * x.d, c * x.d2}; }
static inline Jet2 operator*(const Jet2& x, const Jet2& y) {
  return {x.v * y.v, x.d * y.v + x.v * y.d, x.d2 * y.v + I(2.0) * (x.d * y.d) + x.v * y.d2};
}
static inline Jet2 sq_j(const Jet2& x) {
  return {sq(x.v), I(2.0) * (x.v * x.d), I(2.0) * (sq(x.d) + x.v * x.d2)};
}
static inline Jet2 inv_j(const Jet2& x) {
  I u = I(1.0) / x.v, u2 = sq(u);
  return {u, (-x.d) * u2, (I(2.0) * sq(x.d) * u - x.d2) * u2};
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

static inline I eval_H(const RowConfig& R, I t) {
  return t * sq(R.a + R.b * t);
}
static double solve_T_scalar_guess(const RowConfig& R, double v) {
  if (v <= 0.0) return 0.0;
  double y = std::sqrt(v);
  double a0 = 0.5 * (R.a.l + R.a.h), b0 = 0.5 * (R.b.l + R.b.h);
  double u = std::min(y / a0, std::cbrt(y / b0));
  for (int it = 0; it < 12; ++it) {
    double f = u * (a0 + b0 * u * u) - y;
    double fp = a0 + 3.0 * b0 * u * u;
    u = std::max(0.0, u - f / fp);
  }
  return u * u;
}
static I solve_T_iv(const RowConfig& R, I v) {
  assert(v.h >= 0.0);
  double vl = std::max(0.0, v.l), vh = v.h;
  double tl = 0.0;
  if (vl > 0.0) {
    tl = solve_T_scalar_guess(R, vl);
    double step = std::max(1e-14, tl * 1e-13);
    while (tl > 0.0 && eval_H(R, I(tl)).h > vl) {
      tl = std::max(0.0, tl - step);
      step *= 2.0;
    }
    assert(eval_H(R, I(tl)).h <= vl);
  }
  double th = 0.0;
  if (vh > 0.0) {
    th = solve_T_scalar_guess(R, vh);
    double step = std::max(1e-14, th * 1e-13);
    while (eval_H(R, I(th)).l < vh) {
      th = th + step;
      step *= 2.0;
    }
    assert(eval_H(R, I(th)).l >= vh);
  }
  if (tl > th) tl = th;
  return I(tl, th);
}
static inline Jet2 solve_T_j(const RowConfig& R, const Jet2& v) {
  I T0 = solve_T_iv(R, v.v);
  I a0 = R.a + R.b * T0;
  I c0 = R.a + I(3.0) * R.b * T0;
  I hp = a0 * c0;
  I hpp = I(4.0) * R.a * R.b + I(6.0) * sq(R.b) * T0;
  I td = v.d / hp;
  I td2 = (v.d2 - hpp * sq(td)) / hp;
  return {T0, td, td2};
}

// ============================================================================
// 3. Shifted-polar WCS integrand for raw h = (T - 1)*alpha + (z_1^2/sqrt(2))*conj(beta)
// ============================================================================
// v = (alpha_r, beta_r, alpha_i, beta_i):
//   pr = [T - 1, z2r, 0, z2i]
//   pi = [0, z2i, T - 1, -z2r]

struct WcsIntegrandI {
  I fA;
  I fb[4];
  I fM[10];
};
struct WcsIntegrandJ {
  Jet2 fA;
  Jet2 fb[4];
  Jet2 fM[10];
};

static WcsIntegrandI eval_wcs_pt(const RowConfig& R, I r, I th, I w) {
  I ct = cos_on_0_pi(th), st = sin_on_0_pi(th);
  I yr = r * ct - w, yi = r * st;
  I v = sq(r - w) + I(2.0) * r * w * (I(1.0) - ct);
  I T = solve_T_iv(R, v);
  I a0 = R.a + R.b * T, c0 = R.a + I(3.0) * R.b * T;
  I f = expneg_iv(T) / (a0 * c0);
  I inv_a0 = I(1.0) / a0;
  I Zr = yr * inv_a0, Zi = yi * inv_a0;
  I z2r = (sq(Zr) - sq(Zi)) * R.inv_sqrt2;
  I z2i = (I(2.0) * Zr * Zi) * R.inv_sqrt2;
  I t0 = T - I(1.0);
  I pr[4] = {t0, z2r, I(0.0), z2i};
  I pi[4] = {I(0.0), z2i, t0, -z2r};

  WcsIntegrandI out;
  I f2 = I(2.0) * f, rf2 = r * f2;
  out.fA = r * rf2;
  for (int i = 0; i < 4; ++i) out.fb[i] = rf2 * (ct * pr[i] + st * pi[i]);
  int k = 0;
  for (int i = 0; i < 4; ++i)
    for (int j = i; j < 4; ++j)
      out.fM[k++] = f2 * ((i == j) ? (sq(pr[i]) + sq(pi[i])) : (pr[i] * pr[j] + pi[i] * pi[j]));
  return out;
}

static WcsIntegrandJ eval_wcs_jet(const RowConfig& R, const Jet2& r, const Jet2& th, I w) {
  Jet2 ct = cos_j(th), st = sin_j(th);
  Jet2 yr = r * ct - w, yi = r * st;
  Jet2 v = sq_j(r - w) + (I(2.0) * w) * (r * (Jet2(I(1.0)) - ct));
  Jet2 T = solve_T_j(R, v);
  Jet2 a0 = Jet2(R.a) + R.b * T, c0 = Jet2(R.a) + (I(3.0) * R.b) * T;
  Jet2 f = expneg_j(T) * inv_j(a0 * c0);
  Jet2 inv_a0 = inv_j(a0);
  Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
  Jet2 z2r = R.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
  Jet2 z2i = (I(2.0) * R.inv_sqrt2) * (Zr * Zi);
  Jet2 t0 = T - I(1.0);
  Jet2 z0(I(0.0));
  Jet2 pr[4] = {t0, z2r, z0, z2i};
  Jet2 pi[4] = {z0, z2i, t0, -z2r};

  WcsIntegrandJ out;
  Jet2 f2 = I(2.0) * f, rf2 = r * f2;
  out.fA = r * rf2;
  for (int i = 0; i < 4; ++i) out.fb[i] = rf2 * (ct * pr[i] + st * pi[i]);
  int k = 0;
  for (int i = 0; i < 4; ++i)
    for (int j = i; j < 4; ++j)
      out.fM[k++] = f2 * ((i == j) ? (sq_j(pr[i]) + sq_j(pi[i])) : (pr[i] * pr[j] + pi[i] * pi[j]));
  return out;
}

// ============================================================================
// 4. WCS Cell Grid + r >= 25 tail (valid for all w <= 3 at all three rows!)
// ============================================================================
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
    e.push_back((i == 0) ? 0.0 : (i == n1 ? 4.0 : 4.0 * std::pow(t, 2.7)));
  }
  for (int i = 1; i <= n2; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n2);
    e.push_back((i == n2) ? 9.0 : (4.0 + 5.0 * std::pow(t, 1.5)));
  }
  for (int i = 1; i <= n3; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n3);
    e.push_back((i == n3) ? 25.0 : (9.0 + 16.0 * std::pow(t, 1.8)));
  }
  for (size_t i = 0; i + 1 < e.size(); ++i) assert(e[i] < e[i + 1]);
  return e;
}

// For w <= 3.0 and r >= 25.0: |y| >= 22.0 > sqrt(H(25)) at all 3 rows, so T > 25.
// On T >= 25: |h|^2 <= ((T - 1)^2 + T^2/2) * S_0 = (1.5*T^2 - 2*T + 1) * S_0 <= 2*T^2 * S_0.
// Hence int_{r >= 25} |h|^2 / r dmu <= (S_0 / 25) * int_{25}^infty 2*T^2 e^{-T} dT = (1354 / 25) * e^{-25} * S_0.
static double certified_tail_coeff(const RowConfig& R, double w_max, double r_cut) {
  I y_min = I(r_cut) - I(w_max);
  assert(y_min.l > 0.0);
  I H25 = eval_H(R, I(25.0));
  assert(H25.h <= sq(y_min).l);
  // (1/2) T^2 + 2 T - 1 > 0 at T = 25
  I tail = (I(1354.0) / I(r_cut)) * expneg_iv(I(25.0));
  return tail.h;
}

static WcsCell integrate_wcs_cell(const RowConfig& R, double r0, double r1, I th0, I th1, double w, int nsub_r, int nsub_t) {
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
      WcsIntegrandI mid = eval_wcs_pt(R, r_mid, t_mid, w_iv);
      WcsIntegrandJ jr = eval_wcs_jet(R, Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_iv);
      WcsIntegrandJ jt = eval_wcs_jet(R, Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_iv);
      sum_A = sum_A + area * (mid.fA + inv_24 * (dr2 * jr.fA.d2 + dt2 * jt.fA.d2));
      for (int i = 0; i < 4; ++i)
        sum_b[i] = sum_b[i] + area * (mid.fb[i] + inv_24 * (dr2 * jr.fb[i].d2 + dt2 * jt.fb[i].d2));
      for (int k = 0; k < 10; ++k)
        sum_M[k] = sum_M[k] + area * (mid.fM[k] + inv_24 * (dr2 * jr.fM[k].d2 + dt2 * jt.fM[k].d2));
    }
  }
  WcsCell cell;
  assert(sum_A.h > 0.0);
  cell.A_hi = sum_A.h;
  for (int i = 0; i < 4; ++i) { cell.b_lo[i] = sum_b[i].l; cell.b_hi[i] = sum_b[i].h; }
  for (int k = 0; k < 10; ++k) { cell.M_lo[k] = sum_M[k].l; cell.M_hi[k] = sum_M[k].h; }
  assert(cell.M_lo[2] == 0.0 && cell.M_hi[2] == 0.0);
  return cell;
}

static WcsGrid build_wcs_grid(const RowConfig& R, double w, int nr, int nt, int nsub_r, int nsub_t) {
  require_fe_upward();
  WcsGrid g;
  g.w = w; g.nr = nr; g.nt = nt;
  g.tail_coeff = certified_tail_coeff(R, 3.0, 25.0);
  auto re = make_r_edges(nr);
  int nrings = static_cast<int>(re.size()) - 1;
  g.cells.reserve(static_cast<size_t>(nrings) * static_cast<size_t>(nt));
  for (int ir = 0; ir < nrings; ++ir) {
    double dr_cell = re[ir + 1] - re[ir];
    double max_dr = (re[ir] < 6.0) ? 0.05 : 0.22;
    int sr = std::max(nsub_r, static_cast<int>(std::ceil(dr_cell / max_dr)));
    int nt_ring = (re[ir] < 4.0) ? nt : ((re[ir] < 9.0) ? std::max(4, nt / 2) : std::max(2, nt / 4));
    int st = std::max(nsub_t, static_cast<int>(std::ceil(48.0 / static_cast<double>(nt_ring))));
    for (int it = 0; it < nt_ring; ++it) {
      I th0 = PI_IV * rat(it, nt_ring), th1 = PI_IV * rat(it + 1, nt_ring);
      g.cells.push_back(integrate_wcs_cell(R, re[ir], re[ir + 1], th0, th1, w, sr, st));
    }
  }
  return g;
}

static inline double eval_phi_hi(double A, double Bl, double Bh, double C_hi) {
  if (C_hi <= 0.0) return 0.0;
  double neg_half_C = -0.5 * C_hi;
  if (Bl <= neg_half_C && neg_half_C <= Bh) return C_hi;
  double B_pt = (Bh < neg_half_C) ? Bh : Bl;
  double AB_lo = add_dn(A, B_pt);
  if (AB_lo > 0.0) {
    double b2_lo = mul_dn(B_pt, B_pt);
    double num_hi = add_up(mul_up(A, C_hi), -b2_lo);
    if (num_hi <= 0.0) return 0.0;
    double inner_lo = add_dn(add_dn(A, mul_dn(2.0, B_pt)), C_hi);
    double rad_lo = 0.0;
    if (inner_lo > 0.0) {
      double disc_lo = mul_dn(A, inner_lo);
      if (disc_lo > 0.0) rad_lo = sqrt_dn_strict(disc_lo);
    }
    return div_up(mul_up(2.0, num_hi), add_dn(rad_lo, AB_lo));
  } else {
    double inner_hi = add_up(add_up(A, mul_up(2.0, B_pt)), C_hi);
    double rad_hi = (inner_hi > 0.0) ? sqrt_up_strict(mul_up(A, inner_hi)) : 0.0;
    double phi = mul_up(2.0, add_up(rad_hi, -AB_lo));
    return (phi > 0.0) ? phi : 0.0;
  }
}

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
  static constexpr int odd_idx[3] = {3, 5, 6};

  if (real_only) {
    double sum_half = 0.0;
    for (size_t ci = 0; ci < ncells; ++ci) {
      const WcsCell& cell = cells[ci];
      double neg_Bl = 0.0, Bh = 0.0;
      for (int i = 0; i < 2; ++i) {
        if (v_nonneg[i]) { neg_Bl += (-cell.b_lo[i]) * vv[i]; Bh += cell.b_hi[i] * vv[i]; }
        else { neg_Bl += cell.b_hi[i] * nvv[i]; Bh += cell.b_lo[i] * vv[i]; }
      }
      double C_hi = 0.0;
      for (int e = 0; e < 3; ++e) {
        int m = even_idx[e];
        if (q_nonneg[m]) { double mh = cell.M_hi[m]; C_hi += mh * (mh >= 0.0 ? q_hi[m] : q_lo[m]); }
        else { double ml = cell.M_lo[m]; C_hi += ml * (ml <= 0.0 ? q_lo[m] : q_hi[m]); }
      }
      sum_half += eval_phi_hi(cell.A_hi, -neg_Bl, Bh, C_hi);
    }
    return add_up(total, mul_up(2.0, sum_half));
  }

  for (size_t ci = 0; ci < ncells; ++ci) {
    const WcsCell& cell = cells[ci];
    double neg_Bel = 0.0, Beh = 0.0, neg_Bol = 0.0, Boh = 0.0;
    for (int i = 0; i < 2; ++i) {
      if (v_nonneg[i]) { neg_Bel += (-cell.b_lo[i]) * vv[i]; Beh += cell.b_hi[i] * vv[i]; }
      else { neg_Bel += cell.b_hi[i] * nvv[i]; Beh += cell.b_lo[i] * vv[i]; }
    }
    for (int i = 2; i < 4; ++i) {
      if (v_nonneg[i]) { neg_Bol += (-cell.b_lo[i]) * vv[i]; Boh += cell.b_hi[i] * vv[i]; }
      else { neg_Bol += cell.b_hi[i] * nvv[i]; Boh += cell.b_lo[i] * vv[i]; }
    }
    double C_even_hi = 0.0;
    for (int e = 0; e < 6; ++e) {
      int m = even_idx[e];
      if (q_nonneg[m]) { double mh = cell.M_hi[m]; C_even_hi += mh * (mh >= 0.0 ? q_hi[m] : q_lo[m]); }
      else { double ml = cell.M_lo[m]; C_even_hi += ml * (ml <= 0.0 ? q_lo[m] : q_hi[m]); }
    }
    double C_odd_hi = 0.0, C_odd_neg = 0.0;
    for (int o = 0; o < 3; ++o) {
      int m = odd_idx[o];
      if (q_nonneg[m]) {
        double mh = cell.M_hi[m], ml = cell.M_lo[m];
        C_odd_hi += mh * (mh >= 0.0 ? q_hi[m] : q_lo[m]);
        C_odd_neg += ml * (ml <= 0.0 ? nq_lo[m] : nq_hi[m]);
      } else {
        double ml = cell.M_lo[m], mh = cell.M_hi[m];
        C_odd_hi += ml * (ml <= 0.0 ? q_lo[m] : q_hi[m]);
        C_odd_neg += mh * (mh >= 0.0 ? nq_hi[m] : nq_lo[m]);
      }
    }
    total += eval_phi_hi(cell.A_hi, -(neg_Bel + neg_Bol), Beh + Boh, C_even_hi + C_odd_hi);
    total += eval_phi_hi(cell.A_hi, -(neg_Bel + Boh), Beh + neg_Bol, C_even_hi + C_odd_neg);
  }
  return total;
}

static I eval_Qs_plus_iv(const RowConfig& R, const double v[4]) {
  I Ar(v[0]), Br(v[1]), Ai(v[2]), Bi(v[3]);
  return R.qs_AA * (sq(Ar) + sq(Ai)) + R.qs_BB * (sq(Br) + sq(Bi))
       + I(2.0) * R.qs_AB * (Ar * Br + Ai * Bi);
}
static I eval_Qdiag_iv(const RowConfig& R, const double v[4]) {
  I Ar(v[0]), Br(v[1]), Ai(v[2]), Bi(v[3]);
  return R.qd_diag * (sq(Ar) + sq(Br) + sq(Ai) + sq(Bi));
}

// ============================================================================
// 5. Part 1: Continuous Rational-Secant Origin Matrix (via KJSEC Theorem 2(a))
// ============================================================================
// By KJSEC Theorem 2(a) (P + C): for |h| <= eta * r with eta in [0, 1],
// writing h e^{-i th} = u + i v (u^2 + v^2 = |h|^2):
//   2*(sqrt((r + u)^2 + v^2) - (r + u)) <= (1/r) * (w_P(eta) * |h|^2 + w_H(eta) * v^2),
// where w_P(eta) = eta^2 / (1 - eta + eta^2) >= 0 and w_H(eta) = (1 - eta^2) / (1 - eta + eta^2) >= 0.
// On each sub-box [a_r, b_r] x [a_th, b_th] and slab [wl, wh], we fix a constant upper bound
// eta_max = min(1, upper_bound(s_0 * M(T) / a_r)) (1 if a_r == 0), where M(T) = 1 + (5/4)*T >= sqrt((T-1)^2 + T^2/2),
// and integrate w_P_hi * P_sub(w) + w_H_hi * H_sub(w) via 2D Jet2 midpoint + MVT in w!

struct Sym2 { I a00, a01, a11; };
struct BlockPair { Sym2 re, im; };

static std::vector<double> make_origin_r_edges(double r_cut, int n1, int n2) {
  std::vector<double> e;
  e.reserve(n1 + n2 + 1);
  for (int i = 0; i <= n1; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n1);
    e.push_back((i == 0) ? 0.0 : (i == n1 ? 5.0 : 5.0 * std::pow(t, 2.2)));
  }
  for (int i = 1; i <= n2; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(n2);
    e.push_back((i == n2) ? r_cut : (5.0 + (r_cut - 5.0) * std::pow(t, 1.8)));
  }
  return e;
}

static BlockPair integrate_origin_slab(const RowConfig& R, I w_iv, double s_max, int n1, int n2, int nt) {
  require_fe_upward();
  double tail = certified_tail_coeff(R, w_iv.h, 25.0);
  auto re = make_origin_r_edges(25.0, n1, n2);
  int nr = static_cast<int>(re.size()) - 1;
  I w_mid = I(0.5) * (I(w_iv.l) + I(w_iv.h));
  I half_dw = I(0.5) * (I(w_iv.h) - I(w_iv.l));
  I dw_sym(-half_dw.h, half_dw.h);

  BlockPair res, dw_int;
  res.re.a00 = res.re.a01 = res.re.a11 = I(0.0);
  res.im.a00 = res.im.a01 = res.im.a11 = I(0.0);
  dw_int.re.a00 = dw_int.re.a01 = dw_int.re.a11 = I(0.0);
  dw_int.im.a00 = dw_int.im.a01 = dw_int.im.a11 = I(0.0);
  I inv_pi = I(1.0) / PI_IV, inv_24 = rat(1, 24);

  auto eval_lin_pt = [&](I r, I th, I w_p, double wP, double wH) {
    I ct = cos_on_0_pi(th), st = sin_on_0_pi(th);
    I yr = r * ct - w_p, yi = r * st;
    I T = solve_T_iv(R, sq(r - w_p) + I(2.0) * r * w_p * (I(1.0) - ct));
    I a0 = R.a + R.b * T, c0 = R.a + I(3.0) * R.b * T;
    I f2 = I(2.0) * expneg_iv(T) / (a0 * c0);
    I inv_a0 = I(1.0) / a0;
    I Zr = yr * inv_a0, Zi = yi * inv_a0;
    I z2r = (sq(Zr) - sq(Zi)) * R.inv_sqrt2;
    I z2i = (I(2.0) * Zr * Zi) * R.inv_sqrt2;
    I t0 = T - I(1.0);
    I hrA = (-st) * t0, hrB = (-st) * z2r + ct * z2i;
    I hiA = ct * t0, hiB = (-st) * z2i - ct * z2r;
    I z2_norm2 = sq(z2r) + sq(z2i);
    I cP(wP), cH(wH);
    BlockPair b;
    b.re.a00 = f2 * (cP * sq(t0) + cH * sq(hrA));
    b.re.a01 = f2 * (cP * t0 * z2r + cH * hrA * hrB);
    b.re.a11 = f2 * (cP * z2_norm2 + cH * sq(hrB));
    b.im.a00 = f2 * (cP * sq(t0) + cH * sq(hiA));
    b.im.a01 = f2 * (cP * t0 * (-z2r) + cH * hiA * hiB);
    b.im.a11 = f2 * (cP * z2_norm2 + cH * sq(hiB));
    return b;
  };
  auto eval_lin_jet = [&](const Jet2& r, const Jet2& th, const Jet2& w_j, double wP, double wH) {
    Jet2 ct = cos_j(th), st = sin_j(th);
    Jet2 yr = r * ct - w_j, yi = r * st;
    Jet2 T = solve_T_j(R, sq_j(r - w_j) + I(2.0) * (r * (w_j * (Jet2(I(1.0)) - ct))));
    Jet2 a0 = Jet2(R.a) + R.b * T, c0 = Jet2(R.a) + (I(3.0) * R.b) * T;
    Jet2 f2 = I(2.0) * expneg_j(T) * inv_j(a0 * c0);
    Jet2 inv_a0 = inv_j(a0);
    Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
    Jet2 z2r = R.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
    Jet2 z2i = (I(2.0) * R.inv_sqrt2) * (Zr * Zi);
    Jet2 t0 = T - I(1.0);
    Jet2 hrA = (-st) * t0, hrB = (-st) * z2r + ct * z2i;
    Jet2 hiA = ct * t0, hiB = (-st) * z2i - ct * z2r;
    Jet2 z2_norm2 = sq_j(z2r) + sq_j(z2i);
    I cP(wP), cH(wH);
    struct { Jet2 r00, r01, r11, i00, i01, i11; } o;
    o.r00 = f2 * (cP * sq_j(t0) + cH * sq_j(hrA));
    o.r01 = f2 * (cP * (t0 * z2r) + cH * (hrA * hrB));
    o.r11 = f2 * (cP * z2_norm2 + cH * sq_j(hrB));
    o.i00 = f2 * (cP * sq_j(t0) + cH * sq_j(hiA));
    o.i01 = f2 * (cP * (t0 * (-z2r)) + cH * (hiA * hiB));
    o.i11 = f2 * (cP * z2_norm2 + cH * sq_j(hiB));
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

      // Constant fixed weights (wP, wH) valid across the whole sub-box & w_iv:
      I ct_b = cos_on_0_pi(t_box);
      I T_b = solve_T_iv(R, sq(r_box - w_iv) + I(2.0) * r_box * w_iv * (I(1.0) - ct_b));
      I M_iv = I(1.0) + rat(5, 4) * T_b;  // M(T)^2 = 1 + 2.5 T + 1.5625 T^2 >= (T-1)^2 + T^2/2
      double eta_hi = 1.0;
      if (r_box.l > 0.0) {
        eta_hi = std::min(1.0, ((I(s_max) * M_iv) / I(r_box.l)).h);
      }
      I eta_pt(eta_hi);
      I denom = I(1.0) - eta_pt + sq(eta_pt);
      assert(denom.l >= 0.74);
      double wP_hi = (sq(eta_pt) / denom).h;
      double wH_hi = ((I(1.0) - sq(eta_pt)) / denom).h;

      auto mid = eval_lin_pt(r_mid, t_mid, w_mid, wP_hi, wH_hi);
      auto jr = eval_lin_jet(Jet2(r_box, I(1.0), I(0.0)), Jet2(t_box, I(0.0), I(0.0)), w_mid_j, wP_hi, wH_hi);
      auto jt = eval_lin_jet(Jet2(r_mid, I(0.0), I(0.0)), Jet2(t_box, I(1.0), I(0.0)), w_mid_j, wP_hi, wH_hi);
      auto jw = eval_lin_jet(Jet2(r_box), Jet2(t_box), w_der, wP_hi, wH_hi);
      res.re.a00 = res.re.a00 + area * (mid.re.a00 + inv_24 * (dr2 * jr.r00.d2 + dt2 * jt.r00.d2));
      res.re.a01 = res.re.a01 + area * (mid.re.a01 + inv_24 * (dr2 * jr.r01.d2 + dt2 * jt.r01.d2));
      res.re.a11 = res.re.a11 + area * (mid.re.a11 + inv_24 * (dr2 * jr.r11.d2 + dt2 * jt.r11.d2));
      res.im.a00 = res.im.a00 + area * (mid.im.a00 + inv_24 * (dr2 * jr.i00.d2 + dt2 * jt.i00.d2));
      res.im.a01 = res.im.a01 + area * (mid.im.a01 + inv_24 * (dr2 * jr.i01.d2 + dt2 * jt.i01.d2));
      res.im.a11 = res.im.a11 + area * (mid.im.a11 + inv_24 * (dr2 * jr.i11.d2 + dt2 * jt.i11.d2));
      dw_int.re.a00 = dw_int.re.a00 + area * jw.r00.d;
      dw_int.re.a01 = dw_int.re.a01 + area * jw.r01.d;
      dw_int.re.a11 = dw_int.re.a11 + area * jw.r11.d;
      dw_int.im.a00 = dw_int.im.a00 + area * jw.i00.d;
      dw_int.im.a01 = dw_int.im.a01 + area * jw.i01.d;
      dw_int.im.a11 = dw_int.im.a11 + area * jw.i11.d;
    }
  }
  res.re.a00 = res.re.a00 + dw_sym * dw_int.re.a00 + I(0.0, tail);
  res.re.a01 = res.re.a01 + dw_sym * dw_int.re.a01;
  res.re.a11 = res.re.a11 + dw_sym * dw_int.re.a11 + I(0.0, tail);
  res.im.a00 = res.im.a00 + dw_sym * dw_int.im.a00 + I(0.0, tail);
  res.im.a01 = res.im.a01 + dw_sym * dw_int.im.a01;
  res.im.a11 = res.im.a11 + dw_sym * dw_int.im.a11 + I(0.0, tail);
  return res;
}

static double psd_margin_2x2(I q00, I q01, I q11, const Sym2& M) {
  I d00 = q00 - M.a00, d11 = q11 - M.a11, d01 = q01 - M.a01;
  I tr = d00 + d11, diff = d00 - d11;
  I rad = sqrt_iv(I(0.25) * sq(diff) + sq(d01));
  return (I(0.5) * tr - rad).l;
}

// ============================================================================
// 6. Part 2: Self-Contained Global Shift Curvature -d^2/dw^2 r_w(v) <= 680 * S_0
//            and Per-Slab Base Shift Curvature N'', |C_A''|, |C_B''|
// ============================================================================
struct ShiftCurvGlobal {
  double cap_max, mass_sum, tail_mass;
};

static ShiftCurvGlobal certify_global_shift_curvature_680(const RowConfig& R) {
  require_fe_upward();
  // Linear envelope M(T) = 1 + (5/4)*T >= sqrt((T - 1)^2 + T^2/2):
  // M(T)^2 - ((T-1)^2 + T^2/2) = (9/2)*T + (1/16)*T^2 >= 0 for all T >= 0.
  auto Bbar = [&](I t) {
    I a0 = R.a + R.b * t, c0 = R.a + I(3.0) * R.b * t, D = a0 * c0;
    I M = I(1.0) + rat(5, 4) * t;
    I q = rat(5, 2);  // >= sqrt(6)
    I m = I(1.0) + R.b / a0 + (I(3.0) * R.b) / c0;
    return I(2.0) * M * q / sq(a0) * (I(1.0) + I(6.0) * R.b * t / a0)
         + I(8.0) * m * q * t * M / D
         + rat(1, 2) * ((sq(m) + sq(R.b / a0) + I(9.0) * sq(R.b / c0)) * (I(4.0) * t / sq(c0))
                        + I(2.0) * m / D) * sq(M);
  };
  double cap = 0.0, mass = 0.0;
  for (int j = 0; j < 36 * 256; ++j) {
    I t(j / 256.0, (j + 1) / 256.0);
    I B = Bbar(t);
    I e = expneg_iv(t);
    I D = (R.a + R.b * t) * (R.a + I(3.0) * R.b * t);
    cap = std::max(cap, (e * B / D).h);
    mass = add_up(mass, (e * B / 256.0).h);
  }
  // T >= 36 tail: M(T) = 1 + (5/4)T <= (23/18)T (since 1/36 + 5/4 = 46/36 = 23/18), m <= 19/18 => Bbar <= T / b^2:
  I q = rat(5, 2), m = rat(19, 18), tt(36.0), M_fac = rat(23, 18);
  I coeff = I(14.0) * M_fac * q / sq(tt) + (I(8.0) / I(3.0)) * M_fac * m * q / tt
          + rat(1, 2) * ((sq(m) + I(2.0) / sq(tt)) * (I(4.0) / I(9.0)) + I(2.0) * m / (I(3.0) * tt)) * sq(M_fac);
  assert(coeff.h < 1.0);
  I tail_m = I(37.0) * expneg_iv(tt) / sq(R.b);
  mass = add_up(mass, tail_m.h);
  cap = std::max(cap, (expneg_iv(tt) / (I(108.0) * sq(sq(R.b)))).h);
  assert((I(16.0) * I(cap) * I(mass)).h < 680.0 * 680.0);
  return {cap, mass, tail_m.h};
}

struct SlabCurv {
  double n_up, a2_up, b2_up;
};

static SlabCurv compute_slab_base_curv(const RowConfig& R, double wl, double wh) {
  require_fe_upward();
  I w_iv(wl, wh);
  I tt(25.0);
  assert(eval_H(R, tt).h <= sq(I(25.0) - I(wh)).l);
  // On T >= 25: M = 1 + (5/4)T <= (33/25)T (1/25 + 5/4 = 129/100 < 132/100 = 33/25), m <= 27/25:
  I m25 = rat(27, 25), q = rat(5, 2), M25 = rat(33, 25);
  I coeff25 = I(9.0) / sq(tt)
            + (I(4.0) * m25 * q / (I(3.0) * tt))
            + ((sq(m25) + I(2.0) / sq(tt)) * (I(4.0) / (I(9.0) * tt)) + I(2.0) * m25 / (I(3.0) * sq(tt))) * (M25 * tt);
  assert(coeff25.h < 2.0);
  I c_tail = (I(2.0) * expneg_iv(tt)) / sq(R.b);
  I n_tail = rat(2, 25) * expneg_iv(tt);  // 2 * E[(sin^2 th / r) 1_{r >= 25}] <= (2/25) * exp(-25)

  int nr = 96, nt = 48;
  std::vector<double> re(nr + 1);
  for (int i = 0; i <= nr; ++i) {
    double t = static_cast<double>(i) / static_cast<double>(nr);
    re[i] = (i == nr) ? 25.0 : (25.0 * std::pow(t, 1.8));
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
      Jet2 yr = Jet2(r_box * ct) - w_jet, yi(r_box * st), r_j(r_box);
      Jet2 T = solve_T_j(R, sq_j(r_j - w_jet) + (I(2.0) * r_box * (I(1.0) - ct)) * w_jet);
      Jet2 a0 = Jet2(R.a) + R.b * T, c0 = Jet2(R.a) + (I(3.0) * R.b) * T;
      Jet2 f = expneg_j(T) * inv_j(a0 * c0);
      Jet2 inv_a0 = inv_j(a0);
      Jet2 Zr = yr * inv_a0, Zi = yi * inv_a0;
      Jet2 z2r = R.inv_sqrt2 * (sq_j(Zr) - sq_j(Zi));
      Jet2 z2i = (I(2.0) * R.inv_sqrt2) * (Zr * Zi);
      sum_N = sum_N + area * (I(4.0) * f.v * sq(st));
      Jet2 gA = (I(2.0) * r_box * ct) * (f * (T - I(1.0)));
      Jet2 gB = (I(2.0) * r_box) * (f * (ct * z2r + st * z2i));
      sum_CA = sum_CA + area * gA.d2;
      sum_CB = sum_CB + area * gB.d2;
    }
  }
  return {(sum_N + n_tail).h, add_up(mag(sum_CA), c_tail.h), add_up(mag(sum_CB), c_tail.h)};
}

// ============================================================================
// 7. Part 3: 3D Ray-Convexity Cube Shells from r_0(x) up to r_M = 4
// ============================================================================
static constexpr int BOX_UNIT = 8192;  // 2^13: exact binary64 dyadic coords in [-8192, 8192]

struct Box3 {
  int ic[4], ihw[4];
  int fx;
};

using WcsVertexCache = std::unordered_map<uint64_t, std::pair<double, double>>;

static inline uint64_t pack_vcache_key(size_t li, const int iv[4]) {
  uint64_t u0 = static_cast<uint64_t>(iv[0] + BOX_UNIT);
  uint64_t u1 = static_cast<uint64_t>(iv[1] + BOX_UNIT);
  uint64_t u2 = static_cast<uint64_t>(iv[2] + BOX_UNIT);
  uint64_t u3 = static_cast<uint64_t>(iv[3] + BOX_UNIT);
  return u0 | (u1 << 15) | (u2 << 30) | (u3 << 45) | (static_cast<uint64_t>(li) << 60);
}

struct ShellResult {
  double r_m;
  int64_t closed_boxes;
  double worst_margin;
};

struct StageSpec {
  int r0_num, r1_num;
  int eta_num, eta_den;
  int rho_num, rho_den;
  std::vector<int> r_nums;
};

struct Stage3DOut {
  double r0, r1;
  int eta_num, eta_den;
  int rho_num, rho_den;
  int num_shells;
  int64_t boxes_S, boxes_D;
  double worst_S, worst_D;
};

struct Slab3DResult {
  double wl, wh;
  double n_up, a2_up, b2_up;
  std::vector<Stage3DOut> stages;
  int64_t total_boxes_S, total_boxes_D;
  double worst_margin_S, worst_margin_D;
};

static ShellResult certify_3d_shell_target(
    const RowConfig& R, double wl, double wh, double r_m, int eta_num, int eta_den,
    bool is_target_D, const SlabCurv& sc,
    const std::vector<WcsGrid>& gl, const std::vector<WcsGrid>& gh,
    WcsVertexCache& vcache) {
  require_fe_upward();
  const double scale = r_m / static_cast<double>(BOX_UNIT);
  // Assert exact binary64 dyadic scaling: scale * BOX_UNIT == r_m with zero rounding error.
  assert(scale * static_cast<double>(BOX_UNIT) == r_m);

  I one_minus_eta = I(1.0) - rat(eta_num, eta_den);
  I dw = I(wh) - I(wl);
  I dw2_8 = sq(dw) / I(8.0);
  I q_diag[4];
  if (is_target_D) {
    for (int j = 0; j < 4; ++j) q_diag[j] = one_minus_eta * R.qd_diag;
  } else {
    q_diag[0] = one_minus_eta * R.qs_AA;
    q_diag[1] = one_minus_eta * R.qs_BB;
    q_diag[2] = one_minus_eta * R.qs_AA;
    q_diag[3] = one_minus_eta * R.qs_BB;
  }

  std::vector<Box3> stk;
  stk.reserve(256);
  const int f_ax[7] = {0, 0, 1, 1, 2, 3, 3};
  const int f_sg[7] = {+1, -1, +1, -1, +1, +1, -1};
  for (int f = 0; f < 7; ++f) {
    Box3 b;
    b.fx = f_ax[f];
    for (int j = 0; j < 4; ++j) { b.ic[j] = 0; b.ihw[j] = BOX_UNIT; }
    b.ic[b.fx] = f_sg[f] * BOX_UNIT;
    b.ihw[b.fx] = 0;
    if (b.fx != 2) { b.ic[2] = BOX_UNIT / 2; b.ihw[2] = BOX_UNIT / 2; }
    stk.push_back(b);
  }

  const size_t li_start = (is_target_D && wl < 0.25 && r_m < 0.25 && gl.size() > 1) ? 1 : 0;
  int64_t closed = 0;
  double worst = -1e30;
  while (!stk.empty()) {
    Box3 b = stk.back();
    stk.pop_back();
    I Smax(0.0), e3(0.0);
    double ah[4], hw_d[4];
    for (int j = 0; j < 4; ++j) {
      double cj = static_cast<double>(b.ic[j]) * scale;
      hw_d[j] = static_cast<double>(b.ihw[j]) * scale;
      ah[j] = add_up(std::fabs(cj), hw_d[j]);
      Smax = Smax + sq(I(ah[j]));
      if (j != b.fx) e3 = e3 + q_diag[j] * sq(I(hw_d[j]));
    }
    int free_ax[3], fi = 0;
    for (int j = 0; j < 4; ++j) if (j != b.fx) free_ax[fi++] = j;

    // Sound coarse-box fast split: when the quadratic diagonal variation e3 exceeds the
    // plausible slack on B, split immediately without wasting fine-grid evaluations.
    double max_plausible_slack = (r_m <= 0.5 ? 0.16 : 0.40) * Smax.h;
    if (e3.h > max_plausible_slack) {
      int best_ax = free_ax[0];
      double best_sc = -1.0;
      for (int k = 0; k < 3; ++k) {
        int ax = free_ax[k];
        double sc_k = q_diag[ax].h * hw_d[ax] * hw_d[ax];
        if (sc_k > best_sc) { best_sc = sc_k; best_ax = ax; }
      }
      int inh = b.ihw[best_ax] / 2;
      assert(inh > 0);
      Box3 b1 = b, b2 = b;
      b1.ihw[best_ax] = inh; b1.ic[best_ax] = b.ic[best_ax] - inh;
      b2.ihw[best_ax] = inh; b2.ic[best_ax] = b.ic[best_ax] + inh;
      stk.push_back(b1);
      stk.push_back(b2);
      continue;
    }

    I mw1 = I(680.0) * Smax;
    I mw2 = I(sc.n_up) + I(2.0) * I(ah[0]) * I(sc.a2_up) + I(2.0) * I(ah[1]) * I(sc.b2_up);
    double w_err = (dw2_8 * I(std::min(mw1.h, mw2.h))).h;

    int icorners[8][4];
    double corners[8][4];
    double q_lo_arr[8];
    for (int mask = 0; mask < 8; ++mask) {
      for (int j = 0; j < 4; ++j) icorners[mask][j] = b.ic[j];
      for (int k = 0; k < 3; ++k) {
        int s = (mask & (1 << k)) ? +1 : -1;
        icorners[mask][free_ax[k]] = b.ic[free_ax[k]] + s * b.ihw[free_ax[k]];
      }
      for (int j = 0; j < 4; ++j) corners[mask][j] = static_cast<double>(icorners[mask][j]) * scale;
      q_lo_arr[mask] = (one_minus_eta * (is_target_D ? eval_Qdiag_iv(R, corners[mask]) : eval_Qs_plus_iv(R, corners[mask]))).l;
    }

    bool ok = false;
    double box_max = 1e30;
    size_t li_end = std::min(gl.size(), gh.size());
    for (size_t li = li_start; li < li_end; ++li) {
      if (li == 1 && li > li_start && e3.h > 0.08 * Smax.h) break;
      if (li == 2 && e3.h > 0.025 * Smax.h) break;
      double max_raw = -1e30;
      bool raw_fail = false;
      for (int m = 0; m < 8; ++m) {
        uint64_t key = pack_vcache_key(li, icorners[m]);
        std::pair<double, double> ub_lh;
        auto it = vcache.find(key);
        if (it != vcache.end()) {
          ub_lh = it->second;
        } else {
          ub_lh = {eval_wcs_ub(gl[li], corners[m]), eval_wcs_ub(gh[li], corners[m])};
          vcache.emplace(key, ub_lh);
        }
        double q_lo = q_lo_arr[m];
        double dl = sub_up(ub_lh.first, q_lo);
        if (dl > max_raw) max_raw = dl;
        if (add_up(dl, w_err) >= 0.0) { raw_fail = true; break; }
        double dh = sub_up(ub_lh.second, q_lo);
        if (dh > max_raw) max_raw = dh;
        if (add_up(dh, w_err) >= 0.0) { raw_fail = true; break; }
      }
      if (raw_fail) continue;
      double tot = add_up(add_up(max_raw, e3.h), w_err);
      if (tot < 0.0) { ok = true; box_max = tot; break; }
      double max_gain = (li == 0 ? 0.045 : 0.015) * Smax.h;
      if (tot - max_gain >= 0.0) break;
    }
    if (ok) {
      ++closed;
      if (box_max > worst) worst = box_max;
    } else {
      int best_ax = free_ax[0];
      double best_sc = -1.0;
      for (int k = 0; k < 3; ++k) {
        int ax = free_ax[k];
        double sc_k = q_diag[ax].h * hw_d[ax] * hw_d[ax];
        if (sc_k > best_sc) { best_sc = sc_k; best_ax = ax; }
      }
      int inh = b.ihw[best_ax] / 2;
      if (inh <= 0) {
        std::cerr << "SHELL STUCK row=" << R.name << " targetD=" << is_target_D
                  << " [" << wl << "," << wh << "] r_m=" << r_m << "\n";
        std::exit(1);
      }
      Box3 b1 = b, b2 = b;
      b1.ihw[best_ax] = inh; b1.ic[best_ax] = b.ic[best_ax] - inh;
      b2.ihw[best_ax] = inh; b2.ic[best_ax] = b.ic[best_ax] + inh;
      stk.push_back(b1);
      stk.push_back(b2);
    }
  }
  return {r_m, closed, worst};
}

// ============================================================================
// 8. Startup Self-Tests
// ============================================================================
static void run_self_tests(const RowConfig& R_peak) {
  require_fe_upward();
  I one_third = rat(1, 3);
  assert(one_third.l < one_third.h);
  assert(mul_up(one_third.l, 3.0) <= 1.0 && mul_dn(one_third.h, 3.0) >= 1.0);
  double rt_a = fp_b(1.1), rt_b = fp_b(1.3);
  assert(-((-rt_a) * rt_b) < rt_a * rt_b);
  I s2 = sqrt_iv(I(2.0));
  assert(sq(s2).l <= 2.0 && sq(s2).h >= 2.0 && (s2.h - s2.l) < 1e-14);
  I e1 = expneg_iv(I(1.0));
  assert(e1.l < 0.36787944117144233 && e1.h > 0.36787944117144233);
  // Jet2 finite-difference check near r = 0 and near y = 0:
  const double eps = 1e-4;
  for (double w : {0.0, 0.6}) {
    for (double r : {0.03, 0.6, 1.5}) {
      for (double th : {0.05, 1.1, 2.7}) {
        auto jr = eval_wcs_jet(R_peak, Jet2(I(r), I(1.0), I(0.0)), Jet2(I(th), I(0.0), I(0.0)), I(w));
        auto pm = eval_wcs_pt(R_peak, I(r - eps), I(th), I(w));
        auto p0 = eval_wcs_pt(R_peak, I(r), I(th), I(w));
        auto pp = eval_wcs_pt(R_peak, I(r + eps), I(th), I(w));
        double fd_d2 = (0.5 * (pp.fM[4].l + pp.fM[4].h) - (p0.fM[4].l + p0.fM[4].h) + 0.5 * (pm.fM[4].l + pm.fM[4].h)) / (eps * eps);
        assert(std::fabs(0.5 * (jr.fM[4].d2.l + jr.fM[4].d2.h) - fd_d2) < 1e-3 * (1.0 + std::fabs(fd_d2)));
      }
    }
  }
  // Exact benchmark 2*E|L| = 387*sqrt(pi)/500 ~ 1.3718792806 at peak w = 0:
  WcsGrid g0 = build_wcs_grid(R_peak, 0.0, 24, 12, 2, 2);
  double sumA = 0.0;
  for (const auto& c : g0.cells) sumA += c.A_hi;
  double two_EL = 4.0 * sumA;
  assert(two_EL >= 1.371879 && two_EL < 1.375);
  double z4[4] = {0.0, 0.0, 0.0, 0.0};
  assert(eval_wcs_ub(g0, z4) == 0.0);
  // Zero-core eigenvector check at w = 0: along (1, -0.184, 0, 0)*0.01, true cost is ~0.298365,
  // so U_WCS - (p - 0.31)*S_0 MUST be > 0 (since 0.31 > 0.298365!), while U_WCS - (p - 0.28)*S_0 < 0!
  WcsGrid g0_fine = build_wcs_grid(R_peak, 0.0, 64, 32, 2, 2);
  double v_eig[4] = {0.01, -0.00184, 0.0, 0.0};
  double S_eig = v_eig[0] * v_eig[0] + v_eig[1] * v_eig[1];
  double ub_eig = eval_wcs_ub(g0_fine, v_eig);
  assert(ub_eig < (R_peak.p.l - 0.28) * S_eig);
  assert(ub_eig > (R_peak.p.h - 0.31) * S_eig);
  std::cerr << "[self-test] PASS (FE_UPWARD, trig, expneg, Jet2 FD, 2E|L|=" << std::setprecision(9) << two_EL << ", zero-core eig)\n";
}

static std::string hex_f(double x) {
  std::ostringstream oss;
  oss << std::hexfloat << x;
  return oss.str();
}
static std::string sym2_json(const Sym2& m) {
  std::ostringstream oss;
  oss << "[\"" << hex_f(m.a00.l) << "\",\"" << hex_f(m.a00.h) << "\","
      << "\"" << hex_f(m.a01.l) << "\",\"" << hex_f(m.a01.h) << "\","
      << "\"" << hex_f(m.a11.l) << "\",\"" << hex_f(m.a11.h) << "\"]";
  return oss.str();
}

// Build exact dyadic integer radii over DEN = 262144 (from r0_num up to r1_num) with r_{k+1}/r_k <= rho_num/rho_den!
static StageSpec make_stage_spec(int r0_num, int r1_num, int eta_num, int eta_den, int rho_num, int rho_den) {
  assert(0 < r0_num && r0_num < r1_num && rho_num > rho_den && rho_den > 0);
  int64_t diff = rho_num - rho_den, sum = rho_num + rho_den;
  assert(diff * diff * eta_den <= sum * sum * eta_num);
  std::vector<int> out;
  int cur = r0_num;
  out.push_back(cur);
  while (cur < r1_num) {
    int nxt = static_cast<int>((static_cast<int64_t>(cur) * rho_num) / rho_den);
    assert(nxt > cur);
    if (nxt >= r1_num) nxt = r1_num;
    out.push_back(nxt);
    cur = nxt;
  }
  return {r0_num, r1_num, eta_num, eta_den, rho_num, rho_den, std::move(out)};
}

struct RowCertOut {
  RowConfig R;
  ShiftCurvGlobal sc_glob;
  struct OriOut { double wl, wh, s0; BlockPair K; double margin_S, margin_D; };
  std::vector<OriOut> ori_out;
  std::vector<Slab3DResult> s3_out;
  int64_t tot_boxes_S = 0, tot_boxes_D = 0;
  double worst_S = -1e30, worst_D = -1e30;
  double min_ori_S = 1e30, min_ori_D = 1e30;
};

static RowCertOut certify_row(const RowConfig& R, unsigned int nthreads) {
  std::cerr << "\n=== Certifying row [" << R.name << "] (kd=" << R.kd_num << "/" << R.kd_den << ") ===\n";
  RowCertOut out;
  out.R = R;

  // Part 1: Origin profile on [0, 3] (88 exact dyadic slabs):
  //   [0, 1/8]:   dw = 1/128 (16 slabs), s_0 = 1/4096 = 64/262144   (2*r_0 = 2*(32/262144) = 1/4096)
  //   [1/8, 1/4]: dw = 1/128 (16 slabs), s_0 = 1/2048 = 128/262144  (2*r_0 = 2*(64/262144) = 1/2048)
  //   [1/4, 1/2]: dw = 1/64  (16 slabs), s_0 = 1/256  = 1024/262144 (2*r_0 = 2*(512/262144) = 1/256)
  //   [1/2, 3]:   dw = 1/16  (40 slabs), s_0 = 1/64   = 4096/262144 (2*r_0 = 2*(2048/262144) = 1/64)
  struct OriSpec { double wl, wh, s0; };
  std::vector<OriSpec> ori_specs;
  auto add_ori = [&](int ns, int ne, double step, double s0) {
    for (int i = ns; i < ne; ++i)
      ori_specs.push_back({i * step, (i + 1) * step, s0});
  };
  add_ori(0, 16, 1.0 / 128.0, 1.0 / 4096.0);
  add_ori(16, 32, 1.0 / 128.0, 1.0 / 2048.0);
  add_ori(16, 32, 1.0 / 64.0, 1.0 / 256.0);
  add_ori(8, 48, 1.0 / 16.0, 1.0 / 64.0);

  out.ori_out.resize(ori_specs.size());
  {
    std::atomic<size_t> next_i{0};
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        set_fe_upward();
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= ori_specs.size()) break;
          auto sp = ori_specs[idx];
          BlockPair K = integrate_origin_slab(R, I(sp.wl, sp.wh), sp.s0, 240, 80, 64);
          double mS = std::min(psd_margin_2x2(R.qs_AA, R.qs_AB, R.qs_BB, K.re),
                               psd_margin_2x2(R.qs_AA, R.qs_AB, R.qs_BB, K.im));
          double mD = std::min(psd_margin_2x2(R.qd_diag, I(0.0), R.qd_diag, K.re),
                               psd_margin_2x2(R.qd_diag, I(0.0), R.qd_diag, K.im));
          if (!(mS > 0.0 && mD > 0.0)) {
            std::cerr << "ORIGIN FAIL row=" << R.name << " [" << sp.wl << "," << sp.wh
                      << "] s0=" << sp.s0 << " mS=" << mS << " mD=" << mD << "\n";
            std::exit(1);
          }
          out.ori_out[idx] = {sp.wl, sp.wh, sp.s0, K, mS, mD};
        }
      });
    }
    for (auto& th : workers) th.join();
  }
  for (const auto& oo : out.ori_out) {
    out.min_ori_S = std::min(out.min_ori_S, oo.margin_S);
    out.min_ori_D = std::min(out.min_ori_D, oo.margin_D);
  }
  std::cerr << "  [Part 1] PASS origin (" << out.ori_out.size() << " slabs): min_S=" << out.min_ori_S
            << ", min_D=" << out.min_ori_D << "\n";

  // Part 2: Global shift curvature 680
  out.sc_glob = certify_global_shift_curvature_680(R);
  std::cerr << "  [Part 2] PASS shift curvature 680: cap=" << out.sc_glob.cap_max
            << ", mass=" << out.sc_glob.mass_sum << "\n";

  // Part 3: 3D Ray-Convexity Shells on [0, 3] up to r_M = 4 (exact integer numerators over DEN = 262144 = 2^18):
  //   Band A: [0, 1/8],   dw = 1/256 (32 slabs):
  //           Stage 1 [32, 65536]     (r in [1/8192, 1/4]):  eta = 1/400, rho = 11/10
  //           Stage 2 [65536, 131072] (r in [1/4, 1/2]):     eta = 1/144, rho = 7/6
  //           Stage 3 [131072, 1048576] (r in [1/2, 4]):     eta = 1/25,  rho = 3/2
  //   Band B: [1/8, 1/4], dw = 1/128 (16 slabs):
  //           Stage 1 [64, 65536]     (r in [1/4096, 1/4]):  eta = 1/324, rho = 19/17
  //           Stage 2 [65536, 131072] (r in [1/4, 1/2]):     eta = 1/144, rho = 7/6
  //           Stage 3 [131072, 1048576] (r in [1/2, 4]):     eta = 1/25,  rho = 3/2
  //   Band C: [1/4, 1/2], dw = 1/64  (16 slabs):
  //           Stage 1 [512, 131072]   (r in [1/512, 1/2]):   eta = 1/81,  rho = 5/4
  //           Stage 2 [131072, 1048576] (r in [1/2, 4]):     eta = 1/25,  rho = 3/2
  //   Band D: [1/2, 3],   dw = 1/32  (80 slabs):             eta = 1/25,  rho = 3/2 ([2048, 1048576])
  const int R_END = 4 * 262144;
  struct SlabSpec {
    double wl, wh;
    std::vector<StageSpec> stages;
  };
  std::vector<StageSpec> st_A = {
      make_stage_spec(32, 65536, 1, 400, 11, 10),
      make_stage_spec(65536, 131072, 1, 144, 7, 6),
      make_stage_spec(131072, R_END, 1, 25, 3, 2),
  };
  std::vector<StageSpec> st_B = {
      make_stage_spec(64, 65536, 1, 324, 19, 17),
      make_stage_spec(65536, 131072, 1, 144, 7, 6),
      make_stage_spec(131072, R_END, 1, 25, 3, 2),
  };
  std::vector<StageSpec> st_C = {
      make_stage_spec(512, 131072, 1, 81, 5, 4),
      make_stage_spec(131072, R_END, 1, 25, 3, 2),
  };
  std::vector<StageSpec> st_D = {make_stage_spec(2048, R_END, 1, 25, 3, 2)};

  std::vector<SlabSpec> specs;
  for (int i = 0; i < 32; ++i) specs.push_back({i / 256.0, (i + 1) / 256.0, st_A});
  for (int i = 16; i < 32; ++i) specs.push_back({i / 128.0, (i + 1) / 128.0, st_B});
  for (int i = 16; i < 32; ++i) specs.push_back({i / 64.0, (i + 1) / 64.0, st_C});
  for (int i = 16; i < 96; ++i) specs.push_back({i / 32.0, (i + 1) / 32.0, st_D});

  // Prebuild unique endpoint WCS grids once per row in parallel (113 unique endpoints for 112 contiguous slabs):
  std::vector<double> w_pts(specs.size() + 1);
  for (size_t i = 0; i < specs.size(); ++i) {
    if (i > 0) assert(specs[i].wl == specs[i - 1].wh);
    w_pts[i] = specs[i].wl;
  }
  w_pts[specs.size()] = specs.back().wh;
  std::vector<std::vector<WcsGrid>> end_grids(w_pts.size());
  {
    std::atomic<size_t> next_p{0};
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        set_fe_upward();
        while (true) {
          size_t pi = next_p.fetch_add(1);
          if (pi >= w_pts.size()) break;
          double w = w_pts[pi];
          std::vector<WcsGrid> gs;
          gs.push_back(build_wcs_grid(R, w, 24, 12, 2, 2));
          gs.push_back(build_wcs_grid(R, w, 48, 24, 2, 2));
          if (w <= 0.5) gs.push_back(build_wcs_grid(R, w, 68, 32, 2, 2));
          end_grids[pi] = std::move(gs);
        }
      });
    }
    for (auto& th : workers) th.join();
  }

  out.s3_out.resize(specs.size());
  {
    std::atomic<size_t> next_i{0}, done_i{0};
    std::vector<std::thread> workers;
    for (unsigned t = 0; t < nthreads; ++t) {
      workers.emplace_back([&]() {
        set_fe_upward();
        while (true) {
          size_t idx = next_i.fetch_add(1);
          if (idx >= specs.size()) break;
          const auto& sp = specs[idx];
          SlabCurv sc = compute_slab_base_curv(R, sp.wl, sp.wh);
          const auto& gl = end_grids[idx];
          const auto& gh = end_grids[idx + 1];
          Slab3DResult r{};
          r.wl = sp.wl; r.wh = sp.wh;
          r.n_up = sc.n_up; r.a2_up = sc.a2_up; r.b2_up = sc.b2_up;
          r.worst_margin_S = -1e30; r.worst_margin_D = -1e30;

          // Cache WCS evaluations per radius r_m across stages (boundary shell), faces, and Target S / D!
          int prev_rn = -1;
          WcsVertexCache vcache;
          vcache.reserve(2048);

          for (const auto& st : sp.stages) {
            Stage3DOut sout{};
            sout.r0 = static_cast<double>(st.r0_num) / 262144.0;
            sout.r1 = static_cast<double>(st.r1_num) / 262144.0;
            sout.eta_num = st.eta_num; sout.eta_den = st.eta_den;
            sout.rho_num = st.rho_num; sout.rho_den = st.rho_den;
            sout.num_shells = static_cast<int>(st.r_nums.size());
            sout.boxes_S = 0; sout.boxes_D = 0;
            sout.worst_S = -1e30; sout.worst_D = -1e30;
            for (int rn : st.r_nums) {
              if (rn != prev_rn) {
                vcache.clear();
                prev_rn = rn;
              }
              double rm = static_cast<double>(rn) / 262144.0;
              auto srS = certify_3d_shell_target(R, sp.wl, sp.wh, rm, st.eta_num, st.eta_den, false, sc, gl, gh, vcache);
              auto srD = certify_3d_shell_target(R, sp.wl, sp.wh, rm, st.eta_num, st.eta_den, true, sc, gl, gh, vcache);
              sout.boxes_S += srS.closed_boxes;
              sout.boxes_D += srD.closed_boxes;
              sout.worst_S = std::max(sout.worst_S, srS.worst_margin);
              sout.worst_D = std::max(sout.worst_D, srD.worst_margin);
            }
            r.total_boxes_S += sout.boxes_S;
            r.total_boxes_D += sout.boxes_D;
            r.worst_margin_S = std::max(r.worst_margin_S, sout.worst_S);
            r.worst_margin_D = std::max(r.worst_margin_D, sout.worst_D);
            r.stages.push_back(sout);
          }
          out.s3_out[idx] = std::move(r);
          size_t d = done_i.fetch_add(1) + 1;
          if (d % 16 == 0 || d == specs.size()) {
            std::cerr << "  [Part 3 " << R.name << "] progress " << d << "/" << specs.size() << "\n";
          }
        }
      });
    }
    for (auto& th : workers) th.join();
  }
  for (const auto& r : out.s3_out) {
    out.tot_boxes_S += r.total_boxes_S;
    out.tot_boxes_D += r.total_boxes_D;
    out.worst_S = std::max(out.worst_S, r.worst_margin_S);
    out.worst_D = std::max(out.worst_D, r.worst_margin_D);
  }
  std::cerr << "  [Part 3] PASS (" << out.s3_out.size() << " slabs): boxes_S=" << out.tot_boxes_S
            << " (worst=" << out.worst_S << "), boxes_D=" << out.tot_boxes_D
            << " (worst=" << out.worst_D << ")\n";
  return out;
}

int main(int argc, char** argv) {
  set_fe_upward();
  std::vector<RowConfig> rows = {
      make_row("peak",  699, 1250, 179,  1250,  1891, 2500, 7,  25),   // kd = 0.28
      make_row("flank", 14,  25,   1467, 10000, 149,  200,  3,  10),   // kd = 0.30
      make_row("upper", 573, 1000, 19,   125,   1891, 2500, 31, 100),  // kd = 0.31
  };
  run_self_tests(rows[0]);

  std::string out_path = "result.json";
  bool control_false_hotspot = false;
  std::string single_row = "";
  for (int i = 1; i < argc; ++i) {
    if (std::string(argv[i]) == "--output" && i + 1 < argc) out_path = argv[++i];
    if (std::string(argv[i]) == "--control-false-hotspot") control_false_hotspot = true;
    if (std::string(argv[i]) == "--row" && i + 1 < argc) single_row = argv[++i];
  }

  if (control_false_hotspot) {
    // Negative control: at w = 0 and the zero-core eigen-direction (0.05, -0.0092, 0, 0),
    // true peak cost is ~0.2984, so Target D (kd = 0.28) passes (< 0), whereas a false target kd_false = 0.31
    // (> 0.298365, violating 7.4.9!) MUST fail (> 0)!
    WcsGrid g0 = build_wcs_grid(rows[0], 0.0, 64, 32, 2, 2);
    double vhot[4] = {0.05, -0.0092, 0.0, 0.0};
    double S0 = vhot[0] * vhot[0] + vhot[1] * vhot[1];
    double ub = eval_wcs_ub(g0, vhot);
    double true_q = eval_Qdiag_iv(rows[0], vhot).l;
    double false_q = (rows[0].p.h - 0.31) * S0;
    double diff_true = sub_up(ub, true_q);
    double diff_false = sub_dn(ub, false_q);
    std::cout << "CONTROL_HOTSPOT diff_true=" << std::setprecision(9) << diff_true
              << " diff_false_031=" << diff_false << "\n";
    if (!(diff_true < 0.0 && diff_false > 0.0)) return 2;
    return 0;
  }

  unsigned int nthreads = std::max(1u, std::min(8u, std::thread::hardware_concurrency()));
  std::vector<RowCertOut> results;
  for (const auto& R : rows) {
    if (!single_row.empty() && R.name != single_row) continue;
    results.push_back(certify_row(R, nthreads));
  }

  std::ofstream ofs(out_path);
  assert(ofs.good());
  ofs << "{\n";
  ofs << "  \"format\": \"raw-joint-ab-v1\",\n";
  ofs << "  \"self_tests_passed\": true,\n";
  ofs << "  \"slab_shift_max\": \"" << hex_f(3.0) << "\",\n";
  ofs << "  \"rational_tail_cutoff\": [29, 10],\n";
  ofs << "  \"amplitude_shell_max\": \"" << hex_f(4.0) << "\",\n";
  ofs << "  \"signed_reserve\": [1, 100],\n";
  ofs << "  \"rows\": [\n";
  for (size_t ri = 0; ri < results.size(); ++ri) {
    const auto& rc = results[ri];
    ofs << "    {\n";
    ofs << "      \"name\": \"" << rc.R.name << "\",\n";
    ofs << "      \"a\": [" << rc.R.a_num << ", " << rc.R.a_den << "],\n";
    ofs << "      \"b\": [" << rc.R.b_num << ", " << rc.R.b_den << "],\n";
    ofs << "      \"eps\": [" << rc.R.eps_num << ", " << rc.R.eps_den << "],\n";
    ofs << "      \"kappa_diag\": [" << rc.R.kd_num << ", " << rc.R.kd_den << "],\n";
    ofs << "      \"part1_origin_slabs\": [\n";
    for (size_t i = 0; i < rc.ori_out.size(); ++i) {
      const auto& oo = rc.ori_out[i];
      ofs << "  {\"wl\":\"" << hex_f(oo.wl) << "\",\"wh\":\"" << hex_f(oo.wh)
          << "\",\"s0\":\"" << hex_f(oo.s0)
          << "\",\"K_re\":" << sym2_json(oo.K.re) << ",\"K_im\":" << sym2_json(oo.K.im) << "}"
          << (i + 1 < rc.ori_out.size() ? "," : "") << "\n";
    }
    ofs << "      ],\n";
    ofs << "      \"part2_shift_curvature\": {\"cap_max\":\"" << hex_f(rc.sc_glob.cap_max)
        << "\",\"mass_sum\":\"" << hex_f(rc.sc_glob.mass_sum)
        << "\",\"tail_mass\":\"" << hex_f(rc.sc_glob.tail_mass) << "\",\"constant\":680},\n";
    ofs << "      \"part3_ray_shells\": [\n";
    for (size_t i = 0; i < rc.s3_out.size(); ++i) {
      const auto& s = rc.s3_out[i];
      ofs << "  {\"wl\":\"" << hex_f(s.wl) << "\",\"wh\":\"" << hex_f(s.wh)
          << "\",\"n_up\":\"" << hex_f(s.n_up) << "\",\"a2_up\":\"" << hex_f(s.a2_up) << "\",\"b2_up\":\"" << hex_f(s.b2_up)
          << "\",\"open_boxes\":0,\"stages\":[";
      for (size_t si = 0; si < s.stages.size(); ++si) {
        const auto& st = s.stages[si];
        ofs << "[\"" << hex_f(st.r0) << "\",\"" << hex_f(st.r1)
            << "\",[" << st.eta_num << "," << st.eta_den
            << "],[" << st.rho_num << "," << st.rho_den
            << "]," << st.num_shells
            << "," << st.boxes_S << "," << st.boxes_D
            << ",\"" << hex_f(st.worst_S) << "\",\"" << hex_f(st.worst_D) << "\"]"
            << (si + 1 < s.stages.size() ? "," : "");
      }
      ofs << "]}" << (i + 1 < rc.s3_out.size() ? "," : "") << "\n";
    }
    ofs << "      ],\n";
    ofs << "      \"summary\": {\"total_boxes_S\":" << rc.tot_boxes_S
        << ",\"total_boxes_D\":" << rc.tot_boxes_D
        << ",\"worst_S\":\"" << hex_f(rc.worst_S)
        << "\",\"worst_D\":\"" << hex_f(rc.worst_D)
        << "\",\"min_origin_S\":\"" << hex_f(rc.min_ori_S)
        << "\",\"min_origin_D\":\"" << hex_f(rc.min_ori_D) << "\"}\n";
    ofs << "    }" << (ri + 1 < results.size() ? "," : "") << "\n";
  }
  ofs << "  ]\n";
  ofs << "}\n";
  ofs.close();
  std::cerr << "\n[certify_raw_joint_ab] ALL ROWS DONE -> " << out_path << "\n";
  return 0;
}
