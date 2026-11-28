// Agent-ID: codex-a7c4. Gaussian trial folded-normal midpoint rule with
// interval Hessian remainders.
#include <algorithm>
#include <array>
#include <cfenv>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <limits>
#include <mpfr.h>
// Closed binary64 interval, rounded outwards after every primitive arithmetic
// operation.
struct I {
  double l, h;
  I(double a = 0) : l(a), h(a) {}
  I(double a, double b) : l(a), h(b) {}
};
double dn(double a) { return std::nextafter(a, -INFINITY); }
double up(double a) { return std::nextafter(a, INFINITY); }
I operator+(I a, I b) { return {dn(a.l + b.l), up(a.h + b.h)}; }
I operator-(I a) { return {-a.h, -a.l}; }
I operator-(I a, I b) { return a + -b; }
I operator*(I a, I b) {
  double vals[] = {a.l * b.l, a.h * b.l, a.l * b.h, a.h * b.h};
  return {dn(*std::min_element(vals, vals + 4)),
          up(*std::max_element(vals, vals + 4))};
}
I inv(I a) {
  if (!(a.l > 0 || a.h < 0)) {
    std::fprintf(stderr, "bad denominator %g %g\n", a.l, a.h);
    std::abort();
  }
  return {dn(1 / a.h), up(1 / a.l)};
}
I operator/(I a, I b) { return a * inv(b); }
I sq(I a) {
  if (a.l >= 0)
    return {std::max(0., dn(a.l * a.l)), up(a.h * a.h)};
  if (a.h <= 0)
    return sq(-a);
  return {0, up(std::max(a.l * a.l, a.h * a.h))};
}
I root(I a) {
  if (!(a.l > 0))
    std::abort();
  return {dn(std::sqrt(a.l)), up(std::sqrt(a.h))};
}
using Unary = int (*)(mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);
struct Mp {
  mpfr_t v;
  Mp() { mpfr_init2(v, 64); }
  ~Mp() { mpfr_clear(v); }
} tmp;
double unary(double v, Unary f, mpfr_rnd_t dir) {
  mpfr_set_d(tmp.v, v, MPFR_RNDN);
  f(tmp.v, tmp.v, dir);
  return mpfr_get_d(tmp.v, dir);
}
I expon(I x) {
  return {unary(x.l, mpfr_exp, MPFR_RNDD), unary(x.h, mpfr_exp, MPFR_RNDU)};
}
I erf_i(I x) {
  return {unary(x.l, mpfr_erf, MPFR_RNDD), unary(x.h, mpfr_erf, MPFR_RNDU)};
}
I dec(const char *x) {
  if (mpfr_set_str(tmp.v, x, 10, MPFR_RNDD) != 0 || !mpfr_number_p(tmp.v))
    std::abort();
  double l = mpfr_get_d(tmp.v, MPFR_RNDD);
  if (mpfr_set_str(tmp.v, x, 10, MPFR_RNDU) != 0 || !mpfr_number_p(tmp.v))
    std::abort();
  return {l, mpfr_get_d(tmp.v, MPFR_RNDU)};
}
I pi_i() {
  mpfr_const_pi(tmp.v, MPFR_RNDD);
  double l = mpfr_get_d(tmp.v, MPFR_RNDD);
  mpfr_const_pi(tmp.v, MPFR_RNDU);
  return {l, mpfr_get_d(tmp.v, MPFR_RNDU)};
}
// Two coordinate first and second partials; the tensor midpoint rule needs no
// mixed derivative.
struct J {
  I v, r, q, rr, qq;
  J(I v = 0, I r = 0, I q = 0, I rr = 0, I qq = 0)
      : v(v), r(r), q(q), rr(rr), qq(qq) {}
  J(int v) : v(v) {}
};
J operator+(J a, J b) {
  return {a.v + b.v, a.r + b.r, a.q + b.q, a.rr + b.rr, a.qq + b.qq};
}
J operator-(J a) { return {-a.v, -a.r, -a.q, -a.rr, -a.qq}; }
J operator-(J a, J b) { return a + -b; }
J operator*(J a, J b) {
  return {a.v * b.v, a.r * b.v + a.v * b.r, a.q * b.v + a.v * b.q,
          a.rr * b.v + I(2) * a.r * b.r + a.v * b.rr,
          a.qq * b.v + I(2) * a.q * b.q + a.v * b.qq};
}
J compose(J x, I y, I yp, I ypp) {
  return {y, yp * x.r, yp * x.q, ypp * sq(x.r) + yp * x.rr,
          ypp * sq(x.q) + yp * x.qq};
}
J square(J x) { return compose(x, sq(x.v), I(2) * x.v, 2); }
J reciprocal(J x) {
  I y = inv(x.v);
  return compose(x, y, -sq(y), I(2) * sq(y) * y);
}
J sqrt_j(J x) {
  I y = root(x.v), z = inv(y);
  return compose(x, y, z / I(2), -sq(z) * z / I(4));
}
J exp_j(J x) {
  I v = expon(x.v);
  return compose(x, v, v, v);
}
struct Params {
  I t, l, beta, bA, bB, sig, nu;
};
const I sqrt2 = root(I(2)), sqrt12 = root(I(12)), pi = pi_i(),
        invsqrtpi = inv(root(pi));
template <typename X> X unitinv(X x);
template <> I unitinv(I x) { return inv(x); }
template <> J unitinv(J x) { return reciprocal(x); }
template <typename X> X xsquare(X x);
template <> I xsquare(I x) { return sq(x); }
template <> J xsquare(J x) { return square(x); }
template <typename X> X xroot(X x);
template <> I xroot(I x) { return root(x); }
template <> J xroot(J x) { return sqrt_j(x); }
template <typename X> X xexp(X x);
template <> I xexp(I x) { return expon(x); }
template <> J xexp(J x) { return exp_j(x); }
I erffold(I x, I) { return erf_i(x); }
J erffold(J x, J ex) {
  I p = I(2) * invsqrtpi * ex.v;
  return compose(x, erf_i(x.v), p, -I(2) * x.v * p);
}
template <typename X> std::array<X, 2> integrands(const Params &row, X r, X u) {
  X T = xsquare(r), U = xsquare(u), den = unitinv(X(1) + U),
    co = (X(1) - U) * den;
  X E = r * (T * (T - X(6)) + X(6)) * X(inv(sqrt12)),
    m = (r * (X(row.l) + X(row.beta) * (T - X(2))) + X(row.nu) * E) * co;
  X a = X(1) - X(row.bA) * (T - X(1)), b = X(-row.bB / sqrt2) * T;
  // Identically D²=(a−b)²+4ab cos², positive with no artificial cancellation
  // near phi=pi/2.
  X dsq = xsquare(a - b) + X(4) * a * b * xsquare(co);
  X s = X(row.sig) * xroot(dsq), v = m * unitinv(s), ex = xexp(-xsquare(v)),
    ga = erffold(v, ex);
  X weight = X(8) * r * xexp(-T) * den;
  return {weight * (m * ga + s * X(invsqrtpi) * ex), weight * E * co * ga};
}
int main(int argc, char **argv) {
  static_assert(std::numeric_limits<double>::is_iec559 &&
                    std::numeric_limits<double>::digits == 53,
                "binary64 required");
  if (argc != 12 || std::fegetround() != FE_TONEAREST)
    return 2;
  volatile double minnormal = std::numeric_limits<double>::min();
  if (minnormal * 0.5 == 0)
    return 2;
  int nr = std::atoi(argv[1]), nq = std::atoi(argv[2]);
  if (nr < 1 || nq < 1 || nr > 32768 || nq > 32768)
    return 2;
  Params p = {dec(argv[3]), dec(argv[4]), dec(argv[5]), dec(argv[6]),
              dec(argv[7]), dec(argv[8]), dec(argv[9])};
  if (!(p.l.l > 0 && p.l.h < 1 && p.beta.l > 0 && p.beta.h < 1 && p.nu.l > 0 &&
        p.nu.h < .1 && p.sig.l > 0 && p.sig.h < 1 && p.bA.l > -.5 &&
        p.bA.h < 0 && p.bB.l > -.5 && p.bB.h < 0))
    return 2;
  I hr = I(6) / I(nr), hu = I(1) / I(nq), kl = sq(hr) / I(24),
    ku = sq(hu) / I(24);
  std::array<I, 2> tot{I(0), I(0)};
  for (int i = 0; i < nr; ++i) {
    I rr(I(i) * hr);
    I rr2 = I(i + 1) * hr;
    I rc = (I(i) + I(.5)) * hr;
    for (int j = 0; j < nq; ++j) {
      I u = I(j) * hu, u2 = I(j + 1) * hu, uc = (I(j) + I(.5)) * hu;
      auto cen = integrands<I>(p, rc, uc);
      auto der = integrands<J>(p, J(I(rr.l, rr2.h), 1), J(I(u.l, u2.h), 0, 1));
      for (int k = 0; k < 2; ++k) {
        I e = kl * der[k].rr + ku * der[k].qq;
        tot[k] = tot[k] + (cen[k] + e) * hr * hu;
      }
    }
  }
  // |erf|≤1, E32(r) ≤4r^5 for r≥6; E|N|≤|m|+s/sqrt(pi).
  // For rows within the checked parameter bounds and r≥6, |m|+s/sqrt(pi)≤4r^5.
  // The paired r integrals beyond 6 are ≤8π∫ r^6 exp(−r²) dr
  // ≤8π ∫r^7 exp(−r²)dr = 4π exp(−36)(36³+3·36²+6·36+6)< 2e−10.
  // Explicit bounds: |ell+beta(T-2)|≤1+T; |E32|≤(1+6/36+6/1296)r^5 for r≥6;
  // D≤1+T, so |m|+sigma D/sqrt(pi)≤r(1+T)+.1(1+6/36+6/1296)r^5+1+T<4r^5.
  I tail =
      I(4) * pi * expon(-I(36)) * I(36 * 36 * 36 + 3 * 36 * 36 + 6 * 36 + 6);
  if (!(tail.h < 2e-10))
    return 3;
  I raw = tot[0] + I(0, tail.h), grad = tot[1] + I(-tail.h, tail.h);
  I ep = dec(argv[10]), eta = dec(argv[11]);
  if (!(ep.l > 0 && eta.l > 0))
    return 2;
  I F = raw + sq(p.t) - I(2) * p.t * p.l + I(2) * sq(p.beta) / ep +
        sq(p.sig) * ((sq(p.bA) + sq(p.bB)) / eta - inv(ep)) - sq(p.nu) / eta;
  I G = grad - I(2) * p.nu / eta;
  std::printf("F %.17g %.17g; grad %.17g %.17g\n", F.l, F.h, G.l, G.h);
  std::printf("enclosure %a %a %a %a\n", F.l, F.h, G.l, G.h);
}
