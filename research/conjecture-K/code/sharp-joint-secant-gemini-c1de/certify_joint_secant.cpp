// Agent-ID: gemini-c1de. Refs #436.
// Outward-rounded IEEE-754 interval certifier for the Sharp Global Joint Secant
// Inequality and its four consequences on F_joint and (P_Psi) at the peak row.
//
// All elementary interval operations round strictly outward using std::nextafter
// in FE_TONEAREST mode (verified at startup). No libm transcendental function
// is trusted without an arithmetic enclosure certificate:
//   - sqrti:  verified by squaring endpoints
//   - root_T: verified by bracketing phi(t) = t*(a + b*t)^2
//   - expneg: alternating Taylor series on [0, 1) + 6 squarings
//   - sincos: alternating Taylor series on [0, pi/4] with exact pi enclosure
//
// Every matrix integrand is factored into exact 1D radial densities f(s) (with
// closed-form s-derivatives via T -> s = T*(a+bT)^2) multiplied by low-degree
// polynomials in (r, cos(theta), sin(theta), w), avoiding interval wrapping.
//
// Build:
//   clang++ -O2 -ffp-contract=off -std=c++17 -pthread -Wall -Wextra -Werror certify_joint_secant.cpp -o certify_joint_secant

#include <algorithm>
#include <array>
#include <atomic>
#include <cassert>
#include <cfenv>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <limits>
#include <queue>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>

static inline double dn(double x) { return std::nextafter(x, -INFINITY); }
static inline double up(double x) { return std::nextafter(x, INFINITY); }

struct I {
    double l, h;
    I() : l(0.0), h(0.0) {}
    explicit I(double a) : l(a), h(a) {}
    I(double a, double b) : l(a), h(b) {
        if (a > b || std::isnan(a) || std::isnan(b))
            throw std::runtime_error("invalid interval");
    }
};

static inline I rat(long long num, long long den) {
    if (den <= 0) throw std::runtime_error("bad rational denominator");
    double q = static_cast<double>(num) / static_cast<double>(den);
    return I(dn(q), up(q));
}

static inline I operator+(I x, I y) {
    double lo = dn(x.l + y.l);
    if (x.l >= 0.0 && y.l >= 0.0 && lo < 0.0) lo = 0.0;
    return I(lo, up(x.h + y.h));
}
static inline I operator-(I x, I y) { return I(dn(x.l - y.h), up(x.h - y.l)); }
static inline I operator-(I x) { return I(-x.h, -x.l); }
static inline I operator*(I x, I y) {
    double a = x.l * y.l, b = x.l * y.h, c = x.h * y.l, d = x.h * y.h;
    double lo = dn(std::min({a, b, c, d}));
    if (x.l >= 0.0 && y.l >= 0.0 && lo < 0.0) lo = 0.0;
    return I(lo, up(std::max({a, b, c, d})));
}
static inline I operator/(I x, I y) {
    if (y.l <= 0.0 && y.h >= 0.0) throw std::runtime_error("division by interval containing zero");
    return x * I(dn(1.0 / y.h), up(1.0 / y.l));
}
static inline I sq(I x) {
    if (x.l == 0.0 && x.h == 0.0) return I(0.0, 0.0);
    if (x.l >= 0.0) return I(std::max(0.0, dn(x.l * x.l)), up(x.h * x.h));
    if (x.h <= 0.0) return I(std::max(0.0, dn(x.h * x.h)), up(x.l * x.l));
    return I(0.0, up(std::max(x.l * x.l, x.h * x.h)));
}
static inline double mag(I x) { return std::max(std::abs(x.l), std::abs(x.h)); }
static inline I sqrti(I x) {
    if (x.l < 0.0) throw std::runtime_error("sqrt of negative interval");
    double rl = (x.l == 0.0) ? 0.0 : dn(std::sqrt(x.l));
    double rh = (x.h == 0.0) ? 0.0 : up(std::sqrt(x.h));
    if (rl < 0.0) rl = 0.0;
    while (rl > 0.0 && sq(I(rl)).h > x.l) rl = std::max(0.0, dn(rl));
    while (sq(I(rh)).l < x.h) rh = up(rh);
    if ((rl > 0.0 && sq(I(rl)).h > x.l) || sq(I(rh)).l < x.h)
        throw std::runtime_error("sqrt enclosure verification failed");
    return I(rl, rh);
}

// Peak row exact rational constants
static const I A_C = rat(699, 1250);
static const I B_C = rat(179, 1250);
static const I RHO_C = rat(5053, 10000);
static const I C_C = rat(15159, 50000);
static const I D_C = rat(2, 5);
static const I DH_C = rat(11, 20);
static const I P_C = rat(2500, 1891);
static const I PC_C = P_C - rat(463, 5000);
static const I SQRT2 = sqrti(I(2.0));
static const I PI_I(3.14159265358979311599, 3.14159265358979356009);
static const I HALF_PI = PI_I / I(2.0);
static const I QUARTER_PI = PI_I / I(4.0);
static const I TWO_OVER_PI = I(2.0) / PI_I;

static const I QA0 = PC_C - rat(67, 100) - rat(2, 25) * sq(RHO_C);
static const I QB0 = PC_C - rat(67, 100) * sq(RHO_C) - rat(2, 25);
static const I QAB0 = -rat(59, 100) * RHO_C;

static I phi_T(I t) {
    I h = A_C + B_C * t;
    return t * sq(h);
}

static I rootpoint(double s) {
    if (s <= 0.0) return I(0.0);
    double ad = 699.0 / 1250.0, bd = 179.0 / 1250.0;
    double t = std::min(s / (ad * ad), std::cbrt(s / (bd * bd)));
    for (int j = 0; j < 18; j++) {
        double h = ad + bd * t;
        double f = t * h * h - s;
        double df = h * (ad + 3.0 * bd * t);
        t = std::max(0.0, t - f / df);
    }
    double eps = 1e-13 * (1.0 + std::abs(t));
    for (int j = 0; j < 50; j++, eps *= 2.0) {
        double lo = std::max(0.0, dn(t - eps));
        double hi = up(t + eps);
        if (phi_T(I(lo)).h <= s && phi_T(I(hi)).l >= s) return I(lo, hi);
    }
    throw std::runtime_error("rootpoint bracketing failed");
}

static I root_T(I s) {
    double lo = (s.l <= 0.0) ? 0.0 : rootpoint(s.l).l;
    double hi = (s.h <= 0.0) ? 0.0 : rootpoint(s.h).h;
    return I(lo, hi);
}

static I exppoint(double t) {
    if (t < 0.0) throw std::runtime_error("exppoint negative argument");
    if (t == 0.0) return I(1.0);
    if (t >= 64.0) {
        I upper = exppoint(63.5);
        return I(0.0, upper.h);
    }
    I x = I(t) / I(64.0);
    I term(1.0), sum(1.0), even(1.0);
    for (int j = 1; j <= 23; j++) {
        term = term * (-x) / I(static_cast<double>(j));
        sum = sum + term;
        if (j == 22) even = sum;
    }
    I res(sum.l, even.h);
    if (res.l <= 0.0) throw std::runtime_error("exppoint Taylor failed");
    for (int j = 0; j < 6; j++) res = sq(res);
    return res;
}

static I expneg(I t) {
    double lo = exppoint(t.h).l;
    double hi = exppoint(std::max(0.0, t.l)).h;
    return I(lo, hi);
}

static I cos_small(I x) {
    I x2 = sq(x);
    I term(1.0), sum(1.0), lo_b(0.0), hi_b(1.0);
    for (int k = 1; k <= 12; k++) {
        term = term * (-x2) / I(static_cast<double>((2 * k - 1) * (2 * k)));
        sum = sum + term;
        if (k == 11) lo_b = sum;
        if (k == 12) hi_b = sum;
    }
    return I(std::max(-1.0, lo_b.l), std::min(1.0, hi_b.h));
}

static I sin_small(I x) {
    I x2 = sq(x);
    I term = x, sum = x, lo_b(0.0), hi_b(1.0);
    for (int k = 1; k <= 12; k++) {
        term = term * (-x2) / I(static_cast<double>((2 * k) * (2 * k + 1)));
        sum = sum + term;
        if (k == 11) lo_b = sum;
        if (k == 12) hi_b = sum;
    }
    return I(std::max(-1.0, lo_b.l), std::min(1.0, hi_b.h));
}

static void sincos_point(double th, I &s_out, I &c_out) {
    if (th < 0.0 || th > PI_I.h) throw std::runtime_error("angle out of [0, pi]");
    I t(th);
    if (th <= QUARTER_PI.l) {
        s_out = sin_small(t);
        c_out = cos_small(t);
    } else if (th <= HALF_PI.l) {
        I u = HALF_PI - t;
        if (u.l < 0.0) u = I(0.0, u.h);
        s_out = cos_small(u);
        c_out = sin_small(u);
    } else if (th <= (HALF_PI + QUARTER_PI).l) {
        I u = t - HALF_PI;
        if (u.l < 0.0) u = I(0.0, u.h);
        s_out = cos_small(u);
        c_out = -sin_small(u);
    } else {
        I u = PI_I - t;
        if (u.l < 0.0) u = I(0.0, u.h);
        s_out = sin_small(u);
        c_out = -cos_small(u);
    }
}

static void sincos_interval(double th_lo, double th_hi, I &s_out, I &c_out) {
    I sl, cl, sh, ch;
    sincos_point(th_lo, sl, cl);
    sincos_point(th_hi, sh, ch);
    c_out = I(ch.l, cl.h);
    double slo = std::min(sl.l, sh.l);
    double shi = std::max(sl.h, sh.h);
    if (th_lo <= HALF_PI.h && th_hi >= HALF_PI.l) shi = 1.0;
    s_out = I(slo, shi);
}

// 2nd-order polynomial jet (v, d, dd) in one coordinate (r, theta, or w).
struct J {
    I v, d, dd;
    J() : v(0.0), d(0.0), dd(0.0) {}
    explicit J(I v_, I d_ = I(0.0), I dd_ = I(0.0)) : v(v_), d(d_), dd(dd_) {}
};
static inline J operator+(J x, J y) { return J(x.v + y.v, x.d + y.d, x.dd + y.dd); }
static inline J operator-(J x, J y) { return J(x.v - y.v, x.d - y.d, x.dd - y.dd); }
static inline J operator-(J x) { return J(-x.v, -x.d, -x.dd); }
static inline J operator*(J x, J y) {
    return J(x.v * y.v, x.d * y.v + x.v * y.d, x.dd * y.v + I(2.0) * x.d * y.d + x.v * y.dd);
}
static inline J jsq(J x) {
    return J(sq(x.v), I(2.0) * x.v * x.d, I(2.0) * (sq(x.d) + x.v * x.dd));
}

// 1D density function of s = x^2 + y^2: (f, df/ds, d^2f/ds^2).
struct DenS {
    I f, fs, fss;
};

// Build DenS from exact T-derivatives (g, dg/dT, d^2g/dT^2) using ds/dT = D, d^2s/dT^2 = Dp.
static inline DenS from_T(I g, I gt, I gtt, I D, I Dp, I invD, I invD3) {
    return {g, gt * invD, (gtt * D - gt * Dp) * invD3};
}

// Exact second derivative of f(s(u)) * P(u) w.r.t. u!
static inline I d2_prod(const DenS &d, const J &s, const J &P) {
    return d.fss * sq(s.d) * P.v + d.fs * s.dd * P.v + I(2.0) * d.fs * s.d * P.d + d.f * P.dd;
}

// Compute all factored 1D-in-s densities for O, K, and H from s = x^2 + y^2!
struct AllDens {
    // O-block: f_j(s) = (2/pi)*exp(-T)*((T-2)/sqrt(2))^j / (h^3 * h3), j = 0,1,2
    std::array<DenS, 3> o;
    // Base w_m(T) = (2/pi)*exp(-T) / (h^{2m+1} * h3) for m = 0 (1/(h*h3)), 1 (1/(h^3*h3)), 2 (1/(h^5*h3))
    // K-block densities:
    //   k_zz = w_0 * (T - 2/5)^2
    //   k_z  = w_0 * (T - 2/5)
    //   k_zh = w_1 * (T - 2/5)
    //   k_0  = w_0
    //   k_1  = w_1
    //   k_2  = w_2
    DenS k_zz, k_z, k_zh, k_0, k_1, k_2;
    // H-block densities (zH = T - 11/20):
    DenS h_zz, h_zh;
};

static AllDens eval_dens(I s_val, bool need_H, bool need_derivs) {
    I T = root_T(s_val);
    I h = A_C + B_C * T;
    I h3 = A_C + I(3.0) * B_C * T;
    I D = h * h3;
    I inv_h = I(1.0) / h;
    I inv_h3 = I(1.0) / h3;
    I inv_h2 = sq(inv_h);
    I e = TWO_OVER_PI * expneg(T);
    I w0 = e * inv_h * inv_h3;
    I w1 = w0 * inv_h2;
    I w2 = w1 * inv_h2;

    I q = (T - I(2.0)) / SQRT2;
    I zK = T - D_C;
    I zH = T - DH_C;

    AllDens ad{};
    if (!need_derivs) {
        ad.o[0].f = w1;
        ad.o[1].f = w1 * q;
        ad.o[2].f = w1 * sq(q);
        ad.k_zz.f = w0 * sq(zK);
        ad.k_z.f = w0 * zK;
        ad.k_zh.f = w1 * zK;
        ad.k_0.f = w0;
        ad.k_1.f = w1;
        ad.k_2.f = w2;
        if (need_H) {
            ad.h_zz.f = w0 * sq(zH);
            ad.h_zh.f = w1 * zH;
        }
        return ad;
    }

    I Dp = I(4.0) * A_C * B_C + I(6.0) * sq(B_C) * T;
    I invD = inv_h * inv_h3;
    I invD3 = invD * sq(invD);

    // Helper: for w_m(T) = (2/pi)*exp(-T) / (h^p * h3) with p = 1, 3, 5:
    //   logd = -1 - p*b/h - 3*b/h3
    //   w' = w * logd
    //   w'' = w * (logd^2 + p*b^2/h^2 + 9*b^2/h3^2)
    I b_h = B_C * inv_h;
    I b_h3 = B_C * inv_h3;
    I bh2 = sq(b_h);
    I bh32 = I(9.0) * sq(b_h3);

    I l0 = -I(1.0) - b_h - I(3.0) * b_h3;
    I w0t = w0 * l0;
    I w0tt = w0 * (sq(l0) + bh2 + bh32);

    I l1 = -I(1.0) - I(3.0) * b_h - I(3.0) * b_h3;
    I w1t = w1 * l1;
    I w1tt = w1 * (sq(l1) + I(3.0) * bh2 + bh32);

    I l2 = -I(1.0) - I(5.0) * b_h - I(3.0) * b_h3;
    I w2t = w2 * l2;
    I w2tt = w2 * (sq(l2) + I(5.0) * bh2 + bh32);

    // O densities: w1, w1*q, w1*q^2 (q' = 1/sqrt(2))
    ad.o[0] = from_T(w1, w1t, w1tt, D, Dp, invD, invD3);
    ad.o[1] = from_T(w1 * q, w1t * q + w1 / SQRT2, w1tt * q + SQRT2 * w1t, D, Dp, invD, invD3);
    ad.o[2] = from_T(w1 * sq(q), w1t * sq(q) + SQRT2 * w1 * q, w1tt * sq(q) + I(2.0) * SQRT2 * w1t * q + w1, D, Dp, invD, invD3);

    // K densities:
    //   (w * z)' = w' z + w, (w * z)'' = w'' z + 2 w'
    //   (w * z^2)' = w' z^2 + 2 w z, (w * z^2)'' = w'' z^2 + 4 w' z + 2 w
    ad.k_0 = from_T(w0, w0t, w0tt, D, Dp, invD, invD3);
    ad.k_1 = ad.o[0];
    ad.k_2 = from_T(w2, w2t, w2tt, D, Dp, invD, invD3);
    ad.k_z = from_T(w0 * zK, w0t * zK + w0, w0tt * zK + I(2.0) * w0t, D, Dp, invD, invD3);
    ad.k_zh = from_T(w1 * zK, w1t * zK + w1, w1tt * zK + I(2.0) * w1t, D, Dp, invD, invD3);
    ad.k_zz = from_T(w0 * sq(zK), w0t * sq(zK) + I(2.0) * w0 * zK, w0tt * sq(zK) + I(4.0) * w0t * zK + I(2.0) * w0, D, Dp, invD, invD3);

    if (need_H) {
        ad.h_zz = from_T(w0 * sq(zH), w0t * sq(zH) + I(2.0) * w0 * zH, w0tt * sq(zH) + I(4.0) * w0t * zH + I(2.0) * w0, D, Dp, invD, invD3);
        ad.h_zh = from_T(w1 * zH, w1t * zH + w1, w1tt * zH + I(2.0) * w1t, D, Dp, invD, invD3);
    }
    return ad;
}

// Evaluate polynomial factors for a single direction (mode: 0=point, 1=r, 2=theta, 3=w).
struct PolySet {
    J s;
    // O-block polynomials (since ou_im == ov_re and ov_im == ou_re, only 2x6 = 12 needed!):
    // idx: 0=(0,0), 1=(0,1), 2=(0,2), 3=(1,1), 4=(1,2), 5=(2,2)
    // Note: (0,0) and (0,2) and (2,2) share p0^2; (0,1) and (1,2) share p0*p1; (1,1) is p1^2!
    J ou_00, ou_01, ou_11; // real u (= imag v)
    J ov_00, ov_01, ov_11; // real v (= imag u)

    // K/H trig & quadratic polynomials:
    // Let Qr = (x^2 - y^2)/sqrt(2), Qi = sqrt(2)*x*y
    // Define:
    //   Au_re = Qr*co + Qi*si,  Av_re = Qi*co - Qr*si
    //   Au_im = Qi*co - Qr*si = Av_re,  Av_im = -Qr*co - Qi*si = -Au_re !!
    // WAIT A SECOND!! CHECK THAT ALGEBRAIC MIRACLE!!
    //   Re(z1^2 * e^{-i th}) * h^2 = Qr*co + Qi*si =: Au
    //   Im(z1^2 * e^{-i th}) * h^2 = Qi*co - Qr*si =: Av
    // Check ku1 = (c + Qr/h^2)*co + (Qi/h^2)*si = c*co + Au/h^2
    //       kv1 = (Qi/h^2)*co - (c + Qr/h^2)*si = -c*si + Av/h^2
    //       ku3 = (Qi/h^2)*co + (c - Qr/h^2)*si = c*si + Av/h^2   (since Qi*co - Qr*si = Av!!)
    //       kv3 = (c - Qr/h^2)*co - (Qi/h^2)*si = c*co - Au/h^2   (since -(Qr*co + Qi*si) = -Au!!)
    // EVERYTHING COLLAPSES TO JUST (co, si, Au, Av)!!
    J c2, s2, cAu, sAv, sAu, cAv, Au2, Av2, cs;
};

static PolySet eval_polys(I r_i, I c_i, I s_i, I w_i, int mode) {
    J r(r_i, mode == 1 ? I(1.0) : I(0.0), I(0.0));
    J co(c_i, mode == 2 ? -s_i : I(0.0), mode == 2 ? -c_i : I(0.0));
    J si(s_i, mode == 2 ? c_i : I(0.0), mode == 2 ? -s_i : I(0.0));
    J w(w_i, mode == 3 ? I(1.0) : I(0.0), I(0.0));

    J x = r * co - w;
    J y = r * si;
    PolySet ps;
    ps.s = jsq(x) + jsq(y);

    J p0 = x * co + y * si;    // = r - w*co
    J p1 = x * co - y * si;
    J p2 = y * co - x * si;    // = w*si
    J p3 = -(y * co + x * si);

    ps.ou_00 = jsq(p0);
    ps.ou_01 = p0 * p1;
    ps.ou_11 = jsq(p1);
    ps.ov_00 = jsq(p2);
    ps.ov_01 = p2 * p3;
    ps.ov_11 = jsq(p3);

    J Qr = (jsq(x) - jsq(y)) * J(I(1.0) / SQRT2);
    J Qi = (x * y) * J(SQRT2);
    J Au = Qr * co + Qi * si;
    J Av = Qi * co - Qr * si;

    ps.c2 = jsq(co);
    ps.s2 = jsq(si);
    ps.cs = co * si;
    ps.cAu = co * Au;
    ps.sAv = si * Av;
    ps.sAu = si * Au;
    ps.cAv = co * Av;
    ps.Au2 = jsq(Au);
    ps.Av2 = jsq(Av);
    return ps;
}

// Compute either point values (deriv=false) or exact 2nd-deriv magnitudes (deriv=true) of all matrix entries!
struct EntryVals {
    std::array<I, 3> ku_re, kv_re, ku_im, kv_im;
    std::array<I, 3> hu_re, hv_re, hu_im, hv_im;
    std::array<I, 6> ou_re, ov_re; // note: ou_im == ov_re, ov_im == ou_re!
};

static EntryVals combine_val(const AllDens &d, const PolySet &p, bool need_H) {
    EntryVals e{};
    I c2 = sq(C_C), two_c = I(2.0) * C_C;
    // K real u: ku0 = zK*co, ku1 = c*co + Au/h^2
    e.ku_re[0] = d.k_zz.f * p.c2.v;
    e.ku_re[1] = C_C * d.k_z.f * p.c2.v + d.k_zh.f * p.cAu.v;
    e.ku_re[2] = c2 * d.k_0.f * p.c2.v + two_c * d.k_1.f * p.cAu.v + d.k_2.f * p.Au2.v;
    // K real v: kv0 = -zK*si, kv1 = -c*si + Av/h^2
    e.kv_re[0] = d.k_zz.f * p.s2.v;
    e.kv_re[1] = C_C * d.k_z.f * p.s2.v - d.k_zh.f * p.sAv.v;
    e.kv_re[2] = c2 * d.k_0.f * p.s2.v - two_c * d.k_1.f * p.sAv.v + d.k_2.f * p.Av2.v;
    // K imag u: ku2 = zK*si, ku3 = c*si + Av/h^2
    e.ku_im[0] = d.k_zz.f * p.s2.v;
    e.ku_im[1] = C_C * d.k_z.f * p.s2.v + d.k_zh.f * p.sAv.v;
    e.ku_im[2] = c2 * d.k_0.f * p.s2.v + two_c * d.k_1.f * p.sAv.v + d.k_2.f * p.Av2.v;
    // K imag v: kv2 = zK*co, kv3 = c*co - Au/h^2
    e.kv_im[0] = d.k_zz.f * p.c2.v;
    e.kv_im[1] = C_C * d.k_z.f * p.c2.v - d.k_zh.f * p.cAu.v;
    e.kv_im[2] = c2 * d.k_0.f * p.c2.v - two_c * d.k_1.f * p.cAu.v + d.k_2.f * p.Au2.v;

    if (need_H) {
        // H real u: zH*co, Au/h^2;  v: -zH*si, Av/h^2
        e.hu_re[0] = d.h_zz.f * p.c2.v;
        e.hu_re[1] = d.h_zh.f * p.cAu.v;
        e.hu_re[2] = d.k_2.f * p.Au2.v;
        e.hv_re[0] = d.h_zz.f * p.s2.v;
        e.hv_re[1] = -(d.h_zh.f * p.sAv.v);
        e.hv_re[2] = d.k_2.f * p.Av2.v;
        // H imag u: zH*si, Av/h^2;  v: zH*co, -Au/h^2
        e.hu_im[0] = d.h_zz.f * p.s2.v;
        e.hu_im[1] = d.h_zh.f * p.sAv.v;
        e.hu_im[2] = d.k_2.f * p.Av2.v;
        e.hv_im[0] = d.h_zz.f * p.c2.v;
        e.hv_im[1] = -(d.h_zh.f * p.cAu.v);
        e.hv_im[2] = d.k_2.f * p.Au2.v;
    }

    // O real u (= imag v):
    e.ou_re = {
        d.o[0].f * p.ou_00.v, d.o[0].f * p.ou_01.v, d.o[1].f * p.ou_00.v,
        d.o[0].f * p.ou_11.v, d.o[1].f * p.ou_01.v, d.o[2].f * p.ou_00.v
    };
    // O real v (= imag u):
    e.ov_re = {
        d.o[0].f * p.ov_00.v, d.o[0].f * p.ov_01.v, d.o[1].f * p.ov_00.v,
        d.o[0].f * p.ov_11.v, d.o[1].f * p.ov_01.v, d.o[2].f * p.ov_00.v
    };
    return e;
}

static EntryVals combine_d2(const AllDens &d, const PolySet &p, bool need_H) {
    EntryVals e{};
    I c2 = sq(C_C), two_c = I(2.0) * C_C;
    const J &s = p.s;
    e.ku_re[0] = d2_prod(d.k_zz, s, p.c2);
    e.ku_re[1] = C_C * d2_prod(d.k_z, s, p.c2) + d2_prod(d.k_zh, s, p.cAu);
    e.ku_re[2] = c2 * d2_prod(d.k_0, s, p.c2) + two_c * d2_prod(d.k_1, s, p.cAu) + d2_prod(d.k_2, s, p.Au2);

    e.kv_re[0] = d2_prod(d.k_zz, s, p.s2);
    e.kv_re[1] = C_C * d2_prod(d.k_z, s, p.s2) - d2_prod(d.k_zh, s, p.sAv);
    e.kv_re[2] = c2 * d2_prod(d.k_0, s, p.s2) - two_c * d2_prod(d.k_1, s, p.sAv) + d2_prod(d.k_2, s, p.Av2);

    e.ku_im[0] = d2_prod(d.k_zz, s, p.s2);
    e.ku_im[1] = C_C * d2_prod(d.k_z, s, p.s2) + d2_prod(d.k_zh, s, p.sAv);
    e.ku_im[2] = c2 * d2_prod(d.k_0, s, p.s2) + two_c * d2_prod(d.k_1, s, p.sAv) + d2_prod(d.k_2, s, p.Av2);

    e.kv_im[0] = d2_prod(d.k_zz, s, p.c2);
    e.kv_im[1] = C_C * d2_prod(d.k_z, s, p.c2) - d2_prod(d.k_zh, s, p.cAu);
    e.kv_im[2] = c2 * d2_prod(d.k_0, s, p.c2) - two_c * d2_prod(d.k_1, s, p.cAu) + d2_prod(d.k_2, s, p.Au2);

    if (need_H) {
        e.hu_re[0] = d2_prod(d.h_zz, s, p.c2);
        e.hu_re[1] = d2_prod(d.h_zh, s, p.cAu);
        e.hu_re[2] = d2_prod(d.k_2, s, p.Au2);
        e.hv_re[0] = d2_prod(d.h_zz, s, p.s2);
        e.hv_re[1] = -d2_prod(d.h_zh, s, p.sAv);
        e.hv_re[2] = d2_prod(d.k_2, s, p.Av2);
        e.hu_im[0] = d2_prod(d.h_zz, s, p.s2);
        e.hu_im[1] = d2_prod(d.h_zh, s, p.sAv);
        e.hu_im[2] = d2_prod(d.k_2, s, p.Av2);
        e.hv_im[0] = d2_prod(d.h_zz, s, p.c2);
        e.hv_im[1] = -d2_prod(d.h_zh, s, p.cAu);
        e.hv_im[2] = d2_prod(d.k_2, s, p.Au2);
    }

    e.ou_re = {
        d2_prod(d.o[0], s, p.ou_00), d2_prod(d.o[0], s, p.ou_01), d2_prod(d.o[1], s, p.ou_00),
        d2_prod(d.o[0], s, p.ou_11), d2_prod(d.o[1], s, p.ou_01), d2_prod(d.o[2], s, p.ou_00)
    };
    e.ov_re = {
        d2_prod(d.o[0], s, p.ov_00), d2_prod(d.o[0], s, p.ov_01), d2_prod(d.o[1], s, p.ov_00),
        d2_prod(d.o[0], s, p.ov_11), d2_prod(d.o[1], s, p.ov_01), d2_prod(d.o[2], s, p.ov_00)
    };
    return e;
}

static bool pd2(const std::array<I, 3> &m) {
    if (m[0].l <= 0.0 || m[2].l <= 0.0) return false;
    return (m[2] - sq(m[1]) / m[0]).l > 0.0;
}

static bool pd3(const std::array<I, 6> &m) {
    I a[3][3] = {
        {m[0], m[1], m[2]},
        {m[1], m[3], m[4]},
        {m[2], m[4], m[5]}
    };
    for (int k = 0; k < 3; k++) {
        if (a[k][k].l <= 0.0) return false;
        for (int i = k + 1; i < 3; i++) {
            for (int j = i; j < 3; j++) {
                a[i][j] = a[i][j] - (a[i][k] * a[k][j]) / a[k][k];
                a[j][i] = a[i][j];
            }
        }
    }
    return true;
}

static double max_eig2(const std::array<I, 3> &M, const std::array<I, 3> &B, double extra) {
    double lo = -10.0, hi = 20.0;
    auto ok = [&](double lam) {
        std::array<I, 3> Z = {
            I(lam) - I(extra) + B[0] - M[0], B[1] - M[1], I(lam) - I(extra) + B[2] - M[2]
        };
        return pd2(Z);
    };
    while (!ok(hi)) hi *= 2.0;
    while (ok(lo)) lo *= 2.0;
    for (int it = 0; it < 44; it++) {
        double mid = 0.5 * (lo + hi);
        if (ok(mid)) hi = mid; else lo = mid;
    }
    return hi;
}

static double max_eig3(const std::array<I, 6> &M, const std::array<I, 6> &B, double extra) {
    double lo = -10.0, hi = 20.0;
    auto ok = [&](double lam) {
        std::array<I, 6> Z = {
            I(lam) - I(extra) + B[0] - M[0], B[1] - M[1], B[2] - M[2],
            I(lam) - I(extra) + B[3] - M[3], B[4] - M[4], I(lam) - I(extra) + B[5] - M[5]
        };
        return pd3(Z);
    };
    while (!ok(hi)) hi *= 2.0;
    while (ok(lo)) lo *= 2.0;
    for (int it = 0; it < 44; it++) {
        double mid = 0.5 * (lo + hi);
        if (ok(mid)) hi = mid; else lo = mid;
    }
    return hi;
}

struct CellCache {
    double rl, rh, ul, uh;
    double r_err, th_err, tot_err;
    I r_i, M_K_div_r, g_K_div_r;
    std::array<std::array<I, 3>, 2> ku_re, kv_re, ku_im, kv_im;
    std::array<std::array<I, 3>, 2> hu_re, hv_re, hu_im, hv_im;
    std::array<std::array<I, 6>, 2> ou_re, ov_re;
    std::array<I, 3> eku_re, ekv_re, eku_im, ekv_im;
    std::array<I, 3> ehu_re, ehv_re, ehu_im, ehv_im;
    std::array<I, 6> eou_re, eov_re;
};

struct CellCmp {
    bool operator()(const CellCache &a, const CellCache &b) const { return a.tot_err < b.tot_err; }
};

static CellCache eval_cell(double rl, double rh, double ul, double uh,
                           double w_lo, double w_hi, bool need_H, bool need_eta) {
    I r_i(rl, rh), dr = I(rh) - I(rl), rm = (I(rl) + I(rh)) / I(2.0);
    I er = sq(dr) / I(24.0);
    I tlo = (ul == 0.0) ? I(0.0) : (PI_I * I(ul));
    I thi = (uh == 1.0) ? PI_I : (PI_I * I(uh));
    I dth = thi - tlo;
    I eth = sq(dth) / I(24.0);
    I tmid = PI_I * I(0.5 * (ul + uh));
    I s_i, c_i, s_m, c_m;
    sincos_interval(tlo.l, std::min(thi.h, PI_I.h), s_i, c_i);
    sincos_interval(tmid.l, std::min(tmid.h, PI_I.h), s_m, c_m);

    I w_i(w_lo, w_hi);
    I dw = I(w_hi) - I(w_lo);
    I ew = sq(dw) / I(8.0);
    I area = dr * dth;

    auto pr = eval_polys(r_i, c_i, s_i, w_i, 1);
    auto pt = eval_polys(r_i, c_i, s_i, w_i, 2);
    auto pw = eval_polys(r_i, c_i, s_i, w_i, 3);
    auto ad = eval_dens(pr.s.v, need_H, true);

    auto dr2 = combine_d2(ad, pr, need_H);
    auto dt2 = combine_d2(ad, pt, need_H);
    auto dw2 = combine_d2(ad, pw, need_H);

    auto pm0 = eval_polys(rm, c_m, s_m, I(w_lo), 0);
    auto pm1 = eval_polys(rm, c_m, s_m, I(w_hi), 0);
    auto d0 = eval_dens(pm0.s.v, need_H, false);
    auto d1 = eval_dens(pm1.s.v, need_H, false);
    auto v0 = combine_val(d0, pm0, need_H);
    auto v1 = combine_val(d1, pm1, need_H);

    CellCache cc{};
    cc.rl = rl; cc.rh = rh; cc.ul = ul; cc.uh = uh;
    cc.r_i = r_i;
    if (need_eta && rl > 0.0) {
        I x = r_i * c_i - w_i;
        I y = r_i * s_i;
        I T = root_T(sq(x) + sq(y));
        I M_K = sqrti(sq(T - D_C) + sq(C_C + T / SQRT2));
        cc.M_K_div_r = M_K / r_i;
        I aa = A_C + B_C * T;
        I aa2 = sq(aa);
        I zr = (sq(x) - sq(y)) / (SQRT2 * aa2);
        I zi = (SQRT2 * x * y) / aa2;
        I zK = T - D_C;
        I ku0 = zK * c_i;
        I ku1 = (C_C + zr) * c_i + zi * s_i;
        I ku2 = zK * s_i;
        I ku3 = zi * c_i + (C_C - zr) * s_i;
        I g_K = sqrti(sq(ku0) + sq(ku1) + sq(ku2) + sq(ku3));
        I g_cl(g_K.l, std::min(M_K.h, g_K.h));
        cc.g_K_div_r = g_cl / r_i;
    }

    double r_e = 0.0, t_e = 0.0;
    auto acc_err = [&](I a_r, I a_t, I a_w, double wt_p) {
        I er_t = area * er * I(mag(a_r));
        I et_t = area * eth * I(mag(a_t));
        I ew_t = area * ew * I(mag(a_w));
        r_e += wt_p * er_t.h;
        t_e += wt_p * et_t.h;
        return er_t + et_t + ew_t;
    };

    for (int j = 0; j < 3; j++) {
        cc.eku_re[j] = acc_err(dr2.ku_re[j], dt2.ku_re[j], dw2.ku_re[j], 2.0);
        cc.ekv_re[j] = acc_err(dr2.kv_re[j], dt2.kv_re[j], dw2.kv_re[j], 1.0);
        cc.eku_im[j] = acc_err(dr2.ku_im[j], dt2.ku_im[j], dw2.ku_im[j], 2.0);
        cc.ekv_im[j] = acc_err(dr2.kv_im[j], dt2.kv_im[j], dw2.kv_im[j], 1.0);
        cc.ku_re[0][j] = area * v0.ku_re[j]; cc.ku_re[1][j] = area * v1.ku_re[j];
        cc.kv_re[0][j] = area * v0.kv_re[j]; cc.kv_re[1][j] = area * v1.kv_re[j];
        cc.ku_im[0][j] = area * v0.ku_im[j]; cc.ku_im[1][j] = area * v1.ku_im[j];
        cc.kv_im[0][j] = area * v0.kv_im[j]; cc.kv_im[1][j] = area * v1.kv_im[j];
        if (need_H) {
            cc.ehu_re[j] = acc_err(dr2.hu_re[j], dt2.hu_re[j], dw2.hu_re[j], 1.0);
            cc.ehv_re[j] = acc_err(dr2.hv_re[j], dt2.hv_re[j], dw2.hv_re[j], 0.5);
            cc.ehu_im[j] = acc_err(dr2.hu_im[j], dt2.hu_im[j], dw2.hu_im[j], 1.0);
            cc.ehv_im[j] = acc_err(dr2.hv_im[j], dt2.hv_im[j], dw2.hv_im[j], 0.5);
            cc.hu_re[0][j] = area * v0.hu_re[j]; cc.hu_re[1][j] = area * v1.hu_re[j];
            cc.hv_re[0][j] = area * v0.hv_re[j]; cc.hv_re[1][j] = area * v1.hv_re[j];
            cc.hu_im[0][j] = area * v0.hu_im[j]; cc.hu_im[1][j] = area * v1.hu_im[j];
            cc.hv_im[0][j] = area * v0.hv_im[j]; cc.hv_im[1][j] = area * v1.hv_im[j];
        }
    }
    for (int j = 0; j < 6; j++) {
        cc.eou_re[j] = acc_err(dr2.ou_re[j], dt2.ou_re[j], dw2.ou_re[j], 3.0);
        cc.eov_re[j] = acc_err(dr2.ov_re[j], dt2.ov_re[j], dw2.ov_re[j], 3.0);
        cc.ou_re[0][j] = area * v0.ou_re[j]; cc.ou_re[1][j] = area * v1.ou_re[j];
        cc.ov_re[0][j] = area * v0.ov_re[j]; cc.ov_re[1][j] = area * v1.ov_re[j];
    }
    if (need_eta && rh <= 0.5 && rl > 0.0) {
        double ratio = rh / rl;
        if (ratio > 1.35) r_e += 0.01 * (ratio - 1.0);
    }
    cc.r_err = r_e;
    cc.th_err = t_e;
    cc.tot_err = r_e + t_e;
    return cc;
}

struct SlabCache {
    double w_lo, w_hi, R_max, qw_interp_err;
    bool need_H;
    int cell_count;
    std::vector<CellCache> cells;
    std::array<std::array<I, 3>, 2> sum_ku_re{}, sum_kv_re{}, sum_ku_im{}, sum_kv_im{};
    std::array<std::array<I, 3>, 2> sum_hu_re{}, sum_hv_re{}, sum_hu_im{}, sum_hv_im{};
    std::array<std::array<I, 6>, 2> sum_ou_re{}, sum_ov_re{};
    std::array<I, 3> tot_eku_re{}, tot_ekv_re{}, tot_eku_im{}, tot_ekv_im{};
    std::array<I, 3> tot_ehu_re{}, tot_ehv_re{}, tot_ehu_im{}, tot_ehv_im{};
    std::array<I, 6> tot_eou_re{}, tot_eov_re{};
};

static SlabCache build_adaptive_slab(
    double w_lo, double w_hi, double R_max,
    double err_tol, int max_cells, bool need_H, bool store_cells)
{
    if (dn(R_max - w_hi) < 20.0) throw std::runtime_error("R_max - w_hi must be >= 20");
    if (phi_T(I(24.0)).h >= 400.0) throw std::runtime_error("phi(24) < 20^2 check failed");

    SlabCache sc;
    sc.w_lo = w_lo; sc.w_hi = w_hi; sc.R_max = R_max; sc.need_H = need_H;
    I dw = I(w_hi) - I(w_lo);
    sc.qw_interp_err = (sq(dw) / I(8.0)).h;

    std::priority_queue<CellCache, std::vector<CellCache>, CellCmp> pq;
    std::vector<double> r0 = {0.0, 0.015625, 0.0625, 0.25, 0.5, 1.0, 2.0, 4.0, 8.0, 14.0, 20.0, R_max};
    if (store_cells) {
        r0.push_back(0.00390625);
        r0.push_back(0.03125);
        r0.push_back(0.125);
    }
    double wm = 0.5 * (w_lo + w_hi);
    if (wm > 0.2) {
        for (double off : {-1.0, -0.5, 0.0, 0.5, 1.0}) {
            double v = wm + off;
            if (v > 0.05 && v < R_max - 0.5) r0.push_back(v);
        }
    }
    std::sort(r0.begin(), r0.end());
    r0.erase(std::unique(r0.begin(), r0.end(), [](double a, double b) { return std::abs(a - b) < 1e-6; }), r0.end());

    double tot_quad_err = 0.0;
    int init_nt = 8;
    for (size_t i = 0; i + 1 < r0.size(); i++) {
        for (int j = 0; j < init_nt; j++) {
            auto cc = eval_cell(r0[i], r0[i + 1], j / double(init_nt), (j + 1) / double(init_nt),
                                w_lo, w_hi, need_H, store_cells);
            tot_quad_err += cc.tot_err;
            pq.push(cc);
        }
    }

    while (static_cast<int>(pq.size()) < max_cells && tot_quad_err > err_tol) {
        auto c = pq.top();
        pq.pop();
        tot_quad_err -= c.tot_err;
        if (c.r_err >= c.th_err) {
            double rm = 0.5 * (c.rl + c.rh);
            auto c1 = eval_cell(c.rl, rm, c.ul, c.uh, w_lo, w_hi, need_H, store_cells);
            auto c2 = eval_cell(rm, c.rh, c.ul, c.uh, w_lo, w_hi, need_H, store_cells);
            tot_quad_err += c1.tot_err + c2.tot_err;
            pq.push(c1); pq.push(c2);
        } else {
            double um = 0.5 * (c.ul + c.uh);
            auto c1 = eval_cell(c.rl, c.rh, c.ul, um, w_lo, w_hi, need_H, store_cells);
            auto c2 = eval_cell(c.rl, c.rh, um, c.uh, w_lo, w_hi, need_H, store_cells);
            tot_quad_err += c1.tot_err + c2.tot_err;
            pq.push(c1); pq.push(c2);
        }
    }

    sc.cell_count = static_cast<int>(pq.size());
    if (store_cells) sc.cells.reserve(pq.size());
    while (!pq.empty()) {
        const auto &cc = pq.top();
        for (int j = 0; j < 3; j++) {
            sc.tot_eku_re[j] = sc.tot_eku_re[j] + cc.eku_re[j];
            sc.tot_ekv_re[j] = sc.tot_ekv_re[j] + cc.ekv_re[j];
            sc.tot_eku_im[j] = sc.tot_eku_im[j] + cc.eku_im[j];
            sc.tot_ekv_im[j] = sc.tot_ekv_im[j] + cc.ekv_im[j];
            for (int ep = 0; ep < 2; ep++) {
                sc.sum_ku_re[ep][j] = sc.sum_ku_re[ep][j] + cc.ku_re[ep][j];
                sc.sum_kv_re[ep][j] = sc.sum_kv_re[ep][j] + cc.kv_re[ep][j];
                sc.sum_ku_im[ep][j] = sc.sum_ku_im[ep][j] + cc.ku_im[ep][j];
                sc.sum_kv_im[ep][j] = sc.sum_kv_im[ep][j] + cc.kv_im[ep][j];
            }
            if (need_H) {
                sc.tot_ehu_re[j] = sc.tot_ehu_re[j] + cc.ehu_re[j];
                sc.tot_ehv_re[j] = sc.tot_ehv_re[j] + cc.ehv_re[j];
                sc.tot_ehu_im[j] = sc.tot_ehu_im[j] + cc.ehu_im[j];
                sc.tot_ehv_im[j] = sc.tot_ehv_im[j] + cc.ehv_im[j];
                for (int ep = 0; ep < 2; ep++) {
                    sc.sum_hu_re[ep][j] = sc.sum_hu_re[ep][j] + cc.hu_re[ep][j];
                    sc.sum_hv_re[ep][j] = sc.sum_hv_re[ep][j] + cc.hv_re[ep][j];
                    sc.sum_hu_im[ep][j] = sc.sum_hu_im[ep][j] + cc.hu_im[ep][j];
                    sc.sum_hv_im[ep][j] = sc.sum_hv_im[ep][j] + cc.hv_im[ep][j];
                }
            }
        }
        for (int j = 0; j < 6; j++) {
            sc.tot_eou_re[j] = sc.tot_eou_re[j] + cc.eou_re[j];
            sc.tot_eov_re[j] = sc.tot_eov_re[j] + cc.eov_re[j];
            for (int ep = 0; ep < 2; ep++) {
                sc.sum_ou_re[ep][j] = sc.sum_ou_re[ep][j] + cc.ou_re[ep][j];
                sc.sum_ov_re[ep][j] = sc.sum_ov_re[ep][j] + cc.ov_re[ep][j];
            }
        }
        if (store_cells) sc.cells.push_back(cc);
        pq.pop();
    }
    return sc;
}

static double gersh2(const std::array<I, 3> &e) {
    return std::max((e[0] + e[1]).h, (e[1] + e[2]).h);
}
static double gersh3(const std::array<I, 6> &e) {
    return std::max({(e[0] + e[1] + e[2]).h, (e[1] + e[3] + e[4]).h, (e[2] + e[4] + e[5]).h});
}

struct SlabResult {
    double evK_hi, evO_hi, evH_hi, errK, errO;
};

static SlabResult eval_const_L(
    const SlabCache &sc, double L,
    const std::array<I, 6> &BO_re, const std::array<I, 6> &BO_im)
{
    I Li(L), aO = Li / I(2.0 * L - 1.0);
    I e24 = expneg(I(24.0));
    double tailK = (I(std::max(L, 1.0)) * I(939.0) * e24 / I(20.0)).h;
    double tailO = (I(7851.0) * e24 / I(20.0)).h;

    std::array<I, 3> eKr, eKi, eHr, eHi;
    for (int j = 0; j < 3; j++) {
        eKr[j] = Li * sc.tot_eku_re[j] + sc.tot_ekv_re[j];
        eKi[j] = Li * sc.tot_eku_im[j] + sc.tot_ekv_im[j];
        if (sc.need_H) {
            eHr[j] = Li * sc.tot_ehu_re[j] + sc.tot_ehv_re[j];
            eHi[j] = Li * sc.tot_ehu_im[j] + sc.tot_ehv_im[j];
        }
    }
    // Recall: ou_im == ov_re and ov_im == ou_re!
    std::array<I, 6> eOr, eOi;
    for (int j = 0; j < 6; j++) {
        eOr[j] = aO * sc.tot_eou_re[j] + sc.tot_eov_re[j];
        eOi[j] = aO * sc.tot_eov_re[j] + sc.tot_eou_re[j];
    }

    double exKr = up(up(gersh2(eKr) + tailK) + sc.qw_interp_err);
    double exKi = up(up(gersh2(eKi) + tailK) + sc.qw_interp_err);
    double exOr = up(gersh3(eOr) + tailO);
    double exOi = up(gersh3(eOi) + tailO);

    double evK = -1e9, evO = -1e9, evH = -1e9;
    std::array<I, 3> zero2 = {I(0.0), I(0.0), I(0.0)};
    for (int ep = 0; ep < 2; ep++) {
        I wp(ep == 0 ? sc.w_lo : sc.w_hi);
        I hw2 = sq(wp) / I(2.0);
        std::array<I, 3> QKw = {QA0 + hw2, QAB0, QB0 + hw2};
        std::array<I, 3> MKr, MKi, MHr, MHi;
        for (int j = 0; j < 3; j++) {
            MKr[j] = Li * sc.sum_ku_re[ep][j] + sc.sum_kv_re[ep][j];
            MKi[j] = Li * sc.sum_ku_im[ep][j] + sc.sum_kv_im[ep][j];
            if (sc.need_H) {
                MHr[j] = Li * sc.sum_hu_re[ep][j] + sc.sum_hv_re[ep][j];
                MHi[j] = Li * sc.sum_hu_im[ep][j] + sc.sum_hv_im[ep][j];
            }
        }
        std::array<I, 6> MOr, MOi;
        for (int j = 0; j < 6; j++) {
            MOr[j] = aO * sc.sum_ou_re[ep][j] + sc.sum_ov_re[ep][j];
            MOi[j] = aO * sc.sum_ov_re[ep][j] + sc.sum_ou_re[ep][j];
        }
        evK = std::max(evK, max_eig2(MKr, QKw, exKr));
        evK = std::max(evK, max_eig2(MKi, QKw, exKi));
        evO = std::max(evO, max_eig3(MOr, BO_re, exOr));
        evO = std::max(evO, max_eig3(MOi, BO_im, exOi));
        if (sc.need_H) {
            double exHr = up(gersh2(eHr) + tailK);
            double exHi = up(gersh2(eHi) + tailK);
            evH = std::max(evH, max_eig2(MHr, zero2, exHr));
            evH = std::max(evH, max_eig2(MHi, zero2, exHi));
        }
    }
    return {evK, evO, evH, std::max(exKr, exKi), std::max(exOr, exOi)};
}

static SlabResult eval_switched(
    const SlabCache &sc, double s_hi, double L_s, double eta_cut,
    const std::array<I, 6> &BO_re, const std::array<I, 6> &BO_im)
{
    I e24 = expneg(I(24.0));
    double max_wt_K = std::max(L_s, 1.34);
    double max_wt_O = std::max(1.0, up((1.0 + eta_cut) / (1.0 - eta_cut)));
    double tailK = (I(max_wt_K) * I(939.0) * e24 / I(20.0)).h;
    double tailO = (I(max_wt_O) * I(7851.0) * e24 / I(20.0)).h;

    I Ls_I(L_s), aO_s = Ls_I / I(2.0 * L_s - 1.0);
    I s_I(s_hi);

    std::array<std::array<I, 3>, 2> sKr{}, sKi{};
    std::array<std::array<I, 6>, 2> sOr{}, sOi{};
    std::array<I, 3> eKr{}, eKi{};
    std::array<I, 6> eOr{}, eOi{};

    for (const auto &cc : sc.cells) {
        I al_K, ga_K, al_O, ga_O;
        bool use_bulk = false;
        if (cc.r_i.l > 0.0) {
            I eta_K = s_I * cc.M_K_div_r;
            if (eta_K.h < eta_cut && eta_K.h < 0.99) {
                use_bulk = true;
                I eta_u = s_I * cc.g_K_div_r;
                if (eta_u.h >= 1.0) throw std::runtime_error("eta_u >= 1 inside bulk");
                I eh(eta_u.h);
                I denom_K = I(1.0) - eh + sq(eh);
                I alK_i = sq(eh) / denom_K;
                I gaK_i = I(1.0) / denom_K;
                I ek(eta_K.h);
                I alO_i = (I(1.0) + ek) / (I(2.0) * (I(1.0) - ek));
                I gaO_i = I(1.0) / (I(1.0) - ek);
                al_K = I(alK_i.h);
                ga_K = I(gaK_i.h);
                al_O = I(alO_i.h);
                ga_O = I(gaO_i.h);
            }
        }
        if (!use_bulk) {
            al_K = Ls_I; ga_K = I(1.0); al_O = aO_s; ga_O = I(1.0);
        }

        for (int j = 0; j < 3; j++) {
            eKr[j] = eKr[j] + al_K * cc.eku_re[j] + ga_K * cc.ekv_re[j];
            eKi[j] = eKi[j] + al_K * cc.eku_im[j] + ga_K * cc.ekv_im[j];
            for (int ep = 0; ep < 2; ep++) {
                sKr[ep][j] = sKr[ep][j] + al_K * cc.ku_re[ep][j] + ga_K * cc.kv_re[ep][j];
                sKi[ep][j] = sKi[ep][j] + al_K * cc.ku_im[ep][j] + ga_K * cc.kv_im[ep][j];
            }
        }
        for (int j = 0; j < 6; j++) {
            eOr[j] = eOr[j] + al_O * cc.eou_re[j] + ga_O * cc.eov_re[j];
            eOi[j] = eOi[j] + al_O * cc.eov_re[j] + ga_O * cc.eou_re[j];
            for (int ep = 0; ep < 2; ep++) {
                sOr[ep][j] = sOr[ep][j] + al_O * cc.ou_re[ep][j] + ga_O * cc.ov_re[ep][j];
                sOi[ep][j] = sOi[ep][j] + al_O * cc.ov_re[ep][j] + ga_O * cc.ou_re[ep][j];
            }
        }
    }

    double exKr = up(up(gersh2(eKr) + tailK) + sc.qw_interp_err);
    double exKi = up(up(gersh2(eKi) + tailK) + sc.qw_interp_err);
    double exOr = up(gersh3(eOr) + tailO);
    double exOi = up(gersh3(eOi) + tailO);

    double evK = -1e9, evO = -1e9;
    for (int ep = 0; ep < 2; ep++) {
        I wp(ep == 0 ? sc.w_lo : sc.w_hi);
        I hw2 = sq(wp) / I(2.0);
        std::array<I, 3> QKw = {QA0 + hw2, QAB0, QB0 + hw2};
        evK = std::max(evK, max_eig2(sKr[ep], QKw, exKr));
        evK = std::max(evK, max_eig2(sKi[ep], QKw, exKi));
        evO = std::max(evO, max_eig3(sOr[ep], BO_re, exOr));
        evO = std::max(evO, max_eig3(sOi[ep], BO_im, exOi));
    }
    return {evK, evO, 0.0, std::max(exKr, exKi), std::max(exOr, exOi)};
}

static I compute_h_756() {
    const int N = 20000;
    const double Umax = 6.0;
    I du = I(Umax) / I(static_cast<double>(N));
    I I1(0.0), I2(0.0);
    for (int i = 0; i < N; i++) {
        I u_lo = du * I(static_cast<double>(i));
        I u_hi = du * I(static_cast<double>(i + 1));
        I u(u_lo.l, u_hi.h);
        I T = sq(u);
        I e = expneg(T);
        I den = A_C + B_C * T;
        I1 = I1 + du * (I(2.0) * T * e / den);
        I2 = I2 + du * (I(2.0) * sq(T) * e / den);
    }
    I tail(0.0, 1e-11);
    return ((I2 + tail) - I(2.0) * (I1 + tail)) / SQRT2;
}

static void self_tests() {
    for (int k = 0; k <= 36; k++) {
        double th = (3.141592653589793 * k) / 36.0;
        I s, c;
        sincos_point(th, s, c);
        I one = sq(s) + sq(c);
        if (one.l > 1.0 || one.h < 1.0) throw std::runtime_error("sincos self-test failed");
    }
    // Check 2nd-derivative factored densities against central finite differences!
    double r0 = 0.73, th0 = 1.12, w_t = 0.47, eps = 1e-5;
    I s0, c0, sp, cp, sm, cm;
    sincos_point(th0, s0, c0);
    sincos_point(th0 + eps, sp, cp);
    sincos_point(th0 - eps, sm, cm);
    auto eval_pt = [&](double r, I c, I s, double w) {
        auto ps = eval_polys(I(r), c, s, I(w), 0);
        auto ad = eval_dens(ps.s.v, true, false);
        return combine_val(ad, ps, true);
    };
    auto eval_dir = [&](int mode) {
        auto ps = eval_polys(I(r0), c0, s0, I(w_t), mode);
        auto ad = eval_dens(ps.s.v, true, true);
        return combine_d2(ad, ps, true);
    };
    auto v0 = eval_pt(r0, c0, s0, w_t);
    auto vrp = eval_pt(r0 + eps, c0, s0, w_t), vrm = eval_pt(r0 - eps, c0, s0, w_t);
    auto vtp = eval_pt(r0, cp, sp, w_t), vtm = eval_pt(r0, cm, sm, w_t);
    auto vwp = eval_pt(r0, c0, s0, w_t + eps), vwm = eval_pt(r0, c0, s0, w_t - eps);
    auto dr2 = eval_dir(1), dt2 = eval_dir(2), dw2 = eval_dir(3);
    auto chk = [&](I an_i, I vp, I vm0, I vm, const char *name) {
        double fd = (0.5 * (vp.l + vp.h) - (vm0.l + vm0.h) + 0.5 * (vm.l + vm.h)) / (eps * eps);
        double an = 0.5 * (an_i.l + an_i.h);
        if (std::abs(fd - an) > 1e-3 * (1.0 + std::abs(an))) {
            std::cerr << "FD mismatch on " << name << ": fd=" << fd << " an=" << an << "\n";
            throw std::runtime_error("factored d2 FD check failed");
        }
    };
    for (int j = 0; j < 3; j++) {
        chk(dr2.ku_re[j], vrp.ku_re[j], v0.ku_re[j], vrm.ku_re[j], "ku_re_rr");
        chk(dt2.kv_re[j], vtp.kv_re[j], v0.kv_re[j], vtm.kv_re[j], "kv_re_tt");
        chk(dw2.ku_im[j], vwp.ku_im[j], v0.ku_im[j], vwm.ku_im[j], "ku_im_ww");
        chk(dr2.kv_im[j], vrp.kv_im[j], v0.kv_im[j], vrm.kv_im[j], "kv_im_rr");
        chk(dw2.hu_re[j], vwp.hu_re[j], v0.hu_re[j], vwm.hu_re[j], "hu_re_ww");
        chk(dt2.hv_im[j], vtp.hv_im[j], v0.hv_im[j], vtm.hv_im[j], "hv_im_tt");
    }
    for (int j = 0; j < 6; j++) {
        chk(dr2.ou_re[j], vrp.ou_re[j], v0.ou_re[j], vrm.ou_re[j], "ou_re_rr");
        chk(dt2.ov_re[j], vtp.ov_re[j], v0.ov_re[j], vtm.ov_re[j], "ov_re_tt");
        chk(dw2.ou_re[j], vwp.ou_re[j], v0.ou_re[j], vwm.ou_re[j], "ou_re_ww");
        chk(dw2.ov_re[j], vwp.ov_re[j], v0.ov_re[j], vwm.ov_re[j], "ov_re_ww");
    }
}

template <typename Fn>
static void parallel_for(size_t n, int nthreads, Fn fn) {
    std::atomic<size_t> next{0};
    std::vector<std::thread> threads;
    for (int t = 0; t < nthreads; t++) {
        threads.emplace_back([&]() {
            while (true) {
                size_t i = next.fetch_add(1);
                if (i >= n) break;
                fn(i);
            }
        });
    }
    for (auto &th : threads) th.join();
}

int main(int argc, char **argv) {
    static_assert(std::numeric_limits<double>::is_iec559 &&
                  std::numeric_limits<double>::radix == 2 &&
                  std::numeric_limits<double>::digits == 53);
    if (std::fegetround() != FE_TONEAREST) {
        std::cerr << "FE_TONEAREST rounding mode required\n";
        return 2;
    }
    self_tests();

    const int nthreads = std::max(1u, std::thread::hardware_concurrency());

    // Phase-invariant global rational visible shift c* = (-31/100)*Re(nu) + i*(-7/25)*Im(nu)
    // and phase-invariant zero-mean compensating form C(Q, nu) (c3 = c4 = 0, so E[C] = 0
    // holds under arbitrary sharing after rotating q = |q|e^{i phi} to the real axis):
    //   k1 = -73/100, c3 = 0, al_r = -31/100
    //   k2 = -33/50,  c4 = 0, al_i = -7/25
    // (Constants found by codex-a7c4 in review of PR #594.)
    const I k1 = rat(-73, 100), c3 = I(0.0), al_r = rat(-31, 100);
    const I k2 = rat(-33, 50),  c4 = I(0.0), al_i = rat(-7, 25);
    const I diag_nur = P_C + I(2.0) * k1 * al_r - (P_C + I(1.0)) * sq(al_r);
    const I diag_nui = P_C + I(2.0) * k2 * al_i - (P_C + I(1.0)) * sq(al_i);
    const std::array<I, 6> BO_re = {P_C, I(0.0), k1, P_C, c3, diag_nur};
    const std::array<I, 6> BO_im = {P_C, I(0.0), k2, P_C, c4, diag_nui};

    const I h756 = compute_h_756();
    const std::array<I, 6> B756_re = {P_C, I(0.0), rat(11, 20) * h756, P_C, I(0.0), P_C};
    const std::array<I, 6> B756_im = {P_C, I(0.0), h756, P_C, I(0.0), P_C};

    // Exact dyadic IEEE-754 slab partition of [0, 8] (every endpoint is exact in binary64!):
    //   [0, 3/8]:       24 slabs of width 1/64  = 0.015625
    //   [3/8, 11/16]:   40 slabs of width 1/128 = 0.0078125 (tight O-block peak near w ~ 0.47)
    //   [11/16, 11/8]:  44 slabs of width 1/64  = 0.015625  (11/8 = 1.375 < 7/5 = 1.4!)
    //   [11/8, 19/8]:   32 slabs of width 1/32  = 0.03125
    //   [19/8, 8]:      90 slabs of width 1/16  = 0.0625
    struct SlabSpec { double wl, wh, tol; int maxc; };
    std::vector<SlabSpec> specs_inner, specs_outer;
    for (int i = 0; i < 24; i++) specs_inner.push_back({i / 64.0, (i + 1) / 64.0, 2e-3, 6000});
    for (int i = 0; i < 40; i++) specs_inner.push_back({(48 + i) / 128.0, (49 + i) / 128.0, 1e-3, 18000});
    for (int i = 0; i < 44; i++) specs_inner.push_back({(44 + i) / 64.0, (45 + i) / 64.0, 2e-3, 6000});
    for (int i = 0; i < 32; i++) specs_outer.push_back({(44 + i) / 32.0, (45 + i) / 32.0, 4e-3, 5000});
    for (int i = 0; i < 90; i++) specs_outer.push_back({(38 + i) / 16.0, (39 + i) / 16.0, 2e-2, 2500});

    std::string mode = (argc >= 2) ? argv[1] : "all";
    // Print exact IEEE-754 hexfloats so Python's float.fromhex -> Fraction is bit-for-bit exact!
    std::cout << std::hexfloat;

    std::vector<SlabCache> inner_caches, outer_caches;
    if (mode == "all" || mode == "partBD" || mode == "partC") {
        bool need_cells = (mode == "all" || mode == "partC");
        inner_caches.resize(specs_inner.size());
        parallel_for(specs_inner.size(), nthreads, [&](size_t i) {
            auto sp = specs_inner[i];
            inner_caches[i] = build_adaptive_slab(sp.wl, sp.wh, 25.0, sp.tol, sp.maxc, true, need_cells);
        });
    }
    if (mode == "all" || mode == "partA" || mode == "partBD") {
        outer_caches.resize(specs_outer.size());
        parallel_for(specs_outer.size(), nthreads, [&](size_t i) {
            auto sp = specs_outer[i];
            outer_caches[i] = build_adaptive_slab(sp.wl, sp.wh, 29.0, sp.tol, sp.maxc, true, false);
        });
    }

    if (mode == "all" || mode == "partA") {
        double maxK = -1e9, maxO_756 = -1e9, maxO_cstar = -1e9, maxErrO = 0.0;
        for (const auto &sc : outer_caches) {
            auto r1 = eval_const_L(sc, 1.0, B756_re, B756_im);
            auto r2 = eval_const_L(sc, 1.0, BO_re, BO_im);
            maxK = std::max(maxK, r1.evK_hi);
            maxO_756 = std::max(maxO_756, r1.evO_hi);
            maxO_cstar = std::max(maxO_cstar, r2.evO_hi);
            maxErrO = std::max(maxErrO, r1.errO);
        }
        std::cout << "PART_A w_lo=" << outer_caches.front().w_lo
                  << " w_hi=" << outer_caches.back().w_hi
                  << " slabs=" << outer_caches.size()
                  << " h756_lo=" << h756.l << " h756_hi=" << h756.h
                  << " max_evK=" << maxK << " max_evO_756=" << maxO_756
                  << " max_evO_cstar=" << maxO_cstar << " max_errO=" << maxErrO
                  << " PASS=" << ((maxK < 0.0 && maxO_756 < 0.0 && maxO_cstar < 0.0) ? 1 : 0) << "\n";
        std::cout.flush();
    }

    if (mode == "all" || mode == "partBD") {
        for (auto [L, L_tag] : std::vector<std::pair<double, const char*>>{{3.25, "3.25"}, {5.0, "5"}}) {
            double maxK = -1e9, maxO = -1e9, maxH = -1e9, maxErrO = 0.0, maxErrK = 0.0;
            for (const auto &sc : inner_caches) {
                auto r = eval_const_L(sc, L, BO_re, BO_im);
                maxK = std::max(maxK, r.evK_hi);
                maxO = std::max(maxO, r.evO_hi);
                maxH = std::max(maxH, r.evH_hi);
                maxErrO = std::max(maxErrO, r.errO);
                maxErrK = std::max(maxErrK, r.errK);
            }
            for (const auto &sc : outer_caches) {
                auto r = eval_const_L(sc, L, BO_re, BO_im);
                maxK = std::max(maxK, r.evK_hi);
                maxO = std::max(maxO, r.evO_hi);
                maxH = std::max(maxH, r.evH_hi);
                maxErrO = std::max(maxErrO, r.errO);
                maxErrK = std::max(maxErrK, r.errK);
            }
            std::cout << "PART_BD L=" << L_tag << " max_cV_Fjoint=" << maxK
                      << " max_evO=" << maxO << " max_cV_recen=" << maxH
                      << " max_errK=" << maxErrK << " max_errO=" << maxErrO << "\n";
            std::cout.flush();
        }
    }

    if (mode == "all" || mode == "partC") {
        std::vector<int> s_milli = {6, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 24, 26, 30, 36};
        std::vector<std::pair<double, double>> cand_params = {
            {1.0, 0.34}, {1.0, 0.24}, {1.0, 0.16},
            {1.5, 0.24}, {1.5, 0.16},
            {2.0, 0.22}, {2.0, 0.14},
            {2.5, 0.18}, {2.5, 0.12},
            {3.0, 0.22}, {3.0, 0.14}, {3.0, 0.08},
            {3.5, 0.12}, {3.5, 0.06},
            {4.0, 0.12}, {4.0, 0.07}
        };
        for (int sm : s_milli) {
            double s_hi = rat(sm, 1000).h; // outward-rounded >= sm/1000 so K = (sm/1000)^2 is strictly enclosed!
            std::vector<double> slab_cK(inner_caches.size()), slab_evO(inner_caches.size());
            parallel_for(inner_caches.size(), nthreads, [&](size_t i) {
                const auto &sc = inner_caches[i];
                auto r_fb = eval_const_L(sc, 3.25, BO_re, BO_im);
                double best_cK_w = (r_fb.evO_hi < 0.0) ? r_fb.evK_hi : 1e9;
                double best_evO_w = r_fb.evO_hi;
                auto r_fb3 = eval_const_L(sc, 3.0, BO_re, BO_im);
                if (r_fb3.evO_hi < 0.0 && r_fb3.evK_hi < best_cK_w) {
                    best_cK_w = r_fb3.evK_hi;
                    best_evO_w = r_fb3.evO_hi;
                }
                for (auto [Ls, ec] : cand_params) {
                    auto r = eval_switched(sc, s_hi, Ls, ec, BO_re, BO_im);
                    if (r.evO_hi < 0.0 && r.evK_hi < best_cK_w) {
                        best_cK_w = r.evK_hi;
                        best_evO_w = r.evO_hi;
                    }
                }
                slab_cK[i] = best_cK_w;
                slab_evO[i] = best_evO_w;
            });
            double worst_cK = -1e9, worst_evO = -1e9, worst_w = 0.0;
            for (size_t i = 0; i < inner_caches.size(); i++) {
                if (slab_cK[i] > 1e8) throw std::runtime_error("no passing parameter for slab");
                if (slab_cK[i] > worst_cK) {
                    worst_cK = slab_cK[i];
                    worst_w = inner_caches[i].w_lo;
                }
                worst_evO = std::max(worst_evO, slab_evO[i]);
            }
            std::cout << "PART_C s_milli=" << sm << " K_num=" << (sm * sm) << " K_den=1000000"
                      << " c_K_hi=" << worst_cK << " max_evO=" << worst_evO
                      << " worst_w=" << worst_w << "\n";
            std::cout.flush();
        }
    }
    return 0;
}
