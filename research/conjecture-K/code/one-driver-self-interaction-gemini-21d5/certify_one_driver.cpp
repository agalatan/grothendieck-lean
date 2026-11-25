// certify_one_driver.cpp
// Self-contained outward-rounded interval certifier for the complete one-driver
// self-interaction family in Conjecture K (Layer L4, STATUS.md 6.3.5-6.3.7,
// 6.3.13-6.3.15; MONOGRAPH.md §2.5 & §3 item 6; Issue #509).
//
// Zero external dependencies (C++17 standard library only).
// All floating-point operations are rounded outward by 1 ULP via std::nextafter,
// and every transcendental/algebraic primitive (sqrti, expneg, sin_i, cos_i,
// verified_pi, iota_i) is verified from elementary alternating series or exact
// polynomial bracket checks without trusting unverified libm outputs.
//
// Build:
//   c++ -std=c++17 -O2 -ffp-contract=off -Wall -Wextra -Werror \
//       certify_one_driver.cpp -o certify_one_driver
//
// Agent-ID: gemini-21d5

#include <algorithm>
#include <array>
#include <cfenv>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <thread>
#include <unordered_map>
#include <vector>

namespace {

// ============================================================================
// 1. Embedded FIPS 180-4 SHA-256 (tamper-evident source provenance)
// ============================================================================
struct Sha256 {
  uint32_t h[8];
  uint8_t buf[64];
  uint64_t bitlen;
  size_t buflen;

  Sha256() {
    h[0] = 0x6a09e667u; h[1] = 0xbb67ae85u; h[2] = 0x3c6ef372u; h[3] = 0xa54ff53au;
    h[4] = 0x510e527fu; h[5] = 0x9b05688cu; h[6] = 0x1f83d9abu; h[7] = 0x5be0cd19u;
    bitlen = 0;
    buflen = 0;
  }

  static inline uint32_t rotr(uint32_t x, uint32_t n) {
    return (x >> n) | (x << (32u - n));
  }

  void transform(const uint8_t data[64]) {
    static const uint32_t k[64] = {
      0x428a2f98u,0x71374491u,0xb5c0fbcfu,0xe9b5dba5u,0x3956c25bu,0x59f111f1u,0x923f82a4u,0xab1c5ed5u,
      0xd807aa98u,0x12835b01u,0x243185beu,0x550c7dc3u,0x72be5d74u,0x80deb1feu,0x9bdc06a7u,0xc19bf174u,
      0xe49b69c1u,0xefbe4786u,0x0fc19dc6u,0x240ca1ccu,0x2de92c6fu,0x4a7484aau,0x5cb0a9dcu,0x76f988dau,
      0x983e5152u,0xa831c66du,0xb00327c8u,0xbf597fc7u,0xc6e00bf3u,0xd5a79147u,0x06ca6351u,0x14292967u,
      0x27b70a85u,0x2e1b2138u,0x4d2c6dfcu,0x53380d13u,0x650a7354u,0x766a0abbu,0x81c2c92eu,0x92722c85u,
      0xa2bfe8a1u,0xa81a664bu,0xc24b8b70u,0xc76c51a3u,0xd192e819u,0xd6990624u,0xf40e3585u,0x106aa070u,
      0x19a4c116u,0x1e376c08u,0x2748774cu,0x34b0bcb5u,0x391c0cb3u,0x4ed8aa4au,0x5b9cca4fu,0x682e6ff3u,
      0x748f82eeu,0x78a5636fu,0x84c87814u,0x8cc70208u,0x90befffau,0xa4506cebu,0xbef9a3f7u,0xc67178f2u
    };
    uint32_t w[64];
    for (int i = 0; i < 16; ++i) {
      w[i] = (uint32_t(data[4*i]) << 24) | (uint32_t(data[4*i+1]) << 16) |
             (uint32_t(data[4*i+2]) << 8) | uint32_t(data[4*i+3]);
    }
    for (int i = 16; i < 64; ++i) {
      uint32_t s0 = rotr(w[i-15], 7) ^ rotr(w[i-15], 18) ^ (w[i-15] >> 3);
      uint32_t s1 = rotr(w[i-2], 17) ^ rotr(w[i-2], 19) ^ (w[i-2] >> 10);
      w[i] = w[i-16] + s0 + w[i-7] + s1;
    }
    uint32_t a = h[0], b = h[1], c = h[2], d = h[3];
    uint32_t e = h[4], f = h[5], g = h[6], hh = h[7];
    for (int i = 0; i < 64; ++i) {
      uint32_t S1 = rotr(e, 6) ^ rotr(e, 11) ^ rotr(e, 25);
      uint32_t ch = (e & f) ^ ((~e) & g);
      uint32_t temp1 = hh + S1 + ch + k[i] + w[i];
      uint32_t S0 = rotr(a, 2) ^ rotr(a, 13) ^ rotr(a, 22);
      uint32_t maj = (a & b) ^ (a & c) ^ (b & c);
      uint32_t temp2 = S0 + maj;
      hh = g; g = f; f = e; e = d + temp1;
      d = c; c = b; b = a; a = temp1 + temp2;
    }
    h[0] += a; h[1] += b; h[2] += c; h[3] += d;
    h[4] += e; h[5] += f; h[6] += g; h[7] += hh;
  }

  void update(const uint8_t* data, size_t len) {
    for (size_t i = 0; i < len; ++i) {
      buf[buflen++] = data[i];
      if (buflen == 64) {
        transform(buf);
        bitlen += 512;
        buflen = 0;
      }
    }
  }

  std::string hex_digest() {
    uint64_t total_bits = bitlen + uint64_t(buflen) * 8u;
    buf[buflen++] = 0x80u;
    if (buflen > 56) {
      while (buflen < 64) buf[buflen++] = 0;
      transform(buf);
      buflen = 0;
    }
    while (buflen < 56) buf[buflen++] = 0;
    for (int i = 7; i >= 0; --i) {
      buf[buflen++] = uint8_t((total_bits >> (8 * i)) & 0xffu);
    }
    transform(buf);
    std::ostringstream oss;
    oss << std::hex << std::setfill('0');
    for (int i = 0; i < 8; ++i) oss << std::setw(8) << h[i];
    return oss.str();
  }
};

std::string sha256_bytes(const std::string& s) {
  Sha256 st;
  st.update(reinterpret_cast<const uint8_t*>(s.data()), s.size());
  return st.hex_digest();
}

std::string sha256_file(const std::string& path) {
  std::ifstream in(path, std::ios::binary);
  if (!in) throw std::runtime_error("cannot open file for sha256: " + path);
  Sha256 st;
  char chunk[8192];
  while (in.read(chunk, sizeof(chunk)) || in.gcount() > 0) {
    st.update(reinterpret_cast<const uint8_t*>(chunk), size_t(in.gcount()));
  }
  return st.hex_digest();
}

std::string hexfloat_str(double x) {
  char buf[64];
  std::snprintf(buf, sizeof(buf), "%a", x);
  return std::string(buf);
}

// ============================================================================
// 2. Outward-Rounded Interval Arithmetic & Verified Elementary Primitives
// ============================================================================
inline void require(bool cond, const char* msg) {
  if (!cond) throw std::runtime_error(msg);
}

[[noreturn]] void fail_nonfinite(const char* msg) {
  throw std::runtime_error(msg);
}

inline double dn(double x) {
  uint64_t u;
  std::memcpy(&u, &x, sizeof(u));
  if (__builtin_expect((u & 0x7ff0000000000000ULL) == 0x7ff0000000000000ULL, 0)) {
    fail_nonfinite("non-finite interval endpoint (dn)");
  }
  if (x == 0.0) {
    u = 0x8000000000000001ULL;
  } else if (static_cast<int64_t>(u) > 0) {
    --u;
  } else {
    ++u;
  }
  double out;
  std::memcpy(&out, &u, sizeof(out));
  return out;
}

inline double up(double x) {
  uint64_t u;
  std::memcpy(&u, &x, sizeof(u));
  if (__builtin_expect((u & 0x7ff0000000000000ULL) == 0x7ff0000000000000ULL, 0)) {
    fail_nonfinite("non-finite interval endpoint (up)");
  }
  if (x == 0.0) {
    u = 0x0000000000000001ULL;
  } else if (static_cast<int64_t>(u) > 0) {
    ++u;
  } else {
    --u;
  }
  double out;
  std::memcpy(&out, &u, sizeof(out));
  return out;
}

struct I {
  double l, h;
  constexpr I() : l(0.0), h(0.0) {}
  constexpr explicit I(double v) : l(v), h(v) {}
  constexpr I(double lo, double hi) : l(lo), h(hi) {}
};

inline I make_i(double lo, double hi, int line = __builtin_LINE()) {
  if (!(std::isfinite(lo) && std::isfinite(hi) && lo <= hi)) {
    std::ostringstream oss;
    oss << std::setprecision(17) << "invalid interval at line " << line << ": [" << lo << ", " << hi << "]";
    throw std::runtime_error(oss.str());
  }
  return I(lo, hi);
}

inline I rat_i(int64_t num, int64_t den) {
  require(den > 0, "nonpositive denominator");
  double q = double(num) / double(den);
  return I(dn(q), up(q));
}

inline I operator+(I x, I y) { return I(dn(x.l + y.l), up(x.h + y.h)); }
inline I operator-(I x, I y) { return I(dn(x.l - y.h), up(x.h - y.l)); }
inline I operator-(I x) { return I(-x.h, -x.l); }

inline I operator*(I x, I y) {
  double a = x.l * y.l, b = x.l * y.h, c = x.h * y.l, d = x.h * y.h;
  double lo = std::min(std::min(a, b), std::min(c, d));
  double hi = std::max(std::max(a, b), std::max(c, d));
  return I(dn(lo), up(hi));
}

inline I operator/(I x, I y) {
  require(!(y.l <= 0.0 && y.h >= 0.0), "division by interval containing zero");
  return x * I(dn(1.0 / y.h), up(1.0 / y.l));
}

inline I sq(I x) {
  if (x.l >= 0.0) return I(dn(x.l * x.l), up(x.h * x.h));
  if (x.h <= 0.0) return I(dn(x.h * x.h), up(x.l * x.l));
  double m = std::max(-x.l, x.h);
  return I(0.0, up(m * m));
}

inline I abs_i(I x) {
  if (x.l >= 0.0) return x;
  if (x.h <= 0.0) return -x;
  return I(0.0, std::max(-x.l, x.h));
}

inline I hull_i(I x, I y) { return I(std::min(x.l, y.l), std::max(x.h, y.h)); }
inline double mid_i(I x) { return 0.5 * (x.l + x.h); }

inline I sqrti(I x) {
  require(x.l >= 0.0, "negative sqrti argument");
  double lo = (x.l == 0.0) ? 0.0 : dn(std::sqrt(x.l));
  double hi = (x.h == 0.0) ? 0.0 : up(std::sqrt(x.h));
  while (lo > 0.0 && up(lo * lo) > x.l) lo = dn(lo);
  while (dn(hi * hi) < x.h) hi = up(hi);
  require(lo >= 0.0 && up(lo * lo) <= x.l && dn(hi * hi) >= x.h, "sqrti verification failed");
  return I(lo, hi);
}

inline I exppoint_neg(double t) {
  require(t >= 0.0, "exppoint_neg negative input");
  if (t == 0.0) return I(1.0, 1.0);
  if (t >= 128.0) {
    I e127 = exppoint_neg(127.5);
    return I(0.0, e127.h);
  }
  I x = I(t) / I(128.0);
  require(x.h <= 1.0, "exp scaling out of range");
  I term(1.0), sum(1.0), even_sum(1.0);
  for (int j = 1; j <= 23; ++j) {
    term = term * (-x) / I(double(j));
    sum = sum + term;
    if (j == 22) even_sum = sum;
  }
  I res(sum.l, even_sum.h);
  require(res.l > 0.0 && res.l <= res.h, "exp Taylor bracket failed");
  for (int j = 0; j < 7; ++j) res = sq(res);
  return res;
}

inline I expneg(I t) {
  require(t.h >= 0.0, "expneg completely negative");
  double lo_arg = std::max(0.0, t.l);
  return I(exppoint_neg(t.h).l, exppoint_neg(lo_arg).h);
}

inline I sin_point_pos(double x) {
  require(x >= 0.0 && x <= 2.0, "sin_point_pos domain");
  if (x == 0.0) return I(0.0, 0.0);
  I xi(x), x2 = sq(xi);
  I term = xi, sum = xi, prev_even = xi;
  for (int k = 1; k <= 11; ++k) {
    term = term * (-x2) / I(double(2*k * (2*k + 1)));
    sum = sum + term;
    if (k == 10) prev_even = sum;
  }
  require(sum.l <= prev_even.h, "sin alternating bracket failed");
  return I(std::max(0.0, sum.l), prev_even.h);
}

inline I cos_point_pos(double x) {
  require(x >= 0.0 && x <= 2.0, "cos_point_pos domain");
  if (x == 0.0) return I(1.0, 1.0);
  I xi(x), x2 = sq(xi);
  I term(1.0), sum(1.0), prev_even(1.0);
  for (int k = 1; k <= 11; ++k) {
    term = term * (-x2) / I(double((2*k - 1) * (2*k)));
    sum = sum + term;
    if (k == 10) prev_even = sum;
  }
  require(sum.l <= prev_even.h, "cos alternating bracket failed");
  return I(sum.l, prev_even.h);
}

inline I sin_i_q1(I x) {
  require(x.l >= 0.0 && x.h <= 1.58, "sin_i_q1 domain");
  I s_lo = sin_point_pos(x.l);
  I s_hi = sin_point_pos(x.h);
  if (x.h <= 1.570796) return I(s_lo.l, std::min(1.0, s_hi.h));
  return I(std::min(s_lo.l, s_hi.l), 1.0);
}

inline I cos_i_q1(I x) {
  require(x.l >= 0.0 && x.h <= 1.58, "cos_i_q1 domain");
  I c_lo = cos_point_pos(x.l);
  I c_hi = cos_point_pos(x.h);
  return I(std::max(0.0, c_hi.l), c_lo.h);
}

inline I verified_pi() {
  double p_lo = 3.14159265358970;
  double p_hi = 3.14159265358989;
  I a_lo = I(p_lo) / I(6.0);
  I a_hi = I(p_hi) / I(6.0);
  require(cos_point_pos(a_hi.h).l > 0.8, "cos positivity check for pi failed");
  require(sin_point_pos(a_lo.h).h < 0.5, "pi lower bound verification failed");
  require(sin_point_pos(a_hi.l).l > 0.5, "pi upper bound verification failed");
  return I(p_lo, p_hi);
}

inline I s_cubic(I t, I a, I b) { return t * sq(a + b * t); }

inline I iota_point(double s, I a, I b) {
  require(s >= 0.0, "iota_point negative s");
  if (s == 0.0) return I(0.0, 0.0);
  double ad = mid_i(a), bd = mid_i(b);
  double t = std::min(s / (ad * ad), std::cbrt(s / (bd * bd)));
  for (int it = 0; it < 16; ++it) {
    double k = ad + bd * t;
    t -= (t * k * k - s) / (k * (ad + 3.0 * bd * t));
    if (t < 0.0) t = 0.0;
  }
  double eps = 1e-14 * (1.0 + t);
  for (int it = 0; it < 55; ++it, eps *= 2.0) {
    double lo = std::max(0.0, dn(t - eps));
    double hi = up(t + eps);
    if (s_cubic(I(lo), a, b).h <= s && s_cubic(I(hi), a, b).l >= s) {
      return I(lo, hi);
    }
  }
  throw std::runtime_error("iota_point failed to bracket root");
}

inline I iota_i(I s, I a, I b) {
  require(s.h >= 0.0, "iota_i negative interval");
  double lo_s = std::max(0.0, s.l);
  return I(iota_point(lo_s, a, b).l, iota_point(s.h, a, b).h);
}

// ============================================================================
// 3. Truncated Taylor Jet Jet<D> over Outward Interval I
// ============================================================================
template <int D>
struct Jet {
  std::array<I, D + 1> c;
  Jet() { c.fill(I(0.0)); }
  explicit Jet(I v) { c.fill(I(0.0)); c[0] = v; }
  static Jet var(I x0) {
    Jet r(x0);
    if constexpr (D >= 1) r.c[1] = I(1.0);
    return r;
  }
};

template <int D>
inline Jet<D> operator+(const Jet<D>& x, const Jet<D>& y) {
  Jet<D> r;
  for (int k = 0; k <= D; ++k) r.c[k] = x.c[k] + y.c[k];
  return r;
}

template <int D>
inline Jet<D> operator-(const Jet<D>& x, const Jet<D>& y) {
  Jet<D> r;
  for (int k = 0; k <= D; ++k) r.c[k] = x.c[k] - y.c[k];
  return r;
}

template <int D>
inline Jet<D> operator-(const Jet<D>& x) {
  Jet<D> r;
  for (int k = 0; k <= D; ++k) r.c[k] = -x.c[k];
  return r;
}

template <int D>
inline Jet<D> operator*(const Jet<D>& x, const Jet<D>& y) {
  Jet<D> r;
  for (int k = 0; k <= D; ++k) {
    I s(0.0);
    for (int j = 0; j <= k; ++j) s = s + x.c[j] * y.c[k - j];
    r.c[k] = s;
  }
  return r;
}

template <int D>
inline Jet<D> operator*(I a, const Jet<D>& x) {
  Jet<D> r;
  for (int k = 0; k <= D; ++k) r.c[k] = a * x.c[k];
  return r;
}

template <int D>
inline Jet<D> operator*(const Jet<D>& x, I a) {
  return a * x;
}

template <int D>
inline Jet<D> inv_jet(const Jet<D>& p) {
  Jet<D> q;
  I inv0 = I(1.0) / p.c[0];
  q.c[0] = inv0;
  for (int k = 1; k <= D; ++k) {
    I s(0.0);
    for (int j = 1; j <= k; ++j) s = s + p.c[j] * q.c[k - j];
    q.c[k] = -s * inv0;
  }
  return q;
}

template <int D>
inline Jet<D> operator/(const Jet<D>& x, const Jet<D>& y) { return x * inv_jet(y); }

template <int D>
inline Jet<D> sq_jet(const Jet<D>& x) { return x * x; }

template <int D>
inline Jet<D> expneg_jet(const Jet<D>& u) {
  I e0 = expneg(u.c[0]);
  Jet<D> du = u;
  du.c[0] = I(0.0);
  Jet<D> p(I(1.0)), sum(I(1.0));
  I fac(1.0);
  for (int m = 1; m <= D; ++m) {
    p = p * (-du);
    fac = fac * I(double(m));
    sum = sum + (I(1.0) / fac) * p;
  }
  return e0 * sum;
}

template <int D>
inline void sincos_jet_q1(const Jet<D>& u, Jet<D>& s_out, Jet<D>& c_out) {
  I s0 = sin_i_q1(u.c[0]);
  I c0 = cos_i_q1(u.c[0]);
  s_out = Jet<D>(s0);
  c_out = Jet<D>(c0);
  for (int k = 1; k <= D; ++k) {
    I acc_s(0.0), acc_c(0.0);
    for (int j = 1; j <= k; ++j) {
      I juj = I(double(j)) * u.c[j];
      acc_s = acc_s + juj * c_out.c[k - j];
      acc_c = acc_c - juj * s_out.c[k - j];
    }
    I inv_k = I(1.0) / I(double(k));
    s_out.c[k] = acc_s * inv_k;
    c_out.c[k] = acc_c * inv_k;
  }
}

template <int D>
inline Jet<D> iota_jet(const Jet<D>& sig, I a, I b) {
  I t0 = iota_i(sig.c[0], a, b);
  I k0 = a + b * t0;
  I p1 = k0 * (a + I(3.0) * b * t0);
  I p2 = I(2.0) * a * b + I(3.0) * sq(b) * t0;
  I p3 = sq(b);
  I inv_p1 = I(1.0) / p1;

  Jet<D> dt;
  for (int k = 1; k <= D; ++k) {
    I dt2_k(0.0);
    for (int i = 1; i <= k - 1; ++i) dt2_k = dt2_k + dt.c[i] * dt.c[k - i];
    I dt3_k(0.0);
    for (int i = 1; i <= k - 2; ++i) {
      I inner(0.0);
      for (int j = 1; j <= k - 1 - i; ++j) inner = inner + dt.c[j] * dt.c[k - i - j];
      dt3_k = dt3_k + dt.c[i] * inner;
    }
    dt.c[k] = (sig.c[k] - p2 * dt2_k - p3 * dt3_k) * inv_p1;
  }
  dt.c[0] = t0;
  return dt;
}

inline Jet<4> compose_c4_jet4(const Jet<4>& v, I f0, I fp, I fpp, I f3, I f4) {
  Jet<4> dv = v;
  dv.c[0] = I(0.0);
  Jet<4> dv2 = dv * dv;
  Jet<4> dv3 = dv2 * dv;
  Jet<4> dv4 = dv2 * dv2;
  return Jet<4>(f0) + fp * dv + (fpp / I(2.0)) * dv2 +
         (f3 / I(6.0)) * dv3 + (f4 / I(24.0)) * dv4;
}

inline I panel_int_jet4(const Jet<4>& j_mid, I c4_box, I delta) {
  I d2 = sq(delta);
  I d3 = d2 * delta;
  I d5 = d3 * d2;
  return I(2.0) * delta * j_mid.c[0] + (I(2.0) / I(3.0)) * d3 * j_mid.c[2] +
         (I(2.0) / I(5.0)) * d5 * c4_box;
}

// ============================================================================
// 4. Rigorous 1D Kernel Table & R ~ Exp(1) Integrators per Profile Row
// ============================================================================
struct ProfileSpec {
  std::string name;
  int64_t eps_num, eps_den;
  int64_t a_num, a_den;
  int64_t b_num, b_den;
  int64_t b4_num, b4_den;
};

struct KEval {
  I Phi, P, Pp, P3, P4;   // Phi, Phi', Phi'', Phi''', Phi^(4)
  I g, gp, gpp, g3, g4;   // g (<0), g' (>0), g'' (<0), g''' (>0), g^(4) (<0)
};

struct UStats {
  I Bu_m_B0;  // B(u) - B0
  I Bp;       // B'(u)
  I A0;       // -B''(u) > 0
  I Ku;       // K(u) = 2*u*A0(u) + u^2*A0'(u)
  I lam;      // lambda(u) = E_R[R g(uR)] < 0
  I uBpp_p;   // (u B''(u))' = E_R[R^2(R - 2) Phi''(uR)]
  I lamp;     // lambda'(u)  = E_R[R^2 g'(uR)] > 0
};

struct Mid3D {
  double c0, z1, z2;
  I Ic;
  I dIc_dc, dIc_dz1, dIc_dz2;
  I Tc_re, Tc_im;
  I dTcre_dc, dTcre_dz1, dTcre_dz2;
  I dTcim_dc, dTcim_dz1, dTcim_dz2;
};

struct RowKernels {
  ProfileSpec spec;
  I eps, a, b, b4, pi_val, sqrt_pi, B0, EL2;
  std::array<I, 5> G_cap;  // (-1)^(m+1) g^(m)(0) > 0
  std::array<I, 5> P_cap;  // (-1)^m Phi^(m+1)(0) > 0

  std::vector<double> v_nodes;
  std::vector<I> H_n;    // -g(v) > 0
  std::vector<I> nHp_n;  // g'(v) > 0
  std::vector<I> Hpp_n;  // -g''(v) > 0
  std::vector<I> Phi_n;  // Phi(v) >= 0
  std::vector<I> P_n;    // Phi'(v) > 0
  std::vector<I> nPp_n;  // -Phi''(v) > 0

  // R-panel mesh on [0, 36]: (midpoint rm, half-width dr)
  std::vector<std::pair<I, I>> r_panels;
  std::array<I, 5> E_tail36;  // int_{36}^inf R^p e^{-R} dR for p=0..4

  // Exact local-exponential-moment bins on [0, 36] for fast 11-digit u-integrals
  struct UBin {
    double rm, r_lo, r_hi;
    I m0_0, m0_1, m0_s2h;    // int e^{-R} * {1, s, s^2/2}
    I m1_0, m1_1, m1_s2h;    // int R e^{-R} * {1, s, s^2/2}
    I m2_0, m2_abs1;         // int R^2 e^{-R}, int R^2 |s| e^{-R}
    I m_r2_rm2;              // int R^2(R - 2) e^{-R} dR
    I mwK_0, mwK_1, mwK_s2h; // int wK(R) e^{-R} * {1, s}, int |wK(R)| (s^2/2) e^{-R}
  };
  std::vector<UBin> u_bins;

  struct MidBin {
    double rm, r_lo, r_hi;
    I m0_0, m0_1, m0_2, m0_abs3; // int_{r_lo}^{r_hi} e^{-R} * {1, s, s^2, |s|^3} dR
  };
  std::vector<MidBin> mid_bins;

  template <int D>
  void eval_h0_f0p_jet(const Jet<D>& sig, Jet<D>& h0_out, Jet<D>& neg_f0p_out) const {
    Jet<D> t = iota_jet<D>(sig, a, b);
    Jet<D> et = expneg_jet<D>(t);
    Jet<D> k = Jet<D>(a) + b * t;
    Jet<D> k3 = Jet<D>(a) + (I(3.0) * b) * t;
    h0_out = et / sq_jet<D>(k);
    neg_f0p_out = et / (k * k3);
  }

  explicit RowKernels(const ProfileSpec& sp) : spec(sp) {
    eps = rat_i(sp.eps_num, sp.eps_den);
    a = rat_i(sp.a_num, sp.a_den);
    b = rat_i(sp.b_num, sp.b_den);
    b4 = rat_i(sp.b4_num, sp.b4_den);
    pi_val = verified_pi();
    sqrt_pi = sqrti(pi_val);
    B0 = sqrt_pi * (a + rat_i(3, 2) * b);
    EL2 = sq(a) + I(4.0) * a * b + I(6.0) * sq(b);

    require((I(3.0) * b).h < a.l, "3*b < a required for elementary convexity");
    require(sq(a).l > rat_i(5, 16).h, "a^2 > 5/16 required for Regime I slope 8/5");

    // Step A: Rigorous upper bounds on J_m(0) and L_m(0) for m=0..5 via left-endpoint
    // Riemann sum on y in [0, 24] (dy = 1/256) + exact y >= 24 tail.
    const int NY0 = 24 * 256;
    const I dy0 = rat_i(1, 256);
    std::array<I, 6> sum_h{}, sum_f{};
    for (int m = 0; m < 6; ++m) { sum_h[m] = I(0.0); sum_f[m] = I(0.0); }
    for (int i = 0; i < NY0; ++i) {
      I y_lo = I(double(i)) * dy0;
      Jet<5> sig = Jet<5>::var(sq(y_lo));
      Jet<5> h0j, nf0pj;
      eval_h0_f0p_jet<5>(sig, h0j, nf0pj);
      double fac = 1.0;
      for (int m = 0; m <= 5; ++m) {
        if (m > 0) fac *= double(m);
        double sgn = (m % 2 == 0) ? 1.0 : -1.0;
        I term_h = I(sgn * fac) * h0j.c[m];
        I term_f = I(sgn * fac) * nf0pj.c[m];
        require(term_h.h >= 0.0 && term_f.h >= 0.0, "complete monotonicity sign check");
        sum_h[m] = sum_h[m] + dy0 * I(0.0, term_h.h);
        sum_f[m] = sum_f[m] + dy0 * I(0.0, term_f.h);
      }
    }
    {
      Jet<5> sig24 = Jet<5>::var(I(576.0));
      Jet<5> h24, f24;
      eval_h0_f0p_jet<5>(sig24, h24, f24);
      I t24 = iota_i(I(576.0), a, b);
      I tail0 = rat_i(3, 48) * expneg(t24);
      sum_h[0] = sum_h[0] + I(0.0, tail0.h);
      sum_f[0] = sum_f[0] + I(0.0, tail0.h);
      double fac_prev = 1.0;
      for (int m = 1; m <= 5; ++m) {
        if (m > 1) fac_prev *= double(m - 1);
        double sgn_prev = ((m - 1) % 2 == 0) ? 1.0 : -1.0;
        I prev_h = I(sgn_prev * fac_prev) * h24.c[m - 1] / I(48.0);
        I prev_f = I(sgn_prev * fac_prev) * f24.c[m - 1] / I(48.0);
        sum_h[m] = sum_h[m] + I(0.0, std::max(0.0, prev_h.h));
        sum_f[m] = sum_f[m] + I(0.0, std::max(0.0, prev_f.h));
      }
    }
    const int64_t wg_num[5] = {1, 3, 5, 35, 63};
    const int64_t wg_den[5] = {2, 8, 16, 128, 256};
    const int64_t wp_num[5] = {1, 1, 1, 5, 7};
    const int64_t wp_den[5] = {1, 4, 8, 64, 128};
    for (int m = 0; m < 5; ++m) {
      G_cap[m] = I(0.0, (rat_i(wg_num[m], wg_den[m]) * sum_h[m]).h);
      P_cap[m] = I(0.0, (rat_i(wp_num[m], wp_den[m]) * sum_f[m]).h);
    }

    // Step B: Tabulate J0, J1, J2 and L0, L1, L2 on v_nodes covering [0, 256]
    v_nodes.clear();
    for (int i = 0; i <= 100; ++i) v_nodes.push_back(0.0005 * i);
    for (int i = 1; i <= 95; ++i) v_nodes.push_back(0.05 + 0.005 * i);
    for (int i = 1; i <= 75; ++i) v_nodes.push_back(0.525 + 0.025 * i);
    {
      double cur = 2.4;
      while (cur < 256.0) {
        double step = std::min(1.0, 0.035 * cur);
        cur = std::min(256.0, cur + step);
        v_nodes.push_back(cur);
      }
    }
    const size_t N = v_nodes.size();
    std::vector<I> J0(N), J1(N), J2(N), L0(N), L1(N), L2(N);

    // Graded dyadic y-panels on [0, 24] (all endpoints & midpoints exact in binary64!):
    std::vector<std::pair<double, double>> y_panels;
    auto add_y_seg = [&](double y0, double y1, int np) {
      double h = (y1 - y0) / double(np);
      for (int i = 0; i < np; ++i) {
        double lo = y0 + i * h, hi = y0 + (i + 1) * h;
        y_panels.push_back({0.5 * (lo + hi), 0.5 * h});
      }
    };
    add_y_seg(0.0, 2.0, 256);   // dy_half = 1/256
    add_y_seg(2.0, 6.0, 128);   // dy_half = 1/64
    add_y_seg(6.0, 24.0, 144);  // dy_half = 1/16

    for (size_t idx = 0; idx < N; ++idx) {
      I s_val(v_nodes[idx]);
      I acc_J0(0.0), acc_J1(0.0), acc_J2(0.0);
      I acc_L0(0.0), acc_L1(0.0), acc_L2(0.0);
      for (const auto& yp : y_panels) {
        I ym(yp.first);
        I dy_half(yp.second);
        I y_box = make_i(yp.first - yp.second, yp.first + yp.second);

        auto eval_6_y = [&](I y_arg, Jet<4>& j_h0, Jet<4>& j_nh0p, Jet<4>& j_h0pp,
                            Jet<4>& j_nf0p, Jet<4>& j_f0pp, Jet<4>& j_nf0ppp) {
          Jet<4> sig(sq(y_arg) + s_val);
          sig.c[1] = I(2.0) * y_arg;
          sig.c[2] = I(1.0);
          Jet<4> t = iota_jet<4>(sig, a, b);
          Jet<4> et = expneg_jet<4>(t);
          Jet<4> k = Jet<4>(a) + b * t;
          Jet<4> k3 = Jet<4>(a) + (I(3.0) * b) * t;
          Jet<4> sp = k * k3;
          Jet<4> spp = Jet<4>(I(4.0) * a * b) + (I(6.0) * sq(b)) * t;
          Jet<4> inv_sp = inv_jet<4>(sp);
          Jet<4> inv_k = inv_jet<4>(k);
          Jet<4> inv_k2 = sq_jet<4>(inv_k);

          j_h0 = et * inv_k2;
          Jet<4> kp2b = k + Jet<4>(I(2.0) * b);
          j_nh0p = et * kp2b * inv_k2 * inv_k * inv_sp;
          Jet<4> num_h2 = (k + Jet<4>(b)) * (k * sp) + kp2b * ((I(3.0) * b) * sp + k * spp);
          j_h0pp = et * num_h2 * sq_jet<4>(inv_k2) * sq_jet<4>(inv_sp) * inv_sp;

          j_nf0p = et * inv_sp;
          Jet<4> sp_p_spp = sp + spp;
          j_f0pp = et * sp_p_spp * sq_jet<4>(inv_sp) * inv_sp;
          Jet<4> num_f3 = (sp - Jet<4>(I(6.0) * sq(b))) * sp + I(3.0) * sp_p_spp * spp;
          j_nf0ppp = et * num_f3 * sq_jet<4>(sq_jet<4>(inv_sp)) * inv_sp;
        };

        Jet<4> mh0, mnh0p, mh0pp, mnf0p, mf0pp, mnf0ppp;
        Jet<4> bh0, bnh0p, bh0pp, bnf0p, bf0pp, bnf0ppp;
        eval_6_y(ym, mh0, mnh0p, mh0pp, mnf0p, mf0pp, mnf0ppp);
        eval_6_y(y_box, bh0, bnh0p, bh0pp, bnf0p, bf0pp, bnf0ppp);

        acc_J0 = acc_J0 + panel_int_jet4(mh0, bh0.c[4], dy_half);
        acc_J1 = acc_J1 + panel_int_jet4(mnh0p, bnh0p.c[4], dy_half);
        acc_J2 = acc_J2 + panel_int_jet4(mh0pp, bh0pp.c[4], dy_half);
        acc_L0 = acc_L0 + panel_int_jet4(mnf0p, bnf0p.c[4], dy_half);
        acc_L1 = acc_L1 + panel_int_jet4(mf0pp, bf0pp.c[4], dy_half);
        acc_L2 = acc_L2 + panel_int_jet4(mnf0ppp, bnf0ppp.c[4], dy_half);
      }
      I sig_t = I(576.0) + s_val;
      I t_tail = iota_i(sig_t, a, b);
      I et_t = expneg(t_tail);
      I kt = a + b * t_tail;
      I spt = kt * (a + I(3.0) * b * t_tail);
      I sppt = I(4.0) * a * b + I(6.0) * sq(b) * t_tail;
      I tail_base = rat_i(3, 48) * et_t;
      I h0_t = et_t / sq(kt);
      I nh0p_t = et_t * (kt + I(2.0) * b) / (sq(kt) * kt * spt);
      I nf0p_t = et_t / spt;
      I f0pp_t = et_t * (spt + sppt) / (sq(spt) * spt);

      J0[idx] = make_i(std::max(0.0, acc_J0.l), (acc_J0 + I(0.0, tail_base.h)).h);
      J1[idx] = make_i(std::max(0.0, acc_J1.l), (acc_J1 + I(0.0, (h0_t / I(48.0)).h)).h);
      J2[idx] = make_i(std::max(0.0, acc_J2.l), (acc_J2 + I(0.0, (nh0p_t / I(48.0)).h)).h);
      L0[idx] = make_i(std::max(0.0, acc_L0.l), (acc_L0 + I(0.0, tail_base.h)).h);
      L1[idx] = make_i(std::max(0.0, acc_L1.l), (acc_L1 + I(0.0, (nf0p_t / I(48.0)).h)).h);
      L2[idx] = make_i(std::max(0.0, acc_L2.l), (acc_L2 + I(0.0, (f0pp_t / I(48.0)).h)).h);
    }

    auto eval_JL = [&](I s_iv,
                       I& j0_o, I& j1_o, I& j2_o,
                       I& l0_o, I& l1_o, I& l2_o) {
      double slo = std::max(0.0, s_iv.l);
      double shi = std::min(256.0, s_iv.h);
      auto it0 = std::upper_bound(v_nodes.begin(), v_nodes.end(), slo);
      size_t i0 = (it0 == v_nodes.begin()) ? 0 : std::min(N - 2, size_t(it0 - v_nodes.begin() - 1));
      auto it1 = std::upper_bound(v_nodes.begin(), v_nodes.end(), shi);
      size_t i1 = (it1 == v_nodes.begin()) ? 0 : std::min(N - 2, size_t(it1 - v_nodes.begin() - 1));

      if (i0 == i1) {
        I s_cl(slo, std::max(slo, shi));
        I x0(v_nodes[i0]), x1(v_nodes[i0 + 1]);
        I h = x1 - x0;
        I tau = (s_cl - x0) / h;
        tau.l = std::max(0.0, tau.l); tau.h = std::min(1.0, tau.h);
        I t2 = sq(tau), t3 = t2 * tau;
        I h00 = I(2.0)*t3 - I(3.0)*t2 + I(1.0);
        I h10 = t3 - I(2.0)*t2 + tau;
        I h01 = -I(2.0)*t3 + I(3.0)*t2;
        I h11 = t3 - t2;
        I h4_384 = sq(sq(h)) / I(384.0);
        I eJ0 = h4_384 * sum_h[4];
        I eJ1 = h4_384 * sum_h[5];
        I eL0 = h4_384 * sum_f[4];
        I eL1 = h4_384 * sum_f[5];

        auto cvx_dec = [&](I herm, const I& f0, const I& f1, const I& nf0p, const I& nf1p) {
          I ch = (I(1.0) - tau)*f0 + tau*f1;
          I tg0 = f0 - nf0p*(s_cl - x0);
          I tg1 = f1 - nf1p*(s_cl - x1);
          double lo_b = std::max(herm.l, std::max(f1.l, std::max(tg0.l, tg1.l)));
          double hi_b = std::min(herm.h, std::min(f0.h, ch.h));
          return make_i(lo_b, hi_b);
        };

        I hj0 = h00*J0[i0] - h10*h*J1[i0] + h01*J0[i0+1] - h11*h*J1[i0+1] + I(-eJ0.h, eJ0.h);
        I hj1 = h00*J1[i0] - h10*h*J2[i0] + h01*J1[i0+1] - h11*h*J2[i0+1] + I(-eJ1.h, eJ1.h);
        I hl0 = h00*L0[i0] - h10*h*L1[i0] + h01*L0[i0+1] - h11*h*L1[i0+1] + I(-eL0.h, eL0.h);
        I hl1 = h00*L1[i0] - h10*h*L2[i0] + h01*L1[i0+1] - h11*h*L2[i0+1] + I(-eL1.h, eL1.h);

        j0_o = cvx_dec(hj0, J0[i0], J0[i0+1], J1[i0], J1[i0+1]);
        j1_o = cvx_dec(hj1, J1[i0], J1[i0+1], J2[i0], J2[i0+1]);
        l0_o = cvx_dec(hl0, L0[i0], L0[i0+1], L1[i0], L1[i0+1]);
        l1_o = cvx_dec(hl1, L1[i0], L1[i0+1], L2[i0], L2[i0+1]);
        j2_o = make_i(J2[i0+1].l, J2[i0].h);
        l2_o = make_i(L2[i1+1].l, L2[i0].h);
      } else {
        j0_o = make_i(J0[i1+1].l, J0[i0].h);
        j1_o = make_i(J1[i1+1].l, J1[i0].h);
        j2_o = make_i(J2[i1+1].l, J2[i0].h);
        l0_o = make_i(L0[i1+1].l, L0[i0].h);
        l1_o = make_i(L1[i1+1].l, L1[i0].h);
        l2_o = make_i(L2[i1+1].l, L2[i0].h);
      }
    };

    // Step C: Integrate over beta in [0, pi/2] (96 panels, Jet<4> around exact scalar midpoint bm)
    H_n.resize(N); nHp_n.resize(N); Hpp_n.resize(N);
    Phi_n.resize(N); P_n.resize(N); nPp_n.resize(N);
    const int NB = 96;
    const I half_pi = pi_val / I(2.0);
    const double half_pi_lo = half_pi.l;
    const double half_pi_rem = up(half_pi.h - half_pi.l);
    std::vector<double> b_edges(NB + 1);
    for (int ib = 0; ib <= NB; ++ib) {
      b_edges[ib] = (ib == 0) ? 0.0 : (ib == NB ? half_pi_lo : (half_pi_lo * double(ib) / double(NB)));
    }
    const I two_over_pi = I(2.0) / pi_val;
    const I four_over_pi = I(4.0) / pi_val;
    const I j3_cap(0.0, sum_h[3].h), j4_cap(0.0, sum_h[4].h), j5_cap(0.0, sum_h[5].h);
    const I l3_cap(0.0, sum_f[3].h), l4_cap(0.0, sum_f[4].h), l5_cap(0.0, sum_f[5].h);

    for (size_t idx = 0; idx < N; ++idx) {
      I v_val(v_nodes[idx]);
      I acc_H(0.0), acc_nHp(0.0), acc_Hpp(0.0), acc_P(0.0), acc_nPp(0.0);

      for (int ib = 0; ib < NB; ++ib) {
        double blo = b_edges[ib], bhi = b_edges[ib + 1];
        double bm_d = 0.5 * (blo + bhi);
        double db_h = up(std::max(bm_d - blo, bhi - bm_d));
        I bm(bm_d);
        I dbeta_half(db_h);
        I b_box = make_i(blo, bhi);

        auto eval_b = [&](I b_arg, Jet<4>& jH, Jet<4>& jnHp, Jet<4>& jP, Jet<4>& jnPp) {
          Jet<4> bj = Jet<4>::var(b_arg);
          Jet<4> sb, cb;
          sincos_jet_q1<4>(bj, sb, cb);
          Jet<4> s2 = sq_jet<4>(sb);
          Jet<4> c2 = sq_jet<4>(cb);
          Jet<4> vs2 = v_val * s2;
          vs2.c[0].l = std::max(0.0, vs2.c[0].l);
          vs2.c[0].h = std::min(256.0, vs2.c[0].h);

          I j0v, j1v, j2v, l0v, l1v, l2v;
          eval_JL(vs2.c[0], j0v, j1v, j2v, l0v, l1v, l2v);
          Jet<4> J0_b = compose_c4_jet4(vs2, j0v, -j1v, j2v, -j3_cap, j4_cap);
          Jet<4> J1_b = compose_c4_jet4(vs2, j1v, -j2v, j3_cap, -j4_cap, j5_cap);
          Jet<4> L0_b = compose_c4_jet4(vs2, l0v, -l1v, l2v, -l3_cap, l4_cap);
          Jet<4> L1_b = compose_c4_jet4(vs2, l1v, -l2v, l3_cap, -l4_cap, l5_cap);

          jH = s2 * J0_b;
          jnHp = sq_jet<4>(s2) * J1_b;
          jP = c2 * L0_b;
          jnPp = (c2 * s2) * L1_b;
        };

        Jet<4> mH, mnHp, mP, mnPp;
        Jet<4> xH, xnHp, xP, xnPp;
        eval_b(bm, mH, mnHp, mP, mnPp);
        eval_b(b_box, xH, xnHp, xP, xnPp);

        auto p_int_420 = [&](const Jet<4>& jm, const Jet<4>& jx, bool clean_c2) -> I {
          I q4 = panel_int_jet4(jm, jx.c[4], dbeta_half);
          I q0 = (I(2.0) * dbeta_half) * jx.c[0];
          double lo_b = std::max(q4.l, q0.l);
          double hi_b = std::min(q4.h, q0.h);
          if (clean_c2) {
            I q2 = (I(2.0) * dbeta_half) * jm.c[0] +
                   (rat_i(2, 3) * sq(dbeta_half) * dbeta_half) * jx.c[2];
            lo_b = std::max(lo_b, q2.l);
            hi_b = std::min(hi_b, q2.h);
          }
          return make_i(lo_b, hi_b);
        };

        acc_H   = acc_H   + p_int_420(mH,   xH,   true);
        acc_nHp = acc_nHp + p_int_420(mnHp, xnHp, false);
        acc_P   = acc_P   + p_int_420(mP,   xP,   true);
        acc_nPp = acc_nPp + p_int_420(mnPp, xnPp, false);

        // Coarse box enclosure for Hpp = -g''(v) > 0:
        I sb_box = sin_i_q1(b_box);
        I s2_box = sq(sb_box);
        I vs2_box = v_val * s2_box;
        vs2_box.l = std::max(0.0, vs2_box.l);
        vs2_box.h = std::min(256.0, vs2_box.h);
        I j0d, j1d, j2d, l0d, l1d, l2d;
        eval_JL(vs2_box, j0d, j1d, j2d, l0d, l1d, l2d);
        acc_Hpp = acc_Hpp + I(2.0) * dbeta_half * sq(s2_box) * s2_box * j2d;
      }

      // Add [0, (pi_hi - pi_lo)/2 * max_integrand] for [half_pi_lo, pi/2]:
      acc_H   = acc_H   + I(0.0, (I(half_pi_rem) * J0[0]).h);
      acc_nHp = acc_nHp + I(0.0, (I(half_pi_rem) * J1[0]).h);
      acc_Hpp = acc_Hpp + I(0.0, (I(half_pi_rem) * J2[0]).h);
      acc_P   = acc_P   + I(0.0, (I(half_pi_rem) * L0[0]).h);
      acc_nPp = acc_nPp + I(0.0, (I(half_pi_rem) * L1[0]).h);

      H_n[idx] = make_i(std::max(0.0, (two_over_pi * acc_H).l), (two_over_pi * acc_H).h);
      nHp_n[idx] = make_i(std::max(0.0, (two_over_pi * acc_nHp).l), (two_over_pi * acc_nHp).h);
      Hpp_n[idx] = make_i(std::max(0.0, (two_over_pi * acc_Hpp).l), (two_over_pi * acc_Hpp).h);
      P_n[idx] = make_i(std::max(0.0, (four_over_pi * acc_P).l), (four_over_pi * acc_P).h);
      nPp_n[idx] = make_i(std::max(0.0, (four_over_pi * acc_nPp).l), (four_over_pi * acc_nPp).h);
    }

    // Enforce proved strict monotonicity (decreasing on [0, inf)) across v_nodes:
    auto enforce_dec = [&](std::vector<I>& arr) {
      for (size_t i = 1; i < N; ++i) arr[i].h = std::min(arr[i].h, arr[i - 1].h);
      for (size_t i = N - 1; i > 0; --i) arr[i - 1].l = std::max(arr[i - 1].l, arr[i].l);
      for (size_t i = 0; i < N; ++i) require(arr[i].l <= arr[i].h, "monotone node enclosure invalid");
    };
    enforce_dec(H_n);
    enforce_dec(nHp_n);
    enforce_dec(Hpp_n);
    enforce_dec(P_n);
    enforce_dec(nPp_n);

    // Integrate Phi(v) = int_0^v Phi'(w) dw via cubic Hermite + min(4th, 2nd) Peano remainder,
    // intersected with Lemma 2.1's global sandwich 2*sqrt(v)-B0 <= Phi(v) <= min(2*sqrt(v), 2*sqrt(v)-B0+EL2/sqrt(v))!
    Phi_n[0] = I(0.0, 0.0);
    for (size_t i = 0; i + 1 < N; ++i) {
      I h = I(v_nodes[i + 1]) - I(v_nodes[i]);
      I h2 = sq(h);
      I h5_720 = h2 * h2 * h / I(720.0);
      double err4 = (h5_720 * P_cap[3]).h;
      double d_nPp = std::max(0.0, up(nPp_n[i].h - nPp_n[i + 1].l));
      double err2 = (rat_i(1, 12) * h2 * I(0.0, d_nPp)).h;
      double err_min = std::min(err4, err2);
      I step_int = rat_i(1, 2) * h * (P_n[i] + P_n[i + 1]) +
                   rat_i(1, 12) * h2 * ((-nPp_n[i]) - (-nPp_n[i + 1])) +
                   I(-err_min, err_min);
      I raw = Phi_n[i] + step_int;
      I sv = sqrti(I(v_nodes[i + 1]));
      I lo_lem = I(2.0) * sv - B0;
      I hi_lem1 = I(2.0) * sv;
      I hi_lem2 = I(2.0) * sv - B0 + EL2 / sv;
      Phi_n[i + 1] = make_i(std::max(Phi_n[i].l, std::max(raw.l, lo_lem.l)),
                            std::min(raw.h, std::min(hi_lem1.h, hi_lem2.h)));
    }

    // Step D: Build 176-panel R-mesh on [0, 36] + closed-form tail moments at R=36
    r_panels.clear();
    auto add_r_segment = [&](double r0, double r1, int np) {
      double h = (r1 - r0) / double(np);
      for (int i = 0; i < np; ++i) {
        double lo = r0 + i * h;
        double hi = (i + 1 == np) ? r1 : (r0 + (i + 1) * h);
        double m = 0.5 * (lo + hi);
        r_panels.push_back({I(m), rat_i(int64_t(std::llround((r1 - r0) * 1000)), int64_t(2 * np * 1000))});
        // Ensure exact coverage [lo, hi] subset [m - dr, m + dr]:
        double dr_exact = std::max(m - lo, hi - m);
        r_panels.back().second = I(dn(dr_exact), up(dr_exact));
      }
    };
    add_r_segment(0.0, 2.4, 64);    // h = 0.0375
    add_r_segment(2.4, 12.0, 128);  // h = 0.075
    add_r_segment(12.0, 36.0, 96);  // h = 0.25

    I e36 = expneg(I(36.0));
    I r36(36.0);
    E_tail36[0] = e36;
    E_tail36[1] = (r36 + I(1.0)) * e36;
    E_tail36[2] = (sq(r36) + I(2.0)*r36 + I(2.0)) * e36;
    E_tail36[3] = (sq(r36)*r36 + I(3.0)*sq(r36) + I(6.0)*r36 + I(6.0)) * e36;
    E_tail36[4] = (sq(sq(r36)) + I(4.0)*sq(r36)*r36 + I(12.0)*sq(r36) + I(24.0)*r36 + I(24.0)) * e36;

    // Precompute 4096 exact local-moment bins on [0, 36] (dr = 9/2048 exact in binary64!):
    const int NB_U = 4096;
    const double dr_u = 36.0 / double(2 * NB_U);  // 9 / 2048
    u_bins.resize(NB_U);
    I d1(dr_u), d2 = sq(d1), d3 = d2 * d1, d5 = d3 * d2, d7 = d5 * d2;
    // int_{-d}^d e^{-s} ds       = 2*d + d^3/3 + d^5/60 + [0, 2]*d^7/2520
    // int_{-d}^d s e^{-s} ds     = -2*d^3/3 - d^5/15 - [0, 2]*d^7/630
    // int_{-d}^d (s^2/2) e^{-s}  = d^3/3 + d^5/20 + [0, 2]*d^7/720
    // int_{-d}^d (s^3/6) e^{-s}  = -d^5/15 - [0, 2]*d^7/252
    // int_{-d}^d (s^4/24) e^{-s} = d^5/60 + [0, 2]*d^7/1680
    I I_e0 = I(2.0)*d1 + d3/I(3.0) + d5/I(60.0) + I(0.0, 1.0)*d7/I(1260.0);
    I I_e1 = -I(2.0)*d3/I(3.0) - d5/I(15.0) - I(0.0, 1.0)*d7/I(210.0);
    I I_e2 = I(2.0)*d3/I(3.0) + d5/I(5.0) + I(0.0, 1.0)*d7/I(42.0);
    I I_e3 = -I(2.0)*d5/I(5.0) - I(0.0, 2.0)*d7/I(21.0);
    I I_e4 = I(2.0)*d5/I(5.0) + I(0.0, 2.0)*d7/I(7.0);
    I I_e5 = -I(2.0)*d7/I(7.0) * I(1.0, 1.01);                            // int s^5 e^{-s}

    for (int k = 0; k < NB_U; ++k) {
      double lo = k * (2.0 * dr_u), hi = (k + 1) * (2.0 * dr_u);
      double rm_d = (2 * k + 1) * dr_u;
      I rm_i(rm_d);
      I erm = expneg(rm_i);
      UBin& ub = u_bins[k];
      ub.rm = rm_d; ub.r_lo = lo; ub.r_hi = hi;

      ub.m0_0   = erm * I_e0;
      ub.m0_1   = erm * I_e1;
      ub.m0_s2h = erm * (I_e2 / I(2.0));

      // R = rm + s:
      ub.m1_0   = erm * (rm_i * I_e0 + I_e1);
      ub.m1_1   = erm * (rm_i * I_e1 + I_e2);
      ub.m1_s2h = erm * ((rm_i * I_e2 + I_e3) / I(2.0));
      ub.m1_s2h.l = std::max(0.0, ub.m1_s2h.l);

      // R^2 = rm^2 + 2*rm*s + s^2, and R^2(R - 2) = (rm^3-2rm^2) + (3rm^2-4rm)s + (3rm-2)s^2 + s^3:
      ub.m2_0    = erm * (sq(rm_i) * I_e0 + I(2.0) * rm_i * I_e1 + I_e2);
      ub.m2_abs1 = erm * sq(I(hi)) * d2 * I(1.01);
      I u0_c = sq(rm_i)*rm_i - I(2.0)*sq(rm_i);
      I u1_c = I(3.0)*sq(rm_i) - I(4.0)*rm_i;
      I u2_c = I(3.0)*rm_i - I(2.0);
      ub.m_r2_rm2 = erm * (u0_c * I_e0 + u1_c * I_e1 + u2_c * I_e2 + I_e3);

      // wK(rm + s) = -(rm+s)^3 + 4*(rm+s)^2 - 2*(rm+s) = w0 + w1*s + w2*s^2 - s^3
      I w0 = -sq(rm_i)*rm_i + I(4.0)*sq(rm_i) - I(2.0)*rm_i;
      I w1 = -I(3.0)*sq(rm_i) + I(8.0)*rm_i - I(2.0);
      I w2 = -I(3.0)*rm_i + I(4.0);
      ub.mwK_0 = erm * (w0 * I_e0 + w1 * I_e1 + w2 * I_e2 - I_e3);
      ub.mwK_1 = erm * (w0 * I_e1 + w1 * I_e2 + w2 * I_e3 - I_e4);
      I R_iv(lo, hi);
      I wK_abs = abs_i(R_iv * (I(2.0) - sq(R_iv - I(2.0))));
      ub.mwK_s2h = I(0.0, (erm * wK_abs * (I_e2 / I(2.0))).h);
      (void)I_e5;
    }

    // Precompute graded exact local-moment bins on [0, 36] for eval_mid_3d:
    // [0, 6] with half-width 1/128 (384 bins) + [6, 36] with half-width 1/32 (480 bins) = 864 bins!
    mid_bins.clear();
    auto add_mid_seg = [&](double r0, double r1, int nb) {
      double dr_m = (r1 - r0) / double(2 * nb);
      I dm1(dr_m), dm2 = sq(dm1), dm3 = dm2 * dm1, dm4 = sq(dm2), dm5 = dm3 * dm2, dm7 = dm5 * dm2;
      I M_e0 = I(2.0)*dm1 + dm3/I(3.0) + dm5/I(60.0) + I(0.0, 1.0)*dm7/I(1260.0);
      I M_e1 = -I(2.0)*dm3/I(3.0) - dm5/I(15.0) - I(0.0, 1.0)*dm7/I(210.0);
      I M_e2 = I(2.0)*dm3/I(3.0) + dm5/I(5.0) + I(0.0, 1.0)*dm7/I(42.0);
      // int_{-d}^d |s|^3 e^{-s} ds = d^4/2 + d^6/6 + ... <= (d^4/2)*(1 + d^2) for d <= 1/32:
      I M_abs3 = I(0.0, ((dm4 / I(2.0)) * (I(1.0) + dm2)).h);
      for (int k = 0; k < nb; ++k) {
        double lo = r0 + k * (2.0 * dr_m), hi = r0 + (k + 1) * (2.0 * dr_m);
        double rm_d = r0 + (2 * k + 1) * dr_m;
        I erm = expneg(I(rm_d));
        mid_bins.push_back({rm_d, lo, hi, erm * M_e0, erm * M_e1, erm * M_e2,
                            I(0.0, (erm * M_abs3).h)});
      }
    };
    add_mid_seg(0.0, 5.0, 160);   // dr = 1/64
    add_mid_seg(5.0, 14.0, 72);   // dr = 1/16
    add_mid_seg(14.0, 36.0, 44);  // dr = 1/4
  }

  // Rigorous evaluation of Phi, g and derivatives up to order 4 on any interval v_iv >= 0
  KEval eval_kernels(I v_iv) const {
    double vlo = std::max(0.0, v_iv.l);
    double vhi = std::max(vlo, v_iv.h);
    const size_t N = v_nodes.size();

    auto eval_bounded = [&](double lo, double hi) -> KEval {
      KEval res;
      auto it0 = std::upper_bound(v_nodes.begin(), v_nodes.end(), lo);
      size_t i0 = (it0 == v_nodes.begin()) ? 0 : std::min(N - 2, size_t(it0 - v_nodes.begin() - 1));
      auto it1 = std::upper_bound(v_nodes.begin(), v_nodes.end(), hi);
      size_t i1 = (it1 == v_nodes.begin()) ? 0 : std::min(N - 2, size_t(it1 - v_nodes.begin() - 1));

      if (i0 == i1) {
        I v(lo, hi);
        I x0(v_nodes[i0]), x1(v_nodes[i0 + 1]);
        I h = x1 - x0;
        I tau = (v - x0) / h;
        tau.l = std::max(0.0, tau.l); tau.h = std::min(1.0, tau.h);
        I t2 = sq(tau), t3 = t2 * tau;
        I h00 = I(2.0)*t3 - I(3.0)*t2 + I(1.0);
        I h10 = t3 - I(2.0)*t2 + tau;
        I h01 = -I(2.0)*t3 + I(3.0)*t2;
        I h11 = t3 - t2;
        I h4_384 = sq(sq(h)) / I(384.0);

        I ePhi = h4_384 * P_cap[3];
        I eP   = h4_384 * P_cap[4];
        I eH   = h4_384 * G_cap[4];

        I hPhi = h00*Phi_n[i0] + h10*h*P_n[i0] + h01*Phi_n[i0+1] + h11*h*P_n[i0+1] + I(-ePhi.h, ePhi.h);
        I phi_ch  = (I(1.0) - tau)*Phi_n[i0] + tau*Phi_n[i0+1];
        I phi_tg0 = Phi_n[i0] + P_n[i0]*(v - x0);
        I phi_tg1 = Phi_n[i0+1] + P_n[i0+1]*(v - x1);
        res.Phi = make_i(std::max(hPhi.l, std::max(Phi_n[i0].l, phi_ch.l)),
                         std::min(hPhi.h, std::min(Phi_n[i0+1].h, std::min(phi_tg0.h, phi_tg1.h))));

        I hP   = h00*P_n[i0] - h10*h*nPp_n[i0] + h01*P_n[i0+1] - h11*h*nPp_n[i0+1] + I(-eP.h, eP.h);
        I p_ch  = (I(1.0) - tau)*P_n[i0] + tau*P_n[i0+1];
        I p_tg0 = P_n[i0] - nPp_n[i0]*(v - x0);
        I p_tg1 = P_n[i0+1] - nPp_n[i0+1]*(v - x1);
        res.P = make_i(std::max(hP.l, std::max(P_n[i0+1].l, std::max(p_tg0.l, p_tg1.l))),
                       std::min(hP.h, std::min(P_n[i0].h, p_ch.h)));

        I hH   = h00*H_n[i0] - h10*h*nHp_n[i0] + h01*H_n[i0+1] - h11*h*nHp_n[i0+1] + I(-eH.h, eH.h);
        I h_ch  = (I(1.0) - tau)*H_n[i0] + tau*H_n[i0+1];
        I h_tg0 = H_n[i0] - nHp_n[i0]*(v - x0);
        I h_tg1 = H_n[i0+1] - nHp_n[i0+1]*(v - x1);
        I H_val = make_i(std::max(hH.l, std::max(H_n[i0+1].l, std::max(h_tg0.l, h_tg1.l))),
                         std::min(hH.h, std::min(H_n[i0].h, h_ch.h)));
        res.g   = -H_val;

        // Convex decreasing nHp = g'(v) with derivative -Hpp_n:
        I gp_ch = (I(1.0) - tau)*nHp_n[i0] + tau*nHp_n[i0+1];
        I gp_tg0 = nHp_n[i0] - Hpp_n[i0]*(v - x0);
        I gp_tg1 = nHp_n[i0+1] - Hpp_n[i0+1]*(v - x1);
        res.gp = make_i(std::max(nHp_n[i0+1].l, std::max(gp_tg0.l, gp_tg1.l)), gp_ch.h);

        res.Pp  = -make_i(nPp_n[i0+1].l, nPp_n[i0].h);
        res.gpp = -make_i(Hpp_n[i0+1].l, Hpp_n[i0].h);
      } else {
        // Monotone across [v_nodes[i0], v_nodes[i1+1]] with O(1) convex/concave chord-tangent endpoints:
        I x0_a(v_nodes[i0]), x0_b(v_nodes[i0 + 1]);
        I t0 = (I(lo) - x0_a) / (x0_b - x0_a);
        t0.l = std::max(0.0, t0.l); t0.h = std::min(1.0, t0.h);
        I d1 = I(hi) - I(v_nodes[i1]);
        d1.l = std::max(0.0, d1.l);

        double phi_lo = std::max(Phi_n[i0].l, ((I(1.0) - t0)*Phi_n[i0] + t0*Phi_n[i0+1]).l);
        double phi_hi = std::min(Phi_n[i1+1].h, (Phi_n[i1] + P_n[i1]*d1).h);
        res.Phi = make_i(phi_lo, phi_hi);

        double p_lo_v = std::max(P_n[i1+1].l, (P_n[i1] - nPp_n[i1]*d1).l);
        double p_hi_v = std::min(P_n[i0].h, ((I(1.0) - t0)*P_n[i0] + t0*P_n[i0+1]).h);
        res.P = make_i(p_lo_v, p_hi_v);

        double H_lo_v = std::max(H_n[i1+1].l, (H_n[i1] - nHp_n[i1]*d1).l);
        double H_hi_v = std::min(H_n[i0].h, ((I(1.0) - t0)*H_n[i0] + t0*H_n[i0+1]).h);
        res.g = -make_i(H_lo_v, H_hi_v);

        double gp_lo_v = std::max(nHp_n[i1+1].l, (nHp_n[i1] - Hpp_n[i1]*d1).l);
        double gp_hi_v = std::min(nHp_n[i0].h, ((I(1.0) - t0)*nHp_n[i0] + t0*nHp_n[i0+1]).h);
        res.gp = make_i(gp_lo_v, gp_hi_v);

        res.Pp  = -make_i(nPp_n[i1+1].l, nPp_n[i0].h);
        res.gpp = -make_i(Hpp_n[i1+1].l, Hpp_n[i0].h);
      }
      res.P3 = P_cap[2];        // Phi''' > 0
      res.P4 = -P_cap[3];       // Phi^(4) < 0
      res.g3 = G_cap[3];        // g''' > 0
      res.g4 = -G_cap[4];       // g^(4) < 0
      return res;
    };

    auto eval_asymp = [&](double lo, double hi) -> KEval {
      KEval res;
      I sv_lo = sqrti(I(lo));
      I sv_hi = sqrti(I(hi));
      // 2*sqrt(v) - B0 <= Phi(v) <= 2*sqrt(v) - B0 + EL2/sqrt(v)
      I phi_lo = I(2.0)*sv_lo - B0;
      I phi_hi = I(2.0)*sv_hi - B0 + EL2 / sv_lo;
      res.Phi = make_i(phi_lo.l, phi_hi.h);
      res.P   = make_i(0.0, P_n.back().h);
      res.Pp  = -make_i(0.0, nPp_n.back().h);
      res.P3  = P_cap[2];
      res.P4  = -P_cap[3];
      res.g   = -make_i(0.0, H_n.back().h);
      res.gp  = make_i(0.0, nHp_n.back().h);
      res.gpp = -make_i(0.0, Hpp_n.back().h);
      res.g3  = G_cap[3];
      res.g4  = -G_cap[4];
      return res;
    };

    if (vhi <= 256.0) return eval_bounded(vlo, vhi);
    if (vlo >= 256.0) return eval_asymp(vlo, vhi);
    KEval a1 = eval_bounded(vlo, 256.0);
    KEval a2 = eval_asymp(256.0, vhi);
    KEval out;
    out.Phi = hull_i(a1.Phi, a2.Phi);
    out.P   = hull_i(a1.P, a2.P);
    out.Pp  = hull_i(a1.Pp, a2.Pp);
    out.P3  = hull_i(a1.P3, a2.P3);
    out.P4  = hull_i(a1.P4, a2.P4);
    out.g   = hull_i(a1.g, a2.g);
    out.gp  = hull_i(a1.gp, a2.gp);
    out.gpp = hull_i(a1.gpp, a2.gpp);
    out.g3  = hull_i(a1.g3, a2.g3);
    out.g4  = hull_i(a1.g4, a2.g4);
    return out;
  }

  // Enclose B(u)-B0, B'(u), A0(u)=-B''(u), K(u), lam(u) at point/interval u in [0, 0.05]
  // using the 8192 exact local-exponential-moment bins on [0, 36] + closed-form R >= 36 tails.
  UStats eval_u_stats(I u) const {
    UStats st{I(0.0), I(0.0), I(0.0), I(0.0), I(0.0), I(0.0), I(0.0)};
    const I u2 = sq(u);
    const I u2_P3_max = u2 * P_cap[2];

    for (const auto& ub : u_bins) {
      I v_mid = u * I(ub.rm);
      I v_box = make_i(std::max(0.0, (u * I(ub.r_lo)).l), std::max(0.0, (u * I(ub.r_hi)).h));
      KEval km = eval_kernels(v_mid);
      KEval kx = eval_kernels(v_box);

      // 1. B(u) - B0 = int_0^inf e^{-R} Phi(uR) dR
      st.Bu_m_B0 = st.Bu_m_B0
                   + km.Phi * ub.m0_0
                   + (u * km.P) * ub.m0_1
                   + (u2 * kx.Pp) * ub.m0_s2h;

      // 2. B'(u) = int_0^inf R e^{-R} Phi'(uR) dR
      st.Bp = st.Bp
              + km.P * ub.m1_0
              + (u * km.Pp) * ub.m1_1
              + (u2 * kx.P3) * ub.m1_s2h;

      // 3. A0(u) = -B''(u) = int_0^inf R^2 e^{-R} (-Phi''(uR)) dR
      st.A0 = st.A0 + (-kx.Pp) * ub.m2_0;

      // 4. K(u) = int_0^inf R(2 - (R-2)^2) e^{-R} Phi'(uR) dR
      double rem_Ku = (u2_P3_max * ub.mwK_s2h).h;
      st.Ku = st.Ku
              + km.P * ub.mwK_0
              + (u * km.Pp) * ub.mwK_1
              + I(-rem_Ku, rem_Ku);

      // 5. lam(u) = int_0^inf R e^{-R} g(uR) dR
      st.lam = st.lam
               + km.g * ub.m1_0
               + (u * km.gp) * ub.m1_1
               + (u2 * kx.gpp) * ub.m1_s2h;

      // 6. (u B''(u))' = int_0^inf R^2(R - 2) e^{-R} Phi''(uR) dR, lam'(u) = int_0^inf R^2 e^{-R} g'(uR) dR
      st.uBpp_p = st.uBpp_p + kx.Pp * ub.m_r2_rm2;
      st.lamp   = st.lamp   + kx.gp * ub.m2_0;
    }

    // Closed-form R >= 36 tails:
    I P0 = P_n[0];
    I nPp0 = nPp_n[0];
    I H0 = H_n[0];
    I gp0 = nHp_n[0];
    st.Bu_m_B0 = st.Bu_m_B0 + I(0.0, (u * P0 * E_tail36[1]).h);
    st.Bp      = st.Bp      + I(0.0, (P0 * E_tail36[1]).h);
    st.A0      = st.A0      + I(0.0, (nPp0 * E_tail36[2]).h);
    I tail_Ku  = P0 * E_tail36[3];
    st.Ku      = st.Ku      + I(-tail_Ku.h, 0.0);
    st.lam     = st.lam     + I(-(H0 * E_tail36[1]).h, 0.0);
    st.uBpp_p  = st.uBpp_p  + I(-(nPp0 * E_tail36[3]).h, 0.0);
    st.lamp    = st.lamp    + I(0.0, (gp0 * E_tail36[2]).h);
    return st;
  }

  // Enclose midpoint R-integrals Ic(z0), grad Ic(z0), Tc(z0), Jac Tc(z0) at (c0, z1, z2)
  // via single-pass Jet<2> weighted Mean-Value-Theorem integration against exact exponential
  // bin moments mid_bins on [0, 36] + closed-form R >= 36 tails (zero Jet<4>, zero expneg_jet!).
  Mid3D eval_mid_3d(double c0d, double z1d, double z2d) const {
    Mid3D out{};
    out.c0 = c0d; out.z1 = z1d; out.z2 = z2d;
    I c0(c0d), z1(z1d), z2(z2d);

    auto comp2 = [](const Jet<2>& v, I f0, I fp, I fpp) {
      Jet<2> dv = v; dv.c[0] = I(0.0);
      return Jet<2>(f0) + fp * dv + (fpp / I(2.0)) * (dv * dv);
    };
    auto comp3 = [](const Jet<3>& v, I f0, I fp, I fpp, I f3) {
      Jet<3> dv = v; dv.c[0] = I(0.0);
      Jet<3> dv2 = dv * dv;
      return Jet<3>(f0) + fp * dv + (fpp / I(2.0)) * dv2 + (f3 / I(6.0)) * (dv2 * dv);
    };

    for (const auto& mb : mid_bins) {
      I rm(mb.rm);
      I r_box(mb.r_lo, mb.r_hi);

      auto eval_mid2 = [&](I r_arg,
                           Jet<2>& jIc, Jet<2>& jTre, Jet<2>& jTim,
                           Jet<2>& jdI_c, Jet<2>& jdI_1, Jet<2>& jdI_2,
                           Jet<2>& jdTr_c, Jet<2>& jdTr_1, Jet<2>& jdTr_2,
                           Jet<2>& jdTi_c, Jet<2>& jdTi_1, Jet<2>& jdTi_2) {
        Jet<2> R = Jet<2>::var(r_arg);
        Jet<2> Rm2 = R - Jet<2>(I(2.0));
        Jet<2> wre = c0 * Rm2 + Jet<2>(z1);
        Jet<2> b2 = sq_jet<2>(wre) + Jet<2>(sq(z2));
        Jet<2> V = R * b2;
        V.c[0].l = std::max(0.0, V.c[0].l);
        KEval kv = eval_kernels(V.c[0]);

        Jet<2> Phi_j = comp2(V, kv.Phi, kv.P, kv.Pp);
        Jet<2> P_j   = comp2(V, kv.P, kv.Pp, kv.P3);
        Jet<2> g_j   = comp2(V, kv.g, kv.gp, kv.gpp);
        Jet<2> gp_j  = comp2(V, kv.gp, kv.gpp, kv.g3);

        jIc  = Phi_j;
        jTre = (R * wre) * g_j;
        jTim = (R * z2) * g_j;

        Jet<2> two_R_P = (I(2.0) * R) * P_j;
        jdI_1 = two_R_P * wre;
        jdI_2 = two_R_P * z2;
        jdI_c = jdI_1 * Rm2;

        Jet<2> Rg = R * g_j;
        Jet<2> two_R2_gp = (I(2.0) * sq_jet<2>(R)) * gp_j;
        jdTr_1 = Rg + two_R2_gp * sq_jet<2>(wre);
        jdTr_2 = two_R2_gp * (wre * z2);
        jdTr_c = jdTr_1 * Rm2;

        jdTi_1 = jdTr_2;
        jdTi_2 = Rg + two_R2_gp * sq(z2);
        jdTi_c = jdTi_1 * Rm2;
      };

      // At rm: Jet<2> gives exact c[0], c[1], c[2] for Ic, Tc_re, Tc_im and c[0], c[1] for slopes!
      Jet<2> mIc, mTre, mTim, mdIc, mdI1, mdI2, mdTrc, mdTr1, mdTr2, mdTic, mdTi1, mdTi2;
      eval_mid2(rm, mIc, mTre, mTim, mdIc, mdI1, mdI2, mdTrc, mdTr1, mdTr2, mdTic, mdTi1, mdTi2);

      // At r_box: Jet<3> gives c[3] for Ic, Tc_re, Tc_im (10^{-10} width at small u!) and c[2] for slopes!
      Jet<3> R3 = Jet<3>::var(r_box);
      Jet<3> Rm2_3 = R3 - Jet<3>(I(2.0));
      Jet<3> wre3 = c0 * Rm2_3 + Jet<3>(z1);
      Jet<3> b2_3 = sq_jet<3>(wre3) + Jet<3>(sq(z2));
      Jet<3> V3 = R3 * b2_3;
      V3.c[0].l = std::max(0.0, V3.c[0].l);
      KEval kvb = eval_kernels(V3.c[0]);

      Jet<3> xIc3  = comp3(V3, kvb.Phi, kvb.P, kvb.Pp, kvb.P3);
      Jet<3> g3_j  = comp3(V3, kvb.g, kvb.gp, kvb.gpp, kvb.g3);
      Jet<3> xTre3 = (R3 * wre3) * g3_j;
      Jet<3> xTim3 = (R3 * z2) * g3_j;

      // Project V3 to Jet<2> to reuse kvb without calling eval_kernels a second time!
      auto proj2 = [](const Jet<3>& j) { Jet<2> o; o.c = {j.c[0], j.c[1], j.c[2]}; return o; };
      Jet<2> R2    = proj2(R3);
      Jet<2> Rm2_2 = proj2(Rm2_3);
      Jet<2> wre2  = proj2(wre3);
      Jet<2> V2    = proj2(V3);
      Jet<2> P2_j  = comp2(V2, kvb.P, kvb.Pp, kvb.P3);
      Jet<2> g2_j  = proj2(g3_j);
      Jet<2> gp2_j = comp2(V2, kvb.gp, kvb.gpp, kvb.g3);

      Jet<2> two_R_P = (I(2.0) * R2) * P2_j;
      Jet<2> xdI1 = two_R_P * wre2;
      Jet<2> xdI2 = two_R_P * z2;
      Jet<2> xdIc = xdI1 * Rm2_2;
      Jet<2> Rg2 = R2 * g2_j;
      Jet<2> two_R2_gp = (I(2.0) * sq_jet<2>(R2)) * gp2_j;
      Jet<2> xdTr1 = Rg2 + two_R2_gp * sq_jet<2>(wre2);
      Jet<2> xdTr2 = two_R2_gp * (wre2 * z2);
      Jet<2> xdTrc = xdTr1 * Rm2_2;
      Jet<2> xdTi1 = xdTr2;
      Jet<2> xdTi2 = Rg2 + two_R2_gp * sq(z2);
      Jet<2> xdTic = xdTi1 * Rm2_2;

      auto qm3 = [&](const Jet<2>& jm, const Jet<3>& jx3) -> I {
        I lin = jm.c[0] * mb.m0_0 + jm.c[1] * mb.m0_1;
        I q0 = jx3.c[0] * mb.m0_0;
        I q2 = lin + jx3.c[2] * mb.m0_2;
        double rem3 = (abs_i(jx3.c[3]) * mb.m0_abs3).h;
        I q3 = lin + jm.c[2] * mb.m0_2 + I(-rem3, rem3);
        return make_i(std::max(q0.l, std::max(q2.l, q3.l)),
                      std::min(q0.h, std::min(q2.h, q3.h)));
      };
      auto qm2 = [&](const Jet<2>& jm, const Jet<2>& jx) -> I {
        I q0 = jx.c[0] * mb.m0_0;
        I q2 = jm.c[0] * mb.m0_0 + jm.c[1] * mb.m0_1 + jx.c[2] * mb.m0_2;
        return make_i(std::max(q0.l, q2.l), std::min(q0.h, q2.h));
      };
      out.Ic        = out.Ic        + qm3(mIc, xIc3);
      out.Tc_re     = out.Tc_re     + qm3(mTre, xTre3);
      out.Tc_im     = out.Tc_im     + qm3(mTim, xTim3);
      out.dIc_dc    = out.dIc_dc    + qm2(mdIc, xdIc);
      out.dIc_dz1   = out.dIc_dz1   + qm2(mdI1, xdI1);
      out.dIc_dz2   = out.dIc_dz2   + qm2(mdI2, xdI2);
      out.dTcre_dc  = out.dTcre_dc  + qm2(mdTrc, xdTrc);
      out.dTcre_dz1 = out.dTcre_dz1 + qm2(mdTr1, xdTr1);
      out.dTcre_dz2 = out.dTcre_dz2 + qm2(mdTr2, xdTr2);
      out.dTcim_dc  = out.dTcim_dc  + qm2(mdTic, xdTic);
      out.dTcim_dz1 = out.dTcim_dz1 + qm2(mdTi1, xdTi1);
      out.dTcim_dz2 = out.dTcim_dz2 + qm2(mdTi2, xdTi2);
    }

    // Closed-form R >= 36 tails:
    // For R >= 36: |wre| <= |c0|*R + |z1|, |b| <= |c0|*R + |z|, V <= 2*R*(c0^2*R^2 + |z|^2)
    I ac = abs_i(c0), az1 = abs_i(z1), az2 = abs_i(z2);
    I z_norm2 = sq(az1) + sq(az2);
    I P0 = P_n[0], H0 = H_n[0], gp0 = nHp_n[0];
    // Phi(V) <= P0 * V <= 2 * P0 * (c0^2 * R^3 + |z|^2 * R)
    I tail_Ic = I(2.0) * P0 * (sq(ac) * E_tail36[3] + z_norm2 * E_tail36[1]);
    out.Ic = out.Ic + I(0.0, tail_Ic.h);

    // |R * wre * g(V)| <= H0 * (|c0|*R^2 + |z1|*R)
    I tail_Tre = H0 * (ac * E_tail36[2] + az1 * E_tail36[1]);
    I tail_Tim = H0 * (az2 * E_tail36[1]);
    out.Tc_re = out.Tc_re + I(-tail_Tre.h, tail_Tre.h);
    out.Tc_im = out.Tc_im + I(-tail_Tim.h, tail_Tim.h);

    // |2 R (R-2) wre P(V)| <= 2 P0 (|c0| R^3 + |z1| R^2)
    I tail_dIc  = I(2.0) * P0 * (ac * E_tail36[3] + az1 * E_tail36[2]);
    I tail_dI1  = I(2.0) * P0 * (ac * E_tail36[2] + az1 * E_tail36[1]);
    I tail_dI2  = I(2.0) * P0 * (az2 * E_tail36[1]);
    out.dIc_dc  = out.dIc_dc  + I(-tail_dIc.h, tail_dIc.h);
    out.dIc_dz1 = out.dIc_dz1 + I(-tail_dI1.h, tail_dI1.h);
    out.dIc_dz2 = out.dIc_dz2 + I(-tail_dI2.h, tail_dI2.h);

    // For Jac(Tc): note v * g'(v) <= H0/e < H0 (since -g(v) = int e^{-tv} nu(dt) => v g'(v) = int tv e^{-tv} nu(dt) <= (1/e) int nu(dt) = -g(0)/e < H0)!
    // Let's check that! Since -g(v) is completely monotone, -g(v) = int_0^inf e^{-tv} d_nu(t) with d_nu >= 0!
    // Hence v * g'(v) = int_0^inf (t v) e^{-tv} d_nu(t) <= (1/e) int_0^inf d_nu(t) = (-g(0))/e <= H0!
    // Therefore 2 R^2 |b|^2 g'(R |b|^2) = 2 R * (V g'(V)) <= 2 R H0 !!
    // AMAZING! That keeps Jac(Tc) bounded by 3 * R * H0 instead of growing like R^4 gp0!
    (void)gp0;
    I tail_J1   = I(3.0) * H0 * E_tail36[1];
    I tail_Jc   = I(3.0) * H0 * E_tail36[2];
    out.dTcre_dc  = out.dTcre_dc  + I(-tail_Jc.h, tail_Jc.h);
    out.dTcre_dz1 = out.dTcre_dz1 + I(-tail_J1.h, tail_J1.h);
    out.dTcre_dz2 = out.dTcre_dz2 + I(-tail_J1.h, tail_J1.h);
    out.dTcim_dc  = out.dTcim_dc  + I(-tail_Jc.h, tail_Jc.h);
    out.dTcim_dz1 = out.dTcim_dz1 + I(-tail_J1.h, tail_J1.h);
    out.dTcim_dz2 = out.dTcim_dz2 + I(-tail_J1.h, tail_J1.h);
    return out;
  }
};

// ============================================================================
// 5. Certification Gates 1-5 per Profile Row
// ============================================================================
struct RowReport {
  std::string name;
  // Benchmarks / Gate 1 (6.3.7 + tail scalar bounds)
  I B0, g0, gp0, P0;
  I Ku_min, Ku_at_umax;
  I Bp_min, A0_max, abs_lam_max;

  // Gate 2 (6.3.6: p <= u/5 perturbation, constant 9/40)
  int gate2_vt_leaves = 0;
  double gate2_vt_max_excess = -1e9;  // max(LHS - v) <= 0
  int gate2_c_cells = 0;
  double gate2_min_def = 1e9;
  double gate2_max_ratio = 0.0;       // < 9/40 = 0.225

  // Gate 3 (6.3.13 + 6.3.15: unified (*_u) on f in [1/16, 1], |z| <= 4, constant 11/50)
  int gate3_leaves = 0;
  int gate3_mid3d_evals = 0;
  double gate3_min_H = 1e9;
  double gate3_min_margin = 1e9;      // min(env_22 - |N|^2/H) > 0

  // Gate 4 (6.3.13 + 6.3.15: original (*) on f in [1/16, 4/5], |z| <= 4, constant 11/50)
  int gate4_leaves = 0;
  int gate4_mid3d_evals = 0;
  double gate4_min_margin = 1e9;      // min(0.09 + 0.13*|z|^2/p - |N|^2/H) > 0

  // Gate 5 (6.3.14: small-Wick strip (†) on f in [0, 1/16], y <= 500, constant 47/200)
  int gate5_leaves = 0;
  int gate5_mid3d_evals = 0;
  double gate5_min_norm_margin = 1e9; // min(((47/200)*H + p^2*Q - |N|^2/w) / u^2) > 0
};

struct USlabTable {
  int NU;
  double u_min, u_max, du;
  std::vector<double> u_edges;
  std::vector<UStats> node_stats;  // size NU + 1

  USlabTable(const RowKernels& rk, int nu_slabs = 1024)
      : NU(nu_slabs), u_min(551.0 / 100000.0), u_max(463.0 / 10000.0) {
    u_edges.resize(NU + 1);
    node_stats.resize(NU + 1);
    // Exact rational endpoint enclosures:
    I u0_exact = rat_i(551, 100000);
    I u1_exact = rat_i(463, 10000);
    u_edges[0] = u0_exact.l;
    u_edges[NU] = u1_exact.h;
    du = (u_edges[NU] - u_edges[0]) / double(NU);
    for (int i = 1; i < NU; ++i) u_edges[i] = u_edges[0] + i * du;
    for (int i = 0; i <= NU; ++i) node_stats[i] = rk.eval_u_stats(I(u_edges[i]));
  }

  // O(1) rigorous enclosure of midpoint UStats + box intervals on [ua, ub] via
  // 3rd-order Lagrange Taylor expansion around nearest precomputed node u_edges[k]
  // using 0 <= B'''(xi) = E[R^3 Phi'''(xi R)] <= 6 * P_cap[2].h!
  void enclose_u_interval(double ua, double ub,
                          double& um_out, double& du_half_out,
                          UStats& mid_st_out,
                          I& Bp_box, I& A0_box, I& lam_box, I& uBpp_box,
                          const RowKernels& rk) const {
    int i0 = std::clamp(int((ua - u_edges[0]) / du), 0, NU - 1);
    while (i0 > 0 && u_edges[i0] > ua) --i0;
    while (i0 + 1 < NU && u_edges[i0 + 1] <= ua) ++i0;
    int i1 = std::clamp(int((ub - u_edges[0]) / du), 0, NU - 1);
    while (i1 + 1 < NU && u_edges[i1 + 1] < ub) ++i1;

    um_out = 0.5 * (ua + ub);
    du_half_out = up(std::max(um_out - ua, ub - um_out));

    // Monotone properties on [u_edges[i0], u_edges[i1+1]]:
    // Bp(u) decreasing, A0(u) = -B''(u) decreasing, lam(u) < 0 increasing!
    Bp_box  = make_i(node_stats[i1 + 1].Bp.l, node_stats[i0].Bp.h);
    A0_box  = make_i(node_stats[i1 + 1].A0.l, node_stats[i0].A0.h);
    lam_box = make_i(node_stats[i0].lam.l, node_stats[i1 + 1].lam.h);

    // Nearest node k for midpoint um_out (|um_out - u_edges[k]| <= du/2 ~ 2e-5):
    int k = std::clamp(int(std::llround((um_out - u_edges[0]) / du)), 0, NU);
    const UStats& nk = node_stats[k];
    I delta = I(um_out) - I(u_edges[k]);
    I d2 = sq(delta);
    I d3 = d2 * delta;
    I B3_iv(0.0, (I(6.0) * rk.P_cap[2]).h);  // B'''(xi) in [0, 6 * Phi'''_max]

    mid_st_out.Bu_m_B0 = nk.Bu_m_B0 + nk.Bp * delta - rat_i(1, 2) * nk.A0 * d2 + (B3_iv / I(6.0)) * d3;
    mid_st_out.Bp      = nk.Bp - nk.A0 * delta + rat_i(1, 2) * B3_iv * d2;
    I A0_tay           = nk.A0 - B3_iv * delta;
    mid_st_out.A0      = make_i(std::max(A0_box.l, A0_tay.l), std::min(A0_box.h, A0_tay.h));
    mid_st_out.Ku      = nk.Ku;   // unused in enclose_u_interval callers
    // |(u B''(u))''| <= 36 * P_cap[2].h, |lam''(u)| <= 6 * Hpp_n[0].h:
    double uBpp2_cap = (I(36.0) * rk.P_cap[2]).h;
    double lam2_cap  = (I(6.0) * rk.Hpp_n[0]).h;
    mid_st_out.uBpp_p = nk.uBpp_p + I(-uBpp2_cap, uBpp2_cap) * delta;
    mid_st_out.lam    = nk.lam + nk.lamp * delta + I(-0.5 * lam2_cap, 0.5 * lam2_cap) * d2;
    mid_st_out.lamp   = nk.lamp + I(-lam2_cap, lam2_cap) * delta;

    // Unconditional bound on |(u B''(u))'| = |-A0(u) + u B'''(u)| with 0 <= B'''(u) <= 6 * P_cap[2]:
    double uBpp_der_max = std::max(A0_box.h, (I(6.0) * I(ub) * rk.P_cap[2] - I(A0_box.l)).h);
    I um_i(um_out);
    I uBpp_mid = -um_i * mid_st_out.A0;
    I err_uBpp = I(du_half_out) * I(0.0, uBpp_der_max);
    uBpp_box = uBpp_mid + I(-err_uBpp.h, err_uBpp.h);
  }
};

// Gate 1: Certify K(u) > 0, K(0.0463) enclosure, B'(u) > 1, A0(u) < 7, |lam(u)| < 17/20
void run_gate1(const RowKernels& rk, const USlabTable& utab, RowReport& rep) {
  rep.B0  = rk.B0;
  rep.g0  = -rk.H_n[0];
  rep.gp0 = rk.nHp_n[0];
  rep.P0  = rk.P_n[0];

  // Cross-check benchmarks at peak row:
  if (rk.spec.name == "peak") {
    require(rep.B0.l < 1.37187928060087 && rep.B0.h > 1.371879280600869, "peak B0 benchmark mismatch");
    require(rep.g0.l < -0.8351359326 && rep.g0.h > -0.8351359327, "peak g(0) benchmark mismatch");
    require(rep.P0.l < 1.4319737914 && rep.P0.h > 1.4319737912, "peak Phi'(0) benchmark mismatch");
    I v0 = rat_i(403448, 10000000);
    UStats sv0 = rk.eval_u_stats(v0);
    I S_peak = rk.B0 + sv0.Bu_m_B0 - v0 / rk.eps;
    require(S_peak.l < 1.3739535257 && S_peak.h > 1.3739535256, "peak S = B(v0)-v0/eps benchmark mismatch");
  }

  // Evaluate K(463/10000) directly at exact rational interval:
  UStats s_umax = rk.eval_u_stats(rat_i(463, 10000));
  rep.Ku_at_umax = s_umax.Ku;
  if (rk.spec.name == "peak") {
    require(rep.Ku_at_umax.l > 0.166781 && rep.Ku_at_umax.h < 0.166783,
            "6.3.7 K(0.0463) in (0.166781, 0.166783) failed");
  }

  // Certify K(u) > 0 across all u-slabs via exact Lipschitz bound:
  // K'(u) = int_0^inf R^2 (2 - (R-2)^2) e^{-R} Phi''(uR) dR, and for all R >= 0,
  // |2 - (R-2)^2| <= 2 + (R-2)^2 = R^2 - 4R + 6, whose Gamma moment int R^2(R^2-4R+6)e^{-R} dR
  // = 24 - 24 + 12 = 12; hence |K'(u)| <= 12 * (-Phi''(0)) <= 12 * rk.nPp_n[0].h!
  const I LK = I(12.0) * I(0.0, rk.nPp_n[0].h);
  double ku_min = 1e9, ku_max = -1e9;
  for (int i = 0; i < utab.NU; ++i) {
    double h_half = up(0.5 * (utab.u_edges[i + 1] - utab.u_edges[i]));
    double lip_err = (LK * I(h_half)).h;
    double slab_lo = dn(0.5 * dn(utab.node_stats[i].Ku.l + utab.node_stats[i + 1].Ku.l) - lip_err);
    double slab_hi = up(std::max(utab.node_stats[i].Ku.h, utab.node_stats[i + 1].Ku.h) + lip_err);
    require(slab_lo > 0.015, "K(u) > 0 failed on u-slab");
    ku_min = std::min(ku_min, slab_lo);
    ku_max = std::max(ku_max, slab_hi);
  }
  rep.Ku_min = make_i(ku_min, ku_max);

  // Monotone endpoint bounds across [551/100000, 463/10000]:
  rep.Bp_min = I(utab.node_stats.back().Bp.l, utab.node_stats.front().Bp.h);
  rep.A0_max = I(utab.node_stats.back().A0.l, utab.node_stats.front().A0.h);
  rep.abs_lam_max = abs_i(utab.node_stats.front().lam);

  require(rep.Bp_min.l > 1.0, "B'(u) > 1 (> 4/5) failed");
  require(rep.A0_max.h < 7.0, "A0(u) < 7 failed");
  require(rep.abs_lam_max.h < 0.85, "|lambda(u)| < 17/20 failed");
}

// Gate 2: Direct perturbation certificate 6.3.6 on p <= u/5 (constant 9/40 = 0.225)
void run_gate2(const RowKernels& rk, const USlabTable& utab, RowReport& rep) {
  // Part 2A: Certify I_A(v + t) - (3/4)*E_hat[I_A((2/3)*R*((v/2)*(R-2)^2 + t))] <= v
  // on v in [11/2500, 463/10000], 0 <= t <= v/4, v + t <= 463/10000,
  // where I_A(s) = Phi'(0) - B'(s) is strictly increasing and concave!
  // Precompute 1D table of I_A(s) on s in [0, 35] so E_hat[I_A(...)] evaluates in O(1) per bin!
  // Wait: E_hat has density R e^{-R} on [0, inf); use 1536 radial bins on [0, 24] (width 1/64,
  // exact Gamma(2,1) bin mass M_1[k] = (r0+1)e^{-r0} - (r1+1)e^{-r1} > 0, discarding nonnegative tail R >= 24!).
  const int NBINS = 24 * 64;
  std::vector<double> r_lo(NBINS), r_m2_sq_lo(NBINS);
  std::vector<I> m1_bin(NBINS);
  for (int k = 0; k < NBINS; ++k) {
    double a0 = double(k) / 64.0, a1 = double(k + 1) / 64.0;
    r_lo[k] = a0;
    // Lower bound on (R - 2)^2 for R in [a0, a1]:
    if (a1 <= 2.0) r_m2_sq_lo[k] = dn((2.0 - a1) * (2.0 - a1));
    else if (a0 >= 2.0) r_m2_sq_lo[k] = dn((a0 - 2.0) * (a0 - 2.0));
    else r_m2_sq_lo[k] = 0.0;
    I ea0 = (I(a0) + I(1.0)) * expneg(I(a0));
    I ea1 = (I(a1) + I(1.0)) * expneg(I(a1));
    m1_bin[k] = make_i(std::max(0.0, (ea0 - ea1).l), (ea0 - ea1).h);
  }

  // Precompute I_A(s) = Phi'(0) - B'(s) at nodes s in [0, 20] (note max arg on R<=24, v<=0.0463 is
  // (2/3)*24*(0.02315*484 + 0.01158) = 16 * 11.22 < 180! Let's cover [0, 192]!)
  std::vector<double> s_grid;
  for (int i = 0; i <= 250; ++i) s_grid.push_back(0.0002 * i);       // [0, 0.05] step 2e-4
  for (int i = 1; i <= 190; ++i) s_grid.push_back(0.05 + 0.005 * i); // (0.05, 1.0]
  {
    double c = 1.0;
    while (c < 192.0) { c = std::min(192.0, c * 1.03); s_grid.push_back(c); }
  }
  std::vector<I> IA_val(s_grid.size());
  IA_val[0] = I(0.0, 0.0);
  for (size_t i = 1; i < s_grid.size(); ++i) {
    // Compute B'(s) directly via R-panels (note for large s, B'(s) = int_0^inf R e^{-R} Phi'(sR) dR):
    I s_i(s_grid[i]);
    I Bp_s(0.0);
    for (const auto& pan : rk.r_panels) {
      I rm = pan.first, dr = pan.second;
      I r_box = make_i(std::max(0.0, rm.l - dr.h), rm.h + dr.h);
      if (s_grid[i] <= 0.06) {
        auto ev = [&](I ra) {
          Jet<4> R = Jet<4>::var(ra);
          Jet<4> sR = s_i * R;
          KEval kv = rk.eval_kernels(sR.c[0]);
          Jet<4> Pj = compose_c4_jet4(sR, kv.P, kv.Pp, kv.P3, kv.P4, I(-rk.P_cap[4].h, rk.P_cap[4].h));
          return (R * expneg_jet<4>(R)) * Pj;
        };
        Jet<4> jm = ev(rm), jx = ev(r_box);
        Bp_s = Bp_s + panel_int_jet4(jm, jx.c[4], dr);
      } else {
        // Monotone decreasing P(sR) on exact Gamma(2,1) panel mass!
        double a0 = std::max(0.0, rm.l - dr.h), a1 = rm.h + dr.h;
        I m1 = (I(a0) + I(1.0))*expneg(I(a0)) - (I(a1) + I(1.0))*expneg(I(a1));
        m1.l = std::max(0.0, m1.l);
        KEval klo = rk.eval_kernels(s_i * I(a0));
        KEval khi = rk.eval_kernels(s_i * I(a1));
        Bp_s = Bp_s + m1 * make_i(khi.P.l, klo.P.h);
      }
    }
    Bp_s = Bp_s + I(0.0, (rk.P_n[0] * rk.E_tail36[1]).h);
    IA_val[i] = make_i(std::max(0.0, (rk.P_n[0] - Bp_s).l), (rk.P_n[0] - Bp_s).h);
  }
  // Enforce cumulative monotonicity of valid enclosures:
  for (size_t i = 1; i < s_grid.size(); ++i) {
    IA_val[i].l = std::max(IA_val[i].l, IA_val[i - 1].l);
  }
  for (size_t i = s_grid.size() - 1; i > 0; --i) {
    IA_val[i - 1].h = std::min(IA_val[i - 1].h, IA_val[i].h);
  }

  auto IA_lower = [&](double s) -> double {
    if (s <= 0.0) return 0.0;
    if (s >= s_grid.back()) return IA_val.back().l;
    auto it = std::upper_bound(s_grid.begin(), s_grid.end(), s);
    size_t i = size_t(it - s_grid.begin() - 1);
    // Concave function => secant chord is a rigorous LOWER bound!
    double x0 = s_grid[i], x1 = s_grid[i + 1];
    double theta = dn((s - x0) / up(x1 - x0));
    theta = std::clamp(theta, 0.0, 1.0);
    return (I(1.0 - theta) * I(IA_val[i].l) + I(theta) * I(IA_val[i + 1].l)).l;
  };
  auto IA_upper = [&](double s) -> double {
    if (s <= 0.0) return 0.0;
    if (s >= s_grid.back()) return rk.P_n[0].h;
    auto it = std::upper_bound(s_grid.begin(), s_grid.end(), s);
    size_t i = size_t(it - s_grid.begin() - 1);
    // Concave function with IA'(s) = A0(s) <= A0(0) => IA(x0) + A0(x0)*(s - x0) or IA_val[i+1].h!
    return IA_val[i + 1].h;
  };

  struct BoxVT { double v0, v1, t0, t1; int depth; };
  std::vector<BoxVT> stack;
  I vmin_i = rat_i(11, 2500), umax_i = rat_i(463, 10000);
  stack.push_back({vmin_i.l, umax_i.h, 0.0, up(0.25 * umax_i.h), 0});
  rep.gate2_vt_leaves = 0;
  rep.gate2_vt_max_excess = -1e9;

  while (!stack.empty()) {
    BoxVT b = stack.back();
    stack.pop_back();
    // Prune outside 0 <= t <= v/4 and v + t <= 463/10000:
    if (b.t0 > up(0.25 * b.v1) || dn(b.v0 + b.t0) > umax_i.h) continue;
    b.t1 = std::min(b.t1, up(0.25 * b.v1));
    b.t1 = std::min(b.t1, up(umax_i.h - b.v0));
    if (b.t0 > b.t1) continue;

    // Upper bound on IA(v + t) - (3/4)*E_hat[IA((2/3)*R*((v/2)*(R-2)^2 + t))] - v on box:
    // IA increasing => IA(v + t) <= IA(min(v1 + t1, 0.0463)), E_hat >= E_hat at (v0, t0), -v <= -v0!
    double s_hi = std::min(umax_i.h, up(b.v1 + b.t1));
    double lhs_hi = IA_upper(s_hi);
    I ehat_lo(0.0);
    for (int k = 0; k < NBINS; ++k) {
      double arg_lo = dn((2.0 / 3.0) * r_lo[k] * dn(0.5 * b.v0 * r_m2_sq_lo[k] + b.t0));
      ehat_lo = ehat_lo + m1_bin[k] * I(IA_lower(arg_lo));
    }
    I excess = I(lhs_hi) - rat_i(3, 4) * I(ehat_lo.l) - I(b.v0);
    if (excess.h <= -1e-7) {
      ++rep.gate2_vt_leaves;
      rep.gate2_vt_max_excess = std::max(rep.gate2_vt_max_excess, excess.h);
      continue;
    }
    require(b.depth < 30, "Gate 2A (v,t) subdivision exceeded max depth");
    if ((b.v1 - b.v0) >= (b.t1 - b.t0)) {
      double vm = 0.5 * (b.v0 + b.v1);
      stack.push_back({b.v0, vm, b.t0, b.t1, b.depth + 1});
      stack.push_back({vm, b.v1, b.t0, b.t1, b.depth + 1});
    } else {
      double tm = 0.5 * (b.t0 + b.t1);
      stack.push_back({b.v0, b.v1, b.t0, tm, b.depth + 1});
      stack.push_back({b.v0, b.v1, tm, b.t1, b.depth + 1});
    }
  }
  (void)utab;

  // Part 2B: 1D c-cells covering v = 2*c^2 in [11/2500, 463/10000]:
  I c_min_i = sqrti(vmin_i / I(2.0));
  I c_max_i = sqrti(umax_i / I(2.0));
  const int NC = 512;
  double c_lo_all = c_min_i.l, c_hi_all = c_max_i.h;
  double dc_step = (c_hi_all - c_lo_all) / double(NC);
  rep.gate2_c_cells = NC;
  rep.gate2_min_def = 1e9;
  rep.gate2_max_ratio = 0.0;

  for (int ic = 0; ic < NC; ++ic) {
    double cl = c_lo_all + ic * dc_step;
    double ch = (ic + 1 == NC) ? c_hi_all : (c_lo_all + (ic + 1) * dc_step);
    double cm = 0.5 * (cl + ch);
    double dc_h = up(std::max(cm - cl, ch - cm));

    I vl = I(2.0) * sq(I(cl));
    I vh = I(2.0) * sq(I(ch));
    I vm = I(2.0) * sq(I(cm));

    // Evaluate D(q0) = B(2 c^2) - B0 - Ic(0) and C(q0) = |Tc(0)| on [cl, ch] via midpoint cm!
    UStats svm = rk.eval_u_stats(vm);
    Mid3D m0 = rk.eval_mid_3d(cm, 0.0, 0.0);
    // D(q0)(c) = B(2 c^2) - B0 - I_c(0):
    // d/dc [B(2 c^2) - I_c(0)] at cm is 4*cm*B'(2*cm^2) - dIc_dc(cm, 0),
    // and B(2 c^2) is concave in c^2: B(2 c^2) >= B(2 cm^2) + B'(2 cm^2)*(2 c^2 - 2 cm^2) - (1/2)*A0_max*(2 c^2 - 2 cm^2)^2!
    I dv_max = I(0.0, std::max(vh.h - vm.l, vm.h - vl.l));
    I A0_bound = rk.eval_u_stats(I(vl.l)).A0;
    // Combine linear slope (4*cm*Bp(vm) - dIc_dc):
    I lin_slope = I(4.0) * I(cm) * svm.Bp - m0.dIc_dc;
    I quad_B = rat_i(1, 2) * I(0.0, A0_bound.h) * sq(dv_max);
    // Note 2 c^2 - 2 cm^2 = 4*cm*(c - cm) + 2*(c - cm)^2, and B'(vm) > 0, so +2*B'(vm)*(c - cm)^2 >= 0!
    // Meanwhile I_c(0) <= I_{cm}(0) + dIc_dc*(c - cm) + 2*P0*dc_h^2!
    // Hence D(q0)(c) >= (svm.Bu_m_B0 - m0.Ic) - |lin_slope|*dc_h - quad_B - 2*(P0 - Bp(vm))*dc_h^2!
    I Dc_lo = (svm.Bu_m_B0 - m0.Ic) - abs_i(lin_slope) * I(dc_h) - quad_B -
              I(2.0) * make_i(0.0, (rk.P_n[0] - svm.Bp).h) * sq(I(dc_h));

    // C(q0)(c) = |Tc_re(c, 0)| <= |Tc_re(cm, 0)| + |dTcre_dc|*dc_h + (11/8 / a^2)*dc_h^2:
    I R_Tc = (rat_i(11, 8) / sq(rk.a)) * sq(I(dc_h));
    I Cc_hi = abs_i(m0.Tc_re) + abs_i(m0.dTcre_dc) * I(dc_h) + R_Tc;

    double ph_d = std::min(up(0.25 * vh.h), up(umax_i.h - vl.l));
    I ph(0.0, std::max(0.0, ph_d));
    I denom = Dc_lo - I(vh.h) * I(ph.h);
    I numer = sq(I(Cc_hi.h) + rat_i(8, 5) * I(ph.h));
    I ratio = numer / I(denom.l);
    if (!(denom.l > 0.0) || !(ratio.h < 0.225)) {
      std::ostringstream err;
      err << "Gate 2B failed at ic=" << ic << " cm=" << cm << " vm=" << vm.l
          << " Bu_m_B0=[" << svm.Bu_m_B0.l << "," << svm.Bu_m_B0.h << "]"
          << " Ic=[" << m0.Ic.l << "," << m0.Ic.h << "]"
          << " Dc_lo=" << denom.l + vh.h*ph.h << " denom=" << denom.l
          << " Cc_hi=" << Cc_hi.h << " ph=" << ph.h
          << " ratio=" << ratio.h;
      throw std::runtime_error(err.str());
    }
    require(denom.l > 0.0, "Gate 2B positive deficit D_l - v_h*p_h > 0 failed");
    require(ratio.h < 0.225, "Gate 2B ratio < 9/40 failed");

    rep.gate2_min_def = std::min(rep.gate2_min_def, denom.l);
    rep.gate2_max_ratio = std::max(rep.gate2_max_ratio, ratio.h);
  }
}

struct MidKey {
  uint64_t bc, b1, b2;
  bool operator==(const MidKey& o) const { return bc == o.bc && b1 == o.b1 && b2 == o.b2; }
};

struct MidKeyHash {
  size_t operator()(const MidKey& k) const {
    uint64_t h = k.bc;
    h ^= k.b1 + 0x9e3779b97f4a7c15ULL + (h << 6) + (h >> 2);
    h ^= k.b2 + 0x9e3779b97f4a7c15ULL + (h << 6) + (h >> 2);
    return static_cast<size_t>(h);
  }
};

using MidMemo = std::unordered_map<MidKey, std::shared_ptr<Mid3D>, MidKeyHash>;

inline MidKey make_mid_key(double cm, double z1m, double z2m) {
  if (cm == 0.0) cm = 0.0;
  if (z1m == 0.0) z1m = 0.0;
  if (z2m == 0.0) z2m = 0.0;
  uint64_t bc, b1, b2;
  std::memcpy(&bc, &cm, 8);
  std::memcpy(&b1, &z1m, 8);
  std::memcpy(&b2, &z2m, 8);
  return {bc, b1, b2};
}

// Shared 4D adaptive box solver for Gates 3, 4, 5!
// Mode 3: f in [1/16, 1], |z| <= 4, env_22 = 3/50 + (4/25)*(2c^2+|z|^2)/u - (1/10)*(c*z1)/u
// Mode 4: f in [1/16, 4/5], |z| <= 4, env_star = 9/100 + (13/100)*|z|^2/p
// Mode 5: f in [0, 1/16], y = |z|^2/p <= 500, (47/200)*H + p^2*Q(y) - |N|^2/w(y) > 0
void run_4d_gate(int mode, const RowKernels& rk, const USlabTable& utab, MidMemo& memo, RowReport& rep) {
  struct Box4D {
    double u0, u1;
    double c0, c1;
    double z10, z11;
    double z20, z21;
    int depth;
    std::shared_ptr<Mid3D> cached_mid;  // reused across u-splits!
  };

  I umin_i = rat_i(551, 100000), umax_i = rat_i(463, 10000);
  double u_lo_all = umin_i.l, u_hi_all = umax_i.h;

  std::vector<Box4D> stack;
  int leaves = 0, mid_evals = 0;
  double min_H = 1e9, min_margin = 1e9;

  // Seed initial contiguous partition so root boxes tile the domain without gaps
  // (Modes 3 and 4 share the exact same dyadic (c, z1, z2) root tree for ~95% MidMemo reuse!):
  if (mode == 3 || mode == 4) {
    double c_lo_all = sqrti(umin_i / I(32.0)).l;
    double c_hi_all = sqrti(umax_i * I(0.5)).h;
    const int NU0 = 10, NC0 = 8;
    std::vector<double> ue(NU0 + 1), ce(NC0 + 1);
    ue[0] = u_lo_all; ue[NU0] = u_hi_all;
    for (int i = 1; i < NU0; ++i) ue[i] = u_lo_all * std::pow(u_hi_all / u_lo_all, double(i) / NU0);
    ce[0] = c_lo_all; ce[NC0] = c_hi_all;
    for (int i = 1; i < NC0; ++i) ce[i] = c_lo_all * std::pow(c_hi_all / c_lo_all, double(i) / NC0);
    std::vector<double> z_pos = {0.0, 0.04, 0.09, 0.16, 0.28, 0.45, 0.75, 1.2, 1.9, 2.9, 4.0};
    std::vector<double> z_full;
    for (int i = int(z_pos.size()) - 1; i >= 1; --i) z_full.push_back(-z_pos[i]);
    for (double v : z_pos) z_full.push_back(v);
    for (int iu = 0; iu < NU0; ++iu)
      for (int ic = 0; ic < NC0; ++ic)
        for (size_t i1 = 0; i1 + 1 < z_full.size(); ++i1)
          for (size_t i2 = 0; i2 + 1 < z_pos.size(); ++i2)
            stack.push_back({ue[iu], ue[iu + 1], ce[ic], ce[ic + 1], z_full[i1], z_full[i1 + 1], z_pos[i2], z_pos[i2 + 1], 0, nullptr});
  } else {
    // Mode 5: f in [0, 1/16] => c in [0, sqrt(u_max / 32)], |z| <= sqrt(500 * u_max) < 4.82 < 4.85
    double c_hi_all = sqrti(umax_i / I(32.0)).h;
    require(4.85 * 4.85 > (I(500.0) * umax_i).h, "Mode 5 initial z box must cover y <= 500");
    std::vector<double> z_pos = {0.0, 0.04, 0.08, 0.12, 0.17, 0.24, 0.35, 0.55, 0.9, 1.5, 2.5, 3.6, 4.85};
    std::vector<double> z_full;
    for (int i = int(z_pos.size()) - 1; i >= 1; --i) z_full.push_back(-z_pos[i]);
    for (double v : z_pos) z_full.push_back(v);

    const int NU0 = 12, NC0 = 4;
    std::vector<double> ue(NU0 + 1), ce(NC0 + 1);
    ue[0] = u_lo_all; ue[NU0] = u_hi_all;
    for (int i = 1; i < NU0; ++i) ue[i] = u_lo_all * std::pow(u_hi_all / u_lo_all, double(i) / NU0);
    ce[0] = 0.0; ce[NC0] = c_hi_all;
    for (int i = 1; i < NC0; ++i) ce[i] = i * (c_hi_all / NC0);

    for (int iu = 0; iu < NU0; ++iu)
      for (int ic = 0; ic < NC0; ++ic)
        for (size_t i1 = 0; i1 + 1 < z_full.size(); ++i1)
          for (size_t i2 = 0; i2 + 1 < z_pos.size(); ++i2)
            stack.push_back({ue[iu], ue[iu + 1], ce[ic], ce[ic + 1], z_full[i1], z_full[i1 + 1], z_pos[i2], z_pos[i2 + 1], 0, nullptr});
  }

  const I kap_T = I(1.0) / (I(2.0) * sq(rk.a));
  const I P0_val = rk.P_n[0];

  while (!stack.empty()) {
    Box4D bx = stack.back();
    stack.pop_back();

    // Domain u-tightening & exact tail pruning (keep [c0,c1,z10,z11,z20,z21] on dyadic tree for MidMemo hits!):
    if (mode == 3) {
      // 1/16 <= 2*c^2/u <= 1  <=>  2*c^2 <= u <= 32*c^2
      double u_req_lo = (I(2.0) * sq(I(bx.c0))).l;
      double u_req_hi = (I(32.0) * sq(I(bx.c1))).h;
      if (bx.u1 < u_req_lo || bx.u0 > u_req_hi) continue;
      bx.u0 = std::max(bx.u0, u_req_lo);
      bx.u1 = std::min(bx.u1, u_req_hi);
      if (bx.u0 > bx.u1) continue;
      // Prune |z|^2 >= 16 (covered by analytic/rational tail |z| >= 4):
      I z1_iv(bx.z10, bx.z11), z2_iv(bx.z20, bx.z21);
      if ((sq(z1_iv) + sq(z2_iv)).l >= 16.0) continue;
    } else if (mode == 4) {
      // 1/16 <= 2*c^2/u <= 4/5  <=>  (5/2)*c^2 <= u <= 32*c^2
      double u_req_lo = (rat_i(5, 2) * sq(I(bx.c0))).l;
      double u_req_hi = (I(32.0) * sq(I(bx.c1))).h;
      if (bx.u1 < u_req_lo || bx.u0 > u_req_hi) continue;
      bx.u0 = std::max(bx.u0, u_req_lo);
      bx.u1 = std::min(bx.u1, u_req_hi);
      if (bx.u0 > bx.u1) continue;
      I z1_iv(bx.z10, bx.z11), z2_iv(bx.z20, bx.z21);
      if ((sq(z1_iv) + sq(z2_iv)).l >= 16.0) continue;
    } else {
      // Mode 5: 0 <= 2*c^2 <= u/16 <=> u >= 32*c^2
      double u_req_lo = (I(32.0) * sq(I(bx.c0))).l;
      if (bx.u1 < u_req_lo) continue;
      bx.u0 = std::max(bx.u0, u_req_lo);
      if (bx.u0 > bx.u1) continue;
      // Prune y = |z|^2 / p >= 500: on box, p <= u1 - 2*c0^2, so if min |z|^2 >= 500*(u1 - 2*c0^2), y >= 500 everywhere!
      I z1_iv(bx.z10, bx.z11), z2_iv(bx.z20, bx.z21);
      I p_max_iv = I(bx.u1) - I(2.0) * sq(I(bx.c0));
      if ((sq(z1_iv) + sq(z2_iv)).l >= (I(500.0) * p_max_iv).h) continue;
    }

    if (!bx.cached_mid) {
      double cm = 0.5 * (bx.c0 + bx.c1);
      double z1m = 0.5 * (bx.z10 + bx.z11);
      double z2m = 0.5 * (bx.z20 + bx.z21);
      MidKey mk = make_mid_key(cm, z1m, z2m);
      auto it = memo.find(mk);
      if (it != memo.end()) {
        bx.cached_mid = it->second;
      } else {
        auto ptr = std::make_shared<Mid3D>(rk.eval_mid_3d(cm, z1m, z2m));
        memo.emplace(mk, ptr);
        bx.cached_mid = ptr;
        ++mid_evals;
        if (mid_evals % 2500 == 0) {
          std::cerr << "  [" << rk.spec.name << " mode=" << mode << "] evals=" << mid_evals
                    << " leaves=" << leaves << " depth=" << bx.depth << "\n" << std::flush;
        }
      }
    }
    const Mid3D& m3 = *bx.cached_mid;
    double dc = up(std::max(m3.c0 - bx.c0, bx.c1 - m3.c0));
    double dz1 = up(std::max(m3.z1 - bx.z10, bx.z11 - m3.z1));
    double dz2 = up(std::max(m3.z2 - bx.z20, bx.z21 - m3.z2));

    double um = 0.0, du_h = 0.0;
    UStats mst;
    I Bp_box, A0_box, lam_box, uBpp_box;
    utab.enclose_u_interval(bx.u0, bx.u1, um, du_h, mst, Bp_box, A0_box, lam_box, uBpp_box, rk);

    I cm_i(m3.c0), z1m_i(m3.z1), z2m_i(m3.z2), um_i(um);
    I dc_i(dc), dz1_i(dz1), dz2_i(dz2), du_i(du_h);
    I U_iv(bx.u0, bx.u1), C_iv(bx.c0, bx.c1), Z1_iv(bx.z10, bx.z11), Z2_iv(bx.z20, bx.z21);
    I Z2_norm = sq(Z1_iv) + sq(Z2_iv);
    I S_iv = Z2_norm + I(2.0) * sq(C_iv);

    // Centered 1st-order Taylor model Aff4 on [u0,u1] x [c0,c1] x [z10,z11] x [z20,z21]
    // around (um, cm, z1m, z2m) — eliminates 1st-order dependency blowup across all products!
    struct Aff4 {
      I v0, gu, gc, gz1, gz2;
      double rem;

      double lin_rad(double du_, double dc_, double d1_, double d2_) const {
        return (abs_i(gu)*I(du_) + abs_i(gc)*I(dc_) + abs_i(gz1)*I(d1_) + abs_i(gz2)*I(d2_)).h;
      }
      double max_dev(double du_, double dc_, double d1_, double d2_) const {
        return up(lin_rad(du_, dc_, d1_, d2_) + rem);
      }
      I bounds(double du_, double dc_, double d1_, double d2_) const {
        double md = max_dev(du_, dc_, d1_, d2_);
        return v0 + I(-md, md);
      }
    };
    auto add_a = [](const Aff4& A, const Aff4& B) -> Aff4 {
      return {A.v0 + B.v0, A.gu + B.gu, A.gc + B.gc, A.gz1 + B.gz1, A.gz2 + B.gz2, up(A.rem + B.rem)};
    };
    auto sub_a = [](const Aff4& A, const Aff4& B) -> Aff4 {
      return {A.v0 - B.v0, A.gu - B.gu, A.gc - B.gc, A.gz1 - B.gz1, A.gz2 - B.gz2, up(A.rem + B.rem)};
    };
    auto scl_a = [](I s, const Aff4& A) -> Aff4 {
      return {s * A.v0, s * A.gu, s * A.gc, s * A.gz1, s * A.gz2, (abs_i(s) * I(A.rem)).h};
    };
    auto mul_a = [&](const Aff4& A, const Aff4& B) -> Aff4 {
      double mdA = A.max_dev(du_h, dc, dz1, dz2);
      double mdB = B.max_dev(du_h, dc, dz1, dz2);
      double r = (abs_i(A.v0)*I(B.rem) + abs_i(B.v0)*I(A.rem) + I(mdA)*I(mdB)).h;
      return {A.v0 * B.v0,
              A.v0 * B.gu  + B.v0 * A.gu,
              A.v0 * B.gc  + B.v0 * A.gc,
              A.v0 * B.gz1 + B.v0 * A.gz1,
              A.v0 * B.gz2 + B.v0 * A.gz2,
              r};
    };
    auto sq_a = [&](const Aff4& A) -> Aff4 {
      double mdA = A.max_dev(du_h, dc, dz1, dz2);
      double r = (I(2.0)*abs_i(A.v0)*I(A.rem) + sq(I(mdA))).h;
      I two_v0 = I(2.0) * A.v0;
      return {sq(A.v0), two_v0 * A.gu, two_v0 * A.gc, two_v0 * A.gz1, two_v0 * A.gz2, r};
    };
    auto inv_pos_a = [&](const Aff4& B, double b_lo) -> Aff4 {
      // 1/(b0 + D) = 1/b0 - L_B/b0^2 + (-r_B/b0^2 + D^2/(b0^2 * B))
      double mdB = B.max_dev(du_h, dc, dz1, dz2);
      I inv_b0 = I(1.0) / B.v0;
      I neg_inv_b02 = -sq(inv_b0);
      double r = (abs_i(neg_inv_b02) * (I(B.rem) + sq(I(mdB)) / I(b_lo))).h;
      return {inv_b0, neg_inv_b02 * B.gu, neg_inv_b02 * B.gc, neg_inv_b02 * B.gz1, neg_inv_b02 * B.gz2, r};
    };

    const I zero_i(0.0);
    Aff4 Au  {um_i,  I(1.0), zero_i, zero_i, zero_i, 0.0};
    Aff4 Ac  {cm_i,  zero_i, I(1.0), zero_i, zero_i, 0.0};
    Aff4 Az1 {z1m_i, zero_i, zero_i, I(1.0), zero_i, 0.0};
    Aff4 Az2 {z2m_i, zero_i, zero_i, zero_i, I(1.0), 0.0};

    // 1D u-functions as Aff4:
    Aff4 Aff_Bu   {mst.Bu_m_B0,        mst.Bp,     zero_i, zero_i, zero_i, (rat_i(1, 2) * I(0.0, A0_box.h) * sq(du_i)).h};
    Aff4 Aff_Bp   {mst.Bp,            -mst.A0,     zero_i, zero_i, zero_i, (I(3.0) * rk.P_cap[2] * sq(du_i)).h};
    Aff4 Aff_uBpp {-um_i * mst.A0,     mst.uBpp_p, zero_i, zero_i, zero_i, (I(18.0) * rk.P_cap[2] * sq(du_i)).h};
    Aff4 Aff_lam  {mst.lam,            mst.lamp,   zero_i, zero_i, zero_i, (I(3.0) * rk.Hpp_n[0] * sq(du_i)).h};

    // 3D (c, z1, z2)-functions as Aff4 (Proposition 4.1 exact quadratic Taylor sandwiches):
    double MI = (P0_val * (I(2.0)*sq(dc_i) + sq(dz1_i) + sq(dz2_i))).h;
    Aff4 Aff_Ic  {m3.Ic + rat_i(1, 2)*I(MI), zero_i, m3.dIc_dc,   m3.dIc_dz1,   m3.dIc_dz2,   up(0.5 * MI)};
    double RT = (kap_T * (rat_i(11, 4)*sq(dc_i) + dc_i*dz1_i + sq(dz1_i) + sq(dz2_i))).h;
    Aff4 Aff_Tre {m3.Tc_re,                  zero_i, m3.dTcre_dc, m3.dTcre_dz1, m3.dTcre_dz2, RT};
    Aff4 Aff_Tim {m3.Tc_im,                  zero_i, m3.dTcim_dc, m3.dTcim_dz1, m3.dTcim_dz2, RT};

    // Combined H_{c,u}(z) and |N_{c,u}(z)|^2 as Aff4s:
    Aff4 Aff_Z  = add_a(sq_a(Az1), sq_a(Az2));
    Aff4 Aff_2c2 = scl_a(I(2.0), sq_a(Ac));
    Aff4 Aff_S  = add_a(Aff_2c2, Aff_Z);
    Aff4 Aff_P  = sub_a(Au, Aff_2c2);
    Aff4 Aff_H  = add_a(add_a(sub_a(Aff_Bu, Aff_Ic), mul_a(Aff_Bp, sub_a(Aff_S, Au))),
                        mul_a(scl_a(I(2.0), Aff_uBpp), mul_a(Ac, Az1)));
    Aff4 Aff_Nre = sub_a(Aff_Tre, mul_a(Aff_lam, Az1));
    Aff4 Aff_Nim = sub_a(Aff_Tim, mul_a(Aff_lam, Az2));
    Aff4 Aff_N2  = add_a(sq_a(Aff_Nre), sq_a(Aff_Nim));

    I H_bds = Aff_H.bounds(du_h, dc, dz1, dz2);
    double bregman_floor = (sq(I(bx.c0)) * I(rep.Ku_min.l)).l;
    double H_lo = std::max(H_bds.l, bregman_floor);
    double H_hi = std::max(H_lo, H_bds.h);
    (void)S_iv; (void)Bp_box; (void)lam_box; (void)uBpp_box;

    bool ok = false;
    double box_metric = -1e9;

    if (mode == 3) {
      // M_3 = H * (3/50 * u + 4/25 * (2c^2 + |z|^2) - 1/10 * c * z1) - u * |N|^2 > 0
      Aff4 Aff_E3 = sub_a(add_a(scl_a(rat_i(3, 50), Au), scl_a(rat_i(4, 25), Aff_S)),
                          scl_a(rat_i(1, 10), mul_a(Ac, Az1)));
      Aff4 Aff_M3 = sub_a(mul_a(Aff_H, Aff_E3), mul_a(Au, Aff_N2));
      I M3_bds = Aff_M3.bounds(du_h, dc, dz1, dz2);
      if (H_lo > 0.0 && M3_bds.l > 0.0) {
        ok = true;
        min_H = std::min(min_H, H_lo);
        box_metric = (I(M3_bds.l) / (I(bx.u1) * I(H_hi))).l;
        min_margin = std::min(min_margin, box_metric);
      }
    } else if (mode == 4) {
      // M_4 = H * (9/100 * p + 13/100 * |z|^2) - p * |N|^2 > 0
      Aff4 Aff_E4 = add_a(scl_a(rat_i(9, 100), Aff_P), scl_a(rat_i(13, 100), Aff_Z));
      Aff4 Aff_M4 = sub_a(mul_a(Aff_H, Aff_E4), mul_a(Aff_P, Aff_N2));
      I M4_bds = Aff_M4.bounds(du_h, dc, dz1, dz2);
      double P_hi = (I(bx.u1) - I(2.0) * sq(I(bx.c0))).h;
      if (H_lo > 0.0 && M4_bds.l > 0.0 && P_hi > 0.0) {
        ok = true;
        box_metric = (I(M4_bds.l) / (I(P_hi) * I(H_hi))).l;
        min_margin = std::min(min_margin, box_metric);
      }
    } else {
      // Mode 5: W_5 * ((47/200)*H + F_Q(P, Z)) - P * |N|^2 > 0, where W_5 = 3/10 * P + 7/10 * Z
      I A1 = rat_i(59, 500), A3 = rat_i(21, 200000);
      I C_P2 = I(2.0) * rk.b4 + rat_i(68 * 21, 200000) - A1;
      I C_Z2 = rk.b4 + rat_i(37 * 21, 200000);

      double p_lo = (I(bx.u0) - I(2.0) * sq(I(bx.c1))).l;
      double p_hi = (I(bx.u1) - I(2.0) * sq(I(bx.c0))).h;
      if (p_lo > 0.0 && Aff_P.v0.l > 0.0 && p_hi > 0.0) {
        Aff4 Aff_Z2  = sq_a(Aff_Z);
        Aff4 Aff_Z3  = mul_a(Aff_Z2, Aff_Z);
        Aff4 Aff_FQ  = add_a(sub_a(add_a(scl_a(C_P2, sq_a(Aff_P)), scl_a(A1, mul_a(Aff_P, Aff_Z))),
                                   scl_a(C_Z2, Aff_Z2)),
                             scl_a(A3, mul_a(Aff_Z3, inv_pos_a(Aff_P, p_lo))));
        Aff4 Aff_W5  = add_a(scl_a(rat_i(3, 10), Aff_P), scl_a(rat_i(7, 10), Aff_Z));
        Aff4 Aff_M5  = sub_a(mul_a(Aff_W5, add_a(scl_a(rat_i(47, 200), Aff_H), Aff_FQ)),
                             mul_a(Aff_P, Aff_N2));
        I M5_bds = Aff_M5.bounds(du_h, dc, dz1, dz2);
        double W5_hi = (rat_i(3, 10) * I(p_hi) + rat_i(7, 10) * I(Z2_norm.h)).h;
        if (M5_bds.l > 0.0 && W5_hi > 0.0) {
          ok = true;
          box_metric = (I(M5_bds.l) / (I(W5_hi) * sq(I(bx.u1)))).l;
          min_margin = std::min(min_margin, box_metric);
        }
      }
    }

    if (ok) {
      ++leaves;
      if (leaves % 50000 == 0) {
        std::cerr << "  [" << rk.spec.name << " mode=" << mode << "] leaves=" << leaves
                  << " evals=" << mid_evals << " stack=" << stack.size()
                  << " min_margin=" << min_margin << "\n" << std::flush;
      }
      continue;
    }

    if (bx.depth >= 64) {
      std::ostringstream err;
      err << std::setprecision(10)
          << "4D subdivision exceeded max depth (64) in mode=" << mode
          << " u=[" << bx.u0 << "," << bx.u1 << "] c=[" << bx.c0 << "," << bx.c1 << "]"
          << " z1=[" << bx.z10 << "," << bx.z11 << "] z2=[" << bx.z20 << "," << bx.z21 << "]"
          << " H_bds=[" << H_bds.l << "," << H_bds.h << "] H_lo=" << H_lo
          << " N2=[" << Aff_N2.v0.l << "," << Aff_N2.v0.h << "] remN2=" << Aff_N2.rem
          << " Bu=[" << mst.Bu_m_B0.l << "," << mst.Bu_m_B0.h << "]"
          << " Bp=[" << mst.Bp.l << "," << mst.Bp.h << "]"
          << " Ic=[" << m3.Ic.l << "," << m3.Ic.h << "]";
      throw std::runtime_error(err.str());
    }

    // Choose split coordinate weighted by natural scale:
    double z_scale = std::max(0.02, std::sqrt(um + m3.z1*m3.z1 + m3.z2*m3.z2));
    double su  = (bx.u1 - bx.u0) / um;
    double sc  = (bx.c1 - bx.c0) / std::sqrt(0.5 * um);
    double sz1 = (bx.z11 - bx.z10) / z_scale;
    double sz2 = (bx.z21 - bx.z20) / z_scale;

    int best_dim = 0;
    double best_s = su;
    if (sc > best_s) { best_s = sc; best_dim = 1; }
    if (sz1 > best_s) { best_s = sz1; best_dim = 2; }
    if (sz2 > best_s) { best_s = sz2; best_dim = 3; }

    Box4D b1 = bx, b2 = bx;
    b1.depth = b2.depth = bx.depth + 1;
    if (best_dim == 0) {
      double m = 0.5 * (bx.u0 + bx.u1);
      b1.u1 = m; b2.u0 = m;
      // Keep cached_mid across u-split!
    } else if (best_dim == 1) {
      double m = 0.5 * (bx.c0 + bx.c1);
      b1.c1 = m; b2.c0 = m;
      b1.cached_mid.reset(); b2.cached_mid.reset();
    } else if (best_dim == 2) {
      double m = 0.5 * (bx.z10 + bx.z11);
      b1.z11 = m; b2.z10 = m;
      b1.cached_mid.reset(); b2.cached_mid.reset();
    } else {
      double m = 0.5 * (bx.z20 + bx.z21);
      b1.z21 = m; b2.z20 = m;
      b1.cached_mid.reset(); b2.cached_mid.reset();
    }
    stack.push_back(b1);
    stack.push_back(b2);
  }

  if (mode == 3) {
    rep.gate3_leaves = leaves;
    rep.gate3_mid3d_evals = mid_evals;
    rep.gate3_min_H = min_H;
    rep.gate3_min_margin = min_margin;
  } else if (mode == 4) {
    rep.gate4_leaves = leaves;
    rep.gate4_mid3d_evals = mid_evals;
    rep.gate4_min_margin = min_margin;
  } else {
    rep.gate5_leaves = leaves;
    rep.gate5_mid3d_evals = mid_evals;
    rep.gate5_min_norm_margin = min_margin;
  }
}

void run_startup_selftests() {
  static_assert(std::numeric_limits<double>::is_iec559 &&
                std::numeric_limits<double>::radix == 2 &&
                std::numeric_limits<double>::digits == 53,
                "IEEE-754 binary64 required");
  require(std::fegetround() == FE_TONEAREST, "FE_TONEAREST rounding mode required");

  // SHA-256 NIST FIPS 180-4 test vector ("abc")
  require(sha256_bytes("abc") == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad",
          "SHA-256 self-test failed");
  require(sha256_bytes("") == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "SHA-256 empty self-test failed");

  // Interval primitives self-tests (including bit-level dn/up vs std::nextafter)
  for (double tv : {0.0, -0.0, 1.0, -1.0, 0.5, -0.5, 1e-300, -1e-300, 5e-324, -5e-324, 1e100, -1e100}) {
    require(dn(tv) < tv && dn(tv) <= std::nextafter(tv, -INFINITY), "dn(tv) self-test");
    require(up(tv) > tv && up(tv) >= std::nextafter(tv, +INFINITY), "up(tv) self-test");
  }
  I s2 = sqrti(I(2.0));
  require(s2.l < s2.h && up(s2.l * s2.l) <= 2.0 && dn(s2.h * s2.h) >= 2.0, "sqrti(2) self-test");
  I e1 = expneg(I(1.0));
  // 1/e = 0.36787944117144233...
  require(e1.l <= 0.36787944117144233 && e1.h >= 0.36787944117144233 && (e1.h - e1.l) < 1e-12,
          "expneg(1) self-test");
  I p = verified_pi();
  require(p.l <= 3.14159265358979323846 && p.h >= 3.14159265358979323846, "pi self-test");

  // Jet<4> automatic differentiation self-test on f(x) = exp(-(1 + x)) at x = 0.5:
  Jet<4> x = Jet<4>::var(I(0.5));
  Jet<4> fx = expneg_jet<4>(Jet<4>(I(1.0)) + x);
  I em15 = expneg(I(1.5));
  require(fx.c[0].l <= em15.h && fx.c[0].h >= em15.l, "Jet4 c0");
  // c[4] = f^(4)(0.5)/24 = exp(-1.5)/24:
  I want4 = em15 / I(24.0);
  require(fx.c[4].l <= want4.h && fx.c[4].h >= want4.l, "Jet4 c4");
}

void write_json_iv(std::ostream& os, const I& v) {
  os << std::setprecision(17)
     << "{\"lo\":" << v.l << ",\"hi\":" << v.h
     << ",\"lo_hex\":\"" << hexfloat_str(v.l) << "\""
     << ",\"hi_hex\":\"" << hexfloat_str(v.h) << "\"}";
}

}  // namespace

int main(int argc, char** argv) {
  auto t_start = std::chrono::steady_clock::now();
  run_startup_selftests();

  std::string cpp_path = "certify_one_driver.cpp";
  std::string out_path = "result.json";
  for (int i = 1; i < argc; ++i) {
    std::string arg(argv[i]);
    if (arg == "--cpp" && i + 1 < argc) cpp_path = argv[++i];
    else if (arg == "--out" && i + 1 < argc) out_path = argv[++i];
    else {
      std::cerr << "Usage: " << argv[0] << " [--cpp path] [--out result.json]\n";
      return 2;
    }
  }

  std::string cpp_hash = sha256_file(cpp_path);

  const std::vector<ProfileSpec> specs = {
    {"peak",  1891, 2500,  699,  1250,   179,  1250, 37, 1000},
    {"flank",  149,  200,   14,    25,  1467, 10000, 37, 1000},
    {"upper", 1891, 2500,  573,  1000,    19,   125,  7,  200},
  };

  std::vector<RowReport> reports(specs.size());
  std::vector<std::string> logs(specs.size());
  std::vector<std::string> errs(specs.size());
  std::vector<std::thread> threads;

  std::cout << "[certify_one_driver] Launching 3 parallel row certifiers (peak, flank, upper)...\n" << std::flush;
  for (size_t idx = 0; idx < specs.size(); ++idx) {
    threads.emplace_back([&, idx]() {
      try {
        const auto& sp = specs[idx];
        auto tr0 = std::chrono::steady_clock::now();
        RowKernels rk(sp);
        auto t_rk = std::chrono::steady_clock::now();
        std::cerr << "[" << sp.name << "] RowKernels ready ("
                  << std::fixed << std::setprecision(2)
                  << std::chrono::duration<double>(t_rk - tr0).count() << "s)\n" << std::flush;
        USlabTable utab(rk, 512);
        RowReport rep;
        rep.name = sp.name;

        run_gate1(rk, utab, rep);
        auto t_g1 = std::chrono::steady_clock::now();
        std::cerr << "[" << sp.name << "] Gate 1 PASS K_min=" << rep.Ku_min.l << " ("
                  << std::chrono::duration<double>(t_g1 - t_rk).count() << "s)\n" << std::flush;
        run_gate2(rk, utab, rep);
        auto t_g2 = std::chrono::steady_clock::now();
        std::cerr << "[" << sp.name << "] Gate 2 PASS ratio<=" << rep.gate2_max_ratio << " ("
                  << std::chrono::duration<double>(t_g2 - t_g1).count() << "s)\n" << std::flush;
        MidMemo memo;
        memo.reserve(16384);
        run_4d_gate(3, rk, utab, memo, rep);
        auto t_g3 = std::chrono::steady_clock::now();
        std::cerr << "[" << sp.name << "] Gate 3 PASS leaves=" << rep.gate3_leaves
                  << " evals=" << rep.gate3_mid3d_evals << " margin=" << rep.gate3_min_margin << " ("
                  << std::chrono::duration<double>(t_g3 - t_g2).count() << "s)\n" << std::flush;
        run_4d_gate(4, rk, utab, memo, rep);
        auto t_g4 = std::chrono::steady_clock::now();
        std::cerr << "[" << sp.name << "] Gate 4 PASS leaves=" << rep.gate4_leaves
                  << " evals=" << rep.gate4_mid3d_evals << " margin=" << rep.gate4_min_margin << " ("
                  << std::chrono::duration<double>(t_g4 - t_g3).count() << "s)\n" << std::flush;
        run_4d_gate(5, rk, utab, memo, rep);
        auto t_g5 = std::chrono::steady_clock::now();
        std::cerr << "[" << sp.name << "] Gate 5 PASS leaves=" << rep.gate5_leaves
                  << " evals=" << rep.gate5_mid3d_evals << " margin=" << rep.gate5_min_norm_margin << " ("
                  << std::chrono::duration<double>(t_g5 - t_g4).count() << "s)\n" << std::flush;

        auto tr1 = std::chrono::steady_clock::now();
        double sec = std::chrono::duration<double>(tr1 - tr0).count();
        std::ostringstream oss;
        oss << "[certify_one_driver] Row '" << sp.name << "': "
            << "Gate1(K_min=" << std::setprecision(6) << rep.Ku_min.l << ") "
            << "Gate2(ratio<=" << rep.gate2_max_ratio << ") "
            << "Gate3(leaves=" << rep.gate3_leaves << ",margin=" << rep.gate3_min_margin << ") "
            << "Gate4(leaves=" << rep.gate4_leaves << ",margin=" << rep.gate4_min_margin << ") "
            << "Gate5(leaves=" << rep.gate5_leaves << ",norm_margin=" << rep.gate5_min_norm_margin << ") "
            << "[" << std::fixed << std::setprecision(2) << sec << "s]\n";
        reports[idx] = rep;
        logs[idx] = oss.str();
      } catch (const std::exception& e) {
        errs[idx] = std::string("Row '") + specs[idx].name + "': " + e.what();
        std::cerr << "[ERROR] " << errs[idx] << "\n" << std::flush;
      }
    });
  }
  for (auto& th : threads) th.join();
  for (size_t idx = 0; idx < specs.size(); ++idx) {
    if (!errs[idx].empty()) throw std::runtime_error(errs[idx]);
    std::cout << logs[idx] << std::flush;
  }

  auto t_end = std::chrono::steady_clock::now();
  double total_sec = std::chrono::duration<double>(t_end - t_start).count();

  std::ofstream out(out_path);
  require(bool(out), "cannot open output JSON file");
  out << std::setprecision(17);
  out << "{\n"
      << "  \"agent_id\": \"gemini-21d5\",\n"
      << "  \"issue\": 509,\n"
      << "  \"cpp_sha256\": \"" << cpp_hash << "\",\n"
      << "  \"energy_band\": {\"u_min\": \"551/100000\", \"u_max\": \"463/10000\"},\n"
      << "  \"constants\": {\n"
      << "    \"gate2_wick_20pct\": \"9/40\",\n"
      << "    \"gate3_unified_f_ge_1_16\": \"11/50\",\n"
      << "    \"gate4_star_f_1_16_to_4_5\": \"11/50\",\n"
      << "    \"gate5_small_wick_f_le_1_16\": \"47/200\",\n"
      << "    \"global_one_driver_kappa\": \"47/200\",\n"
      << "    \"shell_cost_kappa_A\": \"6/25\"\n"
      << "  },\n"
      << "  \"rows\": [\n";
  for (size_t idx = 0; idx < reports.size(); ++idx) {
    const auto& r = reports[idx];
    const auto& sp = specs[idx];
    out << "    {\n"
        << "      \"name\": \"" << r.name << "\",\n"
        << "      \"params\": {\"eps\": \"" << sp.eps_num << "/" << sp.eps_den
        << "\", \"a\": \"" << sp.a_num << "/" << sp.a_den
        << "\", \"b\": \"" << sp.b_num << "/" << sp.b_den
        << "\", \"b4\": \"" << sp.b4_num << "/" << sp.b4_den << "\"},\n"
        << "      \"B0\": "; write_json_iv(out, r.B0); out << ",\n"
        << "      \"g0\": "; write_json_iv(out, r.g0); out << ",\n"
        << "      \"gp0\": "; write_json_iv(out, r.gp0); out << ",\n"
        << "      \"Phi_p0\": "; write_json_iv(out, r.P0); out << ",\n"
        << "      \"gate1_6_3_7\": {\n"
        << "        \"K_u_min_on_band\": "; write_json_iv(out, r.Ku_min); out << ",\n"
        << "        \"K_at_0_0463\": "; write_json_iv(out, r.Ku_at_umax); out << ",\n"
        << "        \"Bp_on_band\": "; write_json_iv(out, r.Bp_min); out << ",\n"
        << "        \"A0_on_band\": "; write_json_iv(out, r.A0_max); out << ",\n"
        << "        \"abs_lambda_max\": "; write_json_iv(out, r.abs_lam_max); out << "\n"
        << "      },\n"
        << "      \"gate2_6_3_6\": {\n"
        << "        \"vt_leaves\": " << r.gate2_vt_leaves << ",\n"
        << "        \"vt_max_excess\": " << r.gate2_vt_max_excess << ",\n"
        << "        \"vt_max_excess_hex\": \"" << hexfloat_str(r.gate2_vt_max_excess) << "\",\n"
        << "        \"c_cells\": " << r.gate2_c_cells << ",\n"
        << "        \"min_deficit_after_loss\": " << r.gate2_min_def << ",\n"
        << "        \"max_certified_ratio\": " << r.gate2_max_ratio << ",\n"
        << "        \"max_certified_ratio_hex\": \"" << hexfloat_str(r.gate2_max_ratio) << "\"\n"
        << "      },\n"
        << "      \"gate3_unified_1_16_to_1\": {\n"
        << "        \"leaves\": " << r.gate3_leaves << ",\n"
        << "        \"mid3d_evals\": " << r.gate3_mid3d_evals << ",\n"
        << "        \"min_H_certified\": " << r.gate3_min_H << ",\n"
        << "        \"min_margin\": " << r.gate3_min_margin << ",\n"
        << "        \"min_margin_hex\": \"" << hexfloat_str(r.gate3_min_margin) << "\"\n"
        << "      },\n"
        << "      \"gate4_star_1_16_to_4_5\": {\n"
        << "        \"leaves\": " << r.gate4_leaves << ",\n"
        << "        \"mid3d_evals\": " << r.gate4_mid3d_evals << ",\n"
        << "        \"min_margin\": " << r.gate4_min_margin << ",\n"
        << "        \"min_margin_hex\": \"" << hexfloat_str(r.gate4_min_margin) << "\"\n"
        << "      },\n"
        << "      \"gate5_small_wick_0_to_1_16\": {\n"
        << "        \"leaves\": " << r.gate5_leaves << ",\n"
        << "        \"mid3d_evals\": " << r.gate5_mid3d_evals << ",\n"
        << "        \"min_norm_margin\": " << r.gate5_min_norm_margin << ",\n"
        << "        \"min_norm_margin_hex\": \"" << hexfloat_str(r.gate5_min_norm_margin) << "\"\n"
        << "      }\n"
        << "    }" << (idx + 1 < reports.size() ? "," : "") << "\n";
  }
  out << "  ]\n}\n";
  out.close();

  std::cout << "[certify_one_driver] ALL 5 GATES CERTIFIED AT ALL 3 ROWS in "
            << std::fixed << std::setprecision(2) << total_sec << "s -> " << out_path << "\n";
  return 0;
}
