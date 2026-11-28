// certify_content_cells.cpp
// Outward-rounded C++17 certifier for Problem P1 (Issue #623):
// First-chaos content of a cubic chaos element q in H_{2,1}(C^n) against its fourth cumulant,
// per cell of energy u and fourth excess chi.
//
// Zero external dependencies; zero libm ULP assumptions (exp, sin, cos implemented from
// IEEE-754 directed-rounded +, -, *, /, sqrt under FE_UPWARD with rigorous Taylor remainders).
//
// Build: c++ -O3 -std=c++17 -Wall -Wextra -Werror -pthread certify_content_cells.cpp -o certify_content_cells

#include <cfenv>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
#include <array>
#include <atomic>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <set>
#include <sstream>
#include <string>
#include <thread>
#include <vector>

#pragma STDC FENV_ACCESS ON

namespace {

// Self-contained FIPS 180-4 SHA-256 for cryptographic receipt binding (zero external dependencies).
static std::string sha256_bytes_hex(const uint8_t* data, size_t len) {
    static const uint32_t K[64] = {
        0x428a2f98u, 0x71374491u, 0xb5c0fbcfu, 0xe9b5dba5u, 0x3956c25bu, 0x59f111f1u, 0x923f82a4u, 0xab1c5ed5u,
        0xd807aa98u, 0x12835b01u, 0x243185beu, 0x550c7dc3u, 0x72be5d74u, 0x80deb1feu, 0x9bdc06a7u, 0xc19bf174u,
        0xe49b69c1u, 0xefbe4786u, 0x0fc19dc6u, 0x240ca1ccu, 0x2de92c6fu, 0x4a7484aau, 0x5cb0a9dcu, 0x76f988dau,
        0x983e5152u, 0xa831c66du, 0xb00327c8u, 0xbf597fc7u, 0xc6e00bf3u, 0xd5a79147u, 0x06ca6351u, 0x14292967u,
        0x27b70a85u, 0x2e1b2138u, 0x4d2c6dfcu, 0x53380d13u, 0x650a7354u, 0x766a0abbu, 0x81c2c92eu, 0x92722c85u,
        0xa2bfe8a1u, 0xa81a664bu, 0xc24b8b70u, 0xc76c51a3u, 0xd192e819u, 0xd6990624u, 0xf40e3585u, 0x106aa070u,
        0x19a4c116u, 0x1e376c08u, 0x2748774cu, 0x34b0bcb5u, 0x391c0cb3u, 0x4ed8aa4au, 0x5b9cca4fu, 0x682e6ff3u,
        0x748f82eeu, 0x78a5636fu, 0x84c87814u, 0x8cc70208u, 0x90befffau, 0xa4506cebu, 0xbef9a3f7u, 0xc67178f2u
    };
    auto rotr = [](uint32_t x, int n) -> uint32_t { return (x >> n) | (x << (32 - n)); };
    uint32_t h[8] = {
        0x6a09e667u, 0xbb67ae85u, 0x3c6ef372u, 0xa54ff53au,
        0x510e527fu, 0x9b05688cu, 0x1f83d9abu, 0x5be0cd19u
    };
    uint64_t bit_len = static_cast<uint64_t>(len) * 8ULL;
    size_t pad_len = ((len + 9 + 63) / 64) * 64;
    std::vector<uint8_t> msg(pad_len, 0);
    if (len > 0) std::memcpy(msg.data(), data, len);
    msg[len] = 0x80u;
    for (int i = 0; i < 8; ++i) {
        msg[pad_len - 1 - i] = static_cast<uint8_t>((bit_len >> (8 * i)) & 0xffu);
    }
    for (size_t off = 0; off < pad_len; off += 64) {
        uint32_t w[64];
        for (int i = 0; i < 16; ++i) {
            w[i] = (static_cast<uint32_t>(msg[off + 4 * i]) << 24)
                 | (static_cast<uint32_t>(msg[off + 4 * i + 1]) << 16)
                 | (static_cast<uint32_t>(msg[off + 4 * i + 2]) << 8)
                 | static_cast<uint32_t>(msg[off + 4 * i + 3]);
        }
        for (int i = 16; i < 64; ++i) {
            uint32_t s0 = rotr(w[i - 15], 7) ^ rotr(w[i - 15], 18) ^ (w[i - 15] >> 3);
            uint32_t s1 = rotr(w[i - 2], 17) ^ rotr(w[i - 2], 19) ^ (w[i - 2] >> 10);
            w[i] = w[i - 16] + s0 + w[i - 7] + s1;
        }
        uint32_t a = h[0], b = h[1], c = h[2], d = h[3], e = h[4], f = h[5], g = h[6], hh = h[7];
        for (int i = 0; i < 64; ++i) {
            uint32_t S1 = rotr(e, 6) ^ rotr(e, 11) ^ rotr(e, 25);
            uint32_t ch = (e & f) ^ ((~e) & g);
            uint32_t t1 = hh + S1 + ch + K[i] + w[i];
            uint32_t S0 = rotr(a, 2) ^ rotr(a, 13) ^ rotr(a, 22);
            uint32_t maj = (a & b) ^ (a & c) ^ (b & c);
            uint32_t t2 = S0 + maj;
            hh = g; g = f; f = e; e = d + t1; d = c; c = b; b = a; a = t1 + t2;
        }
        h[0] += a; h[1] += b; h[2] += c; h[3] += d;
        h[4] += e; h[5] += f; h[6] += g; h[7] += hh;
    }
    char hex[65];
    for (int i = 0; i < 8; ++i) std::snprintf(hex + 8 * i, 9, "%08x", h[i]);
    hex[64] = '\0';
    return std::string(hex);
}

static std::string sha256_file_hex(const std::string& path) {
    std::ifstream in(path, std::ios::binary);
    if (!in) {
        std::fprintf(stderr, "FATAL: cannot open %s for SHA-256\n", path.c_str());
        std::exit(2);
    }
    std::vector<uint8_t> buf((std::istreambuf_iterator<char>(in)), std::istreambuf_iterator<char>());
    return sha256_bytes_hex(buf.data(), buf.size());
}

// Force compiler barriers around directed-rounded operations so -O3 never folds or reorders signs.
inline double keep(double x) {
    asm volatile("" : "+r"(x));
    return x;
}

inline double add_up(double a, double b) { return keep(a) + b; }
inline double add_dn(double a, double b) { return -(keep(-a) + (-b)); }
inline double sub_up(double a, double b) { return keep(a) - b; }
inline double sub_dn(double a, double b) { return -(keep(b) - a); }

inline double mul_up(double a, double b) { return keep(a) * b; }
inline double mul_dn(double a, double b) { return -(keep(-a) * b); }
inline double div_up(double a, double b) { return keep(a) / b; }
inline double div_dn(double a, double b) { return -(keep(-a) / b); }

inline double sqrt_up(double a) {
    if (a <= 0.0) return 0.0;
    return keep(std::sqrt(keep(a)));
}

inline double sqrt_dn(double a) {
    if (a <= 0.0) return 0.0;
    // IEEE-754 sqrt in FE_UPWARD rounds upward; 1 ulp below is a strict lower bound,
    // or verify r_dn * r_dn <= a viamul_up!
    double r = std::sqrt(keep(a));
    if (mul_up(r, r) > a) {
        r = std::nextafter(r, 0.0);
    }
    return r;
}

struct Ival {
    double lo;
    double hi;

    static Ival pt(double v) { return {v, v}; }
    static Ival hull(double a, double b) { return {std::min(a, b), std::max(a, b)}; }

    double mid() const { return 0.5 * (lo + hi); }
    double rad() const { return sub_up(hi, lo) * 0.5; }
    double width() const { return sub_up(hi, lo); }
    Ival len_ival() const { return {std::max(0.0, sub_dn(hi, lo)), std::max(0.0, sub_up(hi, lo))}; }
};

inline Ival operator+(const Ival& a, const Ival& b) {
    return {add_dn(a.lo, b.lo), add_up(a.hi, b.hi)};
}
inline Ival operator-(const Ival& a, const Ival& b) {
    return {sub_dn(a.lo, b.hi), sub_up(a.hi, b.lo)};
}
inline Ival operator-(const Ival& a) {
    return {-a.hi, -a.lo};
}
inline Ival operator*(const Ival& a, const Ival& b) {
    double l1 = mul_dn(a.lo, b.lo), u1 = mul_up(a.lo, b.lo);
    double l2 = mul_dn(a.lo, b.hi), u2 = mul_up(a.lo, b.hi);
    double l3 = mul_dn(a.hi, b.lo), u3 = mul_up(a.hi, b.lo);
    double l4 = mul_dn(a.hi, b.hi), u4 = mul_up(a.hi, b.hi);
    return {std::min({l1, l2, l3, l4}), std::max({u1, u2, u3, u4})};
}
inline Ival operator*(double c, const Ival& a) {
    return Ival::pt(c) * a;
}
inline Ival operator/(const Ival& a, const Ival& b) {
    if (b.lo <= 0.0 && b.hi >= 0.0) {
        std::fprintf(stderr, "FATAL: division by interval [%g, %g] containing 0\n", b.lo, b.hi);
        std::exit(2);
    }
    double l1 = div_dn(a.lo, b.lo), u1 = div_up(a.lo, b.lo);
    double l2 = div_dn(a.lo, b.hi), u2 = div_up(a.lo, b.hi);
    double l3 = div_dn(a.hi, b.lo), u3 = div_up(a.hi, b.lo);
    double l4 = div_dn(a.hi, b.hi), u4 = div_up(a.hi, b.hi);
    return {std::min({l1, l2, l3, l4}), std::max({u1, u2, u3, u4})};
}

inline Ival ival_abs(const Ival& a) {
    if (a.lo >= 0.0) return a;
    if (a.hi <= 0.0) return {-a.hi, -a.lo};
    return {0.0, std::max(-a.lo, a.hi)};
}

inline Ival ival_sqr(const Ival& a) {
    Ival ab = ival_abs(a);
    return {mul_dn(ab.lo, ab.lo), mul_up(ab.hi, ab.hi)};
}

inline Ival ival_sqrt(const Ival& a) {
    double lo = (a.lo <= 0.0) ? 0.0 : sqrt_dn(a.lo);
    double hi = (a.hi <= 0.0) ? 0.0 : sqrt_up(a.hi);
    return {lo, hi};
}

inline Ival ival_max(const Ival& a, const Ival& b) {
    return {std::max(a.lo, b.lo), std::max(a.hi, b.hi)};
}
inline Ival ival_min(const Ival& a, const Ival& b) {
    return {std::min(a.lo, b.lo), std::min(a.hi, b.hi)};
}
inline Ival ival_join(const Ival& a, const Ival& b) {
    return {std::min(a.lo, b.lo), std::max(a.hi, b.hi)};
}

// Verified constants (strictly enclosing true mathematical values in IEEE-754 double):
// pi   = 3.1415926535897932384626433...
// ln 2 = 0.6931471805599453094172321...
const Ival PI_IVAL  = {3.141592653589793115998, 3.141592653589793560088};
const Ival LN2_IVAL = {0.693147180559945286227, 0.693147180559945397249};

// Pure IEEE-754 libm-free exp(x) for x in [-700, 700]
inline Ival ival_exp(const Ival& x) {
    if (x.hi < -700.0) return {0.0, std::ldexp(1.0, -1000)};
    auto eval_pt_exp = [](double v) -> Ival {
        if (v < -700.0) return {0.0, std::ldexp(1.0, -1000)};
        int k = static_cast<int>(std::floor(v / 0.6931471805599453 + 0.5));
        Ival r = Ival::pt(v) - static_cast<double>(k) * LN2_IVAL;
        // |r| <= 0.35; 14-term Taylor series sum_{m=0}^{13} r^m / m! + [-rem, +rem], rem = 2 * |r|^{14} / 14!
        Ival sum = Ival::pt(1.0);
        Ival term = Ival::pt(1.0);
        for (int m = 1; m <= 13; ++m) {
            term = (term * r) / Ival::pt(static_cast<double>(m));
            sum = sum + term;
        }
        Ival r_abs = ival_abs(r);
        double rh = r_abs.hi;
        double p14 = 1.0;
        for (int m = 1; m <= 14; ++m) p14 = mul_up(p14, div_up(rh, static_cast<double>(m)));
        double rem = mul_up(2.0, p14);
        Ival res = {sub_dn(sum.lo, rem), add_up(sum.hi, rem)};
        double scale = std::ldexp(1.0, k);
        return {mul_dn(res.lo, scale), mul_up(res.hi, scale)};
    };
    Ival elo = eval_pt_exp(x.lo);
    Ival ehi = eval_pt_exp(x.hi);
    return {std::max(0.0, elo.lo), ehi.hi};
}

// Pure IEEE-754 libm-free cos(u) and sin(u) for |u| <= pi/4 < 0.79
inline void sin_cos_reduced(const Ival& u, Ival& s_out, Ival& c_out) {
    Ival u2 = ival_sqr(u);
    // cos(u) = sum_{k=0}^7 (-1)^k u^{2k} / (2k)! +- |u|^{16}/16!
    Ival c_sum = Ival::pt(1.0);
    Ival c_term = Ival::pt(1.0);
    for (int k = 1; k <= 7; ++k) {
        double denom = static_cast<double>((2 * k - 1) * (2 * k));
        c_term = -(c_term * u2) / Ival::pt(denom);
        c_sum = c_sum + c_term;
    }
    double uh = ival_abs(u).hi;
    double rem_c = 1.0;
    for (int m = 1; m <= 16; ++m) rem_c = mul_up(rem_c, div_up(uh, static_cast<double>(m)));
    c_out = {std::max(-1.0, sub_dn(c_sum.lo, rem_c)), std::min(1.0, add_up(c_sum.hi, rem_c))};

    // sin(u) = sum_{k=0}^7 (-1)^k u^{2k+1} / (2k+1)! +- |u|^{17}/17!
    Ival s_sum = u;
    Ival s_term = u;
    for (int k = 1; k <= 7; ++k) {
        double denom = static_cast<double>((2 * k) * (2 * k + 1));
        s_term = -(s_term * u2) / Ival::pt(denom);
        s_sum = s_sum + s_term;
    }
    double rem_s = mul_up(rem_c, div_up(uh, 17.0));
    s_out = {std::max(-1.0, sub_dn(s_sum.lo, rem_s)), std::min(1.0, add_up(s_sum.hi, rem_s))};
}

// Rigorous sin(theta), cos(theta) for theta in [0, pi] (monotonicity: cos strictly decreasing on [0, pi],
// sin increasing on [0, pi/2] and decreasing on [pi/2, pi]).
inline void ival_sincos_0_pi(const Ival& th, Ival& sin_out, Ival& cos_out) {
    auto eval_pt = [](double t, Ival& sp, Ival& cp) {
        Ival pi2 = 0.5 * PI_IVAL;
        Ival pi4 = 0.25 * PI_IVAL;
        if (t <= 0.7853981633974483) {
            sin_cos_reduced(Ival::pt(t), sp, cp);
        } else if (t <= 1.5707963267948966) {
            Ival u = pi2 - Ival::pt(t);
            sin_cos_reduced(u, cp, sp);
        } else if (t <= 2.356194490192345) {
            Ival u = Ival::pt(t) - pi2;
            Ival su, cu;
            sin_cos_reduced(u, su, cu);
            sp = cu;
            cp = -su;
        } else {
            Ival u = ival_max(Ival::pt(0.0), PI_IVAL - Ival::pt(t));
            Ival su, cu;
            sin_cos_reduced(u, su, cu);
            sp = su;
            cp = -cu;
        }
        (void)pi4;
    };
    Ival s_lo, c_lo, s_hi, c_hi;
    eval_pt(th.lo, s_lo, c_lo);
    eval_pt(th.hi, s_hi, c_hi);
    // cos is strictly decreasing on [0, pi]
    cos_out = {std::max(-1.0, c_hi.lo), std::min(1.0, c_lo.hi)};
    // sin on [0, pi]: attains max 1 if pi/2 in [th.lo, th.hi]
    Ival pi2 = 0.5 * PI_IVAL;
    double slo = std::max(0.0, std::min(s_lo.lo, s_hi.lo));
    double shi = std::min(1.0, std::max(s_lo.hi, s_hi.hi));
    if (th.lo <= pi2.hi && th.hi >= pi2.lo) {
        shi = 1.0;
    }
    sin_out = {slo, shi};
}

// 3-variable centered affine form: c0 + c1*e1 + c2*e2 + c3*e3 + [-rad, +rad], e_i in [-1, 1]
struct Aff3 {
    double c0, c1, c2, c3, rad;

    static Aff3 cst(const Ival& v) {
        double m = v.mid();
        double r = std::max(sub_up(v.hi, m), sub_up(m, v.lo));
        return {m, 0.0, 0.0, 0.0, r};
    }
    static Aff3 var1(const Ival& v) {
        double m_lo = mul_dn(0.5, add_dn(v.lo, v.hi)), m_hi = mul_up(0.5, add_up(v.lo, v.hi));
        double h_lo = mul_dn(0.5, sub_dn(v.hi, v.lo)), h_hi = mul_up(0.5, sub_up(v.hi, v.lo));
        double err = add_up(sub_up(m_hi, m_lo), sub_up(h_hi, h_lo));
        return {m_hi, h_hi, 0.0, 0.0, std::max(0.0, err)};
    }
    static Aff3 var2(const Ival& v) {
        double m_lo = mul_dn(0.5, add_dn(v.lo, v.hi)), m_hi = mul_up(0.5, add_up(v.lo, v.hi));
        double h_lo = mul_dn(0.5, sub_dn(v.hi, v.lo)), h_hi = mul_up(0.5, sub_up(v.hi, v.lo));
        double err = add_up(sub_up(m_hi, m_lo), sub_up(h_hi, h_lo));
        return {m_hi, 0.0, h_hi, 0.0, std::max(0.0, err)};
    }
    static Aff3 var3(const Ival& v) {
        double m = mul_up(0.5, add_up(v.lo, v.hi));
        double h = std::max(sub_up(m, v.lo), sub_up(v.hi, m));
        return {m, 0.0, 0.0, h, 0.0};
    }

    double l1_lin() const {
        return add_up(add_up(std::fabs(c1), std::fabs(c2)), std::fabs(c3));
    }
    Ival bounds() const {
        double sp = add_up(l1_lin(), rad);
        return {sub_dn(c0, sp), add_up(c0, sp)};
    }
    // Integral over (e1, e2) in [-1, 1]^2 / 4 leaves c0 + c3 * e3 + [-rad, +rad]!
    Ival eval_at_e3_subinterval(const Ival& e3_iv) const {
        Ival base = Ival::pt(c0) + Ival::pt(c3) * e3_iv;
        return {sub_dn(base.lo, rad), add_up(base.hi, rad)};
    }
};

inline Aff3 aff_add(const Aff3& a, const Aff3& b) {
    Ival s0 = Ival::pt(a.c0) + Ival::pt(b.c0);
    Ival s1 = Ival::pt(a.c1) + Ival::pt(b.c1);
    Ival s2 = Ival::pt(a.c2) + Ival::pt(b.c2);
    Ival s3 = Ival::pt(a.c3) + Ival::pt(b.c3);
    double m0 = s0.mid(), m1 = s1.mid(), m2 = s2.mid(), m3 = s3.mid();
    double r = add_up(a.rad, b.rad);
    r = add_up(r, std::max(sub_up(s0.hi, m0), sub_up(m0, s0.lo)));
    r = add_up(r, std::max(sub_up(s1.hi, m1), sub_up(m1, s1.lo)));
    r = add_up(r, std::max(sub_up(s2.hi, m2), sub_up(m2, s2.lo)));
    r = add_up(r, std::max(sub_up(s3.hi, m3), sub_up(m3, s3.lo)));
    return {m0, m1, m2, m3, r};
}

inline Aff3 aff_sub(const Aff3& a, const Aff3& b) {
    return aff_add(a, {-b.c0, -b.c1, -b.c2, -b.c3, b.rad});
}

inline Aff3 aff_scale(const Ival& k, const Aff3& a) {
    Ival p0 = k * Ival::pt(a.c0);
    Ival p1 = k * Ival::pt(a.c1);
    Ival p2 = k * Ival::pt(a.c2);
    Ival p3 = k * Ival::pt(a.c3);
    double m0 = p0.mid(), m1 = p1.mid(), m2 = p2.mid(), m3 = p3.mid();
    double kh = ival_abs(k).hi;
    double r = mul_up(kh, a.rad);
    r = add_up(r, std::max(sub_up(p0.hi, m0), sub_up(m0, p0.lo)));
    r = add_up(r, std::max(sub_up(p1.hi, m1), sub_up(m1, p1.lo)));
    r = add_up(r, std::max(sub_up(p2.hi, m2), sub_up(m2, p2.lo)));
    r = add_up(r, std::max(sub_up(p3.hi, m3), sub_up(m3, p3.lo)));
    return {m0, m1, m2, m3, r};
}

inline Aff3 aff_mul(const Aff3& a, const Aff3& b) {
    Ival p0 = Ival::pt(a.c0) * Ival::pt(b.c0);
    Ival p1 = Ival::pt(a.c0) * Ival::pt(b.c1) + Ival::pt(a.c1) * Ival::pt(b.c0);
    Ival p2 = Ival::pt(a.c0) * Ival::pt(b.c2) + Ival::pt(a.c2) * Ival::pt(b.c0);
    Ival p3 = Ival::pt(a.c0) * Ival::pt(b.c3) + Ival::pt(a.c3) * Ival::pt(b.c0);
    double m0 = p0.mid(), m1 = p1.mid(), m2 = p2.mid(), m3 = p3.mid();
    double la = a.l1_lin(), lb = b.l1_lin();
    double sp_a = add_up(la, a.rad), sp_b = add_up(lb, b.rad);
    double r = mul_up(sp_a, sp_b);
    r = add_up(r, mul_up( std::fabs(a.c0), b.rad ));
    r = add_up(r, mul_up( std::fabs(b.c0), a.rad ));
    r = add_up(r, std::max(sub_up(p0.hi, m0), sub_up(m0, p0.lo)));
    r = add_up(r, std::max(sub_up(p1.hi, m1), sub_up(m1, p1.lo)));
    r = add_up(r, std::max(sub_up(p2.hi, m2), sub_up(m2, p2.lo)));
    r = add_up(r, std::max(sub_up(p3.hi, m3), sub_up(m3, p3.lo)));
    return {m0, m1, m2, m3, r};
}

inline double taylor_rad(const Ival& v, double m) {
    return std::max(sub_up(m, v.lo), sub_up(v.hi, m));
}

inline void param_mid_rad(double lo, double hi, double& m_out, double& h_out) {
    m_out = mul_up(0.5, add_up(lo, hi));
    h_out = std::max(sub_up(m_out, lo), sub_up(hi, m_out));
}

inline void aff_sincos_theta(const Ival& th_iv, Aff3& sin_a, Aff3& cos_a) {
    double t0 = th_iv.mid();
    Ival s0, c0;
    ival_sincos_0_pi(Ival::pt(t0), s0, c0);
    Aff3 dt = aff_sub(Aff3::var2(th_iv), Aff3::cst(Ival::pt(t0)));
    double ht = taylor_rad(th_iv, t0);
    double rem = mul_up(0.5, mul_up(ht, ht));  // |sin''|, |cos''| <= 1 => (1/2)*1*ht^2
    sin_a = aff_add(Aff3::cst(s0), aff_scale(c0, dt));
    sin_a.rad = add_up(sin_a.rad, rem);
    cos_a = aff_sub(Aff3::cst(c0), aff_scale(s0, dt));
    cos_a.rad = add_up(cos_a.rad, rem);
}

struct RowSpec {
    std::string tag;
    double l, beta, bA, bB, nu5;
    int sigA_num, sigA_den;
    int sigB_num, sigB_den;
    Ival sigA_iv() const { return Ival::pt(static_cast<double>(sigA_num)) / Ival::pt(static_cast<double>(sigA_den)); }
    Ival sigB_iv() const { return Ival::pt(static_cast<double>(sigB_num)) / Ival::pt(static_cast<double>(sigB_den)); }
};

struct RowProfileEnclosure {
    RowSpec spec;
    double s1;                       // small-s cutoff (2^{-14}) for eval_h_ival
    Ival hA_zero_tube, hB_zero_tube; // uniform enclosure of h_X(v) for ALL v in [0, s1^2]
    std::vector<double> s_edges;     // s_edges[0]=s1 .. s_edges[Ns]=8.0
    std::vector<double> GA_c0, GA_cs, GA_rad;
    std::vector<double> GB_c0, GB_cs, GB_rad;
    std::vector<double> eps_edges;   // eps_edges[0]=0.0 .. eps_edges[Ne]=0.125 (eps = 1/s for s >= 8)
    std::vector<double> GA_eps_c0, GA_eps_cs, GA_eps_rad;
    std::vector<double> GB_eps_c0, GB_eps_cs, GB_eps_rad;

    // 1. Vortex-centered Odd-Taylor origin cap for h_X'(v) on r_* in [0, rs_cap] (covering s in [0, s_cap_lo]):
    double rs_cap;
    double s_cap_lo;
    Ival c1_A0, c3_A0, C5_A;
    Ival c1_B0, c3_B0, C5_B;

    // 2. Vortex-centered Poly3Q slabs on r_* in [rs_edges[0], rs_edges[NRS]] covering s in [s_rs_pt_lo[0], 8.0]:
    std::vector<double> rs_edges;
    std::vector<double> s_rs_pt_lo, s_rs_pt_hi;
    std::vector<double> s_rs_mid_lo, s_rs_mid_hi;
    std::vector<double> ds_rs_lo, ds_rs_hi;
    std::vector<double> PA_q0, PA_q1, PA_q2, PA_rad;
    std::vector<double> PB_q0, PB_q1, PB_q2, PB_rad;

    // 3. Exterior folded polar slabs on eps = 1/s in [0, 0.125] (s >= 8.0, v >= 64.0):
    std::vector<double> PA_eps_c0, PA_eps_cs, PA_eps_rad;
    std::vector<double> PB_eps_c0, PB_eps_cs, PB_eps_rad;

    // 4. Row-level precomputed division-free h_X' panel enclosures on w_edges in [0, 256.0]:
    std::vector<double> w_edges;
    std::vector<Ival> hpA_pan, hpB_pan;
    std::vector<Ival> dhA_nodes; // cumulative int_0^{w_j} h_A'(w) dw for junta low-u integration
    Ival GA_inf, GB_inf;
    Ival PA_inf, PB_inf;
};

// ==================== VORTEX-CENTERED JET5 & POLY3Q ALGEBRA ====================
// 2D centered affine form in (e1, e2) in [-1, 1]^2 (used at exact point r_* = 0):
struct Aff2 {
    double c0, c1, c2, rad;
    static Aff2 cst(const Ival& v) {
        double m = v.mid();
        return {m, 0.0, 0.0, std::max(sub_up(v.hi, m), sub_up(m, v.lo))};
    }
    static Aff2 var1(const Ival& v) {
        double m_lo = mul_dn(0.5, add_dn(v.lo, v.hi)), m_hi = mul_up(0.5, add_up(v.lo, v.hi));
        double h_lo = mul_dn(0.5, sub_dn(v.hi, v.lo)), h_hi = mul_up(0.5, sub_up(v.hi, v.lo));
        double err = add_up(sub_up(m_hi, m_lo), sub_up(h_hi, h_lo));
        return {m_hi, h_hi, 0.0, std::max(0.0, err)};
    }
    double l1() const { return add_up(std::fabs(c1), std::fabs(c2)); }
    double max_dev() const { return add_up(l1(), rad); }
    Ival bounds() const { double d = max_dev(); return {sub_dn(c0, d), add_up(c0, d)}; }
    Ival integral() const { return {sub_dn(c0, rad), add_up(c0, rad)}; }
};
inline void sp_iv(const Ival& iv, double& m, double& r_acc) {
    m = iv.mid();
    r_acc = add_up(r_acc, std::max(sub_up(iv.hi, m), sub_up(m, iv.lo)));
}
inline Aff2 operator+(const Aff2& a, const Aff2& b) {
    Aff2 o{0, 0, 0, add_up(a.rad, b.rad)};
    sp_iv(Ival::pt(a.c0) + Ival::pt(b.c0), o.c0, o.rad);
    sp_iv(Ival::pt(a.c1) + Ival::pt(b.c1), o.c1, o.rad);
    sp_iv(Ival::pt(a.c2) + Ival::pt(b.c2), o.c2, o.rad);
    return o;
}
inline Aff2 operator-(const Aff2& a, const Aff2& b) { return a + Aff2{-b.c0, -b.c1, -b.c2, b.rad}; }
inline Aff2 operator-(const Aff2& a) { return {-a.c0, -a.c1, -a.c2, a.rad}; }
inline Aff2 operator*(const Aff2& a, const Aff2& b) {
    double da = a.max_dev(), db = b.max_dev();
    Aff2 o{0, 0, 0, add_up(mul_up(da, db), add_up(mul_up(std::fabs(a.c0), b.rad), mul_up(std::fabs(b.c0), a.rad)))};
    sp_iv(Ival::pt(a.c0) * Ival::pt(b.c0), o.c0, o.rad);
    sp_iv(Ival::pt(a.c0) * Ival::pt(b.c1) + Ival::pt(a.c1) * Ival::pt(b.c0), o.c1, o.rad);
    sp_iv(Ival::pt(a.c0) * Ival::pt(b.c2) + Ival::pt(a.c2) * Ival::pt(b.c0), o.c2, o.rad);
    return o;
}
inline Aff2 a2_inv(const Aff2& b, double b_lo_hint) {
    double dom_lo = std::min(std::max(b_lo_hint, b.bounds().lo), b.c0);
    if (dom_lo <= 0.0) { std::fprintf(stderr, "FATAL: a2_inv dom_lo=%g\n", dom_lo); std::exit(2); }
    Ival b0 = Ival::pt(b.c0), inv0 = Ival::pt(1.0) / b0, sl = -(inv0 * inv0);
    double d = b.max_dev(), rem = div_up(mul_up(d, d), mul_dn(dom_lo, mul_dn(dom_lo, dom_lo)));
    Aff2 o{0, 0, 0, add_up(mul_up(ival_abs(sl).hi, b.rad), rem)};
    sp_iv(inv0, o.c0, o.rad); sp_iv(sl * Ival::pt(b.c1), o.c1, o.rad); sp_iv(sl * Ival::pt(b.c2), o.c2, o.rad);
    return o;
}
inline Aff2 a2_sqrt(const Aff2& s, double s_lo_hint) {
    double dom_lo = std::min(std::max(s_lo_hint, s.bounds().lo), s.c0);
    if (dom_lo <= 0.0) { std::fprintf(stderr, "FATAL: a2_sqrt dom_lo=%g\n", dom_lo); std::exit(2); }
    Ival s0 = Ival::pt(s.c0), sq0 = ival_sqrt(s0), sl = Ival::pt(0.5) / sq0;
    double d = s.max_dev(), rem = div_up(mul_up(d, d), mul_dn(8.0, mul_dn(dom_lo, sqrt_dn(dom_lo))));
    Aff2 o{0, 0, 0, add_up(mul_up(ival_abs(sl).hi, s.rad), rem)};
    sp_iv(sq0, o.c0, o.rad); sp_iv(sl * Ival::pt(s.c1), o.c1, o.rad); sp_iv(sl * Ival::pt(s.c2), o.c2, o.rad);
    return o;
}
inline Aff2 a2_exp_neg(const Aff2& t, double t_lo_hint) {
    double dom_lo = std::min(std::max(t_lo_hint, t.bounds().lo), t.c0);
    Ival e0 = ival_exp(-Ival::pt(t.c0)), sl = -e0;
    double d = t.max_dev(), emax = ival_exp(-Ival::pt(dom_lo)).hi;
    double rem = mul_up(0.5, mul_up(emax, mul_up(d, d)));
    Aff2 o{0, 0, 0, add_up(mul_up(ival_abs(sl).hi, t.rad), rem)};
    sp_iv(e0, o.c0, o.rad); sp_iv(sl * Ival::pt(t.c1), o.c1, o.rad); sp_iv(sl * Ival::pt(t.c2), o.c2, o.rad);
    return o;
}

// 1D degree-D Taylor jet in r_* over scalar/affine type S: c[k] = f^{(k)}(r_*) / k!
template <typename S, int D>
struct Jet1D {
    std::array<S, D + 1> c{};
    static Jet1D cst(const S& v) { Jet1D o{}; o.c[0] = v; return o; }
    static Jet1D var(const S& v, const S& one) { Jet1D o{}; o.c[0] = v; o.c[1] = one; return o; }
};
template <typename S, int D>
inline Jet1D<S, D> operator+(const Jet1D<S, D>& a, const Jet1D<S, D>& b) {
    Jet1D<S, D> o{}; for (int k = 0; k <= D; ++k) o.c[k] = a.c[k] + b.c[k]; return o;
}
template <typename S, int D>
inline Jet1D<S, D> operator-(const Jet1D<S, D>& a, const Jet1D<S, D>& b) {
    Jet1D<S, D> o{}; for (int k = 0; k <= D; ++k) o.c[k] = a.c[k] - b.c[k]; return o;
}
template <typename S, int D>
inline Jet1D<S, D> operator*(const Jet1D<S, D>& a, const Jet1D<S, D>& b) {
    Jet1D<S, D> o{};
    for (int k = 0; k <= D; ++k) {
        S s = a.c[0] * b.c[k];
        for (int j = 1; j <= k; ++j) s = s + a.c[j] * b.c[k - j];
        o.c[k] = s;
    }
    return o;
}

inline Jet1D<Aff2, 3> j3a_inv(const Jet1D<Aff2, 3>& b, double blo) {
    Jet1D<Aff2, 3> o{}; o.c[0] = a2_inv(b.c[0], blo);
    for (int k = 1; k <= 3; ++k) {
        Aff2 s = b.c[1] * o.c[k - 1];
        for (int j = 2; j <= k; ++j) s = s + b.c[j] * o.c[k - j];
        o.c[k] = -(s * o.c[0]);
    }
    return o;
}
inline Jet1D<Aff2, 3> j3a_sqrt(const Jet1D<Aff2, 3>& a, double slo) {
    Jet1D<Aff2, 3> o{}; o.c[0] = a2_sqrt(a.c[0], slo);
    Aff2 inv2 = Aff2::cst(Ival::pt(0.5)) * a2_inv(o.c[0], sqrt_dn(slo));
    for (int k = 1; k <= 3; ++k) {
        Aff2 s = a.c[k];
        for (int j = 1; j < k; ++j) s = s - o.c[j] * o.c[k - j];
        o.c[k] = s * inv2;
    }
    return o;
}
inline Jet1D<Aff2, 3> j3a_exp_neg(const Jet1D<Aff2, 3>& a, double tlo) {
    Jet1D<Aff2, 3> o{}; o.c[0] = a2_exp_neg(a.c[0], tlo);
    for (int k = 1; k <= 3; ++k) {
        Aff2 s = a.c[1] * o.c[k - 1];
        for (int j = 2; j <= k; ++j) s = s + Aff2::cst(Ival::pt(static_cast<double>(j))) * a.c[j] * o.c[k - j];
        o.c[k] = -(s * Aff2::cst(Ival::pt(1.0) / Ival::pt(static_cast<double>(k))));
    }
    return o;
}

inline Jet1D<Ival, 5> j5i_inv(const Jet1D<Ival, 5>& b) {
    Jet1D<Ival, 5> o{}; o.c[0] = Ival::pt(1.0) / b.c[0];
    for (int k = 1; k <= 5; ++k) {
        Ival s{0, 0}; for (int j = 1; j <= k; ++j) s = s + b.c[j] * o.c[k - j];
        o.c[k] = -(s * o.c[0]);
    }
    return o;
}
inline Jet1D<Ival, 5> j5i_sqrt(const Jet1D<Ival, 5>& a) {
    Jet1D<Ival, 5> o{}; o.c[0] = ival_sqrt(a.c[0]);
    Ival inv2 = Ival::pt(0.5) / o.c[0];
    for (int k = 1; k <= 5; ++k) {
        Ival s = a.c[k]; for (int j = 1; j < k; ++j) s = s - o.c[j] * o.c[k - j];
        o.c[k] = s * inv2;
    }
    return o;
}
inline Jet1D<Ival, 5> j5i_exp_neg(const Jet1D<Ival, 5>& a) {
    Jet1D<Ival, 5> o{}; o.c[0] = ival_exp(-a.c[0]);
    for (int k = 1; k <= 5; ++k) {
        Ival s{0, 0}; for (int j = 1; j <= k; ++j) s = s + Ival::pt(static_cast<double>(j)) * a.c[j] * o.c[k - j];
        o.c[k] = -(s / Ival::pt(static_cast<double>(k)));
    }
    return o;
}

// 3-variable centered quadratic Taylor model Poly3Q on (e1, e2, e3) in [-1, 1]^3:
struct Poly3Q {
    double c0, c1, c2, c3, c11, c12, c13, c22, c23, c33, rad;
    static Poly3Q cst(const Ival& v) {
        double m = v.mid();
        return {m, 0,0,0, 0,0,0,0,0,0, std::max(sub_up(v.hi, m), sub_up(m, v.lo))};
    }
    static Poly3Q var1(const Ival& v) {
        double m_lo = mul_dn(0.5, add_dn(v.lo, v.hi)), m_hi = mul_up(0.5, add_up(v.lo, v.hi));
        double h_lo = mul_dn(0.5, sub_dn(v.hi, v.lo)), h_hi = mul_up(0.5, sub_up(v.hi, v.lo));
        double err = add_up(sub_up(m_hi, m_lo), sub_up(h_hi, h_lo));
        return {m_hi, h_hi,0,0, 0,0,0,0,0,0, std::max(0.0, err)};
    }
    static Poly3Q var3(const Ival& v) {
        double m = mul_up(0.5, add_up(v.lo, v.hi));
        double h = std::max(sub_up(m, v.lo), sub_up(v.hi, m));
        return {m, 0,0,h, 0,0,0,0,0,0, 0.0};
    }
    double l1_lin() const { return add_up(add_up(std::fabs(c1), std::fabs(c2)), std::fabs(c3)); }
    double l1_quad() const {
        return add_up(add_up(add_up(std::fabs(c11), std::fabs(c12)), std::fabs(c13)),
                      add_up(add_up(std::fabs(c22), std::fabs(c23)), std::fabs(c33)));
    }
    double max_dev() const { return add_up(add_up(l1_lin(), l1_quad()), rad); }
};

inline Ival pt_add(double a, double b) { return {add_dn(a, b), add_up(a, b)}; }
inline Ival pt_mul(double a, double b) { return {mul_dn(a, b), mul_up(a, b)}; }

inline Poly3Q p3_add(const Poly3Q& a, const Poly3Q& b) {
    Poly3Q o{}; o.rad = add_up(a.rad, b.rad);
    sp_iv(pt_add(a.c0, b.c0), o.c0, o.rad);
    sp_iv(pt_add(a.c1, b.c1), o.c1, o.rad);
    sp_iv(pt_add(a.c2, b.c2), o.c2, o.rad);
    sp_iv(pt_add(a.c3, b.c3), o.c3, o.rad);
    sp_iv(pt_add(a.c11, b.c11), o.c11, o.rad);
    sp_iv(pt_add(a.c12, b.c12), o.c12, o.rad);
    sp_iv(pt_add(a.c13, b.c13), o.c13, o.rad);
    sp_iv(pt_add(a.c22, b.c22), o.c22, o.rad);
    sp_iv(pt_add(a.c23, b.c23), o.c23, o.rad);
    sp_iv(pt_add(a.c33, b.c33), o.c33, o.rad);
    return o;
}
inline Poly3Q p3_sub(const Poly3Q& a, const Poly3Q& b) {
    return p3_add(a, {-b.c0, -b.c1, -b.c2, -b.c3, -b.c11, -b.c12, -b.c13, -b.c22, -b.c23, -b.c33, b.rad});
}
inline Poly3Q p3_scale(const Ival& k, const Poly3Q& a) {
    Poly3Q o{}; o.rad = mul_up(ival_abs(k).hi, a.rad);
    auto ks = [&](double v) -> Ival {
        return (v >= 0.0) ? Ival{mul_dn(k.lo, v), mul_up(k.hi, v)} : Ival{mul_dn(k.hi, v), mul_up(k.lo, v)};
    };
    sp_iv(ks(a.c0), o.c0, o.rad);
    sp_iv(ks(a.c1), o.c1, o.rad);
    sp_iv(ks(a.c2), o.c2, o.rad);
    sp_iv(ks(a.c3), o.c3, o.rad);
    sp_iv(ks(a.c11), o.c11, o.rad);
    sp_iv(ks(a.c12), o.c12, o.rad);
    sp_iv(ks(a.c13), o.c13, o.rad);
    sp_iv(ks(a.c22), o.c22, o.rad);
    sp_iv(ks(a.c23), o.c23, o.rad);
    sp_iv(ks(a.c33), o.c33, o.rad);
    return o;
}
inline Poly3Q p3_mul(const Poly3Q& a, const Poly3Q& b) {
    double la = a.l1_lin(), qa = a.l1_quad(), lb = b.l1_lin(), qb = b.l1_quad();
    double rem = add_up(add_up(mul_up(la, qb), mul_up(qa, lb)), mul_up(qa, qb));
    rem = add_up(rem, mul_up(add_up(std::fabs(a.c0), add_up(la, qa)), b.rad));
    rem = add_up(rem, mul_up(add_up(std::fabs(b.c0), add_up(lb, qb)), a.rad));
    rem = add_up(rem, mul_up(a.rad, b.rad));
    Poly3Q o{}; o.rad = rem;
    sp_iv(pt_mul(a.c0, b.c0), o.c0, o.rad);
    sp_iv(pt_mul(a.c0, b.c1) + pt_mul(a.c1, b.c0), o.c1, o.rad);
    sp_iv(pt_mul(a.c0, b.c2) + pt_mul(a.c2, b.c0), o.c2, o.rad);
    sp_iv(pt_mul(a.c0, b.c3) + pt_mul(a.c3, b.c0), o.c3, o.rad);
    sp_iv(pt_mul(a.c0, b.c11) + pt_mul(a.c1, b.c1) + pt_mul(a.c11, b.c0), o.c11, o.rad);
    sp_iv(pt_mul(a.c0, b.c12) + pt_mul(a.c1, b.c2) + pt_mul(a.c2, b.c1) + pt_mul(a.c12, b.c0), o.c12, o.rad);
    sp_iv(pt_mul(a.c0, b.c13) + pt_mul(a.c1, b.c3) + pt_mul(a.c3, b.c1) + pt_mul(a.c13, b.c0), o.c13, o.rad);
    sp_iv(pt_mul(a.c0, b.c22) + pt_mul(a.c2, b.c2) + pt_mul(a.c22, b.c0), o.c22, o.rad);
    sp_iv(pt_mul(a.c0, b.c23) + pt_mul(a.c2, b.c3) + pt_mul(a.c3, b.c2) + pt_mul(a.c23, b.c0), o.c23, o.rad);
    sp_iv(pt_mul(a.c0, b.c33) + pt_mul(a.c3, b.c3) + pt_mul(a.c33, b.c0), o.c33, o.rad);
    return o;
}
inline Poly3Q p3_compose_quad(const Poly3Q& p, const Ival& f0, const Ival& s1, const Ival& s2, double lag3) {
    double lp = p.l1_lin(), qp = p.l1_quad(), q_r = add_up(qp, p.rad);
    double rem = add_up(mul_up(ival_abs(s1).hi, p.rad), mul_up(ival_abs(s2).hi, mul_up(add_up(mul_up(2.0, lp), q_r), q_r)));
    rem = add_up(rem, lag3);
    Poly3Q o{}; o.rad = rem;
    auto sc_iv = [](const Ival& k, double v) -> Ival {
        return (v >= 0.0) ? Ival{mul_dn(k.lo, v), mul_up(k.hi, v)} : Ival{mul_dn(k.hi, v), mul_up(k.lo, v)};
    };
    sp_iv(f0, o.c0, o.rad);
    sp_iv(sc_iv(s1, p.c1), o.c1, o.rad); sp_iv(sc_iv(s1, p.c2), o.c2, o.rad); sp_iv(sc_iv(s1, p.c3), o.c3, o.rad);
    sp_iv(sc_iv(s1, p.c11) + s2 * pt_mul(p.c1, p.c1), o.c11, o.rad);
    sp_iv(sc_iv(s1, p.c12) + s2 * pt_mul(2.0 * p.c1, p.c2), o.c12, o.rad);
    sp_iv(sc_iv(s1, p.c13) + s2 * pt_mul(2.0 * p.c1, p.c3), o.c13, o.rad);
    sp_iv(sc_iv(s1, p.c22) + s2 * pt_mul(p.c2, p.c2), o.c22, o.rad);
    sp_iv(sc_iv(s1, p.c23) + s2 * pt_mul(2.0 * p.c2, p.c3), o.c23, o.rad);
    sp_iv(sc_iv(s1, p.c33) + s2 * pt_mul(p.c3, p.c3), o.c33, o.rad);
    return o;
}
inline Poly3Q p3_inv(const Poly3Q& b, double b_lo) {
    double dom_lo = std::min(b_lo, b.c0);
    if (dom_lo <= 0.0) { std::fprintf(stderr, "FATAL: p3_inv dom_lo=%g\n", dom_lo); std::exit(2); }
    Ival b0 = Ival::pt(b.c0), inv0 = Ival::pt(1.0)/b0, inv2 = inv0*inv0, inv3 = inv2*inv0;
    double M = b.max_dev(), m3 = mul_up(M, mul_up(M, M)), b2 = mul_dn(dom_lo, dom_lo);
    return p3_compose_quad(b, inv0, -inv2, inv3, div_up(m3, mul_dn(b2, b2)));
}
inline Poly3Q p3_sqrt(const Poly3Q& s, double s_lo) {
    double dom_lo = std::min(s_lo, s.c0);
    if (dom_lo <= 0.0) { std::fprintf(stderr, "FATAL: p3_sqrt dom_lo=%g\n", dom_lo); std::exit(2); }
    Ival s0 = Ival::pt(s.c0), sq0 = ival_sqrt(s0);
    double M = s.max_dev(), m3 = mul_up(M, mul_up(M, M));
    double s52 = mul_dn(mul_dn(dom_lo, dom_lo), sqrt_dn(dom_lo));
    return p3_compose_quad(s, sq0, Ival::pt(0.5)/sq0, Ival::pt(-0.125)/(s0*sq0), div_up(m3, mul_dn(16.0, s52)));
}
inline Poly3Q p3_exp_neg(const Poly3Q& T, double T_lo) {
    double dom_lo = std::min(T_lo, T.c0);
    Ival e0 = ival_exp(-Ival::pt(T.c0));
    double M = T.max_dev(), m3 = mul_up(M, mul_up(M, M)), emax = ival_exp(-Ival::pt(dom_lo)).hi;
    return p3_compose_quad(T, e0, -e0, Ival::pt(0.5)*e0, div_up(mul_up(emax, m3), 6.0));
}
// Exact psi(e2) = pi * (u0 + hu * e2) for u in [u_lo, u_hi] subset [0, 1] with rounded-center error + cubic remainder:
inline void p3_sincos_unit(double u_lo, double u_hi, Poly3Q& sin_p, Poly3Q& cos_p, Ival& sin_b, Ival& cos_b) {
    double u0_lo = mul_dn(0.5, add_dn(u_lo, u_hi)), u0 = mul_up(0.5, add_up(u_lo, u_hi));
    double hu_lo = mul_dn(0.5, sub_dn(u_hi, u_lo)), hu = mul_up(0.5, sub_up(u_hi, u_lo));
    double u_err = add_up(sub_up(u0, u0_lo), sub_up(hu, hu_lo));
    Ival th0 = PI_IVAL * Ival::pt(u0), eta = PI_IVAL * Ival::pt(hu);
    Ival eta2_half = Ival::pt(0.5) * ival_sqr(eta);
    double eh = mul_up(PI_IVAL.hi, taylor_rad({u_lo, u_hi}, u0));
    double rem3 = add_up(mul_up(PI_IVAL.hi, u_err), div_up(mul_up(eh, mul_up(eh, eh)), 6.0));
    Ival s0, c0; ival_sincos_0_pi(th0, s0, c0);
    sin_p = {}; sin_p.rad = rem3;
    sp_iv(s0, sin_p.c0, sin_p.rad); sp_iv(eta * c0, sin_p.c2, sin_p.rad); sp_iv(-(eta2_half * s0), sin_p.c22, sin_p.rad);
    cos_p = {}; cos_p.rad = rem3;
    sp_iv(c0, cos_p.c0, cos_p.rad); sp_iv(-(eta * s0), cos_p.c2, cos_p.rad); sp_iv(-(eta2_half * c0), cos_p.c22, cos_p.rad);
    ival_sincos_0_pi({mul_dn(PI_IVAL.lo, u_lo), mul_up(PI_IVAL.hi, u_hi)}, sin_b, cos_b);
}

struct Quad1D {
    double q0, q1, q2, rad;
    Ival eval_sub(const Ival& e3) const {
        Ival b = Ival::pt(q0) + Ival::pt(q1)*e3 + Ival::pt(q2)*ival_sqr(e3);
        return {sub_dn(b.lo, rad), add_up(b.hi, rad)};
    }
};
inline Quad1D p3_int_e1e2(const Poly3Q& p, const Ival& sc) {
    Quad1D o{0,0,0, mul_up(ival_abs(sc).hi, p.rad)};
    Ival m0 = Ival::pt(p.c0) + (Ival::pt(p.c11) + Ival::pt(p.c22)) / Ival::pt(3.0);
    sp_iv(sc * m0, o.q0, o.rad);
    sp_iv(sc * Ival::pt(p.c3), o.q1, o.rad);
    sp_iv(sc * Ival::pt(p.c33), o.q2, o.rad);
    return o;
}
inline Quad1D q1_add(const Quad1D& a, const Quad1D& b) {
    Quad1D o{0,0,0, add_up(a.rad, b.rad)};
    sp_iv(Ival::pt(a.q0)+Ival::pt(b.q0), o.q0, o.rad);
    sp_iv(Ival::pt(a.q1)+Ival::pt(b.q1), o.q1, o.rad);
    sp_iv(Ival::pt(a.q2)+Ival::pt(b.q2), o.q2, o.rad);
    return o;
}

struct VortexSlabCtx {
    RowSpec row;
    Ival inv_s2, c0, c1, c2, a0, a2C, bB_s2;
    Ival rs_iv, Ts_b, Ps_b, Cs_b, s_b;
    Poly3Q rs, Ts, Ps, dPs, s_p, ds_p, s_over_ds;
};

void integrate_vortex_cell(
    const VortexSlabCtx& ctx, const Ival& rho_iv, double u_lo, double u_hi,
    const Poly3Q& sin_p, const Poly3Q& cos_p, const Ival& sin_b, const Ival& cos_b,
    int depth, Quad1D& accPA, Quad1D& accPB
) {
    Ival zxb = ctx.rs_iv + rho_iv * cos_b, zyb = rho_iv * sin_b;
    Ival Tb = ival_sqr(zxb) + ival_sqr(zyb);
    double T_lo = Tb.lo;
    if (T_lo >= 39.0625) return; // |z| >= 6.25, bounded by R_VORTEX_TAIL = 1e-12

    Poly3Q rho = Poly3Q::var1(rho_iv);
    const Poly3Q& gam = cos_p;
    const Poly3Q& sig = sin_p;
    Poly3Q zx = p3_add(ctx.rs, p3_mul(rho, gam));
    Poly3Q zy = p3_mul(rho, sig);
    Poly3Q T = p3_add(p3_mul(zx, zx), p3_mul(zy, zy));
    Poly3Q dT = p3_scale(Ival::pt(2.0), zx);
    Poly3Q Delta = p3_add(p3_scale(Ival::pt(2.0), p3_mul(ctx.rs, gam)), rho);
    Poly3Q dDelta = p3_scale(Ival::pt(2.0), gam);
    Poly3Q QL = p3_add(Poly3Q::cst(ctx.c1), p3_scale(ctx.c2, p3_add(p3_scale(Ival::pt(2.0), ctx.Ts), p3_mul(rho, Delta))));
    Poly3Q dQL = p3_scale(ctx.c2, p3_add(p3_scale(Ival::pt(4.0), ctx.rs), p3_mul(rho, dDelta)));

    Poly3Q zxr = p3_add(zx, ctx.rs);
    Poly3Q qx = p3_sub(p3_mul(zxr, gam), p3_mul(zy, sig));
    Poly3Q qy = p3_add(p3_mul(zxr, sig), p3_mul(zy, gam));
    Poly3Q dqx = p3_scale(Ival::pt(2.0), gam), dqy = p3_scale(Ival::pt(2.0), sig);

    Poly3Q d_QL = p3_mul(Delta, QL);
    Poly3Q dd_QL = p3_add(p3_mul(dDelta, QL), p3_mul(Delta, dQL));
    Poly3Q br_x = p3_add(p3_scale(Ival::pt(ctx.row.bA), Delta), p3_scale(ctx.bB_s2, qx));
    Poly3Q dbr_x = p3_add(p3_scale(Ival::pt(ctx.row.bA), dDelta), p3_scale(ctx.bB_s2, dqx));
    Poly3Q br_y = p3_scale(ctx.bB_s2, qy), dbr_y = p3_scale(ctx.bB_s2, dqy);

    Poly3Q Ax = p3_add(p3_mul(gam, ctx.Ps), p3_add(p3_mul(zx, d_QL), p3_mul(ctx.s_p, br_x)));
    Poly3Q Ay = p3_add(p3_mul(sig, ctx.Ps), p3_add(p3_mul(zy, d_QL), p3_mul(ctx.s_p, br_y)));
    Poly3Q A2 = p3_add(p3_mul(Ax, Ax), p3_mul(Ay, Ay));

    Ival Del_b = Ival::pt(2.0)*ctx.rs_iv*cos_b + rho_iv;
    Ival QLb = ctx.c1 + ctx.c2*(Ival::pt(2.0)*ctx.Ts_b + rho_iv*Del_b);
    Ival qxb = (zxb + ctx.rs_iv)*cos_b - zyb*sin_b, qyb = (zxb + ctx.rs_iv)*sin_b + zyb*cos_b;
    Ival Axb = ctx.Ps_b*cos_b + zxb*(Del_b*QLb) + ctx.s_b*(Ival::pt(ctx.row.bA)*Del_b + ctx.bB_s2*qxb);
    Ival Ayb = ctx.Ps_b*sin_b + zyb*(Del_b*QLb) + ctx.s_b*(ctx.bB_s2*qyb);
    double A2_lo = std::max((ival_sqr(Axb) + ival_sqr(Ayb)).lo, sub_dn(A2.c0, A2.max_dev()));
    // Exact polar-norm identity T |A_-(z;s)|^2 = (T P_L(T) - s C(T) z_x)^2 + (s S(T) z_y)^2:
    if (Tb.hi > 0.0 && rho_iv.hi > 0.0) {
        Ival PL_T = ctx.c0 + ctx.c1 * Tb + ctx.c2 * ival_sqr(Tb);
        Ival C_T = ctx.a0 + ctx.a2C * Tb;
        Ival a2S = -(Ival::pt(ctx.row.bA) - ctx.bB_s2);
        Ival S_T = ctx.a0 + a2S * Tb;
        Ival pol_num = ival_sqr(Tb * PL_T - ctx.s_b * C_T * zxb) + ival_sqr(ctx.s_b * S_T * zyb);
        double pol_lo = div_dn(pol_num.lo, mul_up(Tb.hi, mul_up(rho_iv.hi, rho_iv.hi)));
        A2_lo = std::max(A2_lo, pol_lo);
    }

    if (A2.c0 <= 0.0 || A2_lo <= 0.0 || (T_lo < 10.0 && A2_lo <= 0.05 * A2.c0)) {
        if (depth < 4) {
            double rm = 0.5 * (rho_iv.lo + rho_iv.hi), um = 0.5 * (u_lo + u_hi);
            Poly3Q sp1, cp1, sp2_u, cp2_u; Ival sb1, cb1, sb2, cb2;
            p3_sincos_unit(u_lo, um, sp1, cp1, sb1, cb1);
            p3_sincos_unit(um, u_hi, sp2_u, cp2_u, sb2, cb2);
            integrate_vortex_cell(ctx, {rho_iv.lo, rm}, u_lo, um, sp1, cp1, sb1, cb1, depth + 1, accPA, accPB);
            integrate_vortex_cell(ctx, {rho_iv.lo, rm}, um, u_hi, sp2_u, cp2_u, sb2, cb2, depth + 1, accPA, accPB);
            integrate_vortex_cell(ctx, {rm, rho_iv.hi}, u_lo, um, sp1, cp1, sb1, cb1, depth + 1, accPA, accPB);
            integrate_vortex_cell(ctx, {rm, rho_iv.hi}, um, u_hi, sp2_u, cp2_u, sb2, cb2, depth + 1, accPA, accPB);
            return;
        }
        if (A2_lo <= 0.0 || A2.c0 <= 0.0) {
            std::fprintf(stderr, "FATAL: vortex A2_lo=%g c0=%g at depth 4\n", A2_lo, A2.c0);
            std::exit(2);
        }
    }

    Poly3Q dAx = p3_add(p3_mul(gam, ctx.dPs), p3_add(p3_add(d_QL, p3_mul(zx, dd_QL)), p3_add(p3_mul(ctx.ds_p, br_x), p3_mul(ctx.s_p, dbr_x))));
    Poly3Q dAy = p3_add(p3_mul(sig, ctx.dPs), p3_add(p3_mul(zy, dd_QL), p3_add(p3_mul(ctx.ds_p, br_y), p3_mul(ctx.s_p, dbr_y))));

    Poly3Q invA = p3_inv(p3_sqrt(A2, A2_lo), sqrt_dn(A2_lo));
    Poly3Q invA3 = p3_mul(invA, p3_mul(invA, invA));
    Poly3Q cross = p3_sub(p3_mul(Ay, dAx), p3_mul(Ax, dAy));
    Poly3Q ph_x = p3_mul(Ax, invA), ph_y = p3_mul(Ay, invA);
    Poly3Q dph_x = p3_mul(p3_mul(Ay, cross), invA3);
    Poly3Q dph_y = p3_mul(p3_scale(Ival::pt(-1.0), p3_mul(Ax, cross)), invA3);

    Poly3Q wg = p3_mul(p3_exp_neg(T, T_lo), rho);
    // Sector A:
    Poly3Q wA = p3_add(T, Poly3Q::cst(ctx.row.sigA_iv() - Ival::pt(1.0)));
    Poly3Q ig_GA = p3_mul(wg, p3_mul(wA, ph_x));
    Poly3Q ig_DGA = p3_mul(wg, p3_add(p3_mul(dT, p3_mul(p3_sub(Poly3Q::cst(Ival::pt(1.0)), wA), ph_x)), p3_mul(wA, dph_x)));
    Poly3Q numA = p3_sub(p3_mul(ctx.s_over_ds, ig_DGA), ig_GA);

    // Sector B:
    Poly3Q uB = p3_add(p3_scale(ctx.inv_s2, p3_sub(p3_mul(zx, zx), p3_mul(zy, zy))), Poly3Q::cst(ctx.row.sigB_iv()));
    Poly3Q vB = p3_scale(Ival::pt(2.0) * ctx.inv_s2, p3_mul(zx, zy));
    Poly3Q Bre = p3_add(p3_mul(uB, ph_x), p3_mul(vB, ph_y));
    Poly3Q ig_GB = p3_mul(wg, Bre);
    Poly3Q duv_ph = p3_scale(Ival::pt(2.0) * ctx.inv_s2, p3_add(p3_mul(zx, ph_x), p3_mul(zy, ph_y)));
    Poly3Q ig_DGB = p3_mul(wg, p3_sub(p3_add(duv_ph, p3_add(p3_mul(uB, dph_x), p3_mul(vB, dph_y))), p3_mul(dT, Bre)));
    Poly3Q numB = p3_sub(p3_mul(ctx.s_over_ds, ig_DGB), ig_GB);

    // (-2 / pi) * d_rho * (pi * (u_hi - u_lo)) = -2 * (u_hi - u_lo) * d_rho (exact pi cancellation!):
    Ival sc = Ival::pt(-2.0 * (u_hi - u_lo)) * rho_iv.len_ival();
    accPA = q1_add(accPA, p3_int_e1e2(numA, sc));
    accPB = q1_add(accPB, p3_int_e1e2(numB, sc));
}

struct PolarAccum {
    Aff3 intA{0, 0, 0, 0, 0};
    Aff3 intB{0, 0, 0, 0, 0};
};

// Centered 1st-order Taylor Aff3 sqrt(q) and 1/b with exact Lagrange remainder on q >= q_lo > 0, b >= b_lo > 0:
inline Aff3 aff_sqrt(const Aff3& q, double q_lo) {
    if (q_lo <= 0.0 || q.c0 <= 0.0) {
        std::fprintf(stderr, "FATAL: aff_sqrt nonpositive q_lo=%g c0=%g\n", q_lo, q.c0);
        std::exit(2);
    }
    Ival q0 = Ival::pt(q.c0);
    Ival sq0 = ival_sqrt(q0);
    Ival sl = Ival::pt(0.5) / sq0;
    Aff3 dq{0.0, q.c1, q.c2, q.c3, q.rad};
    Aff3 res = aff_add(Aff3::cst(sq0), aff_scale(sl, dq));
    double dq_max = add_up(q.l1_lin(), q.rad);
    double den = mul_dn(8.0, mul_dn(q_lo, sqrt_dn(q_lo)));
    res.rad = add_up(res.rad, div_up(mul_up(dq_max, dq_max), den));
    return res;
}

inline Aff3 aff_inv(const Aff3& b, double b_lo) {
    if (b_lo <= 0.0 || b.c0 <= 0.0) {
        std::fprintf(stderr, "FATAL: aff_inv nonpositive b_lo=%g c0=%g\n", b_lo, b.c0);
        std::exit(2);
    }
    Ival b0 = Ival::pt(b.c0);
    Ival inv0 = Ival::pt(1.0) / b0;
    Ival sl = -(inv0 * inv0);
    Aff3 db{0.0, b.c1, b.c2, b.c3, b.rad};
    Aff3 res = aff_add(Aff3::cst(inv0), aff_scale(sl, db));
    double db_max = add_up(b.l1_lin(), b.rad);
    double den = mul_dn(b_lo, mul_dn(b_lo, b_lo));
    res.rad = add_up(res.rad, div_up(mul_up(db_max, db_max), den));
    return res;
}

// Exact integral over (e1, e2) in [-1, 1]^2 / 4 of W(e1) * F(e1, e2, e3) where W has c2=c3=0:
// (1/4) iint (w0 + w1 e1)(f0 + f1 e1 + f2 e2 + f3 e3) de1 de2 = (w0 f0 + w1 f1 / 3) + (w0 f3) e3!
inline Aff3 aff_bilinear_int_e1e2(const Aff3& w, const Aff3& f) {
    Ival w0 = Ival::pt(w.c0), w1 = Ival::pt(w.c1);
    Ival f0 = Ival::pt(f.c0), f1 = Ival::pt(f.c1), f3 = Ival::pt(f.c3);
    Ival p0 = w0 * f0 + (w1 * f1) / Ival::pt(3.0);
    Ival p3 = w0 * f3;
    double m0 = p0.mid(), m3 = p3.mid();
    double Mw = add_up(std::fabs(w.c0), std::fabs(w.c1));
    double Mf = add_up(std::fabs(f.c0), f.l1_lin());
    double r = add_up(add_up(mul_up(Mw, f.rad), mul_up(Mf, w.rad)), mul_up(w.rad, f.rad));
    r = add_up(r, std::max(sub_up(p0.hi, m0), sub_up(m0, p0.lo)));
    r = add_up(r, std::max(sub_up(p3.hi, m3), sub_up(m3, p3.lo)));
    return {m0, 0.0, 0.0, m3, r};
}

struct PrecompRadial {
    Ival r_iv;
    Aff3 rPL_a, C_a, S_a, wA_rad, wBm_rad, wBp_rad;
};
struct PrecompAngular {
    Ival th_iv;
    Aff3 sin_a, cos_a;
};

// Direct 1D midpoint-Taylor Aff3 on r_iv = [ra, rb] around rounded r0 = r_iv.mid() with exact hr = max(r0-ra, rb-r0):
inline Aff3 make_rad_1d(const Ival& r_iv, const Ival& f0, const Ival& fp0, double fpp_bound) {
    double r0 = r_iv.mid();
    Aff3 dr = aff_sub(Aff3::var1(r_iv), Aff3::cst(Ival::pt(r0)));
    Aff3 lin = aff_add(Aff3::cst(f0), aff_scale(fp0, dr));
    double hr = taylor_rad(r_iv, r0);
    lin.rad = add_up(lin.rad, mul_up(0.5, mul_up(fpp_bound, mul_up(hr, hr))));
    return lin;
}

PrecompRadial make_radial(const RowSpec& row, const Ival& r_iv) {
    const Ival inv_sqrt2  = Ival::pt(1.0) / ival_sqrt(Ival::pt(2.0));
    const Ival inv_sqrt12 = Ival::pt(1.0) / ival_sqrt(Ival::pt(12.0));
    double r0 = r_iv.mid();
    Ival r0_iv = Ival::pt(r0);
    Ival r0_2 = ival_sqr(r0_iv);
    Ival r0_3 = r0_2 * r0_iv;
    Ival r0_4 = ival_sqr(r0_2);
    double rb = r_iv.hi;
    double rb3 = mul_up(rb, mul_up(rb, rb));

    // 1. r P_L(r^2) = c0 r + c1 r^3 + c2 r^5
    Ival c2 = Ival::pt(row.nu5) * inv_sqrt12;
    Ival c1 = Ival::pt(row.beta) - Ival::pt(6.0) * c2;
    Ival c0 = Ival::pt(row.l) - Ival::pt(2.0) * Ival::pt(row.beta) + Ival::pt(6.0) * c2;
    Ival rPL_0  = c0 * r0_iv + c1 * r0_3 + c2 * (r0_4 * r0_iv);
    Ival rPL_p0 = c0 + Ival::pt(3.0) * c1 * r0_2 + Ival::pt(5.0) * c2 * r0_4;
    double rPL_pp = add_up(mul_up(6.0, mul_up(ival_abs(c1).hi, rb)), mul_up(20.0, mul_up(ival_abs(c2).hi, rb3)));
    Aff3 rPL_a = make_rad_1d(r_iv, rPL_0, rPL_p0, rPL_pp);

    // 2. C(r) = (1 + bA) - (bA + bB/sqrt(2)) r^2, S(r) = (1 + bA) - (bA - bB/sqrt(2)) r^2
    Ival a0_D = Ival::pt(1.0) + Ival::pt(row.bA);
    Ival a2_C = -(Ival::pt(row.bA) + Ival::pt(row.bB) * inv_sqrt2);
    Ival a2_S = -(Ival::pt(row.bA) - Ival::pt(row.bB) * inv_sqrt2);
    Aff3 C_a = make_rad_1d(r_iv, a0_D + a2_C * r0_2, Ival::pt(2.0) * a2_C * r0_iv, mul_up(2.0, ival_abs(a2_C).hi));
    Aff3 S_a = make_rad_1d(r_iv, a0_D + a2_S * r0_2, Ival::pt(2.0) * a2_S * r0_iv, mul_up(2.0, ival_abs(a2_S).hi));

    // 3. Exponentially damped radial weights (tight interval polynomial factor for g1'', g3''!):
    Ival e0 = ival_exp(-r0_2);
    double exp_ra = ival_exp(-Ival::pt(mul_dn(r_iv.lo, r_iv.lo))).hi;
    Ival r2_iv = ival_sqr(r_iv), r3_iv = r2_iv * r_iv, r5_iv = ival_sqr(r2_iv) * r_iv;
    double g1_pp = mul_up(ival_abs(Ival::pt(4.0) * r3_iv - Ival::pt(6.0) * r_iv).hi, exp_ra);
    double g3_pp = mul_up(ival_abs(Ival::pt(6.0) * r_iv - Ival::pt(14.0) * r3_iv + Ival::pt(4.0) * r5_iv).hi, exp_ra);

    Ival al = row.sigA_iv() - Ival::pt(1.0);
    Ival wA_0  = (r0_3 + al * r0_iv) * e0;
    Ival wA_p0 = (Ival::pt(-2.0) * r0_4 + (Ival::pt(3.0) - Ival::pt(2.0) * al) * r0_2 + al) * e0;
    double wA_pp = add_up(g3_pp, mul_up(ival_abs(al).hi, g1_pp));
    Aff3 wA_rad = make_rad_1d(r_iv, wA_0, wA_p0, wA_pp);

    Ival g3_0  = r0_3 * e0;
    Ival g3_p0 = (Ival::pt(3.0) * r0_2 - Ival::pt(2.0) * r0_4) * e0;
    Aff3 wBm_rad = make_rad_1d(r_iv, inv_sqrt2 * g3_0, inv_sqrt2 * g3_p0, mul_up(inv_sqrt2.hi, g3_pp));

    Ival g1_0  = r0_iv * e0;
    Ival g1_p0 = (Ival::pt(1.0) - Ival::pt(2.0) * r0_2) * e0;
    Ival sB = row.sigB_iv();
    Aff3 wBp_rad = make_rad_1d(r_iv, sB * g1_0, sB * g1_p0, mul_up(ival_abs(sB).hi, g1_pp));

    return {r_iv, rPL_a, C_a, S_a, wA_rad, wBm_rad, wBp_rad};
}

PrecompAngular make_angular(const Ival& th_iv) {
    Aff3 s_a, c_a;
    aff_sincos_theta(th_iv, s_a, c_a);
    return {th_iv, s_a, c_a};
}

// Integrate s^3 h_X'(s^2) (mode_eps=false, p=s) or eps^{-3} h_X'(eps^{-2}) (mode_eps=true, p=eps)
// over one folded polar box [ra, rb] x [ta, tb] subset [0, 7] x [0, pi/2] via centered Aff3 algebra!
void integrate_hp_polar_cell(
    const RowSpec& row, const PrecompRadial& pr, const PrecompAngular& pa, const Ival& p_iv,
    bool mode_eps, int depth, PolarAccum& acc
) {
    const Ival inv_sqrt2  = Ival::pt(1.0) / ival_sqrt(Ival::pt(2.0));
    const Ival inv_sqrt12 = Ival::pt(1.0) / ival_sqrt(Ival::pt(12.0));
    const Ival& r_iv = pr.r_iv;
    const Ival& th_iv = pa.th_iv;

    // Interval bounds on [ra, rb] x [ta, tb] x [pa, pb] for positivity & root separation checks:
    Ival c2 = Ival::pt(row.nu5) * inv_sqrt12;
    Ival c1 = Ival::pt(row.beta) - Ival::pt(6.0) * c2;
    Ival c0 = Ival::pt(row.l) - Ival::pt(2.0) * Ival::pt(row.beta) + Ival::pt(6.0) * c2;
    Ival a0_D = Ival::pt(1.0) + Ival::pt(row.bA);
    Ival a2_C = -(Ival::pt(row.bA) + Ival::pt(row.bB) * inv_sqrt2);
    Ival a2_S = -(Ival::pt(row.bA) - Ival::pt(row.bB) * inv_sqrt2);

    Ival r2_b = ival_sqr(r_iv), r4_b = ival_sqr(r2_b);
    Ival a_b = r_iv * (c0 + c1 * r2_b + c2 * r4_b);
    Ival C_b = a0_D + a2_C * r2_b;
    Ival S_b = a0_D + a2_S * r2_b;
    Ival sig_b, gam_b;
    ival_sincos_0_pi(th_iv, sig_b, gam_b);
    gam_b.lo = std::max(0.0, gam_b.lo);
    sig_b.lo = std::max(0.0, sig_b.lo);
    Ival b_b = C_b * gam_b, c_b = S_b * sig_b;
    Ival at_b = mode_eps ? (p_iv * a_b) : a_b;
    Ival st_b = mode_eps ? Ival::pt(1.0) : p_iv;
    Ival Up_b = at_b + st_b * b_b;
    Ival Um_b = at_b - st_b * b_b;
    Ival W_b  = st_b * c_b;
    Ival Rp2_b = ival_sqr(Up_b) + ival_sqr(W_b);
    Ival Rm2_b = ival_sqr(Um_b) + ival_sqr(W_b);
    Ival Rp_b = ival_sqrt(Rp2_b);
    Ival Rm_b = ival_sqrt(Rm2_b);

    auto subdivide = [&]() {
        double rm = r_iv.mid(), tm = th_iv.mid();
        PrecompRadial pr1 = make_radial(row, {r_iv.lo, rm});
        PrecompRadial pr2 = make_radial(row, {rm, r_iv.hi});
        PrecompAngular pa1 = make_angular({th_iv.lo, tm});
        PrecompAngular pa2 = make_angular({tm, th_iv.hi});
        integrate_hp_polar_cell(row, pr1, pa1, p_iv, mode_eps, depth + 1, acc);
        integrate_hp_polar_cell(row, pr1, pa2, p_iv, mode_eps, depth + 1, acc);
        integrate_hp_polar_cell(row, pr2, pa1, p_iv, mode_eps, depth + 1, acc);
        integrate_hp_polar_cell(row, pr2, pa2, p_iv, mode_eps, depth + 1, acc);
    };

    bool um_ambig = (Um_b.lo < -0.5 * Rm_b.lo) && (Um_b.hi > 0.5 * Rm_b.lo);
    if (Rm_b.lo <= 0.0 || Rm_b.lo < 0.45 * Rm_b.hi || um_ambig) {
        if (depth < 6) {
            subdivide();
            return;
        }
        Ival dUm_dr = (c0 + Ival::pt(3.0) * c1 * r2_b + Ival::pt(5.0) * c2 * r4_b) * (mode_eps ? p_iv : Ival::pt(1.0))
                    - st_b * (Ival::pt(2.0) * a2_C * r_iv) * gam_b;
        if (dUm_dr.lo <= 0.0 || Rp_b.lo <= 0.0 || S_b.lo <= 0.0 || st_b.lo <= 0.0 || (Up_b + Rp_b).lo <= 0.0) {
            std::fprintf(stderr,
                         "FATAL: root fallback precondition failed (dUm_dr.lo=%g, Rp.lo=%g, S.lo=%g, st.lo=%g, Up+Rp.lo=%g)\n",
                         dUm_dr.lo, Rp_b.lo, S_b.lo, st_b.lo, (Up_b + Rp_b).lo);
            std::exit(2);
        }
        double mr = dUm_dr.lo;
        double dr_len = r_iv.width(), dt_len = th_iv.width();
        double area = mul_up(dr_len, dt_len);
        // Freeze denominator at W_min(theta) = st_min * S_min * sin(theta) per angle and price numerator variation
        // by ((st_max * S_max) / (st_min * S_min))^2 with directed rounding:
        double w_rat = div_up(mul_up(st_b.hi, S_b.hi), mul_dn(st_b.lo, S_b.lo));
        double int_W2_Rm3 = mul_up(mul_up(w_rat, w_rat), div_up(mul_up(2.0, dt_len), mr));
        Ival Rsum_b = Rp_b + Rm_b;
        Ival abs_b = ival_abs(b_b), abs_c = ival_abs(c_b);
        double rp_lo2 = mul_dn(Rp_b.lo, Rp_b.lo);
        double rp_lo3 = mul_dn(rp_lo2, Rp_b.lo);

        double du_t1 = mul_up((Ival::pt(2.0) * st_b * ival_sqr(at_b) * abs_b * gam_b).hi,
                              add_up(div_up(int_W2_Rm3, rp_lo2), div_up(area, rp_lo3)));
        double du_t2 = mul_up(((st_b * abs_b * gam_b * ival_sqr(Rsum_b + Ival::pt(2.0) * at_b)) /
                               (Rp_b * Rsum_b * (Up_b + Rp_b))).hi, area);
        double dw_p1 = mul_up(((st_b * st_b * st_b * sig_b * abs_c * (ival_sqr(b_b) + ival_sqr(c_b))) /
                               (Ival::pt(2.0) * Rp_b * Rp_b * Rp_b)).hi, area);
        double dw_p2 = mul_up((Ival::pt(0.5) * st_b * sig_b * abs_c).hi, int_W2_Rm3);
        double dw_p3 = mul_up(((st_b * ival_sqr(b_b) * ((Ival::pt(2.0) * Rp_b + Rm_b) * Rp_b * Rsum_b + Ival::pt(4.0) * ival_sqr(at_b) * Rm_b)) /
                               (Ival::pt(2.0) * S_b * Rp_b * Rp_b * Rp_b * Rsum_b)).hi, area);
        double tot_ker = add_up(add_up(du_t1, du_t2), add_up(dw_p1, add_up(dw_p2, dw_p3)));

        Ival exp_b = ival_exp(-r2_b);
        Ival wA_b = ival_abs((r2_b * r_iv + (row.sigA_iv() - Ival::pt(1.0)) * r_iv) * exp_b);
        Ival wB_b = ((r2_b * r_iv) * inv_sqrt2 + ival_abs(row.sigB_iv()) * r_iv) * exp_b;
        double fac4pi = (Ival::pt(4.0) / PI_IVAL).hi;
        acc.intA.rad = add_up(acc.intA.rad, mul_up(fac4pi, mul_up(wA_b.hi, tot_ker)));
        acc.intB.rad = add_up(acc.intB.rad, mul_up(fac4pi, mul_up(wB_b.hi, tot_ker)));
        return;
    }

    // Smooth Aff3 evaluation with correlation-preserving Taylor sqrt & inv!
    Aff3 p_a = Aff3::var3(p_iv);
    Aff3 b_a = aff_mul(pr.C_a, pa.cos_a);
    Aff3 c_a = aff_mul(pr.S_a, pa.sin_a);
    Aff3 at_a = mode_eps ? aff_mul(p_a, pr.rPL_a) : pr.rPL_a;
    Aff3 st_a = mode_eps ? Aff3::cst(Ival::pt(1.0)) : p_a;
    Aff3 st2_a = aff_mul(st_a, st_a);
    Aff3 st3_a = aff_mul(st_a, st2_a);

    Aff3 sb_a = aff_mul(st_a, b_a);
    Aff3 Up = aff_add(at_a, sb_a);
    Aff3 Um = aff_sub(at_a, sb_a);
    Aff3 W  = aff_mul(st_a, c_a);
    Aff3 Up2 = aff_mul(Up, Up), Um2 = aff_mul(Um, Um), W2 = aff_mul(W, W);
    Aff3 Rp2 = aff_add(Up2, W2), Rm2 = aff_add(Um2, W2);
    if (Rp2.c0 <= Rp2_b.lo * 0.5 || Rm2.c0 <= Rm2_b.lo * 0.5) {
        if (depth < 6) { subdivide(); return; }
    }
    Aff3 Rp = aff_sqrt(Rp2, Rp2_b.lo);
    Aff3 Rm = aff_sqrt(Rm2, Rm2_b.lo);
    Aff3 Rp3 = aff_mul(Rp, Rp2), Rm3 = aff_mul(Rm, Rm2);
    Aff3 Rsum = aff_add(Rp, Rm);
    Aff3 Rquad = aff_add(aff_add(Rp2, aff_mul(Rp, Rm)), Rm2);

    double rp3_lo = mul_dn(Rp_b.lo, Rp2_b.lo);
    double rm3_lo = mul_dn(Rm_b.lo, Rm2_b.lo);
    double rsum_lo = add_dn(Rp_b.lo, Rm_b.lo);
    double uprp_lo = add_dn(Up_b.lo, Rp_b.lo);

    Aff3 inv_Rp3 = aff_inv(Rp3, rp3_lo);
    Aff3 inv_Rm3 = aff_inv(Rm3, rm3_lo);
    Aff3 inv_Rsum = aff_inv(Rsum, rsum_lo);
    Aff3 inv_Rp3Rm3Rs = aff_mul(aff_mul(inv_Rp3, inv_Rm3), inv_Rsum);

    Aff3 b2_a = aff_mul(b_a, b_a), c2_a = aff_mul(c_a, c_a);
    Aff3 at2_a = aff_mul(at_a, at_a);
    Aff3 b_gam = aff_mul(b_a, pa.cos_a);

    Aff3 du_1 = aff_scale(Ival::pt(2.0), aff_mul(aff_mul(aff_mul(st3_a, at2_a), aff_mul(b_gam, c2_a)), aff_mul(Rquad, inv_Rp3Rm3Rs)));

    Aff3 Rs_2a = aff_add(Rsum, aff_scale(Ival::pt(2.0), at_a));
    Aff3 num_c = aff_mul(aff_mul(st_a, b_gam), aff_mul(Rs_2a, Rs_2a));
    Aff3 den_c = aff_scale(Ival::pt(2.0), aff_mul(aff_mul(Rp, Rm), aff_mul(Rsum, aff_add(Up, Rp))));
    double den_c_lo = mul_dn(2.0, mul_dn(mul_dn(Rp_b.lo, Rm_b.lo), mul_dn(rsum_lo, uprp_lo)));
    Aff3 du_2;
    if (Um_b.lo >= -0.5 * Rm_b.lo) {
        Aff3 umrp = aff_add(Um, Rp);
        (void)umrp;
        Aff3 umrm = aff_add(Um, Rm);
        double umrm_lo = mul_dn(0.5, Rm_b.lo);
        if (umrm.c0 <= 0.25 * Rm_b.lo && depth < 6) { subdivide(); return; }
        du_2 = aff_mul(aff_mul(aff_mul(st2_a, c2_a), num_c), aff_mul(aff_inv(den_c, den_c_lo), aff_inv(umrm, umrm_lo)));
    } else {
        du_2 = aff_mul(aff_mul(num_c, aff_sub(Rm, Um)), aff_inv(den_c, den_c_lo));
    }
    Aff3 d_phi_u = aff_sub(du_1, du_2);

    Aff3 B_canc = aff_add(
        aff_mul(aff_sub(aff_add(aff_scale(Ival::pt(2.0), aff_mul(Up, Um)), Um2), W2), aff_mul(Rp, Rsum)),
        aff_scale(Ival::pt(4.0), aff_mul(at2_a, Rm2))
    );
    Aff3 br_w = aff_add(
        aff_sub(
            aff_scale(Ival::pt(-0.5), aff_mul(aff_add(b2_a, c2_a), inv_Rp3)),
            aff_scale(Ival::pt(0.5), aff_mul(c2_a, inv_Rm3))
        ),
        aff_scale(Ival::pt(0.5), aff_mul(aff_mul(b2_a, B_canc), inv_Rp3Rm3Rs))
    );
    Aff3 d_phi_w = aff_mul(aff_mul(st3_a, aff_mul(pa.sin_a, c_a)), br_w);

    Aff3 dp_plus  = aff_add(d_phi_u, d_phi_w);
    Aff3 dp_minus = aff_sub(d_phi_u, d_phi_w);

    Ival scale_box = (Ival::pt(4.0) / PI_IVAL) * r_iv.len_ival() * th_iv.len_ival();
    Aff3 contribA = aff_scale(scale_box, aff_bilinear_int_e1e2(pr.wA_rad, dp_plus));
    Aff3 contribB = aff_scale(scale_box, aff_add(aff_bilinear_int_e1e2(pr.wBm_rad, dp_minus), aff_bilinear_int_e1e2(pr.wBp_rad, dp_plus)));

    if (depth < 6 && std::max(contribA.rad, contribB.rad) > 2.5e-5) {
        subdivide();
        return;
    }
    acc.intA = aff_add(acc.intA, contribA);
    acc.intB = aff_add(acc.intB, contribB);
}

// Exact integral over (e1, e2) in [-1, 1]^2 / 4 of W(e1) * T(e2) * F(e1, e2, e3),
// where W has c2=c3=0 and T has c1=c3=0:
// (1/4) iint (w0 + w1 e1)(t0 + t2 e2)(f0 + f1 e1 + f2 e2 + f3 e3) de1 de2
//   = (w0 t0 f0 + (w1 t0 f1 + w0 t2 f2)/3) + (w0 t0 f3) e3!
inline Aff3 aff_trilinear_int_e1e2(const Aff3& w, const Aff3& t, const Aff3& f) {
    Ival w0 = Ival::pt(w.c0), w1 = Ival::pt(w.c1);
    Ival t0 = Ival::pt(t.c0), t2 = Ival::pt(t.c2);
    Ival f0 = Ival::pt(f.c0), f1 = Ival::pt(f.c1), f2 = Ival::pt(f.c2), f3 = Ival::pt(f.c3);
    Ival wt0 = w0 * t0;
    Ival p0 = wt0 * f0 + (w1 * t0 * f1 + w0 * t2 * f2) / Ival::pt(3.0);
    Ival p3 = wt0 * f3;
    double m0 = p0.mid(), m3 = p3.mid();

    double Mw = add_up(std::fabs(w.c0), std::fabs(w.c1));
    double Mt = add_up(std::fabs(t.c0), std::fabs(t.c2));
    double Mf = add_up(std::fabs(f.c0), f.l1_lin());
    double r_wt = add_up(add_up(mul_up(Mw, t.rad), mul_up(Mt, w.rad)), mul_up(w.rad, t.rad));
    double MwMt = mul_up(Mw, Mt);
    double r = add_up(add_up(mul_up(MwMt, f.rad), mul_up(Mf, r_wt)), mul_up(r_wt, f.rad));
    r = add_up(r, std::max(sub_up(p0.hi, m0), sub_up(m0, p0.lo)));
    r = add_up(r, std::max(sub_up(p3.hi, m3), sub_up(m3, p3.lo)));
    return {m0, 0.0, 0.0, m3, r};
}

void integrate_polar_cell(
    const RowSpec& row, const PrecompRadial& pr, const PrecompAngular& pa, const Ival& p_iv,
    bool mode_eps, int depth, PolarAccum& acc
) {
    const Ival inv_sqrt2 = Ival::pt(1.0) / ival_sqrt(Ival::pt(2.0));
    Aff3 p_a = Aff3::var3(p_iv);

    Aff3 U_a, W_a;
    if (!mode_eps) {
        U_a = aff_add(pr.rPL_a, aff_mul(p_a, aff_mul(pr.C_a, pa.cos_a)));
        W_a = aff_mul(p_a, aff_mul(pr.S_a, pa.sin_a));
    } else {
        U_a = aff_add(aff_mul(p_a, pr.rPL_a), aff_mul(pr.C_a, pa.cos_a));
        W_a = aff_mul(pr.S_a, pa.sin_a);
    }

    Ival Ub = U_a.bounds(), Wb = W_a.bounds();
    Ival R2_iv = ival_sqr(Ub) + ival_sqr(Wb);

    auto subdivide = [&]() {
        double rm = pr.r_iv.mid(), tm = pa.th_iv.mid();
        PrecompRadial pr1 = make_radial(row, {pr.r_iv.lo, rm});
        PrecompRadial pr2 = make_radial(row, {rm, pr.r_iv.hi});
        PrecompAngular pa1 = make_angular({pa.th_iv.lo, tm});
        PrecompAngular pa2 = make_angular({tm, pa.th_iv.hi});
        integrate_polar_cell(row, pr1, pa1, p_iv, mode_eps, depth + 1, acc);
        integrate_polar_cell(row, pr1, pa2, p_iv, mode_eps, depth + 1, acc);
        integrate_polar_cell(row, pr2, pa1, p_iv, mode_eps, depth + 1, acc);
        integrate_polar_cell(row, pr2, pa2, p_iv, mode_eps, depth + 1, acc);
    };

    // Split near the isolated zero of A+ (up to depth 6) so R = sqrt(U^2 + W^2) is well separated from 0!
    if (R2_iv.lo <= 0.0 || R2_iv.lo < 0.25 * R2_iv.hi) {
        if (depth < 6) {
            subdivide();
            return;
        }
        double fb_mult = mode_eps ? 1.0 : 2.0;
        Ival area = pr.r_iv.len_ival() * pa.th_iv.len_ival();
        Ival wt = Ival::pt(fb_mult) * (Ival::pt(4.0) / PI_IVAL) * pr.r_iv * ival_exp(-(pr.r_iv * pr.r_iv)) * area;
        Ival ampA = ival_abs((pr.r_iv * pr.r_iv - Ival::pt(1.0)) + row.sigA_iv());
        Ival ampB = (pr.r_iv * pr.r_iv) * inv_sqrt2 + ival_abs(row.sigB_iv());
        acc.intA.rad = add_up(acc.intA.rad, (wt * ampA).hi);
        acc.intB.rad = add_up(acc.intB.rad, (wt * ampB).hi);
        return;
    }

    // Direct 2D midpoint-Taylor enclosure of u_eff (= U/R - 1 in !mode_eps, U/R in mode_eps) and w_hat = W/R:
    // Exact straight-line 2nd-derivative bound: (1/2)|d^2/dt^2 (U/R, W/R)| <= (|W0|*dU + |U0|*dW)*sqrt(dU^2 + dW^2) / R_min^3!
    double U0 = U_a.c0, W0 = W_a.c0;
    Ival U0_iv = Ival::pt(U0), W0_iv = Ival::pt(W0);
    Ival R0_2 = ival_sqr(U0_iv) + ival_sqr(W0_iv);
    Ival R0_iv = ival_sqrt(R0_2);
    Ival R0_3 = R0_iv * R0_2;

    Aff3 dU{0.0, U_a.c1, U_a.c2, U_a.c3, U_a.rad};
    Aff3 dW{0.0, W_a.c1, W_a.c2, W_a.c3, W_a.rad};
    double dU_max = add_up(U_a.l1_lin(), U_a.rad);
    double dW_max = add_up(W_a.l1_lin(), W_a.rad);
    double C_max  = add_up(mul_up(std::fabs(W0), dU_max), mul_up(std::fabs(U0), dW_max));
    double Delta  = sqrt_up(add_up(mul_up(dU_max, dU_max), mul_up(dW_max, dW_max)));
    double Rmin   = sqrt_dn(R2_iv.lo);
    double Rmin3  = mul_dn(Rmin, mul_dn(Rmin, Rmin));
    double rem_uw = div_up(mul_up(C_max, Delta), Rmin3);

    Ival du_dU = ival_sqr(W0_iv) / R0_3;
    Ival du_dW = -(U0_iv * W0_iv) / R0_3;
    Ival dw_dW = ival_sqr(U0_iv) / R0_3;

    Ival u0_eff;
    if (!mode_eps) {
        if (U0 > 0.0) {
            u0_eff = -ival_sqr(W0_iv) / (R0_iv * (U0_iv + R0_iv));
        } else {
            u0_eff = (U0_iv / R0_iv) - Ival::pt(1.0);
        }
    } else {
        u0_eff = U0_iv / R0_iv;
    }
    Ival w0_val = W0_iv / R0_iv;

    Aff3 u_eff = aff_add(Aff3::cst(u0_eff), aff_add(aff_scale(du_dU, dU), aff_scale(du_dW, dW)));
    u_eff.rad = add_up(u_eff.rad, rem_uw);
    Aff3 w_hat = aff_add(Aff3::cst(w0_val), aff_add(aff_scale(du_dW, dU), aff_scale(dw_dW, dW)));
    w_hat.rad = add_up(w_hat.rad, rem_uw);

    Ival scale_box = (Ival::pt(4.0) / PI_IVAL) * pr.r_iv.len_ival() * pa.th_iv.len_ival();

    Aff3 int_wA_uc  = aff_trilinear_int_e1e2(pr.wA_rad, pa.cos_a, u_eff);
    Aff3 int_wA_ws  = aff_trilinear_int_e1e2(pr.wA_rad, pa.sin_a, w_hat);
    Aff3 contribA   = aff_scale(scale_box, aff_add(int_wA_uc, int_wA_ws));

    Aff3 int_wBm_uc = aff_trilinear_int_e1e2(pr.wBm_rad, pa.cos_a, u_eff);
    Aff3 int_wBm_ws = aff_trilinear_int_e1e2(pr.wBm_rad, pa.sin_a, w_hat);
    Aff3 int_wBp_uc = aff_trilinear_int_e1e2(pr.wBp_rad, pa.cos_a, u_eff);
    Aff3 int_wBp_ws = aff_trilinear_int_e1e2(pr.wBp_rad, pa.sin_a, w_hat);
    Aff3 termBm     = aff_sub(int_wBm_uc, int_wBm_ws);
    Aff3 termBp     = aff_add(int_wBp_uc, int_wBp_ws);
    Aff3 contribB   = aff_scale(scale_box, aff_add(termBm, termBp));

    // Adaptive refinement around the isolated root (r_*(s), pi) where 1/R^3 is large!
    double base_tol = (p_iv.hi < 0.25 && !mode_eps) ? 1.2e-5 : 4.5e-5;
    double rad_tol = mode_eps ? 4.5e-5 : mul_up(base_tol, std::min(1.0, p_iv.hi));
    if (depth < 5 && std::max(contribA.rad, contribB.rad) > rad_tol) {
        subdivide();
        return;
    }

    acc.intA = aff_add(acc.intA, contribA);
    acc.intB = aff_add(acc.intB, contribB);
}

void self_test_fpu();
Ival eval_hp_ival(const RowProfileEnclosure& enc, bool is_B, const Ival& v_iv);

RowProfileEnclosure enclose_row_profile(const RowSpec& row, int inner_threads = 1) {
    // 1. Verify row global positivity & quantitative outer-tail preconditions in Ival:
    const Ival inv_sqrt2  = Ival::pt(1.0) / ival_sqrt(Ival::pt(2.0));
    const Ival inv_sqrt12 = Ival::pt(1.0) / ival_sqrt(Ival::pt(12.0));
    Ival c2 = Ival::pt(row.nu5) * inv_sqrt12;
    Ival c1 = Ival::pt(row.beta) - Ival::pt(6.0) * c2;
    Ival c0 = Ival::pt(row.l) - Ival::pt(2.0) * Ival::pt(row.beta) + Ival::pt(6.0) * c2;
    Ival a0_D = Ival::pt(1.0) + Ival::pt(row.bA);
    Ival a2_C = -(Ival::pt(row.bA) + Ival::pt(row.bB) * inv_sqrt2);
    Ival a2_S = -(Ival::pt(row.bA) - Ival::pt(row.bB) * inv_sqrt2);
    Ival bB_s2 = Ival::pt(row.bB) * inv_sqrt2;
    Ival sigA_iv = row.sigA_iv(), sigB_iv = row.sigB_iv();
    Ival min_PL = (c1.lo >= 0.0) ? c0 : ival_min(c0, c0 - (c1 * c1) / (Ival::pt(4.0) * c2));
    Ival L_out = Ival::pt(6.25) * (c0 + c1 * Ival::pt(39.0625) + c2 * Ival::pt(39.0625 * 39.0625));
    Ival D_out = (Ival::pt(1.0) + Ival::pt(std::fabs(row.bA)))
               + (Ival::pt(std::fabs(row.bA)) + Ival::pt(std::fabs(row.bB)) * inv_sqrt2) * Ival::pt(39.0625);
    if (min_PL.lo <= 0.45 || c0.lo <= 0.45 || c1.lo <= 0.0 || c2.lo <= 0.0 ||
        (c2 * Ival::pt(39.0625 * 39.0625) - c0).lo <= 0.0 ||
        row.bA >= 0.0 || a0_D.lo <= 0.9 || a2_C.lo <= 0.0 || a2_S.lo <= 0.0 ||
        sigA_iv.lo < 0.0 || sigA_iv.hi > 1.0 || sigB_iv.lo < 0.0 || sigB_iv.hi > 1.0 ||
        L_out.lo <= mul_up(1.2, mul_up(8.2, D_out.hi))) {
        std::fprintf(stderr, "FATAL: row %s failed positivity/tail preconditions (min_PL.lo=%g, L_out.lo=%g)\n",
                     row.tag.c_str(), min_PL.lo, L_out.lo);
        std::exit(2);
    }

    RowProfileEnclosure enc;
    enc.spec = row;
    enc.s1 = std::ldexp(1.0, -14); // s1 = 2^{-14} = 6.103515625e-5

    // Precompute contiguous radial (NR=96 on [0, 7]) and angular (NT=80 on [0, pi_lo]) Aff3 arrays for G_X(s):
    const int NR = 96, NT = 80;
    std::vector<double> r_pol_ed(NR + 1), th_pol_ed(NT + 1);
    r_pol_ed[0] = 0.0; r_pol_ed[NR] = 7.0;
    for (int i = 1; i < NR; ++i) r_pol_ed[i] = 7.0 * std::pow(static_cast<double>(i) / NR, 2.1);
    th_pol_ed[0] = 0.0;
    for (int j = 1; j <= NT; ++j) th_pol_ed[j] = mul_dn(PI_IVAL.lo, static_cast<double>(j) / NT);
    std::vector<PrecompRadial> rad_grid(NR);
    std::vector<PrecompAngular> ang_grid(NT);
    for (int i = 0; i < NR; ++i) rad_grid[i] = make_radial(row, {r_pol_ed[i], r_pol_ed[i + 1]});
    for (int j = 0; j < NT; ++j) ang_grid[j] = make_angular({th_pol_ed[j], th_pol_ed[j + 1]});

    // Quantitative outer-tail + pi-endpoint sliver bounds in Ival (PROOF.md §2.4):
    // 1) For G_X: |G_X^{r>=7}| <= 204 e^{-49} and theta in [pi_lo, pi] sliver <= (8/pi)*(pi_hi - pi_lo):
    const double dpi_hi = sub_up(PI_IVAL.hi, PI_IVAL.lo);
    const double R7_G_TAIL = add_up(
        (Ival::pt(204.0) * ival_exp(Ival::pt(-49.0))).hi,
        ((Ival::pt(8.0) / PI_IVAL) * Ival::pt(dpi_hi)).hi
    );
    // 2) For exterior P_X(eps) on eps in [0, 1/8]: |P_X^{r>=7}(eps)| <= (102 + 14700*pi)*e^{-49} uniformly across
    //    the moving vortex r_*(1/eps), plus theta in [pi_lo/2, pi/2] sliver <= (2/pi)*(pi_hi - pi_lo):
    {
        Ival s_sliv, c_sliv;
        ival_sincos_0_pi({mul_dn(0.5, PI_IVAL.lo), mul_up(0.5, PI_IVAL.hi)}, s_sliv, c_sliv);
        double C49_dth = mul_up((a0_D + a2_C * Ival::pt(49.0)).hi, mul_up(0.5, dpi_hi));
        double W_sliv_lo = mul_dn(a0_D.lo, s_sliv.lo);
        if (W_sliv_lo <= 0.5 || C49_dth >= 0.25 * W_sliv_lo) {
            std::fprintf(stderr, "FATAL: pi/2 sliver precondition failed on row %s\n", row.tag.c_str());
            std::exit(2);
        }
    }
    const double R7_HP_TAIL = add_up(
        ((Ival::pt(102.0) + Ival::pt(14700.0) * PI_IVAL) * ival_exp(Ival::pt(-49.0))).hi,
        ((Ival::pt(2.0) / PI_IVAL) * Ival::pt(dpi_hi)).hi
    );

    // 2. Vortex-centered Odd-Taylor origin cap for F_X(r_*) = G_X(psi(r_*)) on r_* in [0, rs_cap = 0.065]
    //    with Cauchy-disk holomorphic tail bound at rho >= Rmax0 = 8.5, plus exact zero-tube h_X([0, s1^2]):
    auto s_pt_ival = [&](double r) -> Ival {
        Ival rv = Ival::pt(r), t2 = ival_sqr(rv);
        return (rv * (c0 + c1 * t2 + c2 * ival_sqr(t2))) / (a0_D + a2_C * t2);
    };
    enc.rs_cap = 0.065;
    enc.s_cap_lo = s_pt_ival(enc.rs_cap).lo;
    {
        // Holomorphic Cauchy-disk bound on |r_*| <= R_star = rs_cap + delta (delta = 1/3) for rho >= Rmax0 = 8.5:
        const double Rmax0 = 8.5;
        const Ival delta_iv = Ival::pt(1.0) / Ival::pt(3.0);
        const Ival R_star = Ival::pt(enc.rs_cap) + delta_iv;
        const Ival R_star2 = ival_sqr(R_star), R_star4 = ival_sqr(R_star2);
        const Ival C_min_star = a0_D - a2_C * R_star2;
        if (C_min_star.lo <= 0.5) {
            std::fprintf(stderr, "FATAL: Cauchy disk C_min_star.lo=%g on row %s\n", C_min_star.lo, row.tag.c_str());
            std::exit(2);
        }
        const Ival S_star = (R_star * (c0 + c1 * R_star2 + c2 * R_star4)) / C_min_star;
        const Ival R0_iv = Ival::pt(Rmax0);
        const Ival rat_R = R_star / R0_iv;
        const Ival one_p_rat = Ival::pt(1.0) + rat_R;
        const Ival one_p_rat2 = ival_sqr(one_p_rat);
        const Ival q_term1 = rat_R * ival_sqr(one_p_rat2);
        const Ival q_term2 = (Ival::pt(2.0) * rat_R + ival_sqr(rat_R)) * (Ival::pt(1.0) + one_p_rat2);
        const Ival D_coef = (Ival::pt(1.0) + Ival::pt(std::fabs(row.bA)))
                          + (Ival::pt(std::fabs(row.bA)) + Ival::pt(std::fabs(row.bB)) * inv_sqrt2) * ival_sqr(R0_iv + R_star);
        const Ival PL_R0 = c0 + c1 * ival_sqr(R0_iv) + c2 * ival_sqr(ival_sqr(R0_iv));
        const Ival q_term3 = (S_star * D_coef) / (R0_iv * PL_R0);
        const double q_max = (q_term1 + q_term2 + q_term3).hi;
        const double kappa_max = add_up(mul_up(2.0, q_max), mul_up(q_max, q_max));
        if (kappa_max >= 0.85) {
            std::fprintf(stderr, "FATAL: Cauchy disk kappa_max=%g >= 0.85 on row %s\n", kappa_max, row.tag.c_str());
            std::exit(2);
        }
        const Ival sqrt2_iv = ival_sqrt(Ival::pt(2.0));
        const double M_ph = div_up(mul_up(sqrt2_iv.hi, add_up(1.0, q_max)), sqrt_dn(sub_dn(1.0, kappa_max)));
        const Ival u0_iv = R0_iv - R_star;
        const Ival u0_2 = ival_sqr(u0_iv);
        const Ival K_poly = sqrt2_iv * ((u0_iv + R_star) * ival_sqr(u0_iv + Ival::pt(2.0) * R_star)) / u0_2
                          + (u0_iv + R_star) / (u0_2 * u0_iv);
        const Ival cauchy_base = Ival::pt(4.0) * Ival::pt(M_ph) * ival_exp(Ival::pt(2.0) * R_star2)
                               * K_poly * (Ival::pt(0.5) * (u0_2 + Ival::pt(1.0)) * ival_exp(-u0_2));
        const double tail_j1 = mul_up(3.0, cauchy_base.hi);
        const double tail_j3 = mul_up(27.0, cauchy_base.hi);
        const double tail_j5 = mul_up(243.0, cauchy_base.hi);

        // Exact c_1(0) = F'(0) and c_3(0) = F'''(0)/6 via Jet1D<Aff2, 3> at r_* = 0:
        // At r_* = 0, |A_-(z; 0)| = rho P_L(rho^2) is independent of psi, so [r_*^1] and [r_*^3] are exact
        // even trigonometric polynomials in psi of degree <= 9! By discrete Fourier orthogonality, the 16-point
        // midpoint rule on (0, pi) (8 angles psi_j = pi*(2j+1)/32 in (0, pi/2) paired with pi - psi_j via sgn=+-1)
        // integrates every harmonic cos(m*psi) for 1 <= m <= 31 to ZERO identically (zero angular quadrature error)!
        using J3A = Jet1D<Aff2, 3>;
        const int NR0_J = 1152, NP0_HALF = 8;
        J3A rs0 = J3A::var(Aff2::cst({0.0, 0.0}), Aff2::cst({1.0, 1.0}));
        J3A Ts0 = rs0 * rs0;
        J3A Ps0 = J3A::cst(Aff2::cst(c0)) + J3A::cst(Aff2::cst(c1)) * Ts0;
        J3A Cs0 = J3A::cst(Aff2::cst(a0_D)) + J3A::cst(Aff2::cst(a2_C)) * Ts0;
        J3A s0_j = rs0 * (Ps0 * j3a_inv(Cs0, a0_D.lo));

        std::vector<Aff2> a_sin(NP0_HALF), a_cos(NP0_HALF);
        for (int j = 0; j < NP0_HALF; ++j) {
            Ival th0 = PI_IVAL * Ival::pt((2.0 * j + 1.0) / (4.0 * NP0_HALF));
            Ival s_t, c_t; ival_sincos_0_pi(th0, s_t, c_t);
            a_sin[j] = Aff2::cst(s_t);
            a_cos[j] = Aff2::cst(c_t);
        }

        std::vector<double> rho0_ed(NR0_J + 1);
        rho0_ed[0] = 0.0; rho0_ed[NR0_J] = Rmax0;
        for (int i = 1; i < NR0_J; ++i) rho0_ed[i] = Rmax0 * (static_cast<double>(i) / NR0_J);

        const Ival sigA_m1 = sigA_iv - Ival::pt(1.0);
        Ival accA1{0, 0}, accA3{0, 0}, accB1{0, 0}, accB3{0, 0};
        double pl2_min = mul_dn(min_PL.lo, min_PL.lo);
        for (int i = 0; i < NR0_J; ++i) {
            Ival rho_iv{rho0_ed[i], rho0_ed[i + 1]};
            double tlo_cell = mul_dn(rho_iv.lo, rho_iv.lo);
            J3A rho = J3A::cst(Aff2::var1(rho_iv));
            J3A rho2 = rho * rho;
            for (int j = 0; j < NP0_HALF; ++j) {
                J3A sumA = J3A::cst({0, 0, 0, 0}), sumB = J3A::cst({0, 0, 0, 0});
                for (int sgn : {+1, -1}) {
                    J3A gam = J3A::cst(sgn > 0 ? a_cos[j] : -a_cos[j]);
                    J3A sig = J3A::cst(a_sin[j]);
                    J3A zx = rs0 + rho * gam, zy = rho * sig;
                    J3A T = Ts0 + J3A::cst(Aff2::cst({2.0, 2.0})) * rs0 * rho * gam + rho2;
                    J3A Delta = J3A::cst(Aff2::cst({2.0, 2.0})) * rs0 * gam + rho;
                    J3A QL = J3A::cst(Aff2::cst(c1)) + J3A::cst(Aff2::cst(c2)) * (J3A::cst(Aff2::cst({2.0, 2.0})) * Ts0 + rho * Delta);
                    J3A Bx = Ps0 + (rho + rs0 * gam) * (Delta * QL)
                           + s0_j * (J3A::cst(Aff2::cst(Ival::pt(row.bA))) * Delta * gam
                                   + J3A::cst(Aff2::cst(bB_s2)) * (J3A::cst(Aff2::cst({2.0, 2.0})) * rs0 + rho * gam));
                    J3A By = (J3A::cst({0, 0, 0, 0}) - rs0 * sig) * (Delta * QL)
                           + s0_j * (J3A::cst(Aff2::cst(Ival::pt(-row.bA))) * Delta * sig + J3A::cst(Aff2::cst(bB_s2)) * (rho * sig));
                    J3A invB = j3a_inv(j3a_sqrt(Bx * Bx + By * By, pl2_min), min_PL.lo);
                    J3A qhx = Bx * invB, qhy = By * invB;
                    J3A phx = gam * qhx - sig * qhy, phy = sig * qhx + gam * qhy;
                    J3A wg = j3a_exp_neg(T, tlo_cell) * rho;
                    J3A wA = T + J3A::cst(Aff2::cst(sigA_m1));
                    J3A uB = (Ts0 + J3A::cst(Aff2::cst({2.0, 2.0})) * rs0 * rho * gam
                            + rho2 * (J3A::cst(Aff2::cst({2.0, 2.0})) * gam * gam - J3A::cst(Aff2::cst({1.0, 1.0}))))
                           * J3A::cst(Aff2::cst(inv_sqrt2)) + J3A::cst(Aff2::cst(sigB_iv));
                    J3A vB = J3A::cst(Aff2::cst(Ival::pt(2.0) * inv_sqrt2)) * zx * zy;
                    sumA = sumA + wg * wA * phx;
                    sumB = sumB + wg * (uB * phx + vB * phy);
                }
                Ival sc = Ival::pt(-4.0 / (2.0 * NP0_HALF)) * rho_iv.len_ival();
                accA1 = accA1 + sc * sumA.c[1].integral();
                accA3 = accA3 + sc * sumA.c[3].integral();
                accB1 = accB1 + sc * sumB.c[1].integral();
                accB3 = accB3 + sc * sumB.c[3].integral();
            }
        }
        enc.c1_A0 = {sub_dn(accA1.lo, tail_j1), add_up(accA1.hi, tail_j1)};
        enc.c3_A0 = {sub_dn(accA3.lo, tail_j3), add_up(accA3.hi, tail_j3)};
        enc.c1_B0 = {sub_dn(accB1.lo, tail_j1), add_up(accB1.hi, tail_j1)};
        enc.c3_B0 = {sub_dn(accB3.lo, tail_j3), add_up(accB3.hi, tail_j3)};

        // Enclose C_5 = F^{(5)}([0, rs_cap]) / 120 via Jet1D<Ival, 5> up to Rmax0 = 8.5:
        using J5I = Jet1D<Ival, 5>;
        const int NR5_J = 112, NP5_J = 32;
        Ival rs_cap_iv{0.0, enc.rs_cap};
        J5I rs5 = J5I::var(rs_cap_iv, {1.0, 1.0});
        J5I Ts5 = rs5 * rs5, Ts5_2 = Ts5 * Ts5;
        J5I Ps5 = J5I::cst(c0) + J5I::cst(c1) * Ts5 + J5I::cst(c2) * Ts5_2;
        J5I Cs5 = J5I::cst(a0_D) + J5I::cst(a2_C) * Ts5;
        J5I s5_j = rs5 * Ps5 * j5i_inv(Cs5);
        std::vector<double> rho5_ed(NR5_J + 1);
        rho5_ed[0] = 0.0; rho5_ed[NR5_J] = Rmax0;
        for (int i = 1; i < NR5_J; ++i) rho5_ed[i] = Rmax0 * std::pow(static_cast<double>(i) / NR5_J, 1.3);
        Ival accC5A{0, 0}, accC5B{0, 0};
        for (int i = 0; i < NR5_J; ++i) {
            Ival rho_iv{rho5_ed[i], rho5_ed[i + 1]};
            J5I rho = J5I::cst(rho_iv), rho2 = rho * rho;
            for (int j = 0; j < NP5_J; ++j) {
                Ival psi_iv{mul_dn(0.5, mul_dn(PI_IVAL.lo, static_cast<double>(j) / NP5_J)),
                            mul_up(0.5, mul_up(PI_IVAL.hi, static_cast<double>(j + 1) / NP5_J))}, sb, cb;
                ival_sincos_0_pi(psi_iv, sb, cb); cb.lo = std::max(0.0, cb.lo);
                J5I sumA = J5I::cst({0, 0}), sumB = J5I::cst({0, 0});
                for (int sgn : {+1, -1}) {
                    J5I gam = J5I::cst(sgn > 0 ? cb : -cb), sig = J5I::cst(sb);
                    J5I zx = rs5 + rho * gam, zy = rho * sig;
                    J5I T = Ts5 + J5I::cst({2.0, 2.0}) * rs5 * rho * gam + rho2;
                    J5I Delta = J5I::cst({2.0, 2.0}) * rs5 * gam + rho;
                    J5I QL = J5I::cst(c1) + J5I::cst(c2) * (J5I::cst({2.0, 2.0}) * Ts5 + rho * Delta);
                    J5I Bx = Ps5 + (rho + rs5 * gam) * (Delta * QL)
                           + s5_j * (J5I::cst(Ival::pt(row.bA)) * Delta * gam
                                   + J5I::cst(bB_s2) * (J5I::cst({2.0, 2.0}) * rs5 + rho * gam));
                    J5I By = (J5I::cst({0, 0}) - rs5 * sig) * (Delta * QL)
                           + s5_j * (J5I::cst(Ival::pt(-row.bA)) * Delta * sig + J5I::cst(bB_s2) * (rho * sig));
                    J5I B2 = Bx * Bx + By * By;
                    if (B2.c[0].lo <= 0.0) { std::fprintf(stderr, "FATAL: J5I B2.lo=%g\n", B2.c[0].lo); std::exit(2); }
                    J5I invB = j5i_inv(j5i_sqrt(B2));
                    J5I qhx = Bx * invB, qhy = By * invB;
                    J5I phx = gam * qhx - sig * qhy, phy = sig * qhx + gam * qhy;
                    J5I wg = j5i_exp_neg(T) * rho;
                    J5I wA = T + J5I::cst(sigA_m1);
                    J5I uB = (Ts5 + J5I::cst({2.0, 2.0}) * rs5 * rho * gam
                            + rho2 * (J5I::cst({2.0, 2.0}) * gam * gam - J5I::cst({1.0, 1.0})))
                           * J5I::cst(inv_sqrt2) + J5I::cst(sigB_iv);
                    J5I vB = J5I::cst(Ival::pt(2.0) * inv_sqrt2) * zx * zy;
                    sumA = sumA + wg * wA * phx;
                    sumB = sumB + wg * (uB * phx + vB * phy);
                }
                Ival sc = Ival::pt(-4.0 / (2.0 * NP5_J)) * rho_iv.len_ival();
                accC5A = accC5A + sc * sumA.c[5];
                accC5B = accC5B + sc * sumB.c[5];
            }
        }
        enc.C5_A = {sub_dn(accC5A.lo, tail_j5), add_up(accC5A.hi, tail_j5)};
        enc.C5_B = {sub_dn(accC5B.lo, tail_j5), add_up(accC5B.hi, tail_j5)};

        // Direct division-free enclosure of h_X(v) = F_X(r_*) / psi(r_*) = (c1 + c3 r_*^2 + C5 r_*^4) / Q(r_*^2)
        // on s in [0, s1] subset [0, s_cap_lo):
        if (enc.s1 >= enc.s_cap_lo) {
            std::fprintf(stderr, "FATAL: s1=%g >= s_cap_lo=%g on row %s\n", enc.s1, enc.s_cap_lo, row.tag.c_str());
            std::exit(2);
        }
        Ival r_s1{0.0, enc.rs_cap};
        for (int it = 0; it < 4; ++it) {
            Ival Ts = ival_sqr(r_s1);
            Ival Q = (c0 + c1 * Ts + c2 * ival_sqr(Ts)) / (a0_D + a2_C * Ts);
            Ival rn = Ival{0.0, enc.s1} / Q;
            r_s1 = {0.0, std::min(enc.rs_cap, rn.hi)};
        }
        Ival Ts1 = ival_sqr(r_s1);
        Ival Qs1 = (c0 + c1 * Ts1 + c2 * ival_sqr(Ts1)) / (a0_D + a2_C * Ts1);
        enc.hA_zero_tube = (enc.c1_A0 + enc.c3_A0 * Ts1 + enc.C5_A * ival_sqr(Ts1)) / Qs1;
        enc.hB_zero_tube = (enc.c1_B0 + enc.c3_B0 * Ts1 + enc.C5_B * ival_sqr(Ts1)) / Qs1;
    }

    // 3. Dyadic s_edges on [s1, 8.0] and compactified exterior eps in [0, 0.125] for G_X(s):
    auto snap_s = [](double v) -> double { return std::ldexp(std::round(v * 65536.0), -16); };
    const int NS1 = 48, NS2 = 96, NS3 = 48;
    enc.s_edges.push_back(enc.s1);
    for (int i = 1; i <= NS1; ++i) {
        double sv = snap_s(enc.s1 * std::pow(0.25 / enc.s1, static_cast<double>(i) / NS1));
        if (sv > enc.s_edges.back()) enc.s_edges.push_back(sv);
    }
    for (int i = 1; i <= NS2; ++i) {
        double sv = snap_s(0.25 + (2.5 - 0.25) * (static_cast<double>(i) / NS2));
        if (sv > enc.s_edges.back()) enc.s_edges.push_back(sv);
    }
    for (int i = 1; i <= NS3; ++i) {
        double sv = snap_s(2.5 + (8.0 - 2.5) * (static_cast<double>(i) / NS3));
        if (sv > enc.s_edges.back()) enc.s_edges.push_back(sv);
    }
    int NS = static_cast<int>(enc.s_edges.size()) - 1;
    enc.GA_c0.resize(NS); enc.GA_cs.resize(NS); enc.GA_rad.resize(NS);
    enc.GB_c0.resize(NS); enc.GB_cs.resize(NS); enc.GB_rad.resize(NS);
    for (int m = 0; m < NS; ++m) {
        Ival s_iv{enc.s_edges[m], enc.s_edges[m + 1]};
        PolarAccum acc;
        for (int i = 0; i < NR; ++i) {
            for (int j = 0; j < NT; ++j) {
                integrate_polar_cell(row, rad_grid[i], ang_grid[j], s_iv, false, 0, acc);
            }
        }
        enc.GA_c0[m] = acc.intA.c0; enc.GA_cs[m] = acc.intA.c3; enc.GA_rad[m] = add_up(acc.intA.rad, R7_G_TAIL);
        enc.GB_c0[m] = acc.intB.c0; enc.GB_cs[m] = acc.intB.c3; enc.GB_rad[m] = add_up(acc.intB.rad, R7_G_TAIL);
    }

    const int NE = 24;
    enc.eps_edges.resize(NE + 1);
    for (int m = 0; m <= NE; ++m) enc.eps_edges[m] = 0.125 * (static_cast<double>(m) / NE);
    enc.GA_eps_c0.resize(NE); enc.GA_eps_cs.resize(NE); enc.GA_eps_rad.resize(NE);
    enc.GB_eps_c0.resize(NE); enc.GB_eps_cs.resize(NE); enc.GB_eps_rad.resize(NE);
    for (int m = 0; m < NE; ++m) {
        Ival eps_iv{enc.eps_edges[m], enc.eps_edges[m + 1]};
        PolarAccum acc;
        for (int i = 0; i < NR; ++i) {
            for (int j = 0; j < NT; ++j) {
                integrate_polar_cell(row, rad_grid[i], ang_grid[j], eps_iv, true, 0, acc);
            }
        }
        enc.GA_eps_c0[m] = acc.intA.c0; enc.GA_eps_cs[m] = acc.intA.c3; enc.GA_eps_rad[m] = add_up(acc.intA.rad, R7_G_TAIL);
        enc.GB_eps_c0[m] = acc.intB.c0; enc.GB_eps_cs[m] = acc.intB.c3; enc.GB_eps_rad[m] = add_up(acc.intB.rad, R7_G_TAIL);
    }

    // 4b. Vortex-centered Poly3Q slabs on r_* in [0.035, rs_max] covering s in [s(0.035), 8.05]:
    double rs_lo_b = 2.0, rs_hi_b = 10.0;
    for (int it = 0; it < 60; ++it) {
        double mid = 0.5 * (rs_lo_b + rs_hi_b);
        if (s_pt_ival(mid).lo >= 8.05) rs_hi_b = mid;
        else rs_lo_b = mid;
    }
    double rs_min_v = 0.035, rs_max_v = rs_hi_b;
    const int NRS = 216;
    enc.rs_edges.resize(NRS + 1);
    enc.s_rs_pt_lo.resize(NRS + 1);
    enc.s_rs_pt_hi.resize(NRS + 1);
    for (int m = 0; m <= NRS; ++m) {
        enc.rs_edges[m] = rs_min_v + (rs_max_v - rs_min_v) * std::pow(static_cast<double>(m) / NRS, 1.80);
        Ival sp = s_pt_ival(enc.rs_edges[m]);
        enc.s_rs_pt_lo[m] = sp.lo;
        enc.s_rs_pt_hi[m] = sp.hi;
    }
    if (enc.s_rs_pt_hi.front() >= enc.s_cap_lo || enc.s_rs_pt_lo.back() < 8.0) {
        std::fprintf(stderr, "FATAL: vortex slab coverage failed on row %s (s0_hi=%g, s_cap_lo=%g, s_end_lo=%g)\n",
                     row.tag.c_str(), enc.s_rs_pt_hi.front(), enc.s_cap_lo, enc.s_rs_pt_lo.back());
        std::exit(2);
    }

    enc.s_rs_mid_lo.resize(NRS); enc.s_rs_mid_hi.resize(NRS);
    enc.ds_rs_lo.resize(NRS);    enc.ds_rs_hi.resize(NRS);
    enc.PA_q0.resize(NRS); enc.PA_q1.resize(NRS); enc.PA_q2.resize(NRS); enc.PA_rad.resize(NRS);
    enc.PB_q0.resize(NRS); enc.PB_q1.resize(NRS); enc.PB_q2.resize(NRS); enc.PB_rad.resize(NRS);

    const int NP_V_FINE = 264, NP_V_COARSE = 144;
    std::vector<Poly3Q> v_sin_f(NP_V_FINE), v_cos_f(NP_V_FINE), v_sin_c(NP_V_COARSE), v_cos_c(NP_V_COARSE);
    std::vector<Ival> v_sin_bf(NP_V_FINE), v_cos_bf(NP_V_FINE), v_sin_bc(NP_V_COARSE), v_cos_bc(NP_V_COARSE);
    for (int j = 0; j < NP_V_FINE; ++j) {
        p3_sincos_unit(static_cast<double>(j) / NP_V_FINE, static_cast<double>(j + 1) / NP_V_FINE,
                       v_sin_f[j], v_cos_f[j], v_sin_bf[j], v_cos_bf[j]);
    }
    for (int j = 0; j < NP_V_COARSE; ++j) {
        p3_sincos_unit(static_cast<double>(j) / NP_V_COARSE, static_cast<double>(j + 1) / NP_V_COARSE,
                       v_sin_c[j], v_cos_c[j], v_sin_bc[j], v_cos_bc[j]);
    }
    const double exp_mT0_hi = ival_exp(Ival::pt(-39.0625)).hi;

    auto run_slab = [&](int m) {
        Ival rs_iv{enc.rs_edges[m], enc.rs_edges[m + 1]};
        double r_mid, r_rad_unused;
        param_mid_rad(rs_iv.lo, rs_iv.hi, r_mid, r_rad_unused);
        (void)r_rad_unused;
        Ival smid_iv = s_pt_ival(r_mid);
        enc.s_rs_mid_lo[m] = smid_iv.lo;
        enc.s_rs_mid_hi[m] = smid_iv.hi;

        Ival Ts_b = ival_sqr(rs_iv), Ps_b = c0 + c1 * Ts_b + c2 * ival_sqr(Ts_b), Cs_b = a0_D + a2_C * Ts_b;
        Ival dPs_b = Ival::pt(2.0) * rs_iv * (c1 + Ival::pt(2.0) * c2 * Ts_b), dCs_b = Ival::pt(2.0) * a2_C * rs_iv;
        Ival s_b = (rs_iv * Ps_b) / Cs_b;
        Ival ds_b = ((Ps_b + rs_iv * dPs_b) * Cs_b - rs_iv * Ps_b * dCs_b) / ival_sqr(Cs_b);
        if (ds_b.lo <= 0.0 || s_b.hi > 8.2) {
            std::fprintf(stderr, "FATAL: invalid ds/dr* or s_b.hi on slab %d of row %s (ds.lo=%g, s.hi=%g)\n",
                         m, row.tag.c_str(), ds_b.lo, s_b.hi);
            std::exit(2);
        }
        enc.ds_rs_lo[m] = ds_b.lo;
        enc.ds_rs_hi[m] = ds_b.hi;
        double S_rat = div_up(s_b.hi, ds_b.lo);
        double T0_v = 39.0625;
        double mom2 = add_up(mul_up(T0_v, T0_v), add_up(mul_up(4.0, T0_v), 4.0));
        double mom1 = add_up(T0_v, 2.0);
        double vortex_tail_hi = mul_up(
            add_up(mul_up(div_up(mul_up(2.0, S_rat), 6.25), mom2), mul_up(add_up(mul_up(6.4, S_rat), 6.0), mom1)),
            exp_mT0_hi
        );

        Poly3Q rs = Poly3Q::var3(rs_iv), Ts = p3_mul(rs, rs), Ts2 = p3_mul(Ts, Ts);
        Poly3Q Ps = p3_add(Poly3Q::cst(c0), p3_add(p3_scale(c1, Ts), p3_scale(c2, Ts2)));
        Poly3Q dPs = p3_mul(p3_scale(Ival::pt(2.0), rs), p3_add(Poly3Q::cst(c1), p3_scale(Ival::pt(2.0) * c2, Ts)));
        Poly3Q Cs = p3_add(Poly3Q::cst(a0_D), p3_scale(a2_C, Ts));
        Poly3Q dCs = p3_scale(Ival::pt(2.0) * a2_C, rs);
        Poly3Q invCs = p3_inv(Cs, Cs_b.lo);
        Poly3Q s_p = p3_mul(p3_mul(rs, Ps), invCs);
        Poly3Q ds_p = p3_mul(p3_sub(p3_mul(p3_add(Ps, p3_mul(rs, dPs)), Cs), p3_mul(p3_mul(rs, Ps), dCs)), p3_mul(invCs, invCs));
        Poly3Q s_over_ds = p3_mul(s_p, p3_inv(ds_p, ds_b.lo));

        VortexSlabCtx ctx{row, inv_sqrt2, c0, c1, c2, a0_D, a2_C, bB_s2,
                          rs_iv, Ts_b, Ps_b, Cs_b, s_b, rs, Ts, Ps, dPs, s_p, ds_p, s_over_ds};

        bool use_fine = (rs_iv.hi <= 1.25);
        int nr1 = use_fine ? 360 : 168;
        int nr2 = use_fine ? 90  : 60;
        int npv = use_fine ? NP_V_FINE : NP_V_COARSE;
        const auto& vsin = use_fine ? v_sin_f : v_sin_c;
        const auto& vcos = use_fine ? v_cos_f : v_cos_c;
        const auto& vsin_b = use_fine ? v_sin_bf : v_sin_bc;
        const auto& vcos_b = use_fine ? v_cos_bf : v_cos_bc;

        double Rmid = rs_iv.hi + 3.25;
        double Rmax = std::ceil((rs_iv.hi + 6.25) * 4.0) * 0.25;
        std::vector<double> rv_ed(nr1 + nr2 + 1);
        rv_ed[0] = 0.0; rv_ed[nr1] = Rmid; rv_ed[nr1 + nr2] = Rmax;
        for (int i = 1; i < nr1; ++i) rv_ed[i] = Rmid * (static_cast<double>(i) / nr1);
        for (int i = 1; i < nr2; ++i) rv_ed[nr1 + i] = Rmid + (Rmax - Rmid) * (static_cast<double>(i) / nr2);
        Quad1D accPA{0, 0, 0, 0}, accPB{0, 0, 0, 0};
        for (int i = 0; i < nr1 + nr2; ++i) {
            Ival rho_iv{rv_ed[i], rv_ed[i + 1]};
            for (int j = 0; j < npv; ++j) {
                integrate_vortex_cell(ctx, rho_iv, static_cast<double>(j) / npv, static_cast<double>(j + 1) / npv,
                                      vsin[j], vcos[j], vsin_b[j], vcos_b[j], 0, accPA, accPB);
            }
        }
        enc.PA_q0[m] = accPA.q0; enc.PA_q1[m] = accPA.q1; enc.PA_q2[m] = accPA.q2; enc.PA_rad[m] = add_up(accPA.rad, vortex_tail_hi);
        enc.PB_q0[m] = accPB.q0; enc.PB_q1[m] = accPB.q1; enc.PB_q2[m] = accPB.q2; enc.PB_rad[m] = add_up(accPB.rad, vortex_tail_hi);
    };

    if (inner_threads <= 1) {
        for (int m = 0; m < NRS; ++m) run_slab(m);
    } else {
        std::atomic<int> next_m{0};
        std::vector<std::thread> sl_pool;
        for (int t = 0; t < inner_threads; ++t) {
            sl_pool.emplace_back([&]() {
                self_test_fpu();
                while (true) {
                    int m = next_m.fetch_add(1);
                    if (m >= NRS) break;
                    run_slab(m);
                }
            });
        }
        for (auto& th : sl_pool) th.join();
    }

    // 4c. Exterior folded polar slabs on eps = 1/s in [0, 0.125] (s >= 8.0, v >= 64.0):
    const int NR_HP = 112, NT_HP = 64;
    std::vector<double> r_hp_ed(NR_HP + 1), th_hp_ed(NT_HP + 1);
    r_hp_ed[0] = 0.0; r_hp_ed[NR_HP] = 7.0;
    for (int i = 1; i < NR_HP; ++i) r_hp_ed[i] = 7.0 * std::pow(static_cast<double>(i) / NR_HP, 1.5);
    th_hp_ed[0] = 0.0;
    for (int j = 1; j <= NT_HP; ++j) th_hp_ed[j] = mul_dn(0.5, mul_dn(PI_IVAL.lo, static_cast<double>(j) / NT_HP));
    std::vector<PrecompRadial> rad_hp_grid(NR_HP);
    std::vector<PrecompAngular> ang_hp_grid(NT_HP);
    for (int i = 0; i < NR_HP; ++i) rad_hp_grid[i] = make_radial(row, {r_hp_ed[i], r_hp_ed[i + 1]});
    for (int j = 0; j < NT_HP; ++j) ang_hp_grid[j] = make_angular({th_hp_ed[j], th_hp_ed[j + 1]});
    enc.PA_eps_c0.resize(NE); enc.PA_eps_cs.resize(NE); enc.PA_eps_rad.resize(NE);
    enc.PB_eps_c0.resize(NE); enc.PB_eps_cs.resize(NE); enc.PB_eps_rad.resize(NE);
    for (int m = 0; m < NE; ++m) {
        Ival eps_iv{enc.eps_edges[m], enc.eps_edges[m + 1]};
        PolarAccum acc;
        for (int i = 0; i < NR_HP; ++i) {
            for (int j = 0; j < NT_HP; ++j) {
                integrate_hp_polar_cell(row, rad_hp_grid[i], ang_hp_grid[j], eps_iv, true, 0, acc);
            }
        }
        enc.PA_eps_c0[m] = acc.intA.c0; enc.PA_eps_cs[m] = acc.intA.c3; enc.PA_eps_rad[m] = add_up(acc.intA.rad, R7_HP_TAIL);
        enc.PB_eps_c0[m] = acc.intB.c0; enc.PB_eps_cs[m] = acc.intB.c3; enc.PB_eps_rad[m] = add_up(acc.intB.rad, R7_HP_TAIL);
    }

    // 4d. Build row-level w_edges in [0, 256.0] and precompute division-free h_X' panel enclosures:
    const int NW0 = 512, NW1 = 4096, NW2 = 2048, NW3 = 512;
    enc.w_edges.push_back(0.0);
    for (int i = 1; i <= NW0; ++i) enc.w_edges.push_back((1.0 / 256.0) * std::pow(static_cast<double>(i) / NW0, 1.5));
    for (int i = 1; i <= NW1; ++i) enc.w_edges.push_back(1.0 / 256.0 + (4.0 - 1.0 / 256.0) * std::pow(static_cast<double>(i) / NW1, 1.5));
    for (int i = 1; i <= NW2; ++i) enc.w_edges.push_back(4.0 + (64.0 - 4.0) * (static_cast<double>(i) / NW2));
    for (int i = 1; i <= NW3; ++i) enc.w_edges.push_back(64.0 + (256.0 - 64.0) * (static_cast<double>(i) / NW3));
    int NW = static_cast<int>(enc.w_edges.size()) - 1;
    enc.hpA_pan.resize(NW);
    enc.hpB_pan.resize(NW);
    enc.dhA_nodes.resize(NW + 1, {0.0, 0.0});
    for (int j = 0; j < NW; ++j) {
        Ival w_iv{enc.w_edges[j], enc.w_edges[j + 1]};
        enc.hpA_pan[j] = eval_hp_ival(enc, false, w_iv);
        enc.hpB_pan[j] = eval_hp_ival(enc, true, w_iv);
        enc.dhA_nodes[j + 1] = enc.dhA_nodes[j] + w_iv.len_ival() * enc.hpA_pan[j];
    }

    enc.GA_inf = {1e300, -1e300}; enc.GB_inf = {1e300, -1e300};
    enc.PA_inf = {1e300, -1e300}; enc.PB_inf = {1e300, -1e300};
    for (int m = 0; m < NE; ++m) {
        double gA_sp = add_up(std::fabs(enc.GA_eps_cs[m]), enc.GA_eps_rad[m]);
        double gB_sp = add_up(std::fabs(enc.GB_eps_cs[m]), enc.GB_eps_rad[m]);
        double pA_sp = add_up(std::fabs(enc.PA_eps_cs[m]), enc.PA_eps_rad[m]);
        double pB_sp = add_up(std::fabs(enc.PB_eps_cs[m]), enc.PB_eps_rad[m]);
        enc.GA_inf = ival_join(enc.GA_inf, {sub_dn(enc.GA_eps_c0[m], gA_sp), add_up(enc.GA_eps_c0[m], gA_sp)});
        enc.GB_inf = ival_join(enc.GB_inf, {sub_dn(enc.GB_eps_c0[m], gB_sp), add_up(enc.GB_eps_c0[m], gB_sp)});
        enc.PA_inf = ival_join(enc.PA_inf, {sub_dn(enc.PA_eps_c0[m], pA_sp), add_up(enc.PA_eps_c0[m], pA_sp)});
        enc.PB_inf = ival_join(enc.PB_inf, {sub_dn(enc.PB_eps_c0[m], pB_sp), add_up(enc.PB_eps_c0[m], pB_sp)});
    }
    return enc;
}

// Evaluate origin-collar enclosure alone on s = sqrt(v) in [0, s_cap_lo]
Ival eval_hp_origin_only_ival(const RowProfileEnclosure& enc, bool is_B, const Ival& v_iv) {
    Ival sub_s = ival_sqrt(v_iv);
    const Ival inv_sqrt2  = Ival::pt(1.0) / ival_sqrt(Ival::pt(2.0));
    const Ival inv_sqrt12 = Ival::pt(1.0) / ival_sqrt(Ival::pt(12.0));
    Ival c2 = Ival::pt(enc.spec.nu5) * inv_sqrt12;
    Ival c1 = Ival::pt(enc.spec.beta) - Ival::pt(6.0) * c2;
    Ival c0 = Ival::pt(enc.spec.l) - Ival::pt(2.0) * Ival::pt(enc.spec.beta) + Ival::pt(6.0) * c2;
    Ival a0_D = Ival::pt(1.0) + Ival::pt(enc.spec.bA);
    Ival a2_C = -(Ival::pt(enc.spec.bA) + Ival::pt(enc.spec.bB) * inv_sqrt2);

    Ival r_iv{0.0, enc.rs_cap};
    for (int it = 0; it < 4; ++it) {
        Ival Ts = ival_sqr(r_iv);
        Ival Q = (c0 + c1 * Ts + c2 * ival_sqr(Ts)) / (a0_D + a2_C * Ts);
        Ival rn = sub_s / Q;
        r_iv = {std::max(0.0, rn.lo), std::min(enc.rs_cap, rn.hi)};
    }
    Ival Ts = ival_sqr(r_iv), Ps = c0 + c1 * Ts + c2 * ival_sqr(Ts), Cs = a0_D + a2_C * Ts;
    Ival Q = Ps / Cs, Q3 = Q * ival_sqr(Q);
    Ival Qp = ((c1 + Ival::pt(2.0) * c2 * Ts) * Cs - Ps * a2_C) / ival_sqr(Cs);
    Ival sp = Q + Ival::pt(2.0) * Ts * Qp;
    const Ival& c1_0 = is_B ? enc.c1_B0 : enc.c1_A0;
    const Ival& c3_0 = is_B ? enc.c3_B0 : enc.c3_A0;
    const Ival& C5   = is_B ? enc.C5_B  : enc.C5_A;
    Ival num = (c3_0 + (Ival::pt(2.5) * C5 - Ival::pt(0.5) * C5) * Ts)
             - (Qp / sp) * (c1_0 + Ival::pt(3.0) * c3_0 * Ts + Ival::pt(5.0) * C5 * ival_sqr(Ts));
    return num / Q3;
}

// Evaluate h_X'(v) directly on ANY v-interval [va, vb] subset [0, inf) with ZERO 1/s^3 or 1/R^3 blowup!
Ival eval_hp_ival(const RowProfileEnclosure& enc, bool is_B, const Ival& v_iv) {
    Ival s_iv = ival_sqrt(v_iv);
    Ival res{1e300, -1e300};
    auto merge = [&](const Ival& piece) {
        res.lo = std::min(res.lo, piece.lo);
        res.hi = std::max(res.hi, piece.hi);
    };

    const Ival inv_sqrt2  = Ival::pt(1.0) / ival_sqrt(Ival::pt(2.0));
    const Ival inv_sqrt12 = Ival::pt(1.0) / ival_sqrt(Ival::pt(12.0));
    Ival c2 = Ival::pt(enc.spec.nu5) * inv_sqrt12;
    Ival c1 = Ival::pt(enc.spec.beta) - Ival::pt(6.0) * c2;
    Ival c0 = Ival::pt(enc.spec.l) - Ival::pt(2.0) * Ival::pt(enc.spec.beta) + Ival::pt(6.0) * c2;
    Ival a0_D = Ival::pt(1.0) + Ival::pt(enc.spec.bA);
    Ival a2_C = -(Ival::pt(enc.spec.bA) + Ival::pt(enc.spec.bB) * inv_sqrt2);

    auto eval_origin_cap = [&](const Ival& sub_s) -> Ival {
        Ival r_iv{0.0, enc.rs_cap};
        for (int it = 0; it < 4; ++it) {
            Ival Ts = ival_sqr(r_iv);
            Ival Q = (c0 + c1 * Ts + c2 * ival_sqr(Ts)) / (a0_D + a2_C * Ts);
            Ival rn = sub_s / Q;
            r_iv = {std::max(0.0, rn.lo), std::min(enc.rs_cap, rn.hi)};
        }
        Ival Ts = ival_sqr(r_iv), Ps = c0 + c1 * Ts + c2 * ival_sqr(Ts), Cs = a0_D + a2_C * Ts;
        Ival Q = Ps / Cs, Q3 = Q * ival_sqr(Q);
        Ival Qp = ((c1 + Ival::pt(2.0) * c2 * Ts) * Cs - Ps * a2_C) / ival_sqr(Cs);
        Ival sp = Q + Ival::pt(2.0) * Ts * Qp;
        const Ival& c1_0 = is_B ? enc.c1_B0 : enc.c1_A0;
        const Ival& c3_0 = is_B ? enc.c3_B0 : enc.c3_A0;
        const Ival& C5   = is_B ? enc.C5_B  : enc.C5_A;
        Ival num = (c3_0 + (Ival::pt(2.5) * C5 - Ival::pt(0.5) * C5) * Ts)
                 - (Qp / sp) * (c1_0 + Ival::pt(3.0) * c3_0 * Ts + Ival::pt(5.0) * C5 * ival_sqr(Ts));
        return num / Q3;
    };

    auto eval_vortex_slabs = [&](const Ival& sub_s) -> Ival {
        Ival out{1e300, -1e300};
        int NRS = static_cast<int>(enc.PA_q0.size());
        for (int m = 0; m < NRS; ++m) {
            if (enc.s_rs_pt_lo[m] > sub_s.hi) break;
            if (enc.s_rs_pt_hi[m + 1] < sub_s.lo) continue;
            double s_lo_eff = std::max(sub_s.lo, enc.s_rs_pt_lo[m]);
            double s_hi_eff = std::min(sub_s.hi, enc.s_rs_pt_hi[m + 1]);
            if (s_hi_eff < s_lo_eff) continue;
            Ival s_eff{s_lo_eff, s_hi_eff};
            double rs_mid_unused, rs_rad;
            param_mid_rad(enc.rs_edges[m], enc.rs_edges[m + 1], rs_mid_unused, rs_rad);
            (void)rs_mid_unused;
            Ival S_mid{enc.s_rs_mid_lo[m], enc.s_rs_mid_hi[m]};
            Ival ds_iv{enc.ds_rs_lo[m], enc.ds_rs_hi[m]};
            Ival e3_sub = (rs_rad > 0.0) ? ((s_eff - S_mid) / (ds_iv * Ival::pt(rs_rad))) : Ival{0.0, 0.0};
            e3_sub.lo = std::max(-1.0, e3_sub.lo);
            e3_sub.hi = std::min(1.0, e3_sub.hi);
            Quad1D q{
                is_B ? enc.PB_q0[m] : enc.PA_q0[m],
                is_B ? enc.PB_q1[m] : enc.PA_q1[m],
                is_B ? enc.PB_q2[m] : enc.PA_q2[m],
                is_B ? enc.PB_rad[m] : enc.PA_rad[m]
            };
            Ival piece = q.eval_sub(e3_sub) / (s_eff * ival_sqr(s_eff));
            out.lo = std::min(out.lo, piece.lo);
            out.hi = std::max(out.hi, piece.hi);
        }
        return out;
    };

    // Guaranteed start of the moving-vortex physical domain is s_rs_pt_hi.front() >= psi(0.035)
    // (line 1594 certifies s_rs_pt_hi.front() < s_cap_lo). Below s_rs_pt_hi.front(), only the origin enclosure applies!
    double s0_v = enc.s_rs_pt_hi.front();
    double s1_v = enc.s_cap_lo;
    if (s_iv.lo <= s0_v && (s_iv.lo < s0_v || s_iv.hi <= s0_v)) {
        merge(eval_origin_cap({s_iv.lo, std::min(s_iv.hi, s0_v)}));
    }
    if (s_iv.hi > s0_v && s_iv.lo <= s1_v) {
        Ival sub_ov{std::max(s_iv.lo, s0_v), std::min(s_iv.hi, s1_v)};
        Ival h_cap = eval_origin_cap(sub_ov);
        Ival h_vor = eval_vortex_slabs(sub_ov);
        Ival inter{std::max(h_cap.lo, h_vor.lo), std::min(h_cap.hi, h_vor.hi)};
        if (inter.lo > inter.hi) {
            std::fprintf(stderr, "FATAL: origin/vortex overlap mismatch on %s: cap=[%g,%g] vor=[%g,%g]\n",
                         enc.spec.tag.c_str(), h_cap.lo, h_cap.hi, h_vor.lo, h_vor.hi);
            std::exit(2);
        }
        merge(inter);
    }
    if (s_iv.hi > s1_v && s_iv.lo <= 8.0 && (s_iv.lo < 8.0 || s_iv.hi <= 8.0)) {
        merge(eval_vortex_slabs({std::max(s_iv.lo, s1_v), std::min(s_iv.hi, 8.0)}));
    }
    if (s_iv.hi > 8.0) {
        double a = std::max(s_iv.lo, 8.0);
        double eps_hi = div_up(1.0, a);
        double eps_lo = (s_iv.hi >= 1e150) ? 0.0 : div_dn(1.0, s_iv.hi);
        for (size_t m = 0; m + 1 < enc.eps_edges.size(); ++m) {
            double e0 = enc.eps_edges[m], e1 = enc.eps_edges[m + 1];
            if (e1 < eps_lo || e0 > eps_hi) continue;
            Ival sub_eps{std::max(eps_lo, e0), std::min(eps_hi, e1)};
            double emid, erad;
            param_mid_rad(e0, e1, emid, erad);
            Ival e3_sub = (erad > 0.0) ? ((sub_eps - Ival::pt(emid)) / Ival::pt(erad)) : Ival{0.0, 0.0};
            e3_sub.lo = std::max(-1.0, e3_sub.lo);
            e3_sub.hi = std::min(1.0, e3_sub.hi);
            double c0_e = is_B ? enc.PB_eps_c0[m] : enc.PA_eps_c0[m];
            double cs_e = is_B ? enc.PB_eps_cs[m] : enc.PA_eps_cs[m];
            double rd_e = is_B ? enc.PB_eps_rad[m] : enc.PA_eps_rad[m];
            Ival P_sub = Ival::pt(c0_e) + Ival::pt(cs_e) * e3_sub;
            P_sub = {sub_dn(P_sub.lo, rd_e), add_up(P_sub.hi, rd_e)};
            merge(P_sub * (sub_eps * ival_sqr(sub_eps)));
        }
    }
    if (!(res.lo <= res.hi && std::isfinite(res.lo) && std::isfinite(res.hi) && res.lo > -1e200 && res.hi < 1e200)) {
        std::fprintf(stderr, "FATAL: eval_hp_ival returned invalid/empty interval [%g, %g] on v=[%.17g, %.17g]\n",
                     res.lo, res.hi, v_iv.lo, v_iv.hi);
        std::exit(2);
    }
    return res;
}

// Evaluate h_X(v) = G_X(sqrt(v)) / sqrt(v) on ANY v-interval [va, vb] subset [0, inf)!
Ival eval_h_ival(const RowProfileEnclosure& enc, bool is_B, const Ival& v_iv) {
    Ival s_iv = ival_sqrt(v_iv);
    Ival res{1e300, -1e300};
    auto merge = [&](const Ival& piece) {
        res.lo = std::min(res.lo, piece.lo);
        res.hi = std::max(res.hi, piece.hi);
    };

    if (s_iv.lo <= enc.s1 && (s_iv.lo < enc.s1 || s_iv.hi <= enc.s1)) {
        merge(is_B ? enc.hB_zero_tube : enc.hA_zero_tube);
    }
    if (s_iv.hi > enc.s1 && s_iv.lo <= 8.0 && (s_iv.lo < 8.0 || s_iv.hi <= 8.0)) {
        double a = std::max(s_iv.lo, enc.s1);
        double b = std::min(s_iv.hi, 8.0);
        int m_start = static_cast<int>(std::lower_bound(enc.s_edges.begin(), enc.s_edges.end(), a) - enc.s_edges.begin()) - 1;
        m_start = std::max(0, std::min(m_start, static_cast<int>(enc.s_edges.size()) - 2));
        for (int m = m_start; m + 1 < static_cast<int>(enc.s_edges.size()); ++m) {
            double e0 = enc.s_edges[m], e1 = enc.s_edges[m + 1];
            if (e0 > b) break;
            if (e1 < a) continue;
            double sub_lo = std::max(a, e0), sub_hi = std::min(b, e1);
            if (sub_hi < sub_lo) continue;
            Ival sub_s{sub_lo, sub_hi};
            double smid, srad;
            param_mid_rad(e0, e1, smid, srad);
            Ival e3_sub = (srad > 0.0) ? ((sub_s - Ival::pt(smid)) / Ival::pt(srad)) : Ival{0.0, 0.0};
            e3_sub.lo = std::max(-1.0, e3_sub.lo);
            e3_sub.hi = std::min(1.0, e3_sub.hi);
            double c0 = is_B ? enc.GB_c0[m] : enc.GA_c0[m];
            double cs = is_B ? enc.GB_cs[m] : enc.GA_cs[m];
            double rd = is_B ? enc.GB_rad[m] : enc.GA_rad[m];
            Ival G_sub = Ival::pt(c0) + Ival::pt(cs) * e3_sub;
            G_sub = {sub_dn(G_sub.lo, rd), add_up(G_sub.hi, rd)};
            merge(G_sub / sub_s);
        }
    }
    if (s_iv.hi > 8.0) {
        double a = std::max(s_iv.lo, 8.0);
        double eps_hi = div_up(1.0, a);
        double eps_lo = (s_iv.hi >= 1e150) ? 0.0 : div_dn(1.0, s_iv.hi);
        for (size_t m = 0; m + 1 < enc.eps_edges.size(); ++m) {
            double e0 = enc.eps_edges[m], e1 = enc.eps_edges[m + 1];
            if (e1 < eps_lo || e0 > eps_hi) continue;
            double sub_elo = std::max(eps_lo, e0), sub_ehi = std::min(eps_hi, e1);
            Ival sub_eps{sub_elo, sub_ehi};
            double emid, erad;
            param_mid_rad(e0, e1, emid, erad);
            Ival e3_sub = (erad > 0.0) ? ((sub_eps - Ival::pt(emid)) / Ival::pt(erad)) : Ival{0.0, 0.0};
            e3_sub.lo = std::max(-1.0, e3_sub.lo);
            e3_sub.hi = std::min(1.0, e3_sub.hi);
            double c0 = is_B ? enc.GB_eps_c0[m] : enc.GA_eps_c0[m];
            double cs = is_B ? enc.GB_eps_cs[m] : enc.GA_eps_cs[m];
            double rd = is_B ? enc.GB_eps_rad[m] : enc.GA_eps_rad[m];
            Ival G_sub = Ival::pt(c0) + Ival::pt(cs) * e3_sub;
            G_sub = {sub_dn(G_sub.lo, rd), add_up(G_sub.hi, rd)};
            merge(G_sub * sub_eps);
        }
    }
    if (!(res.lo <= res.hi && std::isfinite(res.lo) && std::isfinite(res.hi) && res.lo > -1e200 && res.hi < 1e200)) {
        std::fprintf(stderr, "FATAL: eval_h_ival returned invalid/empty interval [%g, %g] on v=[%.17g, %.17g]\n",
                     res.lo, res.hi, v_iv.lo, v_iv.hi);
        std::exit(2);
    }
    return res;
}

// Precompute fast 1D Laplace-type integral table for k_X(v) = (e^{v/u}/u) int_v^inf h_X(w) e^{-w/u} dw
// at a fixed (row, sector, u)!
// Partition w in [0, W_MAX] (W_MAX = 64.0 + 40.0 * u) into fine panels [w_k, w_{k+1}] where h_X(w) in H_k:
// Then J_k := int_{w_k}^inf h_X(w) e^{-w/u} dw = sum_{j>=k} H_j * u * (e^{-w_j/u} - e^{-w_{j+1}/u})!
// Wait: multiplying by e^{v/u}/u directly via e^{-(w_j - v)/u} NEVER OVERFLOWS EVEN FOR LARGE v/u!!
// CHECK THAT!! k_X(v) = int_0^inf h_X(v + u tau) e^{-tau} dtau:
// On w_j >= v, tau_j = (w_j - v)/u >= 0, so e^{-tau_j} in [0, 1] NEVER OVERFLOWS FOR ANY v >= 0!!
// Division-free 1D backward contraction table for k_X'(v) = int_0^inf h_X'(v + u tau) e^{-tau} dtau on ALL v in [0, inf)!
struct FastKTable {
    const RowProfileEnclosure* enc;
    bool is_B;
    Ival u_iv;
    std::vector<Ival> KP_nodes;
    Ival G_inf_ival;
    Ival P_inf_ival;
};

FastKTable build_k_table(const RowProfileEnclosure& enc, bool is_B, const Ival& u_iv) {
    FastKTable kt;
    kt.enc = &enc;
    kt.is_B = is_B;
    kt.u_iv = u_iv;
    kt.G_inf_ival = is_B ? enc.GB_inf : enc.GA_inf;
    kt.P_inf_ival = is_B ? enc.PB_inf : enc.PA_inf;

    const auto& hp_pan = is_B ? enc.hpB_pan : enc.hpA_pan;
    int NW = static_cast<int>(hp_pan.size());
    kt.KP_nodes.resize(NW + 1, {0.0, 0.0});
    Ival e40 = ival_exp(Ival::pt(-40.0));
    Ival one_m_e40 = Ival::pt(1.0) - e40;
    double inv_rt_lo = div_dn(1.0, sqrt_up(add_up(256.0, mul_up(40.0, u_iv.hi))));
    double inv_rt3_lo = mul_dn(inv_rt_lo, mul_dn(inv_rt_lo, inv_rt_lo));
    double inv_rt3_hi = 1.0 / 4096.0; // 16^{-3}
    Ival kp_top = kt.P_inf_ival * Ival{inv_rt3_lo, inv_rt3_hi} * one_m_e40;
    double tail40 = mul_up(div_up(ival_abs(kt.P_inf_ival).hi, 4096.0), e40.hi);
    kt.KP_nodes[NW] = {sub_dn(kp_top.lo, tail40), add_up(kp_top.hi, tail40)};

    for (int j = NW - 1; j >= 0; --j) {
        Ival dw = Ival::pt(enc.w_edges[j + 1]) - Ival::pt(enc.w_edges[j]);
        Ival r_j = ival_exp(-(dw / u_iv));
        double r_lo = std::max(0.0, r_j.lo), r_hi = std::min(1.0, r_j.hi);
        const Ival& h = hp_pan[j];
        const Ival& K = kt.KP_nodes[j + 1];
        double kp_lo = (K.lo >= h.lo)
            ? add_dn(h.lo, mul_dn(r_lo, sub_dn(K.lo, h.lo)))
            : add_dn(K.lo, mul_dn(std::max(0.0, sub_dn(1.0, r_hi)), sub_dn(h.lo, K.lo)));
        double kp_hi = (K.hi >= h.hi)
            ? add_up(h.hi, mul_up(r_hi, sub_up(K.hi, h.hi)))
            : add_up(K.hi, mul_up(sub_up(1.0, r_lo), sub_up(h.hi, K.hi)));
        kt.KP_nodes[j] = {kp_lo, kp_hi};
    }
    return kt;
}

void eval_psi_g1_ival(const FastKTable& kt, const Ival& v_iv, Ival& psi_out, Ival& g1_out) {
    psi_out = {1e300, -1e300};
    g1_out  = {1e300, -1e300};
    auto merge_pg = [&](const Ival& p, const Ival& g) {
        psi_out.lo = std::min(psi_out.lo, p.lo); psi_out.hi = std::max(psi_out.hi, p.hi);
        g1_out.lo  = std::min(g1_out.lo,  g.lo); g1_out.hi  = std::max(g1_out.hi,  g.hi);
    };

    const auto& w_edges = kt.enc->w_edges;
    int NW = static_cast<int>(w_edges.size()) - 1;

    if (v_iv.lo <= 256.0 && (v_iv.lo < 256.0 || v_iv.hi <= 256.0)) {
        double a = std::max(0.0, v_iv.lo), b = std::min(v_iv.hi, 256.0);
        int idx0 = static_cast<int>(std::lower_bound(w_edges.begin(), w_edges.end(), a) - w_edges.begin()) - 1;
        idx0 = std::max(0, std::min(idx0, NW - 1));
        int idx1 = static_cast<int>(std::upper_bound(w_edges.begin(), w_edges.end(), b) - w_edges.begin()) - 1;
        idx1 = std::max(idx0, std::min(idx1, NW - 1));
        for (int j = idx0; j <= idx1; ++j) {
            double sub_lo = std::max(a, w_edges[j]);
            double sub_hi = std::min(b, w_edges[j + 1]);
            if (sub_hi < sub_lo) continue;
            Ival sub_v{sub_lo, sub_hi};
            Ival kp_iv = ival_join(kt.KP_nodes[j], kt.KP_nodes[j + 1]);
            merge_pg(sub_v * ival_sqr(kp_iv), sub_v * kp_iv);
        }
    }

    if (v_iv.hi > 256.0) {
        Ival sub_v{std::max(v_iv.lo, 256.0), v_iv.hi};
        Ival e40 = ival_exp(Ival::pt(-40.0));
        Ival one_m_e40 = Ival::pt(1.0) - e40;
        double c_tau_hi = mul_up(40.0, kt.u_iv.hi);
        double inv_rt_lo = (sub_v.hi >= 1e150) ? 0.0
            : mul_dn(div_dn(sub_v.lo, add_up(sub_v.lo, c_tau_hi)),
                     div_dn(1.0, sqrt_up(add_up(sub_v.hi, c_tau_hi))));
        double inv_rt_hi = div_up(1.0, sqrt_dn(sub_v.lo));
        double pmax = ival_abs(kt.P_inf_ival).hi;
        double psi_hi = div_up(mul_up(pmax, pmax), mul_dn(sub_v.lo, sub_v.lo));
        Ival g1_tail = kt.P_inf_ival * Ival{inv_rt_lo, inv_rt_hi} * one_m_e40;
        double g1_rem = mul_up(mul_up(pmax, inv_rt_hi), e40.hi);
        g1_tail = {sub_dn(g1_tail.lo, g1_rem), add_up(g1_tail.hi, g1_rem)};
        merge_pg({0.0, psi_hi}, g1_tail);
    }
    if (!(psi_out.lo <= psi_out.hi && g1_out.lo <= g1_out.hi &&
          std::isfinite(psi_out.lo) && std::isfinite(psi_out.hi) &&
          std::isfinite(g1_out.lo) && std::isfinite(g1_out.hi) &&
          psi_out.lo > -1e200 && psi_out.hi < 1e200 && g1_out.lo > -1e200 && g1_out.hi < 1e200)) {
        std::fprintf(stderr, "FATAL: eval_psi_g1_ival returned invalid/empty interval on v=[%.17g, %.17g]\n",
                     v_iv.lo, v_iv.hi);
        std::exit(2);
    }
}

void verify_row_seam_and_vortex_join_controls(const RowProfileEnclosure& enc) {
    std::fesetround(FE_UPWARD);
    FastKTable ktA = build_k_table(enc, false, {1e-3, 2e-3});
    FastKTable ktB = build_k_table(enc, true, {1e-3, 2e-3});

    auto check_singleton_v = [&](double v) {
        Ival viv{v, v};
        for (bool is_B : {false, true}) {
            Ival hp = eval_hp_ival(enc, is_B, viv);
            Ival h  = eval_h_ival(enc, is_B, viv);
            if (!(hp.lo <= hp.hi && h.lo <= h.hi && hp.lo > -1e100 && hp.hi < 1e100 && h.lo > -1e100 && h.hi < 1e100)) {
                std::fprintf(stderr, "FATAL: singleton seam test failed on row %s at v=%.17g\n", enc.spec.tag.c_str(), v);
                std::exit(2);
            }
        }
        Ival pa, ga, pb, gb;
        eval_psi_g1_ival(ktA, viv, pa, ga);
        eval_psi_g1_ival(ktB, viv, pb, gb);
        if (!(pa.lo <= pa.hi && ga.lo <= ga.hi && pb.lo <= pb.hi && gb.lo <= gb.hi &&
              pa.hi < 1e100 && pb.hi < 1e100 && std::fabs(ga.hi) < 1e100 && std::fabs(gb.hi) < 1e100)) {
            std::fprintf(stderr, "FATAL: eval_psi_g1_ival singleton seam test failed on row %s at v=%.17g\n",
                         enc.spec.tag.c_str(), v);
            std::exit(2);
        }
    };

    // Test v = 0, every dyadic s_edges[m]^2 (including s1^2, all internal mesh joins, and v = 64),
    // key w_edges joins (including v = 256), and exterior v = 512:
    check_singleton_v(0.0);
    for (double se : enc.s_edges) {
        check_singleton_v(se * se); // exact binary64 square since se is an integer multiple of 2^{-16} <= 8
    }
    check_singleton_v(64.0);
    check_singleton_v(256.0);
    check_singleton_v(512.0);
    if (!enc.w_edges.empty()) {
        check_singleton_v(enc.w_edges[1]);
        check_singleton_v(enc.w_edges[enc.w_edges.size() / 2]);
        check_singleton_v(enc.w_edges.back());
    }

    // Point control strictly between s_rs_pt_lo.front() and true psi(0.035) (< s_rs_pt_hi.front()):
    // Verify that on row 0.865 at s_probe = 0.021522191494256774 (where s_rs_pt_lo.front() < s_probe < psi(0.035)),
    // eval_hp_ival uses ONLY the origin enclosure (never intersecting with an out-of-domain vortex slab)!
    if (enc.spec.tag == "0.865") {
        const double s_probe = 0.021522191494256774;
        const Ival v_probe{mul_dn(s_probe, s_probe), mul_up(s_probe, s_probe)};
        const Ival s_chk = ival_sqrt(v_probe);
        if (!(enc.s_rs_pt_lo.front() < s_chk.lo && s_chk.hi < 0.021522191494256780 &&
              0.021522191494256780 < enc.s_rs_pt_hi.front())) {
            std::fprintf(stderr, "FATAL: row 0.865 vortex-join probe [%.20g, %.20g] outside (s_lo=%.20g, psi~...7816, s_hi=%.20g)\n",
                         s_chk.lo, s_chk.hi, enc.s_rs_pt_lo.front(), enc.s_rs_pt_hi.front());
            std::exit(2);
        }
        for (bool is_B : {false, true}) {
            Ival hp_got = eval_hp_ival(enc, is_B, v_probe);
            Ival hp_ori = eval_hp_origin_only_ival(enc, is_B, v_probe);
            if (!(hp_got.lo == hp_ori.lo && hp_got.hi == hp_ori.hi)) {
                std::fprintf(stderr, "FATAL: row 0.865 probe below psi(0.035) did not use pure origin enclosure!\n");
                std::exit(2);
            }
            Ival hp_pt_got = eval_hp_ival(enc, is_B, {v_probe.lo, v_probe.lo});
            Ival hp_pt_ori = eval_hp_origin_only_ival(enc, is_B, {v_probe.lo, v_probe.lo});
            if (!(hp_pt_got.lo == hp_pt_ori.lo && hp_pt_got.hi == hp_pt_ori.hi)) {
                std::fprintf(stderr, "FATAL: row 0.865 singleton probe below psi(0.035) did not use pure origin enclosure!\n");
                std::exit(2);
            }
        }
    }
}

std::vector<RowSpec> get_all_15_rows() {
    // 14 Case I rows (exact rational tilt 2/5, 3/20) from P1 §1.1 / rows_all.lines + own-row 0.70 (tilt 2/5, 3/10)!
    return {
        {"0.700_own", 0.6245096553001263, 0.07904908421224786, -0.03518753810410364, -0.02017063635664792, 0.0036971895674154077, 2, 5, 3, 10},
        {"0.740", 0.6781275617095309, 0.09539327050603977, -0.03937313202352518, -0.022174245012128353, 0.005245866309529529, 2, 5, 3, 20},
        {"0.760", 0.7066343985897735, 0.10431377279347073, -0.041548253781079215, -0.023197930806220953, 0.006172649707780391, 2, 5, 3, 20},
        {"0.780", 0.7363510124950496, 0.11373939453568198, -0.04377920822595397, -0.024235746896916818, 0.007209291146524148, 2, 5, 3, 20},
        {"0.790", 0.7516941249996238, 0.1186447826270958, -0.04491892457253125, -0.024761704512558748, 0.007771064402320817, 2, 5, 3, 20},
        {"0.800", 0.7673768889125988, 0.12367717725246688, -0.046082257981661004, -0.02529487327562145, 0.008364651085775717, 2, 5, 3, 20},
        {"0.810", 0.783392836934038, 0.12884448465913795, -0.04725552388339392, -0.02583202245238701, 0.008988977623549207, 2, 5, 3, 20},
        {"0.820", 0.7997734630974279, 0.13414383378358785, -0.048451815387690556, -0.026377577658754977, 0.009646421658694632, 2, 5, 3, 20},
        {"0.830", 0.8165376104297967, 0.1395777827978554, -0.0496759046433095, -0.02693100916457022, 0.010338438615358537, 2, 5, 3, 20},
        {"0.840", 0.8336645769796259, 0.1451519411882082, -0.050913306939498776, -0.027495117153251914, 0.011064787509303698, 2, 5, 3, 20},
        {"0.845", 0.842392772582138, 0.14799004056880435, -0.05154996067972087, -0.02777932673325344, 0.01144329376046891, 2, 5, 3, 20},
        {"0.850", 0.8512127524942481, 0.15086558015734544, -0.05218273153479364, -0.028067485693355317, 0.011830334695139898, 2, 5, 3, 20},
        {"0.855", 0.8601447482675636, 0.15377540703893833, -0.052838171869459966, -0.028359822411707876, 0.012228120747279888, 2, 5, 3, 20},
        {"0.860", 0.8691800227081347, 0.15672367813654822, -0.0534880791349209, -0.028652156319431955, 0.012635130402384913, 2, 5, 3, 20},
        {"0.865", 0.8783259514041781, 0.1597092307190024, -0.05414284751003532, -0.028951745258042246, 0.013052163374299502, 2, 5, 3, 20}
    };
}

void self_test_fpu() {
    std::fesetround(FE_UPWARD);
    if (std::fegetround() != FE_UPWARD) {
        std::fprintf(stderr, "FATAL: FE_UPWARD rounding mode not active!\n");
        std::exit(2);
    }
    if (!(add_up(1.0, 1e-300) > 1.0) || !(add_dn(1.0, -1e-300) < 1.0)) {
        std::fprintf(stderr, "FATAL: directed rounding self-test failed!\n");
        std::exit(2);
    }
    Ival e1 = ival_exp(Ival::pt(1.0));
    if (!(e1.lo < 2.7182818284590452354 && e1.hi > 2.7182818284590452354 && e1.width() < 1e-12)) {
        std::fprintf(stderr, "FATAL: ival_exp(1) self-test failed: [%.17g, %.17g]\n", e1.lo, e1.hi);
        std::exit(2);
    }
    Ival s6, c6;
    ival_sincos_0_pi(PI_IVAL / Ival::pt(6.0), s6, c6);
    if (!(s6.lo <= 0.5 && s6.hi >= 0.5 && s6.width() < 1e-13)) {
        std::fprintf(stderr, "FATAL: ival_sincos(pi/6) self-test failed: [%.17g, %.17g]\n", s6.lo, s6.hi);
        std::exit(2);
    }
    // Live regression test for rounded-midpoint Taylor radius on f(r) = (r - m)^2:
    {
        Ival v_ulp{1.0, std::nextafter(1.0, 2.0)};
        double m_ulp = v_ulp.mid();
        Ival b_ulp = make_rad_1d(v_ulp, {0.0, 0.0}, {0.0, 0.0}, 2.0).bounds();
        double exact_end = mul_dn(sub_dn(m_ulp, v_ulp.lo), sub_dn(m_ulp, v_ulp.lo)); // 0x1p-104
        if (!(b_ulp.lo <= 0.0 && b_ulp.hi >= exact_end && exact_end >= std::ldexp(1.0, -104))) {
            std::fprintf(stderr, "FATAL: make_rad_1d 1-ULP quadratic enclosure failed: hi=%a < %a!\n", b_ulp.hi, exact_end);
            std::exit(2);
        }
        for (int n_pan : {96, 112}) {
            double p_exp = (n_pan == 112) ? 1.5 : 2.1;
            double prev = 0.0;
            for (int i = 1; i <= n_pan; ++i) {
                double cur = (i == n_pan) ? 7.0 : (7.0 * std::pow(static_cast<double>(i) / n_pan, p_exp));
                Ival vp{prev, cur};
                double mp = vp.mid();
                Ival bp = make_rad_1d(vp, {0.0, 0.0}, {0.0, 0.0}, 2.0).bounds();
                double dl = sub_up(mp, vp.lo), dr = sub_up(vp.hi, mp);
                double fl = mul_up(dl, dl), fr = mul_up(dr, dr);
                if (!(bp.lo <= 0.0 && bp.hi >= std::max(fl, fr))) {
                    std::fprintf(stderr, "FATAL: make_rad_1d panel %d/%d quadratic enclosure failed!\n", i, n_pan);
                    std::exit(2);
                }
                prev = cur;
            }
        }
    }
    // Live regression test for mixed-sign inexact-sum magnitude under FE_UPWARD + FIPS 180-4 SHA-256 vectors:
    {
        double ar = -0.09668002, br = 0.02559663;
        double bad_abs = std::fabs(add_up(ar, br));
        double good_abs = ival_abs(Ival::pt(ar) + Ival::pt(br)).hi;
        if (!(good_abs > bad_abs && good_abs >= -add_dn(ar, br))) {
            std::fprintf(stderr, "FATAL: mixed-sign ival_abs self-test failed: good=%a bad=%a!\n", good_abs, bad_abs);
            std::exit(2);
        }
        const uint8_t abc[3] = {'a', 'b', 'c'};
        if (sha256_bytes_hex(nullptr, 0) != "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" ||
            sha256_bytes_hex(abc, 3) != "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad") {
            std::fprintf(stderr, "FATAL: SHA-256 self-test failed!\n");
            std::exit(2);
        }
    }
}

// Negative Control 1 (P1 §6): At u = 1e-6, certify on the 1D Wick junta q_u(X) = sqrt(u) X(|X|^2 - 2)/sqrt(2)
// that (R1) holds strictly for ALL lambda > 0 (min_{lambda > 0} [E rho(lambda^2 V) - lambda u / e1] > 0.880 > t_lo
// on all 17 pieces!) AND r_{h_A}(q_u) > 3.60 on row 0.865 and row 0.800 (rejecting one constant across all energies!).
struct JuntaLowUResult {
    std::string row_tag;
    Ival u_iv;
    Ival c_sq_over_delta;
    Ival omega_hat;
    Ival ratio;
    double r1_min_lb;
};

JuntaLowUResult certify_junta_low_u(const RowProfileEnclosure& enc, const Ival& u_iv) {
    std::fesetround(FE_UPWARD);
    const Ival inv_sqrt2 = Ival::pt(1.0) / ival_sqrt(Ival::pt(2.0));
    const Ival sqrt2_iv = ival_sqrt(Ival::pt(2.0));
    const auto& w_edges = enc.w_edges;
    int NW = static_cast<int>(w_edges.size()) - 1;
    Ival hA0 = eval_h_ival(enc, false, {0.0, 0.0});
    const double m0 = enc.hpA_pan[0].mid();
    const Ival m0_iv = Ival::pt(m0);

    // Center both h_A'(w) - m0 and k_A'(v) - m0 around m0 = midpoint(h_A'(0)) so m0^2 cancels cleanly!
    double hp_abs_max = div_up(ival_abs(enc.PA_inf).hi, 4096.0);
    std::vector<Ival> dh_rem_nodes(NW + 1, {0.0, 0.0});
    for (int j = 0; j < NW; ++j) {
        Ival w_iv{w_edges[j], w_edges[j + 1]};
        dh_rem_nodes[j + 1] = dh_rem_nodes[j] + w_iv.len_ival() * (enc.hpA_pan[j] - m0_iv);
        hp_abs_max = std::max(hp_abs_max, ival_abs(enc.hpA_pan[j]).hi);
    }
    const double dkp_abs_max = add_up(hp_abs_max, std::fabs(m0));

    std::vector<Ival> DKP_nodes(NW + 1, {0.0, 0.0});
    {
        Ival e40 = ival_exp(Ival::pt(-40.0));
        Ival one_m_e40 = Ival::pt(1.0) - e40;
        double inv_rt_hi = div_dn(1.0, sqrt_up(add_up(256.0, mul_up(40.0, u_iv.hi))));
        double inv_rt3_lo = mul_dn(inv_rt_hi, mul_dn(inv_rt_hi, inv_rt_hi));
        Ival kp_top = enc.PA_inf * Ival{inv_rt3_lo, 1.0 / 4096.0} * one_m_e40;
        double tail40 = mul_up(div_up(ival_abs(enc.PA_inf).hi, 4096.0), e40.hi);
        DKP_nodes[NW] = Ival{sub_dn(kp_top.lo, tail40), add_up(kp_top.hi, tail40)} - m0_iv;
        for (int j = NW - 1; j >= 0; --j) {
            Ival dw = Ival::pt(w_edges[j + 1]) - Ival::pt(w_edges[j]);
            Ival r_j = ival_exp(-(dw / u_iv));
            double r_lo = std::max(0.0, r_j.lo), r_hi = std::min(1.0, r_j.hi);
            Ival h = enc.hpA_pan[j] - m0_iv;
            const Ival& K = DKP_nodes[j + 1];
            double dkp_lo = (K.lo >= h.lo)
                ? add_dn(h.lo, mul_dn(r_lo, sub_dn(K.lo, h.lo)))
                : add_dn(K.lo, mul_dn(std::max(0.0, sub_dn(1.0, r_hi)), sub_dn(h.lo, K.lo)));
            double dkp_hi = (K.hi >= h.hi)
                ? add_up(h.hi, mul_up(r_hi, sub_up(K.hi, h.hi)))
                : add_up(K.hi, mul_up(sub_up(1.0, r_lo), sub_up(h.hi, K.hi)));
            DKP_nodes[j] = {dkp_lo, dkp_hi};
        }
    }

    auto eval_dhA_rem = [&](const Ival& v_iv) -> Ival {
        if (v_iv.hi <= w_edges[1]) {
            return v_iv * (eval_hp_ival(enc, false, {0.0, v_iv.hi}) - m0_iv);
        }
        if (v_iv.lo >= 256.0) {
            return eval_h_ival(enc, false, v_iv) - hA0 - m0_iv * v_iv;
        }
        Ival out{1e300, -1e300};
        double a = std::max(0.0, v_iv.lo), b = std::min(v_iv.hi, 256.0);
        int j0 = static_cast<int>(std::lower_bound(w_edges.begin(), w_edges.end(), a) - w_edges.begin()) - 1;
        j0 = std::max(0, std::min(j0, NW - 1));
        int j1 = static_cast<int>(std::upper_bound(w_edges.begin(), w_edges.end(), b) - w_edges.begin()) - 1;
        j1 = std::max(j0, std::min(j1, NW - 1));
        for (int j = j0; j <= j1; ++j) {
            Ival dv{std::max(0.0, sub_dn(std::max(a, w_edges[j]), w_edges[j])),
                    std::max(0.0, sub_up(std::min(b, w_edges[j + 1]), w_edges[j]))};
            Ival p = dh_rem_nodes[j] + dv * (enc.hpA_pan[j] - m0_iv);
            out = ival_join(out, p);
        }
        if (v_iv.hi > 256.0) {
            Ival vt{256.0, v_iv.hi};
            out = ival_join(out, eval_h_ival(enc, false, vt) - hA0 - m0_iv * vt);
        }
        return out;
    };

    auto eval_dkp = [&](const Ival& v_iv) -> Ival {
        Ival out{1e300, -1e300};
        if (v_iv.lo <= 256.0 && (v_iv.lo < 256.0 || v_iv.hi <= 256.0)) {
            double a = std::max(0.0, v_iv.lo), b = std::min(v_iv.hi, 256.0);
            int j0 = static_cast<int>(std::lower_bound(w_edges.begin(), w_edges.end(), a) - w_edges.begin()) - 1;
            j0 = std::max(0, std::min(j0, NW - 1));
            int j1 = static_cast<int>(std::upper_bound(w_edges.begin(), w_edges.end(), b) - w_edges.begin()) - 1;
            j1 = std::max(j0, std::min(j1, NW - 1));
            for (int j = j0; j <= j1; ++j) {
                out = ival_join(out, ival_join(DKP_nodes[j], DKP_nodes[j + 1]));
            }
        }
        if (v_iv.hi > 256.0) {
            double bnd = div_up(ival_abs(enc.PA_inf).hi, 4096.0);
            out = ival_join(out, Ival{-bnd, bnd} - m0_iv);
        }
        return out;
    };

    // Integrate over T = |X|^2 in [0, 56] using exact Gaussian Wick identities:
    //   int_0^inf e^{-T} p(T) dT = 1,  int_0^inf e^{-T} (T(T-2)/sqrt(2)) p(T) dT = 8 sqrt(2).
    const int NPAN = 32768;
    std::vector<double> t_junta_ed(NPAN + 1);
    t_junta_ed[0] = 0.0; t_junta_ed[NPAN] = 56.0;
    for (int i = 1; i < NPAN; ++i) t_junta_ed[i] = 56.0 * std::pow(static_cast<double>(i) / NPAN, 1.5);
    Ival c_rem_int{0.0, 0.0}, D1_int{0.0, 0.0}, D2_int{0.0, 0.0}, sqrt_p_int{0.0, 0.0};
    for (int i = 0; i < NPAN; ++i) {
        double ta = t_junta_ed[i], tb = t_junta_ed[i + 1];
        auto do_sub = [&](double a, double b) {
            if (b <= a) return;
            Ival T{a, b};
            Ival wt = ival_exp(-Ival::pt(a)) - ival_exp(-Ival::pt(b));
            Ival Tm2 = T - Ival::pt(2.0);
            Ival pT = Ival::pt(0.5) * T * ival_sqr(Tm2);
            Ival V = u_iv * pT;
            Ival dh_rem = eval_dhA_rem(V);
            Ival dkp = eval_dkp(V);
            c_rem_int = c_rem_int + wt * (T * Tm2 * inv_sqrt2) * dh_rem;
            D1_int = D1_int + wt * V * dkp;
            D2_int = D2_int + wt * V * ival_sqr(dkp);
            sqrt_p_int = sqrt_p_int + wt * ival_sqrt(pT);
        };
        if (ta < 2.0 && tb > 2.0) {
            do_sub(ta, 2.0);
            do_sub(2.0, tb);
        } else {
            do_sub(ta, tb);
        }
    }
    // Quantitative T >= 56 Gaussian Gamma-moment tails in Ival (int_{56}^inf T^5 e^{-T} dT < 2 * 56^5 * e^{-56}):
    const double e56_hi = ival_exp(Ival::pt(-56.0)).hi;
    const double mom5_56 = mul_up(2.0, mul_up(56.0 * 56.0 * 56.0 * 56.0 * 56.0, e56_hi));
    const double tail_c  = mul_up(dkp_abs_max, mul_up(u_iv.hi, mom5_56));
    const double tail_d1 = mul_up(dkp_abs_max, mul_up(u_iv.hi, mom5_56));
    const double tail_d2 = mul_up(mul_up(dkp_abs_max, dkp_abs_max), mul_up(u_iv.hi, mom5_56));
    const double tail_sp = mul_up(56.0 * 56.0 + 114.0, e56_hi);
    c_rem_int = {sub_dn(c_rem_int.lo, tail_c), add_up(c_rem_int.hi, tail_c)};
    D1_int = {sub_dn(D1_int.lo, tail_d1), add_up(D1_int.hi, tail_d1)};
    D2_int = {std::max(0.0, sub_dn(D2_int.lo, tail_d2)), add_up(D2_int.hi, tail_d2)};
    sqrt_p_int.hi = add_up(sqrt_p_int.hi, tail_sp);

    Ival c_int = Ival::pt(8.0) * sqrt2_iv * m0_iv * u_iv + c_rem_int;
    Ival c_sq_del = ival_sqr(c_int) / (Ival::pt(42.0) * u_iv);
    Ival om = Ival::pt(0.75) * ival_sqr(m0_iv) * u_iv
            + Ival::pt(1.5) * m0_iv * D1_int
            + Ival::pt(1.5) * D2_int
            - (Ival::pt(0.75) * ival_sqr(D1_int)) / u_iv;
    Ival rat = c_sq_del / om;

    const Ival eps1_iv = Ival::pt(39.0) / Ival::pt(50.0);
    Ival half_rt_pi = Ival::pt(0.5) * ival_sqrt(PI_IVAL);
    double L0 = div_dn(half_rt_pi.lo, std::max(1.0e-12, mul_up(sqrt_up(u_iv.hi), sqrt_p_int.hi)));
    Ival slope_iv = ival_sqrt(u_iv) * Ival::pt(sqrt_p_int.lo) - u_iv / eps1_iv;
    Ival lb1_iv = Ival::pt(half_rt_pi.lo) - (Ival::pt(L0) * u_iv) / eps1_iv;
    double lb2 = (slope_iv.lo > 0.0) ? mul_dn(L0, slope_iv.lo) : -1e9;
    return {enc.spec.tag, u_iv, c_sq_del, om, rat, std::min(lb1_iv.lo, lb2)};
}

// Dump all 15 row precomputed enclosures to JSON for generate_certificates.py
void dump_rows_json(const std::vector<RowProfileEnclosure>& rows, const std::string& out_path) {
    std::ofstream out(out_path);
    out << std::setprecision(17);
    out << "{\n  \"rows\": [\n";
    for (size_t idx = 0; idx < rows.size(); ++idx) {
        const auto& r = rows[idx];
        out << "    {\n      \"tag\": \"" << r.spec.tag << "\",\n";
        auto write_vec = [&](const char* name, const std::vector<double>& v, bool comma) {
            out << "      \"" << name << "\": [";
            for (size_t i = 0; i < v.size(); ++i) out << (i ? "," : "") << v[i];
            out << "]" << (comma ? "," : "") << "\n";
        };
        auto write_ivec = [&](const char* name_lo, const char* name_hi, const std::vector<Ival>& v, bool comma) {
            out << "      \"" << name_lo << "\": [";
            for (size_t i = 0; i < v.size(); ++i) out << (i ? "," : "") << v[i].lo;
            out << "],\n      \"" << name_hi << "\": [";
            for (size_t i = 0; i < v.size(); ++i) out << (i ? "," : "") << v[i].hi;
            out << "]" << (comma ? "," : "") << "\n";
        };
        write_vec("w_edges", r.w_edges, true);
        write_ivec("hpA_lo", "hpA_hi", r.hpA_pan, true);
        write_ivec("hpB_lo", "hpB_hi", r.hpB_pan, true);
        out << "      \"GA_inf\": [" << r.GA_inf.lo << ", " << r.GA_inf.hi << "],\n";
        out << "      \"GB_inf\": [" << r.GB_inf.lo << ", " << r.GB_inf.hi << "],\n";
        out << "      \"PA_inf\": [" << r.PA_inf.lo << ", " << r.PA_inf.hi << "],\n";
        out << "      \"PB_inf\": [" << r.PB_inf.lo << ", " << r.PB_inf.hi << "]\n";
        out << "    }" << (idx + 1 < rows.size() ? "," : "") << "\n";
    }
    out << "  ]\n}\n";
}

// ==================== PART 2: CONTINUOUS-U DUAL CERTIFICATE VERIFIER ====================
// Simple line-oriented text format for dual_certs.txt (faster and zero fragile JSON-parser boilerplate in C++!):
// Wait: dual_certs.json can also be read by verify.py, OR generate_certificates.py writes dual_certs.json
// AND dual_certs.dat (plain ASCII numbers, 100% human-readable, parsed by std::ifstream >> in 30 lines of C++!),
// with verify.py checking exact SHA-256 / numerical equality between dual_certs.json and dual_certs.dat!
// WAIT: even simpler — verify.py --replay-cpp passes dual_certs.dat generated from dual_certs.json on the fly
// (so we don't even have to commit two files — ONLY dual_certs.json is committed in git!!)!

struct SliceCert {
    double a_r, b_r;
    double beta, gamma, lamK;
    std::vector<double> xs; // length M_knots
    double yeq0, yeq1, yeq2, yeq3;
    std::vector<double> w_stein; // length K_rat
    double mu_u2_lo, mu_u2_hi, mu_u3;
    double nu_plus, nu_minus;
    double mu_sx_sep, mu_sr_sep;
    double mu_rad;
    std::vector<double> eta_gram; // length K_gram
    std::vector<double> mu_rice;  // length K_rice
    double eta_sl_lo, eta_sl_hi;
};

struct CellCert {
    int piece_idx;
    int u_idx;
    std::string row_tag;
    std::string kind; // "JM1_BOUND" or "INFEAS_R1"
    double u_lo, u_hi, t_lo, chi_lo, chi_hi;
    double theta_allow; // <= 0 if benchmark only or infeas
    double F_claimed;
    // For INFEAS_R1: 1 slice with F_claimed=0, beta=gamma=lamK=0, proving 1 <= 0!
    std::vector<SliceCert> slicesA;
    std::vector<SliceCert> slicesB;
};

struct GlobalDualConfig {
    std::vector<double> t_knots;   // 0 = t_0 < t_1 < ... < t_M
    double eps_K;
    std::vector<double> c_rat;     // rational Stein poles
    std::vector<double> s_gram;    // coupled Gram parameters >= 2
    std::vector<double> rho_a;     // piecewise-linear concave upper bound on rho(x): min_k (rho_a[k] + rho_b[k]*x)
    std::vector<double> rho_b;
    std::vector<double> lams_rice; // Rice lambda parameters
    std::vector<CellCert> cells;
};

GlobalDualConfig load_dual_stream(std::istream& in) {
    GlobalDualConfig cfg;
    auto read_dvec = [&](std::vector<double>& v) {
        size_t n = 0; in >> n; v.resize(n);
        for (size_t i = 0; i < n; ++i) in >> v[i];
    };
    read_dvec(cfg.t_knots);
    in >> cfg.eps_K;
    read_dvec(cfg.c_rat);
    read_dvec(cfg.s_gram);
    read_dvec(cfg.rho_a);
    read_dvec(cfg.rho_b);
    read_dvec(cfg.lams_rice);
    size_t ncells = 0; in >> ncells;
    cfg.cells.resize(ncells);
    auto read_slices = [&](std::vector<SliceCert>& sls) {
        size_t ns = 0; in >> ns; sls.resize(ns);
        for (size_t s = 0; s < ns; ++s) {
            auto& sc = sls[s];
            in >> sc.a_r >> sc.b_r >> sc.beta >> sc.gamma >> sc.lamK;
            read_dvec(sc.xs);
            in >> sc.yeq0 >> sc.yeq1 >> sc.yeq2 >> sc.yeq3;
            read_dvec(sc.w_stein);
            in >> sc.mu_u2_lo >> sc.mu_u2_hi >> sc.mu_u3;
            in >> sc.nu_plus >> sc.nu_minus >> sc.mu_sx_sep >> sc.mu_sr_sep >> sc.mu_rad;
            read_dvec(sc.eta_gram);
            read_dvec(sc.mu_rice);
            in >> sc.eta_sl_lo >> sc.eta_sl_hi;
        }
    };
    for (size_t i = 0; i < ncells; ++i) {
        auto& c = cfg.cells[i];
        in >> c.piece_idx >> c.u_idx >> c.row_tag >> c.kind >> c.u_lo >> c.u_hi >> c.t_lo >> c.chi_lo >> c.chi_hi >> c.theta_allow >> c.F_claimed;
        read_slices(c.slicesA);
        read_slices(c.slicesB);
    }
    return cfg;
}

// Outward-rounded M_{Lambda(chi_hi)}(c1, c2) = max_{(d1,d2) in [0,2u]x[0,u], d1^2+d2^2 <= (chi_hi/2) u^2} (c1 d1 + c2 d2)
Ival eval_M_lambda_ival(const Ival& c1, const Ival& c2, const Ival& u_iv_in, double chi_hi) {
    Ival a1 = ival_max(Ival::pt(0.0), c1);
    Ival a2 = ival_max(Ival::pt(0.0), c2);
    if (a1.hi <= 0.0 && a2.hi <= 0.0) return {0.0, 0.0};
    Ival u_iv = Ival::pt(u_iv_in.hi);
    // Note: since M_{Lambda}(a1, a2) is monotone increasing in a1 >= 0 and a2 >= 0, we only need its UPPER bound at (a1.hi, a2.hi)
    // and LOWER bound at (a1.lo, a2.lo)!
    auto eval_pt_up = [&](double x1, double x2) -> double {
        if (x1 <= 0.0 && x2 <= 0.0) return 0.0;
        Ival X1 = Ival::pt(x1), X2 = Ival::pt(x2);
        Ival R2 = Ival::pt(0.5) * Ival::pt(chi_hi) * ival_sqr(u_iv);
        Ival R  = ival_sqrt(R2);
        Ival box_top = Ival::pt(2.0) * u_iv * X1 + u_iv * X2;
        if (chi_hi >= 10.0) return box_top.hi;
        Ival nrm = ival_sqrt(ival_sqr(X1) + ival_sqr(X2));
        Ival disk_top = R * nrm;
        if (chi_hi <= 2.0) return std::min(box_top.hi, disk_top.hi);
        // Check if unconstrained disk maximizer R*(X1, X2)/nrm violates d1 <= 2u or d2 <= u:
        // By convexity duality, M_{Lambda} <= min(box_top, disk_top), AND if R*X1 >= 2u*nrm (and chi_hi > 8),
        // exact value is 2u*X1 + X2*sqrt(R^2 - 4u^2); if R*X2 >= u*nrm, exact value is X1*min(2u, sqrt(R^2 - u^2)) + u*X2!
        // Notice: EVERY dual upper bound in {box_top, disk_top} is ALWAYS >= M_{Lambda}!
        // And to match when clamped to d2 = u (2 < chi_hi < 10 and X2/nrm > u/R):
        // Use Cauchy-Schwarz decomposition X2 = (X2 - q2) + q2 with q2 = (u / sqrt(R^2 - u^2)) * X1 (if R > u)!
        double best_up = std::min(box_top.hi, disk_top.hi);
        if (chi_hi > 2.0) {
            Ival d1_cap = ival_min(Ival::pt(2.0) * u_iv, ival_sqrt(ival_max(Ival::pt(0.0), R2 - ival_sqr(u_iv))));
            // Decompose (X1, X2) = (0, p2) + (X1, X2 - p2) for p2 >= 0!
            double r_u = sqrt_dn(std::max(0.0, 0.5 * chi_hi - 1.0));
            if (r_u > 0.0) {
                double q2 = x1 / r_u;
                if (x2 > q2) {
                    Ival p2 = Ival::pt(x2) - Ival::pt(q2);
                    Ival q2_iv = Ival::pt(x2) - p2;
                    Ival split1 = u_iv * p2 + R * ival_sqrt(ival_sqr(X1) + ival_sqr(q2_iv));
                    best_up = std::min(best_up, split1.hi);
                }
            }
            if (chi_hi > 8.0) {
                double r_2u = sqrt_dn(std::max(0.0, 0.5 * chi_hi - 4.0));
                if (r_2u > 0.0) {
                    double q1 = 2.0 * x2 / r_2u;
                    if (x1 > q1) {
                        Ival p1 = Ival::pt(x1) - Ival::pt(q1);
                        Ival q1_iv = Ival::pt(x1) - p1;
                        Ival split2 = Ival::pt(2.0) * u_iv * p1 + R * ival_sqrt(ival_sqr(q1_iv) + ival_sqr(X2));
                        best_up = std::min(best_up, split2.hi);
                    }
                }
            }
            (void)d1_cap;
        }
        return best_up;
    };
    return {0.0, eval_pt_up(a1.hi, a2.hi)};
}

// Outward-rounded Psi_K(A, B; lam_S, mu_S) = sup_{1+v >= 0, |r| <= 1+v} (-2 A v - 2 B r - lam_S v^2 - mu_S r^2)
// Notice Psi_K(A, B) is a supremum of affine functions of (A, B), hence CONVEX in (A, B)!
// On a rectangle [A.lo, A.hi] x [B.lo, B.hi], a convex function of 2 variables attains its MAXIMUM at one of the 4 CORNERS!!
inline double eval_psi_K_rect_hi(const Ival& A_iv, const Ival& B_iv, double lam_S, double mu_S) {
    auto corner_hi = [&](double a, double b) -> double {
        Ival A = Ival::pt(a), B = Ival::pt(std::fabs(b));
        Ival L = Ival::pt(lam_S), M = Ival::pt(mu_S);
        // Remember BOTH branches are C^1-matched; more simply, evaluate:
        // if mu_S * (lam_S - a) >= lam_S * |b|: A^2/L + B^2/M, else 2A - L + (L - A + |B|)_+^2 / (L + M).
        // Because a, b, lam_S, mu_S are exact IEEE doubles at the corner, enclose the branch test safely:
        Ival lhs = M * (L - A);
        Ival rhs = L * B;
        double v_top = (ival_sqr(A) / L + ival_sqr(B) / M).hi;
        Ival pos = ival_max(Ival::pt(0.0), L - A + B);
        double v_bot = (Ival::pt(2.0) * A - L + ival_sqr(pos) / (L + M)).hi;
        if (lhs.lo >= rhs.hi) return v_top;
        if (lhs.hi <= rhs.lo) return v_bot;
        return std::max(v_top, v_bot);
    };
    double c1 = corner_hi(A_iv.lo, B_iv.lo);
    double c2 = corner_hi(A_iv.lo, B_iv.hi);
    double c3 = corner_hi(A_iv.hi, B_iv.lo);
    double c4 = corner_hi(A_iv.hi, B_iv.hi);
    return std::max({c1, c2, c3, c4});
}

// Verify ONE SliceCert across ALL U in [0, inf) (adaptive interval subdivision on [0, 1024] + exact cubic tail on [1024, inf))!
double verify_slice_continuous(
    const GlobalDualConfig& cfg, const CellCert& cell, const SliceCert& sc,
    const FastKTable* kt, bool is_infeas
) {
    // 1. Check structural sign conditions on multipliers and energy interval:
    if (cell.u_lo <= 0.0 || cell.u_hi < cell.u_lo) return +1e99;
    Ival u_iv{cell.u_lo, cell.u_hi};
    if (sc.mu_u2_lo < 0 || sc.mu_u2_hi < 0 || sc.mu_u3 <= 0 || sc.nu_plus < 0 || sc.nu_minus < 0 ||
        sc.mu_sx_sep < 0 || sc.mu_sr_sep <= 0 || sc.mu_rad < 0 || sc.eta_sl_lo < 0 || sc.eta_sl_hi < 0) {
        return +1e99;
    }
    double sum_eta = 0.0;
    for (double e : sc.eta_gram) {
        if (e < 0.0) return +1e99;
        sum_eta = add_up(sum_eta, e);
    }
    for (double mr : sc.mu_rice) {
        if (mr < 0.0) return +1e99;
    }
    Ival lam_S_iv = Ival::pt(sc.mu_sx_sep);
    for (double e : sc.eta_gram) lam_S_iv = lam_S_iv + Ival::pt(e);
    if (lam_S_iv.lo <= 0.0) return +1e99;
    double lam_S_lo = lam_S_iv.lo;
    double mu_S = sc.mu_sr_sep;

    // Coupled Gram shifts af, ag:
    Ival af_iv{0.0, 0.0}, ag_iv{0.0, 0.0};
    for (size_t j = 0; j < cfg.s_gram.size(); ++j) {
        Ival sj = Ival::pt(cfg.s_gram[j]);
        Ival ej = Ival::pt(sc.eta_gram[j]);
        af_iv = af_iv + ej * (sj - Ival::pt(1.0)) / Ival::pt(18.0);
        ag_iv = ag_iv + ej * (sj + Ival::pt(0.5) - Ival::pt(3.0) / sj) / Ival::pt(18.0);
    }

    // Constant offset C_JM1 - F * (3 a_r b_r / (4 u)) - rhs_dual:
    Ival const_offset{0.0, 0.0};
    std::vector<Ival> kant_offsets(cfg.t_knots.size(), {0.0, 0.0});
    if (is_infeas) {
        const_offset = Ival::pt(1.0); // prove 1 + dual <= 0!
    } else {
        if (sc.beta < 0.0 || sc.gamma <= 0.0) return +1e99;
        for (size_t m = 1; m < sc.xs.size(); ++m) {
            if (sc.xs[m] < sc.xs[m - 1]) return +1e99;
        }
        Ival beta_iv = Ival::pt(sc.beta), gamma_iv = Ival::pt(sc.gamma), lamK_iv = Ival::pt(sc.lamK);
        Ival c1 = ival_sqr(beta_iv) / Ival::pt(3.0) + lamK_iv;
        Ival c2 = (sc.beta > 0.0) ? (ival_sqr(beta_iv) / (Ival::pt(4.0) * gamma_iv) + lamK_iv) : lamK_iv;
        Ival M_lam = eval_M_lambda_ival(c1, c2, u_iv, cell.chi_hi);

        std::vector<Ival> exp_t(cfg.t_knots.size());
        for (size_t m = 0; m < cfg.t_knots.size(); ++m) {
            exp_t[m] = ival_exp(-Ival::pt(cfg.t_knots[m]));
        }
        Ival c_kant{0.0, 0.0};
        for (size_t m = 0; m + 1 < sc.xs.size(); ++m) {
            c_kant = c_kant + Ival::pt(sc.xs[m]) * (exp_t[m] - exp_t[m + 1]);
        }
        c_kant = c_kant + Ival::pt(sc.xs.back()) * exp_t[sc.xs.size() - 1] + exp_t.back() / Ival::pt(cfg.eps_K);

        for (size_t m = 1; m < cfg.t_knots.size(); ++m) {
            Ival dt = Ival::pt(cfg.t_knots[m]) - Ival::pt(cfg.t_knots[m - 1]);
            kant_offsets[m] = kant_offsets[m - 1] + dt * Ival::pt(sc.xs[m - 1]);
        }

        Ival C_JM1 = c1 * u_iv + M_lam + c_kant;
        const_offset = C_JM1 - Ival::pt(cell.F_claimed) * (Ival::pt(0.75) * Ival::pt(sc.a_r) * Ival::pt(sc.b_r) / u_iv);
    }

    // M3_hi = 6 + 9 chi_hi + (4045313/100000) chi_hi^{3/2}
    Ival chi_hi_iv = Ival::pt(cell.chi_hi);
    Ival M3_hi = Ival::pt(6.0) + Ival::pt(9.0) * chi_hi_iv + (Ival::pt(4045313.0) / Ival::pt(100000.0)) * chi_hi_iv * ival_sqrt(chi_hi_iv);

    Ival rhs_dual = Ival::pt(sc.yeq0) + Ival::pt(sc.yeq1) + Ival::pt(2.0) * Ival::pt(sc.yeq3)
                  + Ival::pt(sc.mu_u2_lo) * (Ival::pt(2.0) + Ival::pt(cell.chi_lo))
                  - Ival::pt(sc.mu_u2_hi) * (Ival::pt(2.0) + chi_hi_iv)
                  - Ival::pt(sc.mu_u3) * M3_hi
                  + Ival::pt(sc.nu_plus) * (Ival::pt(2.0) / Ival::pt(3.0))
                  - Ival::pt(sc.mu_rad) * (Ival::pt(2287.0) / Ival::pt(2500.0))
                  + Ival::pt(sc.eta_sl_lo) * Ival::pt(sc.a_r)
                  - Ival::pt(sc.eta_sl_hi) * Ival::pt(sc.b_r);
    for (size_t k = 0; k < cfg.lams_rice.size(); ++k) {
        Ival lk = Ival::pt(cfg.lams_rice[k]);
        Ival br_k = Ival::pt(cell.t_lo) + (lk * u_iv) / (Ival::pt(39.0) / Ival::pt(50.0));
        rhs_dual = rhs_dual + Ival::pt(sc.mu_rice[k]) * br_k;
    }

    if (is_infeas && (sc.eta_sl_lo != 0.0 || sc.eta_sl_hi != 0.0)) return +1e99;

    // Evaluate upper bound of M(U) on an interval U_iv subset [0, U0]:
    auto eval_M_hi = [&](const Ival& U_iv) -> double {
        Ival c_U2 = Ival::pt(sc.yeq3) + Ival::pt(sc.mu_u2_lo) - Ival::pt(sc.mu_u2_hi) + Ival::pt(sc.nu_plus) / Ival::pt(3.0);
        Ival c_g1 = Ival::pt(sc.eta_sl_lo) - Ival::pt(sc.eta_sl_hi);

        double Jg1_hi = 0.0;
        if (!is_infeas) {
            Ival c_g1_tot = c_g1 + Ival::pt(cell.F_claimed) * (Ival::pt(0.75) * (Ival::pt(sc.a_r) + Ival::pt(sc.b_r)) / u_iv);
            auto eval_piece = [&](const Ival& sub_v, const Ival& psi_p, const Ival& g1_p) -> double {
                Ival H_iv = (Ival::pt(1.5) + Ival::pt(sc.gamma)) * psi_p - Ival::pt(sc.beta) * g1_p - Ival::pt(sc.lamK) * sub_v;
                double pl_hi = 0.0;
                for (size_t m = 1; m < cfg.t_knots.size(); ++m) {
                    double vm = sub_up(mul_up(cfg.t_knots[m], H_iv.hi), kant_offsets[m].lo);
                    if (vm > pl_hi) pl_hi = vm;
                }
                double excess_hi = std::max(0.0, sub_up(H_iv.hi, sc.xs.back()));
                double tail_hi = mul_up(0.5 * cfg.eps_K, mul_up(excess_hi, excess_hi));
                double phi_hi = add_up(pl_hi, tail_hi);
                double t1 = sub_up(phi_hi, mul_dn(cell.F_claimed, mul_dn(1.5, psi_p.lo)));
                return add_up(t1, (c_g1_tot * g1_p).hi);
            };
            Ival V_iv = u_iv * U_iv;
            const auto& w_edges = kt->enc->w_edges;
            int NW = static_cast<int>(w_edges.size()) - 1;
            int j0 = static_cast<int>(std::lower_bound(w_edges.begin(), w_edges.end(), std::max(0.0, std::min(V_iv.lo, 256.0))) - w_edges.begin()) - 1;
            j0 = std::max(0, std::min(j0, NW - 1));
            int j1 = static_cast<int>(std::upper_bound(w_edges.begin(), w_edges.end(), std::max(0.0, std::min(V_iv.hi, 256.0))) - w_edges.begin()) - 1;
            j1 = std::max(j0, std::min(j1, NW - 1));
            if (j1 - j0 <= 8) {
                Jg1_hi = -1e300;
                if (V_iv.lo <= 256.0 && (V_iv.lo < 256.0 || V_iv.hi <= 256.0)) {
                    double a = std::max(0.0, V_iv.lo), b = std::min(V_iv.hi, 256.0);
                    for (int j = j0; j <= j1; ++j) {
                        double slo = std::max(a, w_edges[j]), shi = std::min(b, w_edges[j + 1]);
                        if (shi < slo) continue;
                        Ival sv{slo, shi};
                        Ival kp_iv = ival_join(kt->KP_nodes[j], kt->KP_nodes[j + 1]);
                        Jg1_hi = std::max(Jg1_hi, eval_piece(sv, sv * ival_sqr(kp_iv), sv * kp_iv));
                    }
                }
                if (V_iv.hi > 256.0) {
                    Ival sv{std::max(V_iv.lo, 256.0), V_iv.hi};
                    Ival psi_t, g1_t;
                    eval_psi_g1_ival(*kt, sv, psi_t, g1_t);
                    Jg1_hi = std::max(Jg1_hi, eval_piece(sv, psi_t, g1_t));
                }
            } else {
                Ival psi_iv, g1_iv;
                eval_psi_g1_ival(*kt, V_iv, psi_iv, g1_iv);
                Jg1_hi = eval_piece(V_iv, psi_iv, g1_iv);
            }
        }

        // Rational Stein functions f(U), fp(U), Phi(U)-phi(U), phi(U), Y(U):
        Ival phi_t{0.0, 0.0}, Y_t{0.0, 0.0}, Phiphi_t{0.0, 0.0};
        for (size_t m = 0; m < cfg.c_rat.size(); ++m) {
            Ival cm = Ival::pt(cfg.c_rat[m]);
            Ival wm = Ival::pt(sc.w_stein[m]);
            Ival u_c = U_iv / cm;
            Ival den = Ival::pt(1.0) + u_c;
            Ival den2 = ival_sqr(den);
            // phi_m = w_m / (1 + U/c)^2
            phi_t = phi_t + wm / den2;
            // Y_m = -w_m * (U/c) / (1 + U/c)^2
            Y_t = Y_t - (wm * u_c) / den2;
            // Phi_m - phi_m = w_m * (c - c / (1 + U/c) - 1 / (1 + U/c)^2)
            Phiphi_t = Phiphi_t + wm * (cm - cm / den - Ival::pt(1.0) / den2);
        }

        Ival slope_x = Ival::pt(-2.0) * Ival::pt(sc.yeq3)
                     + (Ival::pt(2.0) * lam_S_iv / Ival::pt(3.0) + Ival::pt(2.0) * af_iv);
        Ival coeff_x = Ival::pt(sc.yeq2) + phi_t + slope_x * U_iv;
        Ival slope_r = -Ival::pt(sc.yeq3) - Ival::pt(sc.nu_plus) + Ival::pt(sc.nu_minus)
                     + (Ival::pt(2.0) * Ival::pt(mu_S) / Ival::pt(3.0) - Ival::pt(2.0) * ag_iv);
        Ival coeff_r = Y_t + slope_r * U_iv;
        double psiK_hi = eval_psi_K_rect_hi(-Ival::pt(0.5) * coeff_x, -Ival::pt(0.5) * coeff_r, lam_S_lo, mu_S);

        // Rice upper polygon at x_k = lam_k^2 u U_iv: since rho_a[j] + rho_b[j]*x is increasing in x (rho_b[j] > 0),
        // min_j (rho_a[j] + rho_b[j] * x.hi) is an exact upper bound on [x.lo, x.hi]!
        Ival rice_sum{0.0, 0.0};
        for (size_t k = 0; k < cfg.lams_rice.size(); ++k) {
            if (sc.mu_rice[k] == 0.0) continue;
            Ival x_iv = ival_sqr(Ival::pt(cfg.lams_rice[k])) * u_iv * U_iv;
            double r_hi = 1e300;
            for (size_t j = 0; j < cfg.rho_a.size(); ++j) {
                double vj = add_up(cfg.rho_a[j], mul_up(cfg.rho_b[j], x_iv.hi));
                if (vj < r_hi) r_hi = vj;
            }
            rice_sum = rice_sum + Ival::pt(sc.mu_rice[k]) * Ival{0.0, r_hi};
        }

        // Use Horner's form on U to avoid U^2 vs -U^3 interval cancellation at large U!
        Ival poly_U = Ival::pt(sc.yeq0) + U_iv * (Ival::pt(sc.yeq1) + U_iv * (c_U2 - Ival::pt(sc.mu_u3) * U_iv));
        Ival coeff_p = poly_U - Phiphi_t - Ival::pt(sc.mu_rad) * ival_sqrt(U_iv) + rice_sum;

        double total_hi = add_up(const_offset.hi, Jg1_hi);
        total_hi = add_up(total_hi, coeff_p.hi);
        total_hi = add_up(total_hi, psiK_hi);
        total_hi = sub_up(total_hi, rhs_dual.lo);
        return total_hi;
    };

    // Adaptive branch-and-bound cover of U in [0, U0], where U0 >= 8192 and u_lo*U0 >= 64:
    const double U0 = std::max(8192.0, div_up(64.0, cell.u_lo));
    double worst_hi = -1e300;
    struct Seg { double a, b; int d; };
    std::vector<Seg> stk;
    for (int i = 159; i >= 0; --i) {
        double a = U0 * std::pow(static_cast<double>(i) / 160.0, 2.2);
        double b = U0 * std::pow(static_cast<double>(i + 1) / 160.0, 2.2);
        stk.push_back({a, b, 0});
    }
    while (!stk.empty()) {
        Seg s = stk.back(); stk.pop_back();
        double hi = eval_M_hi({s.a, s.b});
        if (hi <= -1e-7 || s.d >= 26) {
            if (hi > worst_hi) worst_hi = hi;
            if (hi >= 0.0) return hi; // early exit if failed at max depth!
        } else {
            double mid = 0.5 * (s.a + s.b);
            stk.push_back({mid, s.b, s.d + 1});
            stk.push_back({s.a, mid, s.d + 1});
        }
    }

    // Analytic tail U in [U0, inf) (where v = u*U >= u_lo*U0 >= 64 => |h_X'(w)| <= P_max / w^{3/2} for all w >= v):
    // Hence |k_X'(v)| <= P_max / v^{3/2}, so psi(u U) <= P_max^2 / 4096 and |g1(u U)| <= P_max / 8!
    {
        Ival inv_U = {0.0, div_up(1.0, U0)};
        Ival inv_U2 = ival_sqr(inv_U);
        Ival inv_U3 = inv_U2 * inv_U;
        double U0_2 = mul_dn(U0, U0);
        double U0_3 = mul_dn(U0_2, U0);

        double J_over_U3_hi = 0.0;
        double g1_tail_hi = 0.0;
        if (!is_infeas) {
            double P_max = ival_abs(kt->P_inf_ival).hi;
            if (P_max > 2.0) return +1e99;
            double psi_tail_hi = div_up(mul_up(P_max, P_max), 4096.0);
            g1_tail_hi = div_up(P_max, 8.0);
            double C_H0 = add_up(mul_up(add_up(1.5, sc.gamma), psi_tail_hi), mul_up(sc.beta, g1_tail_hi));
            double C_H1_eff = mul_up(std::max(0.0, -sc.lamK), cell.u_hi);
            double neg_K_hi = 0.0;
            for (size_t m = 1; m < kant_offsets.size(); ++m) {
                if (-kant_offsets[m].lo > neg_K_hi) neg_K_hi = -kant_offsets[m].lo;
            }
            double tM = cfg.t_knots.back();
            double pl_u3 = add_up(
                mul_up(tM, add_up(div_up(C_H0, U0_3), div_up(C_H1_eff, U0_2))),
                div_up(neg_K_hi, U0_3)
            );
            double d0 = std::max(0.0, sub_up(C_H0, sc.xs.back()));
            double s_u = add_up(div_up(d0, U0), C_H1_eff);
            double q_u3 = div_up(mul_up(0.5 * cfg.eps_K, mul_up(s_u, s_u)), U0);
            double om_neg_u3 = div_up(mul_up(cell.F_claimed, mul_up(div_up(mul_up(0.75, ival_abs(Ival::pt(sc.a_r) + Ival::pt(sc.b_r)).hi), cell.u_lo), g1_tail_hi)), U0_3);
            J_over_U3_hi = add_up(add_up(pl_u3, q_u3), om_neg_u3);
        }

        double sum_w = 0.0, sum_wc = 0.0;
        for (size_t m = 0; m < cfg.c_rat.size(); ++m) {
            sum_w = add_up(sum_w, std::fabs(sc.w_stein[m]));
            sum_wc = add_up(sum_wc, mul_up(std::fabs(sc.w_stein[m]), cfg.c_rat[m]));
        }
        Ival cx_over_U = Ival::pt(-2.0) * Ival::pt(sc.yeq3) + (Ival::pt(2.0) * lam_S_iv / Ival::pt(3.0) + Ival::pt(2.0) * af_iv)
                       + (Ival::pt(sc.yeq2) + Ival{-sum_w, sum_w}) * inv_U;
        Ival cr_over_U = -Ival::pt(sc.yeq3) - Ival::pt(sc.nu_plus) + Ival::pt(sc.nu_minus)
                       + (Ival::pt(2.0) * Ival::pt(mu_S) / Ival::pt(3.0) - Ival::pt(2.0) * ag_iv)
                       + Ival{-sum_w, sum_w} * inv_U;
        double psiK_u2 = add_up(
            div_up(ival_sqr(Ival::pt(0.5) * cx_over_U).hi, lam_S_lo),
            div_up(ival_sqr(Ival::pt(0.5) * cr_over_U).hi, mu_S)
        );
        double psiK_u3 = div_up(psiK_u2, U0);

        double rice_u3 = 0.0;
        for (size_t k = 0; k < cfg.lams_rice.size(); ++k) {
            if (sc.mu_rice[k] == 0.0) continue;
            double aL = cfg.rho_a.back(), bL = cfg.rho_b.back();
            double x_over_U = mul_up(mul_up(cfg.lams_rice[k], cfg.lams_rice[k]), cell.u_hi);
            double term_u3 = add_up(mul_up(aL, inv_U3.hi), mul_up(mul_up(bL, x_over_U), inv_U2.hi));
            rice_u3 = add_up(rice_u3, mul_up(sc.mu_rice[k], term_u3));
        }

        Ival c_U2 = Ival::pt(sc.yeq3) + Ival::pt(sc.mu_u2_lo) - Ival::pt(sc.mu_u2_hi) + Ival::pt(sc.nu_plus) / Ival::pt(3.0);
        Ival c_g1 = Ival::pt(sc.eta_sl_lo) - Ival::pt(sc.eta_sl_hi);
        double g1_lin_u3 = div_up(mul_up(ival_abs(c_g1).hi, g1_tail_hi), U0_3);
        Ival lin_u3 = (const_offset - rhs_dual + Ival::pt(sc.yeq0) + Ival{-sum_wc, sum_wc}) * inv_U3
                    + Ival::pt(sc.yeq1) * inv_U2 + c_U2 * inv_U;
        double tail_coeff_hi = sub_up(add_up(add_up(add_up(lin_u3.hi, g1_lin_u3), J_over_U3_hi), add_up(psiK_u3, rice_u3)), sc.mu_u3);
        if (tail_coeff_hi >= 0.0) {
            return +1e50; // U^3 tail failed!
        }
        double tail_val_at_U0 = mul_dn(-tail_coeff_hi, U0_3);
        worst_hi = std::max(worst_hi, -tail_val_at_U0);
    }
    return worst_hi;
}

static std::string fmt_outward_6(double x, bool round_up) {
    if (!std::isfinite(x)) return "nan";
    const int prev_rm = std::fegetround();
    std::fesetround(round_up ? FE_UPWARD : FE_DOWNWARD);
    volatile double scaled = x * 1000000.0;
    const double bound = round_up ? std::ceil(scaled) : std::floor(scaled);
    std::fesetround(prev_rm);
    const long long n = static_cast<long long>(bound);
    char buf[64];
    if (n < 0) {
        const unsigned long long an = static_cast<unsigned long long>(-(n + 1)) + 1ULL;
        std::snprintf(buf, sizeof(buf), "-%llu.%06llu", an / 1000000ULL, an % 1000000ULL);
    } else {
        const unsigned long long an = static_cast<unsigned long long>(n);
        std::snprintf(buf, sizeof(buf), "%llu.%06llu", an / 1000000ULL, an % 1000000ULL);
    }
    return std::string(buf);
}

static std::string format_junta_console_line(const JuntaLowUResult& jc, bool with_target_note) {
    const std::string lo_s = fmt_outward_6(jc.ratio.lo, false);
    const std::string hi_s = fmt_outward_6(jc.ratio.hi, true);
    const std::string r1_s = fmt_outward_6(jc.r1_min_lb, false);
    char buf[384];
    std::snprintf(
        buf, sizeof(buf),
        "  junta u=1e-6 on %s: ratio in [%s, %s] ([%a, %a]), R1_min >= %s (%a)%s\n",
        jc.row_tag.c_str(), lo_s.c_str(), hi_s.c_str(),
        jc.ratio.lo, jc.ratio.hi, r1_s.c_str(), jc.r1_min_lb,
        with_target_note ? " (> 0.866656)" : ""
    );
    return std::string(buf);
}

} // namespace

int main(int argc, char** argv) {
    self_test_fpu();

    int nthreads = 2;
    std::string mode;
    std::string arg1, arg2, only_row, cpp_src_path, manifest_path;
    std::vector<std::pair<std::string, std::string>> shard_paths;
    for (int i = 1; i < argc; ++i) {
        std::string s = argv[i];
        if (s == "--threads" && i + 1 < argc) {
            nthreads = std::max(1, std::atoi(argv[++i]));
        } else if (s == "--only-row" && i + 1 < argc) {
            only_row = argv[++i];
        } else if (s == "--cpp-src" && i + 1 < argc) {
            cpp_src_path = argv[++i];
        } else if (s == "--manifest" && i + 1 < argc) {
            manifest_path = argv[++i];
        } else if (s == "--shard" && i + 2 < argc) {
            std::string sh_name = argv[++i];
            std::string sh_file = argv[++i];
            shard_paths.emplace_back(sh_name, sh_file);
        } else if (s == "--dump-rows" && i + 1 < argc) {
            mode = "dump";
            arg1 = argv[++i];
        } else if (s == "--self-test-only") {
            std::fesetround(FE_UPWARD);
            if (fmt_outward_6(3.6731184288272809, false) != "3.673118" ||
                fmt_outward_6(4.4838217366393893, true) != "4.483822" ||
                fmt_outward_6(0.88354592372096086, false) != "0.883545" ||
                fmt_outward_6(-1.2345671, false) != "-1.234568" ||
                fmt_outward_6(-1.2345671, true) != "-1.234567") {
                std::fprintf(stderr, "FATAL: fmt_outward_6 self-test failed under FE_UPWARD!\n");
                return 2;
            }
            auto all_sp = get_all_15_rows();
            for (const auto& sp : all_sp) {
                if (sp.tag == "0.865") {
                    RowProfileEnclosure enc0865 = enclose_row_profile(sp, nthreads);
                    verify_row_seam_and_vortex_join_controls(enc0865);
                    std::fesetround(FE_UPWARD);
                    const Ival u_1e6_iv = Ival::pt(1.0) / Ival::pt(1000000.0);
                    JuntaLowUResult j_0865_st = certify_junta_low_u(enc0865, u_1e6_iv);
                    const std::string line = format_junta_console_line(j_0865_st, true);
                    std::fputs(line.c_str(), stdout);
                }
            }
            return 0;
        } else if (s == "--verify-all" && i + 2 < argc) {
            mode = "verify";
            arg1 = argv[++i];
            arg2 = argv[++i];
        }
    }
    if (mode.empty()) {
        std::fprintf(stderr, "Usage:\n  %s --dump-rows <rows_cache.json> [--threads N] [--only-row TAG]\n  %s --verify-all <dual_certs.dat> <result.json> [--threads N]\n", argv[0], argv[0]);
        return 1;
    }

    GlobalDualConfig cfg;
    if (mode == "verify") {
        std::fesetround(FE_TONEAREST);
        std::ifstream in(arg1);
        if (!in) {
            std::fprintf(stderr, "FATAL: cannot open %s\n", arg1.c_str());
            return 2;
        }
        cfg = load_dual_stream(in);
        self_test_fpu();
    }

    auto specs = get_all_15_rows();
    if (mode == "verify") {
        if (!only_row.empty()) {
            std::fprintf(stderr, "FATAL: --only-row is for --dump-rows; verification selects all required rows.\n");
            return 2;
        }
        std::set<std::string> needed{"0.700_own", "0.800", "0.865"};  // Low-energy controls.
        for (const auto& cell : cfg.cells) needed.insert(cell.row_tag);
        std::vector<RowSpec> selected;
        for (const auto& spec : specs) {
            if (needed.erase(spec.tag)) selected.push_back(spec);
        }
        if (!needed.empty()) {
            std::fprintf(stderr, "FATAL: unknown row tag %s\n", needed.begin()->c_str());
            return 2;
        }
        specs.swap(selected);
    } else if (!only_row.empty()) {
        std::vector<RowSpec> filt;
        for (const auto& sp : specs) if (sp.tag == only_row) filt.push_back(sp);
        specs = filt;
    }
    std::vector<RowProfileEnclosure> row_encs(specs.size());
    std::atomic<size_t> next_r{0};
    std::fprintf(stderr, "[Part 1] Enclosing %zu rows from 2D Gaussian integral definitions (%d threads)...\n", specs.size(), nthreads);
    if (specs.size() == 1 && nthreads > 1) {
        row_encs[0] = enclose_row_profile(specs[0], nthreads);
    } else {
        std::vector<std::thread> pool;
        for (int t = 0; t < nthreads; ++t) {
            pool.emplace_back([&]() {
                self_test_fpu();
                while (true) {
                    size_t idx = next_r.fetch_add(1);
                    if (idx >= specs.size()) break;
                    row_encs[idx] = enclose_row_profile(specs[idx], 1);
                }
            });
        }
        for (auto& th : pool) th.join();
    }
    for (const auto& r : row_encs) {
        verify_row_seam_and_vortex_join_controls(r);
        Ival hA0 = eval_h_ival(r, false, {0.0, 0.0});
        Ival hB0 = eval_h_ival(r, true, {0.0, 0.0});
        std::fprintf(stderr, "  row %-9s: hA(0)=[%s, %s] (w=%.1e), hB(0)=[%s, %s] (w=%.1e)\n",
                     r.spec.tag.c_str(),
                     fmt_outward_6(hA0.lo, false).c_str(), fmt_outward_6(hA0.hi, true).c_str(), hA0.width(),
                     fmt_outward_6(hB0.lo, false).c_str(), fmt_outward_6(hB0.hi, true).c_str(), hB0.width());
    }

    if (mode == "dump") {
        dump_rows_json(row_encs, arg1);
        std::fprintf(stderr, "[Part 1] Wrote %s\n", arg1.c_str());
        return 0;
    }

    // Mode "verify": verify all cells + negative controls, write result.json!
    std::fprintf(stderr, "[Part 2] Verifying %zu continuous-law cell certificates (%d threads)...\n", cfg.cells.size(), nthreads);

    auto find_row = [&](const std::string& tag) -> const RowProfileEnclosure& {
        for (const auto& r : row_encs) if (r.spec.tag == tag) return r;
        std::fprintf(stderr, "FATAL: unknown row tag %s\n", tag.c_str());
        std::exit(2);
    };

    struct CellVerdict {
        bool ok{false};
        double worst_M_A{-1e300};
        double worst_M_B{-1e300};
        Ival g1_range_A{0, 0};
        Ival g1_range_B{0, 0};
    };
    std::vector<CellVerdict> verdicts(cfg.cells.size());
    std::atomic<size_t> next_c{0};
    std::atomic<int> failures{0};

    {
        std::vector<std::thread> pool;
        for (int t = 0; t < nthreads; ++t) {
            pool.emplace_back([&]() {
                self_test_fpu();
                while (true) {
                    size_t idx = next_c.fetch_add(1);
                    if (idx >= cfg.cells.size()) break;
                    const auto& cell = cfg.cells[idx];
                    const auto& renc = find_row(cell.row_tag);
                    CellVerdict cv;
                    if (cell.kind == "INFEAS_R1") {
                        if (cell.slicesA.size() != 1) { failures.fetch_add(1); continue; }
                        double m = verify_slice_continuous(cfg, cell, cell.slicesA[0], nullptr, true);
                        cv.worst_M_A = m; cv.worst_M_B = m;
                        cv.ok = (m < 0.0);
                        if (!cv.ok) failures.fetch_add(1);
                        verdicts[idx] = cv;
                        continue;
                    }
                    FastKTable ktA = build_k_table(renc, false, {cell.u_lo, cell.u_hi});
                    FastKTable ktB = build_k_table(renc, true, {cell.u_lo, cell.u_hi});

                    // Verify slice intervals [a_r, b_r] contiguously cover the global range of g1(v) on [0, inf)!
                    auto global_g1_bounds = [&](const FastKTable& kt) -> Ival {
                        Ival acc{0.0, 0.0}; // g1(0) = 0, g1(inf) -> 0
                        for (int k = 0; k < 128; ++k) {
                            double va = 64.0 * std::pow(static_cast<double>(k) / 128.0, 2.0);
                            double vb = 64.0 * std::pow(static_cast<double>(k + 1) / 128.0, 2.0);
                            Ival ps, g1;
                            eval_psi_g1_ival(kt, {va, vb}, ps, g1);
                            acc = ival_join(acc, g1);
                        }
                        Ival ps_t, g1_t;
                        eval_psi_g1_ival(kt, {64.0, 1e150}, ps_t, g1_t);
                        return ival_join(acc, g1_t);
                    };
                    cv.g1_range_A = global_g1_bounds(ktA);
                    cv.g1_range_B = global_g1_bounds(ktB);

                    auto check_sector = [&](const std::vector<SliceCert>& sls, const FastKTable& kt, const Ival& g1_rng, double& w_out) -> bool {
                        if (sls.empty()) return false;
                        if (sls.front().a_r > g1_rng.lo || sls.back().b_r < g1_rng.hi) return false;
                        for (size_t s = 0; s + 1 < sls.size(); ++s) {
                            if (sls[s].b_r < sls[s + 1].a_r) return false;
                        }
                        double w = -1e300;
                        for (const auto& sc : sls) {
                            double m = verify_slice_continuous(cfg, cell, sc, &kt, false);
                            if (m > w) w = m;
                            if (m >= 0.0) { w_out = w; return false; }
                        }
                        w_out = w;
                        return true;
                    };

                    bool okA = check_sector(cell.slicesA, ktA, cv.g1_range_A, cv.worst_M_A);
                    bool okB = check_sector(cell.slicesB, ktB, cv.g1_range_B, cv.worst_M_B);
                    cv.ok = okA && okB;
                    if (!cv.ok) {
                        std::fprintf(stderr, "  FAIL cell %zu (pc=%d, row=%s, u=[%.17g,%.17g], chi=[%g,%g]): okA=%d (%.4e) okB=%d (%.4e)\n",
                                     idx, cell.piece_idx, cell.row_tag.c_str(), cell.u_lo, cell.u_hi, cell.chi_lo, cell.chi_hi,
                                     okA ? 1 : 0, cv.worst_M_A, okB ? 1 : 0, cv.worst_M_B);
                        failures.fetch_add(1);
                    }
                    verdicts[idx] = cv;
                }
            });
        }
        for (auto& th : pool) th.join();
    }

    // [Part 3] Negative Control 1: Junta at exact rational u = 1/1000000 = 1e-6 on rows 0.800 and 0.865 (rejects one constant for all energies!)
    std::fprintf(stderr, "[Part 3] Certifying low-energy junta negative controls at u = 1/1000000...\n");
    std::fesetround(FE_UPWARD);
    const Ival u_1e6_iv = Ival::pt(1.0) / Ival::pt(1000000.0);
    JuntaLowUResult j_080 = certify_junta_low_u(find_row("0.800"), u_1e6_iv);
    JuntaLowUResult j_0865 = certify_junta_low_u(find_row("0.865"), u_1e6_iv);
    JuntaLowUResult j_070 = certify_junta_low_u(find_row("0.700_own"), u_1e6_iv);
    std::fputs(format_junta_console_line(j_080, true).c_str(), stderr);
    std::fputs(format_junta_console_line(j_0865, true).c_str(), stderr);
    std::fputs(format_junta_console_line(j_070, false).c_str(), stderr);

    if (j_080.ratio.lo <= 3.30 || j_0865.ratio.lo <= 3.30 || j_080.r1_min_lb <= 0.866656) {
        std::fprintf(stderr, "FATAL: low-energy junta negative control failed!\n");
        return 2;
    }
    if (failures.load() > 0) {
        std::fprintf(stderr, "FATAL: %d cell certificate(s) failed continuous verification!\n", failures.load());
        return 2;
    }

    // Precompute hA(0), hB(0), hA'(0), hB'(0) under FE_UPWARD, verify hA'(0) != 0 and hB'(0) != 0 on every row,
    // then switch to FE_TONEAREST for exact IEEE-754 decimal round-trip formatting!
    std::fesetround(FE_UPWARD);
    std::vector<Ival> hA0_vec(row_encs.size()), hB0_vec(row_encs.size());
    std::vector<Ival> hpA0_vec(row_encs.size()), hpB0_vec(row_encs.size());
    for (size_t i = 0; i < row_encs.size(); ++i) {
        hA0_vec[i] = eval_h_ival(row_encs[i], false, {0.0, 0.0});
        hB0_vec[i] = eval_h_ival(row_encs[i], true, {0.0, 0.0});
        hpA0_vec[i] = eval_hp_ival(row_encs[i], false, {0.0, 0.0});
        hpB0_vec[i] = eval_hp_ival(row_encs[i], true, {0.0, 0.0});
        if ((hpA0_vec[i].lo <= 0.0 && hpA0_vec[i].hi >= 0.0) ||
            (hpB0_vec[i].lo <= 0.0 && hpB0_vec[i].hi >= 0.0)) {
            std::fprintf(stderr, "FATAL: row %s hX'(0) enclosure contains 0!\n", row_encs[i].spec.tag.c_str());
            return 2;
        }
    }
    std::fesetround(FE_TONEAREST);

    // Write result.json receipt (including cryptographic SHA-256 digests and per-cell g1 ranges)!
    const std::string dat_sha256 = sha256_file_hex(arg1);
    const std::string cpp_sha256 = cpp_src_path.empty() ? "" : sha256_file_hex(cpp_src_path);
    const std::string manifest_sha256 = manifest_path.empty() ? "" : sha256_file_hex(manifest_path);
    std::vector<std::pair<std::string, std::string>> shard_digests;
    for (const auto& sp : shard_paths) {
        shard_digests.emplace_back(sp.first, sha256_file_hex(sp.second));
    }
    std::ofstream out(arg2);
    out << std::setprecision(17);
    out << "{\n";
    out << "  \"status\": \"CERTIFIED\",\n";
    out << "  \"dat_sha256\": \"" << dat_sha256 << "\",\n";
    if (!cpp_sha256.empty()) {
        out << "  \"cpp_sha256\": \"" << cpp_sha256 << "\",\n";
    }
    if (!manifest_sha256.empty()) {
        out << "  \"manifest_sha256\": \"" << manifest_sha256 << "\",\n";
    }
    if (!shard_digests.empty()) {
        out << "  \"shard_sha256s\": {\n";
        for (size_t k = 0; k < shard_digests.size(); ++k) {
            out << "    \"" << shard_digests[k].first << "\": \"" << shard_digests[k].second << "\""
                << (k + 1 < shard_digests.size() ? "," : "") << "\n";
        }
        out << "  },\n";
    }
    out << "  \"rows_enclosed\": " << row_encs.size() << ",\n";
    out << "  \"cells_verified\": " << cfg.cells.size() << ",\n";
    out << "  \"row_summaries\": [\n";
    for (size_t i = 0; i < row_encs.size(); ++i) {
        const auto& r = row_encs[i];
        const Ival& hA0 = hA0_vec[i];
        const Ival& hB0 = hB0_vec[i];
        const Ival& hpA0 = hpA0_vec[i];
        const Ival& hpB0 = hpB0_vec[i];
        out << "    {\"tag\": \"" << r.spec.tag << "\", \"hA0\": [" << hA0.lo << ", " << hA0.hi
            << "], \"hB0\": [" << hB0.lo << ", " << hB0.hi
            << "], \"hpA0\": [" << hpA0.lo << ", " << hpA0.hi
            << "], \"hpB0\": [" << hpB0.lo << ", " << hpB0.hi
            << "], \"PA_inf\": [" << r.PA_inf.lo << ", " << r.PA_inf.hi
            << "], \"PB_inf\": [" << r.PB_inf.lo << ", " << r.PB_inf.hi << "]}" << (i + 1 < row_encs.size() ? "," : "") << "\n";
    }
    out << "  ],\n";
    out << "  \"junta_low_u_controls\": [\n";
    auto write_jc = [&](const JuntaLowUResult& jc, bool comma) {
        out << "    {\"row\": \"" << jc.row_tag << "\", \"u_ival\": [" << jc.u_iv.lo << ", " << jc.u_iv.hi
            << "], \"ratio_ival\": [" << jc.ratio.lo << ", " << jc.ratio.hi
            << "], \"r1_min_lb\": " << jc.r1_min_lb << "}" << (comma ? "," : "") << "\n";
    };
    write_jc(j_070, true);
    write_jc(j_080, true);
    write_jc(j_0865, false);
    out << "  ],\n";
    out << "  \"cells\": [\n";
    for (size_t i = 0; i < cfg.cells.size(); ++i) {
        const auto& c = cfg.cells[i];
        const auto& v = verdicts[i];
        out << "    {\"piece\": " << c.piece_idx << ", \"u_idx\": " << c.u_idx
            << ", \"row\": \"" << c.row_tag << "\", \"kind\": \"" << c.kind
            << "\", \"u_lo\": " << c.u_lo << ", \"u_hi\": " << c.u_hi << ", \"t_lo\": " << c.t_lo
            << ", \"chi_lo\": " << c.chi_lo << ", \"chi_hi\": " << c.chi_hi
            << ", \"theta_allow\": " << c.theta_allow << ", \"F_certified\": " << c.F_claimed
            << ", \"worst_M_A\": " << v.worst_M_A << ", \"worst_M_B\": " << v.worst_M_B;
        if (c.kind == "JM1_BOUND") {
            out << ", \"g1_range_A\": [" << v.g1_range_A.lo << ", " << v.g1_range_A.hi
                << "], \"g1_range_B\": [" << v.g1_range_B.lo << ", " << v.g1_range_B.hi << "]";
        }
        out << "}" << (i + 1 < cfg.cells.size() ? "," : "") << "\n";
    }
    out << "  ]\n}\n";
    std::fprintf(stderr, "ALL %zu CONTINUOUS-LAW CERTIFICATES AND NEGATIVE CONTROLS PASSED!\n", cfg.cells.size());
    return 0;
}
