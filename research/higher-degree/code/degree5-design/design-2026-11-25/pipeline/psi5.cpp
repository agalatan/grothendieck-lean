// psi5.cpp -- rigorous enclosure of the degree-5 q-only potential
//   Psi5(s; nu) = E|A+| + E|A-| = 2 E|A+|,   A+(z) = L(z) + nu e32(z) + s D(z),
//   L = z (l + beta(|z|^2 - 2)),  e32 = z(|z|^4 - 6|z|^2 + 6)/sqrt(12),  D = 1 - bA(|z|^2 - 1) - bB z^2/sqrt(2),
// z a standard complex Gaussian (density exp(-|z|^2)/pi).  claude-b9ee d5cert worker, 16 Nov 2026.
//
// Method (C = interval-certified).  E|A-| = E|A+| because A-(-z) = -A+(z); |A+(conj z)| = |A+(z)| for real
// parameters.  So Psi5 = 4 * integral over the upper half plane y >= 0 of |A+(x+iy)| exp(-x^2-y^2)/pi dx dy.
// The square [-R,R] x [0,R] (R = 13/2) is covered by cells; each cell is either
//   (a) integrated by an N x N tensor Gauss-Legendre rule with the error bound
//       |I - Q| <= (16/3) rho^(2-2N)/(rho^2-1) * 2 hx hy (Mx + My)
//       (Chebyshev-coefficient bound |a_k| <= 2M rho^-k; P, see CERT_STAGE1.md), where Mx bounds |f| for
//       x in the Bernstein ellipse E_rho of the x-interval and real y in the cell, My symmetrically; analyticity
//       holds because P = R^2 + Im^2 (the continuation of |A|^2) is checked zero-free on boxes covering those
//       sets (f = sqrt(P) exp(-x^2-y^2)/pi then has an analytic branch, positive on the real cell); or
//   (b) bounded crudely by [0, area * sup f] (f >= 0), when that is below the tolerance or at the depth limit.
// The outside of the square (|z| > R) is bounded in the Python driver (Arb incomplete gamma).
// Arithmetic: intervals of binary64 with one-ulp outward widening after every correctly rounded IEEE operation
// (+, -, *, /, sqrt); exp by range reduction with an Arb enclosure of ln 2 and a Taylor polynomial with remainder;
// Gauss-Legendre nodes/weights and 1/pi are Arb enclosures (glconsts.h).  Compile with -ffp-contract=off.
//
// Input (stdin): first line  l_num l_den beta_num beta_den bA_num bA_den bB_num bB_den
//                then lines   s_num s_den nu_num nu_den      (all |num|, den < 2^53)
// Output: one line per node:  s_num/s_den nu_num/nu_den lo_hex hi_hex  (enclosure of the square part of Psi5)
//         followed by cells, point evaluations and failures.
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstdint>
#include <cstring>
#include <algorithm>
#include <vector>
#include "glconsts.h"

// one-ulp outward steps by bit manipulation (equivalent to nextafter toward -inf / +inf for finite x)
static inline double up(double x) {
  if (!(x < INFINITY)) return x;                        // +inf or NaN
  if (x == 0.0) return 4.9406564584124654e-324;         // smallest positive subnormal
  uint64_t b; std::memcpy(&b, &x, 8);
  b = (x > 0) ? b + 1 : b - 1;
  double r; std::memcpy(&r, &b, 8); return r;
}
static inline double dn(double x) { return -up(-x); }

struct I { double lo, hi; };
static inline I iv(double a) { return {a, a}; }
static inline I add(I a, I b) { return {dn(a.lo + b.lo), up(a.hi + b.hi)}; }
static inline I sub(I a, I b) { return {dn(a.lo - b.hi), up(a.hi - b.lo)}; }
static inline I neg(I a) { return {-a.hi, -a.lo}; }
static inline I mul(I a, I b) {
  double p1 = a.lo * b.lo, p2 = a.lo * b.hi, p3 = a.hi * b.lo, p4 = a.hi * b.hi;
  return {dn(std::min(std::min(p1, p2), std::min(p3, p4))), up(std::max(std::max(p1, p2), std::max(p3, p4)))};
}
static inline I sqr(I a) {
  if (a.lo >= 0) return {dn(a.lo * a.lo), up(a.hi * a.hi)};
  if (a.hi <= 0) return {dn(a.hi * a.hi), up(a.lo * a.lo)};
  double m = std::max(-a.lo, a.hi);
  return {0.0, up(m * m)};
}
static inline I dvd(I a, I b) {
  if (!(b.lo > 0 || b.hi < 0)) { fprintf(stderr, "division by interval containing 0\n"); exit(2); }
  double p1 = a.lo / b.lo, p2 = a.lo / b.hi, p3 = a.hi / b.lo, p4 = a.hi / b.hi;
  return {dn(std::min(std::min(p1, p2), std::min(p3, p4))), up(std::max(std::max(p1, p2), std::max(p3, p4)))};
}
static inline I isqrt(I a) {
  if (a.hi < 0) { fprintf(stderr, "sqrt of negative interval\n"); exit(2); }
  double lo = a.lo <= 0 ? 0.0 : std::max(0.0, dn(std::sqrt(a.lo)));
  return {lo, up(std::sqrt(a.hi))};
}
static inline I scal(double c, I a) { return mul(iv(c), a); }   // c exact double
static inline double mag(I a) { return std::max(std::fabs(a.lo), std::fabs(a.hi)); }
static inline bool finite(I a) { return std::isfinite(a.lo) && std::isfinite(a.hi); }

// ---- rigorous exp -------------------------------------------------------------------------------------------
static I LN2, INVPI, INVFACT[30];
static void init_exp() {
  LN2 = {LN2_LO, LN2_HI};
  INVPI = {INVPI_LO, INVPI_HI};
  INVFACT[0] = iv(1.0);
  for (int j = 1; j < 30; j++) INVFACT[j] = dvd(INVFACT[j - 1], iv((double)j));
}
// enclosure of exp(x) for a double x (|x| <= 700)
static I exp_point(double x) {
  if (x < -700) return {0.0, 1e-300};
  double k = std::nearbyint(x / 0.6931471805599453);
  I r = sub(iv(x), mul(iv(k), LN2));                 // |r| <= 0.35 + tiny
  if (mag(r) > 0.4) { fprintf(stderr, "exp reduction failed\n"); exit(2); }
  const int N = 24;
  I s = INVFACT[N];
  for (int j = N - 1; j >= 0; j--) s = add(mul(s, r), INVFACT[j]);
  // remainder |r|^(N+1)/(N+1)! * e^|r| <= |r|^25/25! * 1.5
  double m = mag(r);
  double rem = 1.5;
  for (int j = 0; j < N + 1; j++) rem = up(rem * m);
  rem = up(rem * INVFACT[N + 1].hi);
  s = {dn(s.lo - rem), up(s.hi + rem)};
  int ki = (int)k;
  return {std::ldexp(s.lo, ki), std::ldexp(s.hi, ki)};   // exact scaling by 2^k (no underflow for |x| <= 700)
}
static inline I iexp(I a) { return {exp_point(a.lo).lo, exp_point(a.hi).hi}; }

// ---- complex intervals --------------------------------------------------------------------------------------
struct C { I re, im; };
static inline C cadd(C a, C b) { return {add(a.re, b.re), add(a.im, b.im)}; }
static inline C csub(C a, C b) { return {sub(a.re, b.re), sub(a.im, b.im)}; }
static inline C cmul(C a, C b) { return {sub(mul(a.re, b.re), mul(a.im, b.im)), add(mul(a.re, b.im), mul(a.im, b.re))}; }
static inline C csqr(C a) { return {sub(sqr(a.re), sqr(a.im)), scal(2.0, mul(a.re, a.im))}; }
static inline C crs(I r, C a) { return {mul(r, a.re), mul(r, a.im)}; }      // real interval times complex
static inline C caddr(C a, I r) { return {add(a.re, r), a.im}; }
static inline double cmag(C a) {  // upper bound of |a|
  double r = mag(a.re), i = mag(a.im);
  return up(std::sqrt(up(up(r * r) + up(i * i))));
}
static inline bool cnozero(C a) { return a.re.lo > 0 || a.re.hi < 0 || a.im.lo > 0 || a.im.hi < 0; }

// ---- the row -------------------------------------------------------------------------------------------------
struct Par { I l, beta, bA, s, nk, c; };   // nk = nu/sqrt(12), c = s*bB/sqrt(2)
static Par P;
static I two, six, one;

static I rat(long long n, long long d) {
  if (std::llabs(n) >= (1LL << 53) || d <= 0 || d >= (1LL << 53)) { fprintf(stderr, "bad rational\n"); exit(2); }
  return dvd(iv((double)n), iv((double)d));
}

// |A+(x+iy)| on real intervals, with X2 = x^2, Y2 = y^2 supplied
static inline I absA_pre(I x, I X2, I y, I Y2) {
  I T = add(X2, Y2);
  I g = add(add(P.l, mul(P.beta, sub(T, two))), mul(P.nk, add(sub(sqr(T), mul(six, T)), six)));
  I h = sub(one, mul(P.bA, sub(T, one)));
  I R = sub(add(mul(x, g), mul(P.s, h)), mul(P.c, sub(X2, Y2)));
  I Im = sub(mul(y, g), scal(2.0, mul(P.c, mul(x, y))));
  return isqrt(add(sqr(R), sqr(Im)));
}
// real integrand f(x,y) = |A+(x+iy)| exp(-x^2-y^2)/pi on real intervals
static I f_real(I x, I y) {
  I X2 = sqr(x), Y2 = sqr(y), T = add(X2, Y2);
  I g = add(add(P.l, mul(P.beta, sub(T, two))), mul(P.nk, add(sub(sqr(T), mul(six, T)), six)));
  I h = sub(one, mul(P.bA, sub(T, one)));
  I R = sub(add(mul(x, g), mul(P.s, h)), mul(P.c, sub(X2, Y2)));
  I Im = sub(mul(y, g), scal(2.0, mul(P.c, mul(x, y))));
  I absA = isqrt(add(sqr(R), sqr(Im)));
  I w = mul(iexp(neg(T)), INVPI);
  return mul(absA, w);
}
// complex continuation: returns P = R^2 + Im^2 and Re(T) (for the weight bound)
static void p_cplx(C x, C y, C &Pz, I &ReT) {
  C X2 = csqr(x), Y2 = csqr(y), T = cadd(X2, Y2);
  C g = caddr(cadd(crs(P.beta, caddr(T, neg(two))), crs(P.nk, caddr(csub(csqr(T), crs(six, T)), six))), P.l);
  C h = caddr(crs(neg(P.bA), caddr(T, neg(one))), one);
  C R = csub(cadd(cmul(x, g), crs(P.s, h)), crs(P.c, csub(X2, Y2)));
  C Im = csub(cmul(y, g), crs(scal(2.0, P.c), cmul(x, y)));
  Pz = cadd(csqr(R), csqr(Im));
  ReT = T.re;
}

static long long n_evals = 0, n_cells = 0, n_crude = 0, n_fail_depth = 0;

// sup of |f| over X (complex box) x Y (complex box), split adaptively; returns -1 if P may vanish
static double bound_box(C X, C Y, int depth) {
  C Pz; I ReT;
  p_cplx(X, Y, Pz, ReT);
  n_evals++;
  if (cnozero(Pz)) {
    double sq = up(std::sqrt(cmag(Pz)));
    double e = exp_point(-ReT.lo).hi;
    return up(up(sq * e) * INVPI.hi);
  }
  if (depth <= 0) return -1;
  // split the widest of the four real dimensions
  double w[4] = {X.re.hi - X.re.lo, X.im.hi - X.im.lo, Y.re.hi - Y.re.lo, Y.im.hi - Y.im.lo};
  int k = (int)(std::max_element(w, w + 4) - w);
  C X1 = X, X2 = X, Y1 = Y, Y2 = Y;
  auto split = [](I a, I &l, I &r) { double m = 0.5 * (a.lo + a.hi); l = {a.lo, m}; r = {m, a.hi}; };
  if (k == 0) split(X.re, X1.re, X2.re);
  else if (k == 1) split(X.im, X1.im, X2.im);
  else if (k == 2) split(Y.re, Y1.re, Y2.re);
  else split(Y.im, Y1.im, Y2.im);
  double b1 = (k < 2) ? bound_box(X1, Y, depth - 1) : bound_box(X, Y1, depth - 1);
  if (b1 < 0) return -1;
  double b2 = (k < 2) ? bound_box(X2, Y, depth - 1) : bound_box(X, Y2, depth - 1);
  if (b2 < 0) return -1;
  return std::max(b1, b2);
}

static I total = {0.0, 0.0};
static double TOLD = 1e-12;   // error tolerance per unit area
static int MAXDEPTH = 18;

static void accumulate(I v) { total = add(total, v); }

static double ellipse_ext(double h, double rho, bool imag) {  // upper bound of the half-extent of h*E_rho
  double a = imag ? up(rho - dn(1.0 / rho)) : up(rho + up(1.0 / rho));
  return up(up(0.5 * a) * h);
}

static void cell(double x1, double x2, double y1, double y2, int depth) {
  n_cells++;
  I X = {x1, x2}, Y = {y1, y2};
  double area = (x2 - x1) * (y2 - y1);  // exact enough: used only for tolerance and crude bound (rounded up below)
  I fs = f_real(X, Y);
  n_evals++;
  double crude = up(up(up(x2 - x1) * up(y2 - y1)) * fs.hi);
  double tol = TOLD * area;
  if (crude <= tol || depth >= MAXDEPTH) {
    if (depth >= MAXDEPTH && crude > tol) n_fail_depth++;
    n_crude++;
    accumulate({0.0, crude});
    return;
  }
  double hx = 0.5 * (x2 - x1), hy = 0.5 * (y2 - y1), cx = 0.5 * (x1 + x2), cy = 0.5 * (y1 + y2);
  static const double RHOS[3] = {4.0, 2.5, 1.6};
  for (double rho : RHOS) {
    // Mx: x in E_rho (upper half suffices by conjugation symmetry), y real in [y1,y2]
    double ax = ellipse_ext(hx, rho, false), bx = ellipse_ext(hx, rho, true);
    C Xb = {{dn(cx - ax), up(cx + ax)}, {0.0, bx}};
    C Yr = {Y, {0.0, 0.0}};
    double Mx = bound_box(Xb, Yr, 6);
    if (Mx < 0) continue;
    double ay = ellipse_ext(hy, rho, false), by = ellipse_ext(hy, rho, true);
    C Yb = {{dn(cy - ay), up(cy + ay)}, {0.0, by}};
    C Xr = {X, {0.0, 0.0}};
    double My = bound_box(Xr, Yb, 6);
    if (My < 0) continue;
    for (int t = 0; t < 9; t++) {
      int N = GL_NS[t];
      if (N < 6) continue;
      // E = (16/3) rho^(2-2N)/(rho^2-1) * 2 hx hy (Mx+My), evaluated with upward rounding
      double rp = 1.0;
      for (int j = 0; j < 2 * N - 2; j++) rp = up(rp / rho);         // upper bound of rho^(2-2N)
      double E = up(up(16.0 * rp) / 3.0);
      E = up(E / dn(dn(rho * rho) - 1.0));                               // divide by a lower bound of rho^2-1
      E = up(E * up(2.0 * up(hx * hy)));
      E = up(E * up(Mx + My));
      if (E <= tol) {
        const double *gx = GLX_[t], *gw = GLW_[t];
        I hX = iv(hx), hY = iv(hy), cX = iv(cx), cY = iv(cy);
        I Q = {0.0, 0.0};
        std::vector<I> xs(N), ys(N), wx(N);
        std::vector<I> x2(N), y2(N), ex(N), ey(N);
        for (int i = 0; i < N; i++) {
          I ti = {gx[2 * i], gx[2 * i + 1]};
          xs[i] = add(cX, mul(hX, ti));
          ys[i] = add(cY, mul(hY, ti));
          wx[i] = {gw[2 * i], gw[2 * i + 1]};
          x2[i] = sqr(xs[i]); y2[i] = sqr(ys[i]);
          ex[i] = mul(iexp(neg(x2[i])), wx[i]);     // w_i exp(-x_i^2)
          ey[i] = mul(iexp(neg(y2[i])), wx[i]);     // w_j exp(-y_j^2)
        }
        for (int i = 0; i < N; i++) {
          I acc = {0.0, 0.0};
          for (int j = 0; j < N; j++) acc = add(acc, mul(ey[j], absA_pre(xs[i], x2[i], ys[j], y2[j])));
          Q = add(Q, mul(ex[i], acc));
        }
        Q = mul(Q, INVPI);
        n_evals += (long long)N * N;
        Q = mul(Q, mul(hX, hY));
        accumulate({dn(Q.lo - E), up(Q.hi + E)});
        return;
      }
    }
  }
  // subdivide
  double mx = 0.5 * (x1 + x2), my = 0.5 * (y1 + y2);
  cell(x1, mx, y1, my, depth + 1);
  cell(mx, x2, y1, my, depth + 1);
  cell(x1, mx, my, y2, depth + 1);
  cell(mx, x2, my, y2, depth + 1);
}

int main(int argc, char **argv) {
  init_exp();
  two = iv(2.0); six = iv(6.0); one = iv(1.0);
  if (argc > 1) TOLD = atof(argv[1]);
  if (argc > 2) MAXDEPTH = atoi(argv[2]);
  long long ln, ld, bn, bd, an, ad, Bn, Bd;
  if (scanf("%lld %lld %lld %lld %lld %lld %lld %lld", &ln, &ld, &bn, &bd, &an, &ad, &Bn, &Bd) != 8) return 1;
  I l = rat(ln, ld), beta = rat(bn, bd), bA = rat(an, ad), bB = rat(Bn, Bd);
  I k12 = isqrt(dvd(one, iv(12.0))), k2 = isqrt(dvd(one, iv(2.0)));
  long long sn, sd, nn, nd;
  const double R = 6.5, H = 0.5;
  while (scanf("%lld %lld %lld %lld", &sn, &sd, &nn, &nd) == 4) {
    I s = rat(sn, sd), nu = rat(nn, nd);
    P = {l, beta, bA, s, mul(nu, k12), mul(mul(s, bB), k2)};
    total = {0.0, 0.0};
    n_evals = n_cells = n_crude = n_fail_depth = 0;
    int nb = (int)std::lround(R / H);
    for (int i = -nb; i < nb; i++)
      for (int j = 0; j < nb; j++) cell(i * H, (i + 1) * H, j * H, (j + 1) * H, 0);
    I psi = scal(4.0, total);
    if (!finite(psi)) { fprintf(stderr, "non-finite result\n"); return 3; }
    printf("%lld/%lld %lld/%lld %a %a %lld %lld %lld %lld\n", sn, sd, nn, nd, psi.lo, psi.hi, n_cells, n_evals, n_crude,
           n_fail_depth);
    fflush(stdout);
  }
  return 0;
}
