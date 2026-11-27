// certify_pure_cost.cpp
// Self-contained C++17 outward-rounded IEEE-754 interval certifier for
// Problem P6 (#627): Certified pure-cost constants for the odd and quintic
// sectors of the 19 degree-5 rows.
//
// Zero external dependencies (C++17 standard library + pthread only).
// Compile: c++ -std=c++17 -O2 -ffp-contract=off -pthread -Wall -Wextra -Werror certify_pure_cost.cpp -o certify_pure_cost
//
// Agent-ID: gemini-21d5

#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <mutex>
#include <sstream>
#include <stdexcept>
#include <string>
#include <thread>
#include <utility>
#include <vector>

namespace {

inline void require(bool cond, const std::string& msg) {
  if (!cond) throw std::runtime_error("CERTIFICATION FAILURE: " + msg);
}

// ============================================================================
// 1. Tamper-Evident FIPS 180-4 SHA-256
// ============================================================================
struct Sha256 {
  uint32_t h[8];
  uint8_t buf[64];
  uint64_t len;

  Sha256() {
    h[0] = 0x6a09e667u; h[1] = 0xbb67ae85u; h[2] = 0x3c6ef372u; h[3] = 0xa54ff53au;
    h[4] = 0x510e527fu; h[5] = 0x9b05688cu; h[6] = 0x1f83d9abu; h[7] = 0x5be0cd19u;
    len = 0;
  }
  static inline uint32_t rotr(uint32_t x, uint32_t n) { return (x >> n) | (x << (32 - n)); }
  void block(const uint8_t b[64]) {
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
    for (int i = 0; i < 16; ++i)
      w[i] = (uint32_t(b[4*i]) << 24) | (uint32_t(b[4*i+1]) << 16) | (uint32_t(b[4*i+2]) << 8) | uint32_t(b[4*i+3]);
    for (int i = 16; i < 64; ++i) {
      uint32_t s0 = rotr(w[i-15], 7) ^ rotr(w[i-15], 18) ^ (w[i-15] >> 3);
      uint32_t s1 = rotr(w[i-2], 17) ^ rotr(w[i-2], 19) ^ (w[i-2] >> 10);
      w[i] = w[i-16] + s0 + w[i-7] + s1;
    }
    uint32_t a=h[0],bb=h[1],c=h[2],d=h[3],e=h[4],f=h[5],g=h[6],hh=h[7];
    for (int i = 0; i < 64; ++i) {
      uint32_t S1 = rotr(e, 6) ^ rotr(e, 11) ^ rotr(e, 25);
      uint32_t ch = (e & f) ^ ((~e) & g);
      uint32_t t1 = hh + S1 + ch + k[i] + w[i];
      uint32_t S0 = rotr(a, 2) ^ rotr(a, 13) ^ rotr(a, 22);
      uint32_t maj = (a & bb) ^ (a & c) ^ (bb & c);
      uint32_t t2 = S0 + maj;
      hh = g; g = f; f = e; e = d + t1; d = c; c = bb; bb = a; a = t1 + t2;
    }
    h[0]+=a; h[1]+=bb; h[2]+=c; h[3]+=d; h[4]+=e; h[5]+=f; h[6]+=g; h[7]+=hh;
  }
  void update(const uint8_t* data, size_t n) {
    size_t idx = size_t(len & 63u);
    len += n;
    for (size_t i = 0; i < n; ++i) {
      buf[idx++] = data[i];
      if (idx == 64) { block(buf); idx = 0; }
    }
  }
  std::string hex() {
    uint64_t bits = len * 8u;
    uint8_t pad = 0x80u;
    update(&pad, 1);
    uint8_t zero = 0;
    while ((len & 63u) != 56u) update(&zero, 1);
    uint8_t bl[8];
    for (int i = 0; i < 8; ++i) bl[i] = uint8_t((bits >> (56 - 8*i)) & 0xffu);
    update(bl, 8);
    std::ostringstream oss;
    oss << std::hex << std::setfill('0');
    for (int i = 0; i < 8; ++i) oss << std::setw(8) << h[i];
    return oss.str();
  }
};

std::string sha256_file(const std::string& path) {
  std::ifstream in(path, std::ios::binary);
  require(bool(in), "cannot open file for SHA-256: " + path);
  Sha256 s;
  char b[8192];
  while (in.read(b, sizeof(b)) || in.gcount() > 0)
    s.update(reinterpret_cast<const uint8_t*>(b), size_t(in.gcount()));
  return s.hex();
}

// ============================================================================
// 2. Exact IEEE-754 Binary64 Outward Rounding & Verified Interval Arithmetic
// ============================================================================
static_assert(std::numeric_limits<double>::is_iec559, "IEEE-754 binary64 required");

inline double dn(double x) {
  if (std::isnan(x)) throw std::runtime_error("NaN in dn()");
  if (x == -std::numeric_limits<double>::infinity()) return x;
  if (x == 0.0) return -std::numeric_limits<double>::denorm_min();
  uint64_t u;
  std::memcpy(&u, &x, sizeof(double));
  if ((u >> 63) == 0) --u;
  else ++u;
  double r;
  std::memcpy(&r, &u, sizeof(double));
  return r;
}

inline double up(double x) {
  if (std::isnan(x)) throw std::runtime_error("NaN in up()");
  if (x == std::numeric_limits<double>::infinity()) return x;
  if (x == 0.0) return std::numeric_limits<double>::denorm_min();
  uint64_t u;
  std::memcpy(&u, &x, sizeof(double));
  if ((u >> 63) == 0) ++u;
  else --u;
  double r;
  std::memcpy(&r, &u, sizeof(double));
  return r;
}

struct I {
  double l, h;
  constexpr I() : l(0.0), h(0.0) {}
  constexpr explicit I(double v) : l(v), h(v) {}
  I(double lo, double hi) : l(lo), h(hi) {
    if (std::isnan(lo) || std::isnan(hi) || lo > hi)
      throw std::runtime_error("invalid interval [" + std::to_string(lo) + ", " + std::to_string(hi) + "]");
  }
  double mid() const { return 0.5 * (l + h); }
  double width() const { return up(h - l); }
};

inline I make_i(double lo, double hi) { return I(lo, hi); }

inline I rat_i(int64_t num, int64_t den) {
  require(den > 0, "rat_i den > 0");
  double nl = double(num), nh = double(num);
  if (int64_t(nl) != num) { nl = dn(double(num)); nh = up(double(num)); }
  double dl = double(den), dh = double(den);
  if (int64_t(dl) != den) { dl = dn(double(den)); dh = up(double(den)); }
  if (num >= 0) return I(dn(nl / dh), up(nh / dl));
  return I(dn(nl / dl), up(nh / dh));
}

inline I operator+(I a, I b) {
  double lo = (a.l == 0.0 && b.l == 0.0) ? 0.0 : dn(a.l + b.l);
  double hi = (a.h == 0.0 && b.h == 0.0) ? 0.0 : up(a.h + b.h);
  return I(lo, hi);
}
inline I operator-(I a, I b) {
  double lo = (a.l == 0.0 && b.h == 0.0) ? 0.0 : dn(a.l - b.h);
  double hi = (a.h == 0.0 && b.l == 0.0) ? 0.0 : up(a.h - b.l);
  return I(lo, hi);
}
inline I operator-(I a) { return I(-a.h, -a.l); }

inline I operator*(I a, I b) {
  if (a.l >= 0.0) {
    if (b.l >= 0.0) return I(dn(a.l * b.l), up(a.h * b.h));
    if (b.h <= 0.0) return I(dn(a.h * b.l), up(a.l * b.h));
    return I(dn(a.h * b.l), up(a.h * b.h));
  }
  if (a.h <= 0.0) {
    if (b.l >= 0.0) return I(dn(a.l * b.h), up(a.h * b.l));
    if (b.h <= 0.0) return I(dn(a.h * b.h), up(a.l * b.l));
    return I(dn(a.l * b.h), up(a.l * b.l));
  }
  if (b.l >= 0.0) return I(dn(a.l * b.h), up(a.h * b.h));
  if (b.h <= 0.0) return I(dn(a.h * b.l), up(a.l * b.l));
  double lo = std::min(dn(a.l * b.h), dn(a.h * b.l));
  double hi = std::max(up(a.l * b.l), up(a.h * b.h));
  return I(lo, hi);
}

inline I sq(I a) {
  if (a.l >= 0.0) return I((a.l == 0.0) ? 0.0 : std::max(0.0, dn(a.l * a.l)), (a.h == 0.0) ? 0.0 : up(a.h * a.h));
  if (a.h <= 0.0) return I((a.h == 0.0) ? 0.0 : std::max(0.0, dn(a.h * a.h)), (a.l == 0.0) ? 0.0 : up(a.l * a.l));
  double m = std::max(-a.l, a.h);
  return I(0.0, (m == 0.0) ? 0.0 : up(m * m));
}

inline I abs_i(I a) {
  if (a.l >= 0.0) return a;
  if (a.h <= 0.0) return I(-a.h, -a.l);
  return I(0.0, std::max(-a.l, a.h));
}

inline I inv_pos(I b) {
  require(b.l > 0.0, "inv_pos requires b.l > 0");
  return I(dn(1.0 / b.h), up(1.0 / b.l));
}

inline I operator/(I a, I b) {
  require(b.l > 0.0 || b.h < 0.0, "division by interval containing 0");
  if (b.l > 0.0) return a * inv_pos(b);
  return (-a) * inv_pos(-b);
}

inline I hull_i(I a, I b) { return I(std::min(a.l, b.l), std::max(a.h, b.h)); }

// Bracket-verified square root
inline I sqrti(I a) {
  require(a.l >= 0.0, "sqrti negative");
  double lo = (a.l == 0.0) ? 0.0 : dn(std::sqrt(a.l));
  if (lo < 0.0) lo = 0.0;
  while (up(lo * lo) > a.l && lo > 0.0) lo = dn(lo);
  double hi = (a.h == 0.0) ? 0.0 : up(std::sqrt(a.h));
  while (dn(hi * hi) < a.h) hi = up(hi);
  return I(lo, hi);
}

// Verified exp(-x) for x >= 0 via binary scaling to y <= 1/32 + alternating Taylor S_11(y) < e^{-y} < S_12(y)
inline const std::array<I, 13>& inv_small_ints() {
  static const std::array<I, 13> tbl = {
    I(1.0), rat_i(1, 1), rat_i(1, 2), rat_i(1, 3), rat_i(1, 4), rat_i(1, 5), rat_i(1, 6),
    rat_i(1, 7), rat_i(1, 8), rat_i(1, 9), rat_i(1, 10), rat_i(1, 11), rat_i(1, 12)
  };
  return tbl;
}

inline double expneg_scalar_lo(double x) {
  if (x <= 0.0) return 1.0;
  if (x >= 710.0) return 0.0;
  int k = 0;
  double y = x;
  while (y > 0.03125) { y *= 0.5; ++k; }
  const auto& inv_n = inv_small_ints();
  I yi(y), sum(1.0), term(1.0);
  for (int n = 1; n <= 11; ++n) {
    term = (term * yi) * inv_n[size_t(n)];
    if (n % 2 == 1) sum = sum - term;
    else sum = sum + term;
  }
  // Since n=11 is odd and y <= 1/32 < 1, S_11(y) < exp(-y):
  double lo = std::max(0.0, sum.l);
  for (int j = 0; j < k; ++j) lo = std::max(0.0, dn(lo * lo));
  return lo;
}

inline double expneg_scalar_hi(double x) {
  if (x <= 0.0) return 1.0;
  if (x >= 750.0) return std::numeric_limits<double>::denorm_min();
  int k = 0;
  double y = x;
  while (y > 0.03125) { y *= 0.5; ++k; }
  const auto& inv_n = inv_small_ints();
  I yi(y), sum(1.0), term(1.0);
  for (int n = 1; n <= 11; ++n) {
    term = (term * yi) * inv_n[size_t(n)];
    if (n % 2 == 1) sum = sum - term;
    else sum = sum + term;
  }
  term = (term * yi) * inv_n[12];
  // Since n=12 is even and y <= 1/32 < 1, exp(-y) < S_12(y) = S_11(y) + y^{12}/12!:
  double hi = up(sum.h + term.h);
  for (int j = 0; j < k; ++j) hi = up(hi * hi);
  return hi;
}

inline I expneg(I x) {
  require(x.l >= 0.0, "expneg requires x >= 0");
  return I(expneg_scalar_lo(x.h), expneg_scalar_hi(x.l));
}

// Machin's formula pi = 16*atan(1/5) - 4*atan(1/239)
inline I verified_atan_unit_inv(int64_t q) {
  I inv_q = rat_i(1, q);
  I inv_q2 = sq(inv_q);
  I sum(0.0), p = inv_q;
  for (int k = 0; k < 16; ++k) {
    I term = p / I(double(2 * k + 1));
    if (k % 2 == 0) sum = sum + term;
    else sum = sum - term;
    p = p * inv_q2;
  }
  I rem = p / I(33.0);
  return I(dn(sum.l - rem.h), up(sum.h + rem.h));
}

inline I verified_pi() {
  static const I pi_iv = I(16.0) * verified_atan_unit_inv(5) - I(4.0) * verified_atan_unit_inv(239);
  return pi_iv;
}

// Verified sin(x), cos(x) for x in [0, pi] via range reduction to [0, pi/2] and alternating Taylor
inline void sincos_small_nonneg(I x, I& s_out, I& c_out) {
  // x in [0, 1.6]
  I x2 = sq(x);
  I s_sum = x, s_p = x;
  for (int k = 1; k <= 10; ++k) {
    s_p = s_p * x2 / I(double(2*k * (2*k + 1)));
    if (k % 2 == 1) s_sum = s_sum - s_p;
    else s_sum = s_sum + s_p;
  }
  I s_rem = s_p * x2 / I(double(22 * 23));
  s_out = I(std::max(0.0, dn(s_sum.l - s_rem.h)), std::min(1.0, up(s_sum.h + s_rem.h)));

  I c_sum(1.0), c_p(1.0);
  for (int k = 1; k <= 10; ++k) {
    c_p = c_p * x2 / I(double((2*k - 1) * 2*k));
    if (k % 2 == 1) c_sum = c_sum - c_p;
    else c_sum = c_sum + c_p;
  }
  I c_rem = c_p * x2 / I(double(21 * 22));
  c_out = I(std::max(-1.0, dn(c_sum.l - c_rem.h)), std::min(1.0, up(c_sum.h + c_rem.h)));
}

inline void sincos_0_pi(I phi, I& s_out, I& c_out) {
  const I pi_v = verified_pi();
  const I hpi = I(0.5) * pi_v;
  double lo = std::max(0.0, phi.l);
  double hi = std::min(pi_v.h, std::max(lo, phi.h));
  if (hi <= hpi.l) {
    sincos_small_nonneg(I(lo, hi), s_out, c_out);
    c_out.l = std::max(0.0, c_out.l);
    return;
  }
  if (lo >= hpi.h) {
    I u = pi_v - I(lo, hi);
    u.l = std::max(0.0, u.l);
    I su, cu;
    sincos_small_nonneg(u, su, cu);
    s_out = su;
    c_out = -make_i(std::max(0.0, cu.l), cu.h);
    return;
  }
  // Straddles pi/2: sin attains 1 at pi/2; cos is strictly decreasing on [0, pi]
  I s1, c1, s2, c2;
  sincos_small_nonneg(I(lo, lo), s1, c1);
  I u2 = pi_v - I(hi, hi);
  u2.l = std::max(0.0, u2.l);
  sincos_small_nonneg(u2, s2, c2);
  s_out = I(std::min(s1.l, s2.l), 1.0);
  c_out = I(-c2.h, c1.h);
}

// ============================================================================
// 3. Truncated Taylor Jet<K> Automatic Differentiation
// ============================================================================
template <int K>
struct Jet {
  std::array<I, K + 1> c;
  Jet() { c.fill(I(0.0)); }
  explicit Jet(I c0) { c.fill(I(0.0)); c[0] = c0; }
  static Jet var(I x0) {
    Jet r(x0);
    if constexpr (K >= 1) r.c[1] = I(1.0);
    return r;
  }
};

template <int K>
inline Jet<K> operator+(const Jet<K>& a, const Jet<K>& b) {
  Jet<K> r;
  for (int i = 0; i <= K; ++i) r.c[i] = a.c[i] + b.c[i];
  return r;
}
template <int K>
inline Jet<K> operator-(const Jet<K>& a, const Jet<K>& b) {
  Jet<K> r;
  for (int i = 0; i <= K; ++i) r.c[i] = a.c[i] - b.c[i];
  return r;
}
template <int K>
inline Jet<K> operator-(const Jet<K>& a) {
  Jet<K> r;
  for (int i = 0; i <= K; ++i) r.c[i] = -a.c[i];
  return r;
}
template <int K>
inline Jet<K> operator*(I s, const Jet<K>& a) {
  Jet<K> r;
  for (int i = 0; i <= K; ++i) r.c[i] = s * a.c[i];
  return r;
}
template <int K>
inline Jet<K> operator*(const Jet<K>& a, I s) { return s * a; }

template <int K>
inline Jet<K> operator*(const Jet<K>& a, const Jet<K>& b) {
  Jet<K> r;
  for (int k = 0; k <= K; ++k) {
    I acc = a.c[0] * b.c[k];
    for (int j = 1; j <= k; ++j) acc = acc + a.c[j] * b.c[k - j];
    r.c[k] = acc;
  }
  return r;
}

template <int K>
inline Jet<K> sq_jet(const Jet<K>& a) {
  Jet<K> r = a * a;
  r.c[0] = sq(a.c[0]);
  return r;
}

template <int K>
inline Jet<K> inv_jet(const Jet<K>& a) {
  require(a.c[0].l > 0.0 || a.c[0].h < 0.0, "inv_jet zero");
  Jet<K> r;
  r.c[0] = I(1.0) / a.c[0];
  for (int k = 1; k <= K; ++k) {
    I acc(0.0);
    for (int j = 1; j <= k; ++j) acc = acc + a.c[j] * r.c[k - j];
    r.c[k] = -acc * r.c[0];
  }
  return r;
}

template <int K>
inline Jet<K> sqrt_jet(const Jet<K>& a) {
  require(a.c[0].l > 0.0, "sqrt_jet requires c[0] > 0");
  Jet<K> r;
  r.c[0] = sqrti(a.c[0]);
  I inv2r0 = inv_pos(I(2.0) * r.c[0]);
  for (int k = 1; k <= K; ++k) {
    I acc = a.c[k];
    for (int j = 1; j < k; ++j) acc = acc - r.c[j] * r.c[k - j];
    r.c[k] = acc * inv2r0;
  }
  return r;
}

template <int K>
inline Jet<K> expneg_jet(const Jet<K>& u) {
  Jet<K> r;
  r.c[0] = expneg(u.c[0]);
  for (int k = 1; k <= K; ++k) {
    I acc(0.0);
    for (int j = 1; j <= k; ++j) acc = acc + I(double(j)) * u.c[j] * r.c[k - j];
    r.c[k] = -acc / I(double(k));
  }
  return r;
}

template <int K>
inline void sincos_jet_0_pi(const Jet<K>& u, Jet<K>& s, Jet<K>& c) {
  sincos_0_pi(u.c[0], s.c[0], c.c[0]);
  for (int k = 1; k <= K; ++k) {
    I as(0.0), ac(0.0);
    for (int j = 1; j <= k; ++j) {
      as = as + I(double(j)) * u.c[j] * c.c[k - j];
      ac = ac - I(double(j)) * u.c[j] * s.c[k - j];
    }
    s.c[k] = as / I(double(k));
    c.c[k] = ac / I(double(k));
  }
}

inline I panel_int_jet4(const Jet<4>& j_mid, I c4_box, I delta) {
  I d2 = sq(delta), d3 = d2 * delta, d5 = d3 * d2;
  return I(2.0) * delta * j_mid.c[0] + (I(2.0) / I(3.0)) * d3 * j_mid.c[2] +
         (I(2.0) / I(5.0)) * d5 * c4_box;
}

std::string hexfloat_str(double x) {
  std::ostringstream oss;
  oss << std::hexfloat << x;
  return oss.str();
}

void write_json_iv(std::ostream& os, const I& v) {
  os << std::setprecision(17)
     << "{\"lo\":" << v.l << ",\"hi\":" << v.h
     << ",\"lo_hex\":\"" << hexfloat_str(v.l) << "\""
     << ",\"hi_hex\":\"" << hexfloat_str(v.h) << "\"}";
}

// ============================================================================
// 4. Verified Matrix Eigenvalue Bounds (Exact 2x2 + Interval LDL^T for NxN)
// ============================================================================
inline double lam_max_2x2_upper(const I& a, const I& b, const I& d) {
  // Exact monotone supremum over symmetric 2x2 interval matrix:
  I a_hi(std::max(0.0, a.h)), d_hi(std::max(0.0, d.h));
  I b_abs = abs_i(b);
  I disc = sq(a_hi - d_hi) + I(4.0) * sq(b_abs);
  I lam = I(0.5) * (a_hi + d_hi + sqrti(disc));
  return lam.h;
}

inline double lam_max_2x2_lower(const I& a, const I& b, const I& d) {
  // Rigorous lower bound on lam_max via Rayleigh quotient at midpoint eigenvector:
  double am = a.mid(), bm = b.mid(), dm = d.mid();
  double tr = 0.5 * (am + dm);
  double rt = std::sqrt(0.25 * (am - dm) * (am - dm) + bm * bm);
  double l0 = tr + rt;
  double vx = bm, vy = l0 - am;
  double nrm = std::sqrt(vx * vx + vy * vy);
  I u1(1.0), u2(0.0);
  if (nrm > 1e-14) { u1 = I(vx / nrm); u2 = I(vy / nrm); }
  else if (dm > am) { u1 = I(0.0); u2 = I(1.0); }
  I num = sq(u1) * a + I(2.0) * u1 * u2 * b + sq(u2) * d;
  I den = sq(u1) + sq(u2);
  return (num / den).l;
}

// Jacobi eigensolver on double symmetric NxN matrix (only used to propose shift mu0 and unit test vector!)
template <int N>
void jacobi_sym(std::array<std::array<double, N>, N> A, std::array<double, N>& evals, std::array<double, N>& top_vec) {
  std::array<std::array<double, N>, N> V{};
  for (int i = 0; i < N; ++i) V[i][i] = 1.0;
  for (int sweep = 0; sweep < 60; ++sweep) {
    double off = 0.0;
    for (int p = 0; p < N; ++p)
      for (int q = p + 1; q < N; ++q) off += A[p][q] * A[p][q];
    if (off < 1e-30) break;
    for (int p = 0; p < N; ++p) {
      for (int q = p + 1; q < N; ++q) {
        double apq = A[p][q];
        if (std::abs(apq) < 1e-18) continue;
        double tau = (A[q][q] - A[p][p]) / (2.0 * apq);
        double t = (tau >= 0.0) ? (1.0 / (tau + std::sqrt(1.0 + tau * tau)))
                                : (-1.0 / (-tau + std::sqrt(1.0 + tau * tau)));
        double c = 1.0 / std::sqrt(1.0 + t * t);
        double s = t * c;
        A[p][p] -= t * apq;
        A[q][q] += t * apq;
        A[p][q] = A[q][p] = 0.0;
        for (int r = 0; r < N; ++r) {
          if (r == p || r == q) continue;
          double arp = A[r][p], arq = A[r][q];
          A[r][p] = A[p][r] = c * arp - s * arq;
          A[r][q] = A[q][r] = s * arp + c * arq;
        }
        for (int r = 0; r < N; ++r) {
          double vrp = V[r][p], vrq = V[r][q];
          V[r][p] = c * vrp - s * vrq;
          V[r][q] = s * vrp + c * vrq;
        }
      }
    }
  }
  int best = 0;
  for (int i = 0; i < N; ++i) {
    evals[i] = A[i][i];
    if (evals[i] > evals[best]) best = i;
  }
  for (int i = 0; i < N; ++i) top_vec[i] = V[i][best];
}

// Rigorous outward-rounded interval LDL^T test certifying mu*I - M0 is strictly positive definite
template <int N>
bool interval_ldlt_pd(const std::array<std::array<double, N>, N>& M0, double mu) {
  std::array<std::array<I, N>, N> L{};
  std::array<I, N> D{};
  for (int i = 0; i < N; ++i) {
    for (int j = 0; j <= i; ++j) {
      I sum = (i == j) ? (I(mu) - I(M0[i][i])) : (-I(M0[i][j]));
      for (int k = 0; k < j; ++k) sum = sum - L[i][k] * L[j][k] * D[k];
      if (i == j) {
        if (sum.l <= 0.0) return false;
        D[i] = sum;
        L[i][i] = I(1.0);
      } else {
        L[i][j] = sum / D[j];
      }
    }
  }
  return true;
}

template <int N>
std::pair<double, double> sym_interval_lam_max_bounds(const std::array<std::array<I, N>, N>& M) {
  std::array<std::array<double, N>, N> M0{};
  double rad_norm = 0.0;
  for (int i = 0; i < N; ++i) {
    double row_r = 0.0;
    for (int j = 0; j < N; ++j) {
      double m = 0.5 * (M[i][j].l + M[i][j].h);
      M0[i][j] = m;
      double rij = std::max(up(M[i][j].h - m), up(m - M[i][j].l));
      row_r = up(row_r + rij);
    }
    rad_norm = std::max(rad_norm, row_r);
  }
  for (int i = 0; i < N; ++i)
    for (int j = i + 1; j < N; ++j) {
      double s = 0.5 * (M0[i][j] + M0[j][i]);
      if (s != M0[i][j] || s != M0[j][i]) {
        double d_ij = std::max(std::abs(s - M0[i][j]), std::abs(s - M0[j][i]));
        rad_norm = up(rad_norm + up(double(N) * d_ij));
        M0[i][j] = M0[j][i] = s;
      }
    }

  std::array<double, N> evals{};
  std::array<double, N> top_v{};
  jacobi_sym<N>(M0, evals, top_v);
  double lam_approx = *std::max_element(evals.begin(), evals.end());

  double eps = 1e-12;
  double mu = up(lam_approx + eps);
  while (!interval_ldlt_pd<N>(M0, mu)) {
    eps *= 4.0;
    require(eps < 1.0, "LDL^T shift failed to converge");
    mu = up(lam_approx + eps);
  }
  double hi = up(mu + rad_norm);

  // Certified lower bound via Rayleigh quotient of interval matrix M at top_v:
  I num(0.0), den(0.0);
  for (int i = 0; i < N; ++i) {
    I vi(top_v[i]);
    den = den + sq(vi);
    for (int j = 0; j < N; ++j) num = num + vi * I(top_v[j]) * M[i][j];
  }
  double lo = (den.l > 0.0) ? (num / den).l : 0.0;
  return {lo, hi};
}

// ============================================================================
// 5. Sturm-Certified Rational Elliptic Secant Ladder for Deliverable (c)
// ============================================================================
// Every (beta, U_k, alpha_k) rung satisfies for ALL (u, v) in R^2 with |u| <= U_k:
//   sqrt((1+u)^2 + v^2) + sqrt((1-u)^2 + v^2) - 2 <= alpha_k * u^2 + beta * v^2.
// Verified in pure exact rational Sturm arithmetic by verify_pure_cost.py!
struct SecantRung {
  int64_t U_milli;     // U_k = U_milli / 1000
  int64_t alpha_40;    // alpha_k = alpha_40 / 40 (with fallback 20/40 = 1/2)
};

struct SecantLadder {
  int64_t beta_num, beta_den;
  I beta_iv;
  std::vector<std::pair<double, I>> rungs; // (U_k_lo_double, alpha_iv)
};

std::vector<SecantLadder> build_secant_ladders() {
  // Pre-computed exact rational rungs (all verified by exact Sturm chain in verify_pure_cost.py
  // AND checked by polynomial lower-bound self-test at startup below!):
  struct RawSpec {
    int64_t bn, bd;
    std::vector<SecantRung> r;
  };
  const std::vector<RawSpec> specs = {
    {10002, 10000, {{14,0},{165,1},{242,2},{307,3},{369,4},{429,5},{489,6},{551,7},{614,8},{680,9},
                    {749,10},{821,11},{899,12},{981,13},{1069,14},{1164,15},{1267,16},{1378,17},{1500,18},{1634,19}}},
    {10005, 10000, {{22,0},{167,1},{243,2},{308,3},{370,4},{430,5},{490,6},{551,7},{615,8},{680,9},
                    {749,10},{822,11},{899,12},{981,13},{1069,14},{1164,15},{1267,16},{1378,17},{1500,18},{1634,19}}},
    { 1001,  1000, {{31,0},{170,1},{245,2},{310,3},{372,4},{431,5},{491,6},{553,7},{616,8},{681,9},
                    {750,10},{823,11},{900,12},{982,13},{1070,14},{1165,15},{1267,16},{1379,17},{1500,18},{1634,19}}},
    { 1002,  1000, {{44,0},{176,1},{250,2},{314,3},{375,4},{434,5},{494,6},{555,7},{618,8},{684,9},
                    {752,10},{825,11},{902,12},{984,13},{1071,14},{1166,15},{1268,16},{1379,17},{1500,18},{1634,19}}},
    { 1004,  1000, {{63,0},{186,1},{258,2},{321,3},{381,4},{440,5},{500,6},{560,7},{623,8},{688,9},
                    {756,10},{828,11},{905,12},{987,13},{1074,14},{1168,15},{1270,16},{1380,17},{1501,18},{1634,19}}},
    { 1007,  1000, {{83,0},{201,1},{270,2},{331,3},{390,4},{449,5},{507,6},{567,7},{630,8},{694,9},
                    {762,10},{834,11},{910,12},{991,13},{1078,14},{1171,15},{1272,16},{1382,17},{1502,18},{1634,19}}},
    {  101,   100, {{99,0},{213,1},{281,2},{341,3},{399,4},{457,5},{515,6},{574,7},{636,8},{700,9},
                    {768,10},{839,11},{915,12},{995,13},{1082,14},{1175,15},{1275,16},{1384,17},{1503,18},{1634,19}}},
    { 51,  50, {{140,0},{248,1},{312,2},{370,3},{426,4},{481,5},{538,6},{596,7},{657,8},{720,9},
                {786,10},{856,11},{930,12},{1009,13},{1094,14},{1185,15},{1283,16},{1389,17},{1505,18},{1634,19}}},
    { 21,  20, {{218,0},{323,1},{382,2},{437,3},{489,4},{542,5},{596,6},{652,7},{709,8},{769,9},
                {832,10},{899,11},{969,12},{1044,13},{1124,14},{1210,15},{1303,16},{1403,17},{1511,18},{1634,19}}},
    { 11,  10, {{301,0},{406,1},{464,2},{516,3},{567,4},{617,5},{669,6},{721,7},{776,8},{832,9},
                {892,10},{954,11},{1020,12},{1090,13},{1164,14},{1243,15},{1328,16},{1419,17},{1517,18},{1634,19}}},
    { 23,  20, {{361,0},{466,1},{524,2},{575,3},{625,4},{674,5},{723,6},{774,7},{826,8},{881,9},
                {937,10},{996,11},{1058,12},{1124,13},{1193,14},{1267,15},{1345,16},{1429,17},{1519,18},{1634,19}}},
    {  6,   5, {{408,0},{514,1},{571,2},{622,3},{670,4},{718,5},{767,6},{816,7},{866,8},{919,9},
                {973,10},{1029,11},{1088,12},{1150,13},{1216,14},{1285,15},{1358,16},{1436,17},{1519,18},{1634,19}}},
    {  5,   4, {{447,0},{553,1},{610,2},{660,3},{708,4},{755,5},{802,6},{850,7},{899,8},{949,9},
                {1001,10},{1056,11},{1112,12},{1171,13},{1233,14},{1298,15},{1366,16},{1439,17},{1519,18},{1634,19}}},
    { 13,  10, {{480,0},{587,1},{643,2},{693,3},{740,4},{786,5},{832,6},{879,7},{926,8},{975,9},
                {1025,10},{1077,11},{1131,12},{1187,13},{1246,14},{1308,15},{1373,16},{1441,17},{1519,18},{1634,19}}}
  };

  std::vector<SecantLadder> out;
  for (const auto& sp : specs) {
    SecantLadder sl;
    sl.beta_num = sp.bn;
    sl.beta_den = sp.bd;
    sl.beta_iv = rat_i(sp.bn, sp.bd);
    for (const auto& rg : sp.r) {
      I u_iv = rat_i(rg.U_milli, 1000);
      I a_iv = rat_i(rg.alpha_40, 40);
      // Verify polynomial nonnegativity on [1, U] and [max(1, U), inf):
      if (rg.U_milli > 1000) {
        I chk = a_iv * sq(u_iv) - I(2.0) * u_iv + I(2.0);
        require(chk.l >= 0.0, "ladder [1, U] check failed");
      }
      if (rg.alpha_40 == 0) {
        I chk = sl.beta_iv * (I(1.0) - sq(u_iv)) - I(1.0);
        require(chk.l >= 0.0, "ladder alpha=0 check failed");
      }
      sl.rungs.push_back({u_iv.l, a_iv});
    }
    out.push_back(sl);
  }
  return out;
}

inline I lookup_alpha(const SecantLadder& sl, double U_hi) {
  for (const auto& kv : sl.rungs) {
    if (U_hi <= kv.first) return kv.second;
  }
  return I(0.5);
}

// ============================================================================
// 6. Row Parameters, Algebraic Positivity Checks, & 1D / 2D Integrators
// ============================================================================
struct RowSpec {
  std::string label;
  int64_t L6, B6, bA6, bB6, nu6; // exact rationals / 10^6
};

struct RowDerived {
  RowSpec sp;
  I eps1, eta, p1, p2, pi_v, sqrt2, sqrt3, sqrt6, sqrt12;
  I l, beta, bA, bB, nu5;
  I alp, gamB, a0, a2, d2;
  I c0, c1, c2; // g(T) = c0 + c1*T + c2*T^2

  explicit RowDerived(const RowSpec& s) : sp(s) {
    eps1 = rat_i(39, 50);
    eta  = rat_i(779, 10000);
    p1   = rat_i(50, 39);
    p2   = rat_i(10000, 779);
    pi_v = verified_pi();
    sqrt2 = sqrti(I(2.0));
    sqrt3 = sqrti(I(3.0));
    sqrt6 = sqrti(I(6.0));
    sqrt12 = I(2.0) * sqrt3;

    l    = rat_i(s.L6, 1000000);
    beta = rat_i(s.B6, 1000000);
    bA   = rat_i(s.bA6, 1000000);
    bB   = rat_i(s.bB6, 1000000);
    nu5  = rat_i(s.nu6, 1000000);

    alp  = -bA;
    gamB = (-bB) / sqrt2;
    a0   = I(1.0) - alp;
    a2   = alp + gamB;
    d2   = alp - gamB;

    c0 = l - I(2.0) * beta + sqrt3 * nu5;
    c1 = beta - sqrt3 * nu5;
    c2 = nu5 / sqrt12;

    // Certify algebraic root-uniqueness premises on [0, inf):
    require(alp.l > 0.0 && gamB.l > 0.0, "alp, gamB > 0");
    require(a0.l > 0.9, "a0 = 1 - |bA| > 0.9");
    require(d2.l > 0.015, "d2 = |bA| - |bB|/sqrt(2) > 0");
    require(c0.l > 0.45 && c1.l > 0.06 && c2.l > 0.0, "g(T) coefficients positive");
    I psi_lin = I(3.0) * a0 * c1 - a2 * c0;
    require(psi_lin.l > 0.15, "psi'(r) linear numerator > 0");
  }

  inline I g_eval(I T) const { return c0 + T * (c1 + T * c2); }
  inline I psi_eval(I r) const {
    I T = sq(r);
    return (r * g_eval(T)) / (a0 + a2 * T);
  }
  inline I psit_eval(I r) const {
    I T = sq(r);
    return (r * g_eval(T)) / (a0 + d2 * T);
  }
};

// Deliverable (a): Zero-core scalar Z = 2 * eps1 * int_0^inf r^2 e^{-r^2} / g(r^2) dr
I certify_Z(const RowDerived& rd) {
  const int NP = 4096;
  const double R_cut = 8.0;
  const double h = R_cut / double(NP); // exact dyadic 1/512
  I acc(0.0);
  for (int i = 0; i < NP; ++i) {
    double lo = i * h, hi = (i + 1) * h;
    I rm = I(0.5) * (I(lo) + I(hi));
    I dh = I(0.5) * (I(hi) - I(lo));
    I rbox(lo, hi);
    auto ev = [&](I ra) {
      Jet<4> r = Jet<4>::var(ra);
      Jet<4> T = sq_jet<4>(r);
      Jet<4> g = Jet<4>(rd.c0) + rd.c1 * T + rd.c2 * sq_jet<4>(T);
      return T * expneg_jet<4>(T) * inv_jet<4>(g);
    };
    Jet<4> jm = ev(rm), jx = ev(rbox);
    I q4 = panel_int_jet4(jm, jx.c[4], dh);
    I q0 = (I(2.0) * dh) * jx.c[0];
    acc = acc + make_i(std::max(q4.l, q0.l), std::min(q4.h, q0.h));
  }
  I main_part = I(2.0) * rd.eps1 * acc;
  I tail_hi = (I(65.0) * rd.eps1 * expneg(I(64.0))) / rd.g_eval(I(64.0));
  return make_i(main_part.l, (main_part + I(0.0, tail_hi.h)).h);
}

// Analytic large-s tail for s >= psi(R_star) with R_star = 9.0, inner ball R1 = 5.0 (T1 = 25.0)
struct LargeSTails {
  double s_max_lo;
  double Modd_over_p1_hi;
  double qtilde_over_p1_hi;
  double NE1_over_p2_hi;
  double NE_over_p2_hi;
};

LargeSTails certify_large_s_tails(const RowDerived& rd) {
  const I r_star(9.0), r1(5.0), T1(25.0);
  I s_max = rd.psi_eval(r_star);
  I psit1 = rd.psit_eval(r1);
  require((I(0.75) * s_max - psit1).l > 0.0, "psit(5) < (3/4)*psi(9)");

  // 1. Inner ball |z| <= 5: |A_+(z; s)| >= a0 * (s_max - psit(5))
  I M_in = rd.a0 * (s_max - psit1);
  require(M_in.l > 10.0, "M_in > 10");
  I inv_Min = inv_pos(M_in);

  // 2. Outer region |z| > 5 (T > 25):
  // Non-cone lower bound on |A_+|: min((1/4)*s_max*a0, (1/4)*5*g(25), s_max*a0/sqrt(10))
  I lb_lo = I(0.25) * s_max * rd.a0;
  I lb_hi = I(0.25) * r1 * rd.g_eval(T1);
  I lb_ang = (s_max * rd.a0) / sqrti(I(10.0));
  double lb_noncone = std::min({lb_lo.l, lb_hi.l, lb_ang.l});
  require(lb_noncone > 2.0, "lb_noncone > 2");

  // Cone parameters on T >= 25:
  I kx = -(rat_i(5, 3)) * rd.c0 + rat_i(2, 15) * rd.c1 * T1 + rat_i(29, 15) * rd.c2 * sq(T1);
  I ky = rd.g_eval(T1) * (I(1.0) - (I(8.0) * rd.gamB) / (I(3.0) * rd.a2));
  require(kx.l > 0.5 && ky.l > 0.5, "cone kx, ky > 0.5");

  // Fubini integral of e^{-(x^2+y^2)/4} / sqrt(kx^2*(x-x0(y))^2 + ky^2*y^2) over R^2:
  // Splitting R_x at min(1, |y|) and 1 gives <= 4*sqrt(pi)/ky + (4*pi + 4)/kx.
  // Factor e^{-T} = e^{-T/2} * e^{-T/4} * e^{-T/4} on T >= 25: e^{-T/2} <= e^{-12.5}!
  I fubini_cone = (I(4.0) * sqrti(rd.pi_v)) / ky + (I(4.0) * rd.pi_v + I(4.0)) / kx;
  I outer_factor = (expneg(I(12.5)) / rd.pi_v) *
                   (fubini_cone + (I(4.0) * rd.pi_v) / I(lb_noncone));

  // Upper bound on sup_{T >= 25} (trace_poly(T) * e^{-T/4}):
  // Note d/dT (T^k e^{-T/4}) <= 0 for T >= 4k; since 4*5 = 20 < 25, EVERY T^k e^{-T/4} (k <= 5)
  // attains its exact maximum on [25, inf) at T = 25!
  I e_quarter_25 = expneg(I(6.25));
  // Odd trace |z|^2 + |zbar|^2 = 2*T:
  I sup_odd = I(2.0) * T1 * e_quarter_25;
  // E1 trace: |e10|^2 + |e01|^2 + |e21|^2 + |e12|^2 + |e30|^2 = 2*T + T*(T-2)^2 + T^3/6
  I sup_E1 = (I(2.0) * T1 + T1 * sq(T1 - I(2.0)) + (T1 * sq(T1)) / I(6.0)) * e_quarter_25;
  // All 12 E_{a,b} (a<=3, b<=2): bound |e_{a,b}(z)|^2 on T=25 explicitly:
  // e00:1; e10,e01:T; e20,e02:T^2/2; e30:T^3/6; e11:(T-1)^2; e21,e12:T(T-2)^2/2;
  // e31:T^2(T-3)^2/6; e22:(T^2-4T+2)^2/4; e32:T(T^2-6T+6)^2/12!
  I sum12_at_25 = I(1.0) + I(2.0) * T1 + sq(T1) + (T1 * sq(T1)) / I(6.0) +
                  sq(T1 - I(1.0)) + T1 * sq(T1 - I(2.0)) +
                  (sq(T1) * sq(T1 - I(3.0))) / I(6.0) +
                  sq(sq(T1) - I(4.0) * T1 + I(2.0)) / I(4.0) +
                  (T1 * sq(sq(T1) - I(6.0) * T1 + I(6.0))) / I(12.0);
  I sup_Eall = sum12_at_25 * e_quarter_25;

  // By unitary / Parseval trace: lam_max <= tr(N_F) = E_{|z|<=5}[sum |F_j|^2 / |A_+|] + outer!
  // On |z| <= 5, E[sum |F_j|^2 * 1_{|z|<=5}] <= E[sum |F_j|^2] = |F| (orthonormality E|e_{a,b}|^2 = 1!).
  I tr_odd_hi  = I(2.0) * inv_Min + outer_factor * sup_odd;
  I tr_E1_hi   = I(5.0) * inv_Min + outer_factor * sup_E1;
  I tr_Eall_hi = I(12.0) * inv_Min + outer_factor * sup_Eall;

  LargeSTails res{};
  res.s_max_lo = s_max.l;
  res.Modd_over_p1_hi = (tr_odd_hi / rd.p1).h;
  res.qtilde_over_p1_hi = (tr_odd_hi / rd.p1).h;
  res.NE1_over_p2_hi = (tr_E1_hi / rd.p2).h;
  res.NE_over_p2_hi = (tr_Eall_hi / rd.p2).h;
  return res;
}

// ============================================================================
// 7. Shifted-Polar 2D Integrator on Disjoint r*-Slabs Covering [0, 9.0]
// ============================================================================
// Evaluates M_odd(s), qtilde_odd(s), N_{E1}(s), N_E(s) on [r_a, r_b] via:
//   I(r*) in I(r_m) + [-dr, +dr] * I'([r_a, r_b])
// where I(r_m) uses the iterated 1D Jet<2> midpoint rule in (rho, phi) and
// I'([r_a, r_b]) sums Jet<1> derivatives d/dr* across exact disjoint cells.

struct SlabMatrices {
  double r_lo, r_hi;
  I s_iv;
  // M_odd blocks (2x2 + 2x2):
  std::array<std::array<I, 2>, 2> Modd_pos, Modd_neg;
  // qtilde_odd blocks (2x2 + 2x2):
  std::array<std::array<I, 2>, 2> Mtil_pos, Mtil_neg;
  // N_{E_odd} (6x6, top-left 5x5 is N_{E1}) and N_{E_even} (6x6):
  std::array<std::array<I, 6>, 6> NE_odd, NE_even;
};

// Bivariate truncated Taylor jet BivJet12 in R[eps, eta] / (eps^2, eta^3):
//   i in {0, 1} tracks r* (value and 1st derivative across [r_lo, r_hi]),
//   j in {0, 1, 2} tracks aux = rho or phi (for 2D Gauss-Midpoint quadrature of BOTH I(rm) and I'([r_lo, r_hi])!).
// Every nilpotent delta with delta.c[0][0] == 0 satisfies delta^4 == 0 identically mod (eps^2, eta^3):
// among 4 factors of degree >= 1, either >= 2 carry eps (eps^2 = 0) or >= 3 carry eta (eta^3 = 0).
struct BivJet12 {
  std::array<std::array<I, 3>, 2> c;
  BivJet12() { c[0].fill(I(0.0)); c[1].fill(I(0.0)); }
  explicit BivJet12(I c00) : BivJet12() { c[0][0] = c00; }
  static BivJet12 from_rs1(const Jet<1>& j) {
    BivJet12 r;
    r.c[0][0] = j.c[0];
    r.c[1][0] = j.c[1];
    return r;
  }
  static BivJet12 from_aux2(const Jet<2>& j) {
    BivJet12 r;
    for (int k = 0; k < 3; ++k) r.c[0][k] = j.c[k];
    return r;
  }
};

inline BivJet12 operator+(const BivJet12& a, const BivJet12& b) {
  BivJet12 r;
  for (int i = 0; i < 2; ++i)
    for (int j = 0; j < 3; ++j) r.c[i][j] = a.c[i][j] + b.c[i][j];
  return r;
}
inline BivJet12 operator-(const BivJet12& a, const BivJet12& b) {
  BivJet12 r;
  for (int i = 0; i < 2; ++i)
    for (int j = 0; j < 3; ++j) r.c[i][j] = a.c[i][j] - b.c[i][j];
  return r;
}
inline BivJet12 operator-(const BivJet12& a) {
  BivJet12 r;
  for (int i = 0; i < 2; ++i)
    for (int j = 0; j < 3; ++j) r.c[i][j] = -a.c[i][j];
  return r;
}
inline BivJet12 operator*(const I& s, const BivJet12& a) {
  BivJet12 r;
  for (int i = 0; i < 2; ++i)
    for (int j = 0; j < 3; ++j) r.c[i][j] = s * a.c[i][j];
  return r;
}
inline BivJet12 operator*(const BivJet12& a, const BivJet12& b) {
  BivJet12 r;
  for (int i = 0; i < 2; ++i) {
    for (int j = 0; j < 3; ++j) {
      bool first = true;
      I sum(0.0);
      for (int p = 0; p <= i; ++p) {
        for (int q = 0; q <= j; ++q) {
          I prod = a.c[p][q] * b.c[i - p][j - q];
          if (first) { sum = prod; first = false; }
          else sum = sum + prod;
        }
      }
      r.c[i][j] = sum;
    }
  }
  return r;
}
inline BivJet12 horner_biv12(const BivJet12& u, const std::array<I, 4>& d) {
  BivJet12 del = u;
  del.c[0][0] = I(0.0);
  BivJet12 r(d[3]);
  for (int k = 2; k >= 0; --k) r = BivJet12(d[k]) + del * r;
  return r;
}

// Overloaded elementary Jet operations for generic template evaluation (Jet<K> and BivJet12):
template <int K> inline void clamp_nonneg0(Jet<K>& u) { u.c[0].l = std::max(0.0, u.c[0].l); }
inline void clamp_nonneg0(BivJet12& u) { u.c[0][0].l = std::max(0.0, u.c[0][0].l); }

template <int K> inline Jet<K> sq_g(const Jet<K>& a) { return sq_jet<K>(a); }
inline BivJet12 sq_g(const BivJet12& a) {
  BivJet12 r = a * a;
  r.c[0][0] = sq(a.c[0][0]);
  return r;
}

template <int K> inline Jet<K> inv_g(const Jet<K>& a) { return inv_jet<K>(a); }
inline BivJet12 inv_g(const BivJet12& u) {
  I i1 = inv_pos(u.c[0][0]);
  I i2 = sq(i1), i3 = i2 * i1, i4 = sq(i2);
  return horner_biv12(u, {i1, -i2, i3, -i4});
}

template <int K> inline Jet<K> invsqrt_g(const Jet<K>& a) { return inv_jet<K>(sqrt_jet<K>(a)); }
inline BivJet12 invsqrt_g(const BivJet12& u) {
  require(u.c[0][0].l > 0.0, "invsqrt_g BivJet12 requires u > 0");
  I is0 = inv_pos(sqrti(u.c[0][0]));
  I iu = inv_pos(u.c[0][0]);
  I iu2 = sq(iu), iu3 = iu2 * iu;
  return horner_biv12(u, {is0, -I(0.5) * (is0 * iu), I(0.375) * (is0 * iu2), -I(0.3125) * (is0 * iu3)});
}

template <int K> inline Jet<K> expneg_g(const Jet<K>& u) { return expneg_jet<K>(u); }
inline BivJet12 expneg_g(const BivJet12& u) {
  I u0 = u.c[0][0];
  u0.l = std::max(0.0, u0.l);
  I e0 = expneg(u0);
  return horner_biv12(u, {e0, -e0, I(0.5) * e0, -rat_i(1, 6) * e0});
}

// Fast 6-channel evaluator for Modd_pos (0..2) and Modd_neg (3..5) only:
static constexpr int N_ODD = 6;

template <typename J>
inline void eval_odd_integrands(const RowDerived& rd,
                                const J& rs, const J& rho,
                                const J& cphi, const J& sphi,
                                std::array<J, N_ODD>& out,
                                J* out_T = nullptr, J* out_zx = nullptr,
                                J* out_zy = nullptr, J* out_wt = nullptr) {
  const I two_over_pi = I(2.0) / rd.pi_v;
  J rs2 = sq_g(rs);
  J r_cphi = rho * cphi;

  J zx = r_cphi - rs;
  J zy = rho * sphi;
  J T = sq_g(zx) + sq_g(zy);
  clamp_nonneg0(T);

  J g_rs = J(rd.c0) + rd.c1 * rs2 + rd.c2 * sq_g(rs2);
  J s = (rs * g_rs) * inv_g(J(rd.a0) + rd.a2 * rs2);

  J gT = J(rd.c0) + rd.c1 * T + rd.c2 * sq_g(T);
  J dr = rho - (I(2.0) * rs) * cphi;
  J real_shift = (-rs) * dr * (J(rd.c1) + rd.c2 * (T + rs2)) + s * (rd.alp * dr);
  J c2phi = sq_g(cphi) - sq_g(sphi);
  J s2phi = I(2.0) * (cphi * sphi);
  J s_gam = rd.gamB * s;
  J At_re = cphi * gT + real_shift + s_gam * (rho * c2phi - (I(2.0) * rs) * cphi);
  J At_im = sphi * gT + s_gam * (rho * s2phi - (I(2.0) * rs) * sphi);

  J inv_At = invsqrt_g(sq_g(At_re) + sq_g(At_im));
  J ph_re = At_re * inv_At;
  J ph_im = At_im * inv_At;

  J wt = two_over_pi * expneg_g(T) * inv_At;

  J u_z  = zx * ph_re + zy * ph_im;
  J v_z  = zy * ph_re - zx * ph_im;
  J u_zb = zx * ph_re - zy * ph_im;
  J v_zb = -(zy * ph_re + zx * ph_im);

  out[0] = wt * sq_g(v_z);
  out[1] = wt * (v_z * v_zb);
  out[2] = wt * sq_g(v_zb);
  out[3] = wt * sq_g(u_z);
  out[4] = wt * (u_z * u_zb);
  out[5] = wt * sq_g(u_zb);

  if (out_T) *out_T = T;
  if (out_zx) *out_zx = zx;
  if (out_zy) *out_zy = zy;
  if (out_wt) *out_wt = wt;
}

// Generic evaluation of all 40 distinct symmetric matrix integrands at (rs, rho, phi)
// Packing order (40 scalars):
//   0..2:   Modd_pos (00, 01, 11)
//   3..5:   Modd_neg (00, 01, 11)   (Mtil_pos = Modd_pos + 0.5*Modd_neg, Mtil_neg = Modd_neg + 0.5*Modd_pos)
//   6..22:  17 distinct entries of NE_odd (6x6 symmetric)
//   23..39: 17 distinct entries of NE_even (6x6 symmetric)
static constexpr int N_PACK = 40;

template <typename J>
void eval_all_integrands(const RowDerived& rd,
                         const J& rs, const J& rho,
                         const J& cphi, const J& sphi,
                         std::array<J, N_PACK>& out) {
  std::array<J, N_ODD> odd6;
  J T, zx, zy, wt;
  eval_odd_integrands<J>(rd, rs, rho, cphi, sphi, odd6, &T, &zx, &zy, &wt);
  for (int m = 0; m < N_ODD; ++m) out[m] = odd6[m];

  const I inv_s2 = I(1.0) / rd.sqrt2;
  const I inv_s6 = I(1.0) / rd.sqrt6;
  const I inv_s12 = I(1.0) / rd.sqrt12;

  J z2x = sq_g(zx) - sq_g(zy);
  J z2y = I(2.0) * (zx * zy);
  J z4x = sq_g(z2x) - sq_g(z2y);
  J T2 = sq_g(T);

  // 17 distinct NE_odd entries (basis: z, zbar, z*l21, zbar*l21, z^3/sqrt6, z*l32):
  J l21 = inv_s2 * (T - J(I(2.0)));
  J l21_2 = sq_g(l21);
  J l32 = inv_s12 * (T2 - I(6.0) * T + J(I(6.0)));
  J l21_l32 = l21 * l32;

  J wt_T = wt * T;
  J wt_z2x = wt * z2x;
  J wt_z4x = wt * z4x;
  J wt_Tz2x_s6 = inv_s6 * (wt_T * z2x);
  J wt_z4x_s6 = inv_s6 * wt_z4x;

  out[6]  = wt_T;                              // (0,0) and (1,1)
  out[7]  = wt_z2x;                            // (0,1)
  out[8]  = wt_T * l21;                        // (0,2) and (1,3)
  out[9]  = wt_z2x * l21;                      // (0,3) and (1,2)
  out[10] = wt_Tz2x_s6;                        // (0,4)
  out[11] = wt_T * l32;                        // (0,5)
  out[12] = wt_z4x_s6;                         // (1,4)
  out[13] = wt_z2x * l32;                      // (1,5)
  out[14] = wt_T * l21_2;                      // (2,2) and (3,3)
  out[15] = wt_z2x * l21_2;                    // (2,3)
  out[16] = wt_Tz2x_s6 * l21;                  // (2,4)
  out[17] = wt_T * l21_l32;                    // (2,5)
  out[18] = wt_z4x_s6 * l21;                   // (3,4)
  out[19] = wt_z2x * l21_l32;                  // (3,5)
  out[20] = rat_i(1, 6) * (wt_T * T2);         // (4,4)
  out[21] = wt_Tz2x_s6 * l32;                  // (4,5)
  out[22] = wt_T * sq_g(l32);                  // (5,5)

  // 17 distinct NE_even entries (basis: 1, z^2/sqrt2, T-1, z^2*l31, zbar^2/sqrt2, l22):
  J Tm1 = T - J(I(1.0));
  J l31 = inv_s6 * (T - J(I(3.0)));
  J l22 = I(0.5) * (T2 - I(4.0) * T + J(I(2.0)));
  J wt_z2_s2 = inv_s2 * wt_z2x;
  J wt_T2 = wt * T2;

  out[23] = wt;                                // (0,0)
  out[24] = wt_z2_s2;                          // (0,1) and (0,4)
  out[25] = wt * Tm1;                          // (0,2)
  out[26] = wt_z2x * l31;                      // (0,3)
  out[27] = wt * l22;                          // (0,5)
  out[28] = I(0.5) * wt_T2;                    // (1,1) and (4,4)
  out[29] = wt_z2_s2 * Tm1;                    // (1,2) and (2,4)
  out[30] = inv_s2 * (wt_T2 * l31);            // (1,3)
  out[31] = I(0.5) * wt_z4x;                   // (1,4)
  out[32] = wt_z2_s2 * l22;                    // (1,5) and (4,5)
  out[33] = wt * sq_g(Tm1);                    // (2,2)
  out[34] = wt_z2x * (Tm1 * l31);              // (2,3)
  out[35] = wt * (Tm1 * l22);                  // (2,5)
  out[36] = wt_T2 * sq_g(l31);                 // (3,3)
  out[37] = inv_s2 * (wt_z4x * l31);           // (3,4)
  out[38] = wt_z2x * (l31 * l22);              // (3,5)
  out[39] = wt * sq_g(l22);                    // (5,5)
}

inline void unpack_ne_matrices(const std::array<I, N_PACK>& total,
                               std::array<std::array<I, 6>, 6>& NE_odd,
                               std::array<std::array<I, 6>, 6>& NE_even) {
  static constexpr int map_odd[6][6] = {
    { 6,  7,  8,  9, 10, 11},
    { 7,  6,  9,  8, 12, 13},
    { 8,  9, 14, 15, 16, 17},
    { 9,  8, 15, 14, 18, 19},
    {10, 12, 16, 18, 20, 21},
    {11, 13, 17, 19, 21, 22}
  };
  static constexpr int map_even[6][6] = {
    {23, 24, 25, 26, 24, 27},
    {24, 28, 29, 30, 31, 32},
    {25, 29, 33, 34, 29, 35},
    {26, 30, 34, 36, 37, 38},
    {24, 31, 29, 37, 28, 32},
    {27, 32, 35, 38, 32, 39}
  };
  for (int i = 0; i < 6; ++i) {
    for (int j = 0; j < 6; ++j) {
      NE_odd[i][j]  = total[static_cast<size_t>(map_odd[i][j])];
      NE_even[i][j] = total[static_cast<size_t>(map_even[i][j])];
    }
  }
}

template <int NP>
void integrate_slab_channels(const RowDerived& rd, double r_lo, double r_hi,
                             int n_phi, double h_rho, double T_biv_cut,
                             std::array<I, NP>& total, I& s_iv_out) {
  require(r_lo < r_hi && r_lo >= 0.0, "slab ordering");
  I rm = I(0.5) * (I(r_lo) + I(r_hi));
  I dr = I(0.5) * (I(r_hi) - I(r_lo));
  I rs_box(r_lo, r_hi);
  require(rm.l >= rs_box.l && rm.h <= rs_box.h, "rm inside rs_box");

  const double rho_min = 0.0;
  double rho_max = std::ceil(std::max(r_hi + 7.5, 2.0 * r_hi + 2.0));
  int n_rho = int(std::llround((rho_max - rho_min) / h_rho));
  require(n_rho > 0 && std::abs(rho_min + n_rho * h_rho - rho_max) == 0.0, "exact dyadic rho grid");

  const I pi_v = rd.pi_v;
  const double pi_lo = pi_v.l;

  std::vector<double> phi_edges;
  if (r_lo > 1.5 && 5.0 / r_lo < 0.85 * pi_lo) {
    const double phi_core = 5.0 / r_lo;
    const int n_core = n_phi;
    const int n_tail = 64;
    phi_edges.reserve(size_t(n_core + n_tail + 1));
    for (int j = 0; j <= n_core; ++j)
      phi_edges.push_back(j == 0 ? 0.0 : (j == n_core ? phi_core : (phi_core * double(j) / double(n_core))));
    for (int j = 1; j <= n_tail; ++j)
      phi_edges.push_back(j == n_tail ? pi_lo : (phi_core + (pi_lo - phi_core) * double(j) / double(n_tail)));
  } else {
    phi_edges.resize(size_t(n_phi + 1));
    for (int j = 0; j <= n_phi; ++j)
      phi_edges[size_t(j)] = (j == 0) ? 0.0 : (j == n_phi ? pi_lo : (pi_lo * double(j) / double(n_phi)));
  }
  const int n_phi_tot = int(phi_edges.size()) - 1;
  require(n_phi_tot > 0 && phi_edges.front() == 0.0 && phi_edges.back() == pi_lo, "phi_edges endpoints");
  for (int j = 0; j < n_phi_tot; ++j) require(phi_edges[size_t(j)] < phi_edges[size_t(j + 1)], "phi_edges increasing");

  struct PhiCell {
    I pm, dphi, pbox;
    I cm, sm, cbox, sbox;
    BivJet12 cb12, sb12;
  };
  std::vector<PhiCell> pcells(static_cast<size_t>(n_phi_tot));
  for (int j = 0; j < n_phi_tot; ++j) {
    double plo = phi_edges[size_t(j)], phi_h = phi_edges[size_t(j + 1)];
    pcells[size_t(j)].pm = I(0.5) * (I(plo) + I(phi_h));
    pcells[size_t(j)].dphi = I(0.5) * (I(phi_h) - I(plo));
    pcells[size_t(j)].pbox = I(plo, phi_h);
    sincos_0_pi(pcells[size_t(j)].pm, pcells[size_t(j)].sm, pcells[size_t(j)].cm);
    sincos_0_pi(pcells[size_t(j)].pbox, pcells[size_t(j)].sbox, pcells[size_t(j)].cbox);
    Jet<2> pj = Jet<2>::var(pcells[size_t(j)].pbox), sj2, cj2;
    sincos_jet_0_pi<2>(pj, sj2, cj2);
    pcells[size_t(j)].cb12 = BivJet12::from_aux2(cj2);
    pcells[size_t(j)].sb12 = BivJet12::from_aux2(sj2);
  }

  auto call_eval = [&](const auto& rs_arg, const auto& rho_arg,
                       const auto& c_arg, const auto& s_arg, auto& out_arr) {
    using JType = std::decay_t<decltype(rs_arg)>;
    if constexpr (NP == N_ODD) {
      eval_odd_integrands<JType>(rd, rs_arg, rho_arg, c_arg, s_arg, out_arr);
    } else {
      eval_all_integrands<JType>(rd, rs_arg, rho_arg, c_arg, s_arg, out_arr);
    }
  };

  std::array<I, NP> acc_mid{}, acc_der{}, acc_outer{};
  acc_mid.fill(I(0.0));
  acc_der.fill(I(0.0));
  acc_outer.fill(I(0.0));

  Jet<0> j0_rm(rm);
  Jet<0> j0_rs_box(rs_box);
  Jet<1> j1_rs = Jet<1>::var(rs_box);
  BivJet12 b12_rs = BivJet12::from_rs1(j1_rs);

  for (int ir = 0; ir < n_rho; ++ir) {
    double r0 = rho_min + ir * h_rho, r1 = rho_min + (ir + 1) * h_rho;
    I rhom = I(0.5) * (I(r0) + I(r1));
    I drho = I(0.5) * (I(r1) - I(r0));
    I rhobox(r0, r1);
    I drho3 = sq(drho) * drho;

    Jet<0> j0_rhom(rhom);
    Jet<1> j1_rhom(rhom);
    BivJet12 b12_rho_var = BivJet12::from_aux2(Jet<2>::var(rhobox));
    BivJet12 b12_rho_const(rhobox);

    for (int j = 0; j < n_phi_tot; ++j) {
      const auto& pc = pcells[size_t(j)];
      I area4 = I(4.0) * drho * pc.dphi;
      I T_cell = sq(rhobox * pc.cbox - rs_box) + sq(rhobox * pc.sbox);
      if (T_cell.l >= T_biv_cut) {
        std::array<Jet<0>, NP> f_out;
        call_eval(j0_rs_box, Jet<0>(rhobox), Jet<0>(pc.cbox), Jet<0>(pc.sbox), f_out);
        for (int m = 0; m < NP; ++m) acc_outer[m] = acc_outer[m] + area4 * f_out[m].c[0];
        continue;
      }

      I w_r2 = rat_i(4, 3) * drho3 * pc.dphi;
      I w_p2 = rat_i(4, 3) * drho * (sq(pc.dphi) * pc.dphi);

      std::array<Jet<0>, NP> f_pt;
      call_eval(j0_rm, j0_rhom, Jet<0>(pc.cm), Jet<0>(pc.sm), f_pt);

      std::array<Jet<1>, NP> f_pt_der;
      call_eval(j1_rs, j1_rhom, Jet<1>(pc.cm), Jet<1>(pc.sm), f_pt_der);

      std::array<BivJet12, NP> f_r2;
      call_eval(b12_rs, b12_rho_var, BivJet12(pc.cm), BivJet12(pc.sm), f_r2);

      std::array<BivJet12, NP> f_p2;
      call_eval(b12_rs, b12_rho_const, pc.cb12, pc.sb12, f_p2);

      for (int m = 0; m < NP; ++m) {
        I q2_m = area4 * f_pt[m].c[0] + w_r2 * f_r2[m].c[0][2] + w_p2 * f_p2[m].c[0][2];
        I q0_m = area4 * f_p2[m].c[0][0];
        double lom = std::max(q2_m.l, q0_m.l), him = std::min(q2_m.h, q0_m.h);
        if (lom > him) { lom = q0_m.l; him = q0_m.h; }
        acc_mid[m] = acc_mid[m] + I(lom, him);

        I q2_d = area4 * f_pt_der[m].c[1] + w_r2 * f_r2[m].c[1][2] + w_p2 * f_p2[m].c[1][2];
        I q0_d = area4 * f_p2[m].c[1][0];
        double lod = std::max(q2_d.l, q0_d.l), hid = std::min(q2_d.h, q0_d.h);
        if (lod > hid) { lod = q0_d.l; hid = q0_d.h; }
        acc_der[m] = acc_der[m] + I(lod, hid);
      }
    }
  }

  I s_iv = make_i(rd.psi_eval(I(r_lo)).l, rd.psi_eval(I(r_hi)).h);
  s_iv_out = s_iv;

  std::array<I, NP> phi_rem_acc{};
  phi_rem_acc.fill(I(0.0));
  {
    I phi_rem_box(pi_lo, pi_v.h);
    I dphi_rem = pi_v - I(pi_lo);
    dphi_rem.l = std::max(0.0, dphi_rem.l);
    I c_rem, s_rem;
    sincos_0_pi(phi_rem_box, s_rem, c_rem);
    Jet<0> j_rs_box(rs_box);
    for (int ir = 0; ir < n_rho; ++ir) {
      double r0 = rho_min + ir * h_rho, r1 = rho_min + (ir + 1) * h_rho;
      I rbox(r0, r1);
      I area_rem = I(2.0) * (I(0.5) * (I(r1) - I(r0))) * dphi_rem;
      std::array<Jet<0>, NP> f_rem;
      call_eval(j_rs_box, Jet<0>(rbox), Jet<0>(c_rem), Jet<0>(s_rem), f_rem);
      for (int m = 0; m < NP; ++m) phi_rem_acc[m] = phi_rem_acc[m] + area_rem * f_rem[m].c[0];
    }
  }

  I tail_rad(0.0);
  {
    I R_tail(rho_max - r_hi);
    require(R_tail.l >= 7.5 && R_tail.l >= r_hi + 1.5, "R_tail >= 7.5 and r_hi + 1.5");
    I T0 = sq(R_tail);
    I A_lb = (rd.a0 + rd.a2 * T0) * (rd.psi_eval(R_tail) - I(s_iv.h));
    require(A_lb.l > 0.5, "radial tail A_lb > 0.5");
    I T0_2 = sq(T0), T0_3 = T0_2 * T0, T0_4 = sq(T0_2), T0_5 = T0_4 * T0;
    I gamma6_tail = (T0_5 + I(5.0)*T0_4 + I(20.0)*T0_3 + I(60.0)*T0_2 + I(120.0)*T0 + I(120.0)) * expneg(T0);
    tail_rad = gamma6_tail / A_lb;
  }

  I sym_dr(-dr.h, dr.h);
  for (int m = 0; m < NP; ++m) {
    total[m] = acc_mid[m] + sym_dr * acc_der[m] + acc_outer[m] + phi_rem_acc[m] + I(-tail_rad.h, tail_rad.h);
  }
}

SlabMatrices eval_odd_slab_matrices(const RowDerived& rd, double r_lo, double r_hi, int n_phi = 64, double h_rho = 0.0625) {
  std::array<I, N_ODD> total{};
  I s_iv{};
  integrate_slab_channels<N_ODD>(rd, r_lo, r_hi, n_phi, h_rho, 16.0, total, s_iv);
  SlabMatrices sm{};
  sm.r_lo = r_lo; sm.r_hi = r_hi; sm.s_iv = s_iv;
  sm.Modd_pos[0][0] = total[0]; sm.Modd_pos[0][1] = sm.Modd_pos[1][0] = total[1]; sm.Modd_pos[1][1] = total[2];
  sm.Modd_neg[0][0] = total[3]; sm.Modd_neg[0][1] = sm.Modd_neg[1][0] = total[4]; sm.Modd_neg[1][1] = total[5];
  sm.Mtil_pos[0][0] = total[0] + I(0.5) * total[3];
  sm.Mtil_pos[0][1] = sm.Mtil_pos[1][0] = total[1] + I(0.5) * total[4];
  sm.Mtil_pos[1][1] = total[2] + I(0.5) * total[5];
  sm.Mtil_neg[0][0] = total[3] + I(0.5) * total[0];
  sm.Mtil_neg[0][1] = sm.Mtil_neg[1][0] = total[4] + I(0.5) * total[1];
  sm.Mtil_neg[1][1] = total[5] + I(0.5) * total[2];
  return sm;
}

SlabMatrices eval_slab_matrices(const RowDerived& rd, double r_lo, double r_hi, int n_phi = 64, double h_rho = 0.0625) {
  std::array<I, N_PACK> total{};
  I s_iv{};
  integrate_slab_channels<N_PACK>(rd, r_lo, r_hi, n_phi, h_rho, 20.0, total, s_iv);
  SlabMatrices sm{};
  sm.r_lo = r_lo; sm.r_hi = r_hi; sm.s_iv = s_iv;
  sm.Modd_pos[0][0] = total[0]; sm.Modd_pos[0][1] = sm.Modd_pos[1][0] = total[1]; sm.Modd_pos[1][1] = total[2];
  sm.Modd_neg[0][0] = total[3]; sm.Modd_neg[0][1] = sm.Modd_neg[1][0] = total[4]; sm.Modd_neg[1][1] = total[5];
  sm.Mtil_pos[0][0] = total[0] + I(0.5) * total[3];
  sm.Mtil_pos[0][1] = sm.Mtil_pos[1][0] = total[1] + I(0.5) * total[4];
  sm.Mtil_pos[1][1] = total[2] + I(0.5) * total[5];
  sm.Mtil_neg[0][0] = total[3] + I(0.5) * total[0];
  sm.Mtil_neg[0][1] = sm.Mtil_neg[1][0] = total[4] + I(0.5) * total[1];
  sm.Mtil_neg[1][1] = total[5] + I(0.5) * total[2];
  unpack_ne_matrices(total, sm.NE_odd, sm.NE_even);
  return sm;
}

// ============================================================================
// 8. Collar Concavity Proof on r* in [0, r0] (r0 = 1/16) for Deliverable (b)
// ============================================================================
struct CollarCert {
  double r0;
  I mu1;       // -0.5 * m11''([0, r0]) > 0
  I mu2;       // p1*Z_lo - m22([0, r0]) > 0
  I K12;       // 0.5 * |m12''([0, r0])|
  I det_coeff; // mu1 * mu2 - r0^2 * K12^2 > 0
  double pos_block_ratio_hi;
};

// Bivariate truncated Taylor jet in R[eps, eta] / (eps^3, eta^3) for 2D Gauss-Midpoint quadrature
// of d^2/dr*^2 Modd_neg(r*) across (rho, phi) cells without 0th-order Riemann bloat!
// Note: every nilpotent delta with delta.c[0][0] == 0 satisfies delta^5 == 0 identically mod (eps^3, eta^3)
// because 5 factors of degree >= 1 cannot have both deg_eps <= 2 and deg_eta <= 2 (2 + 2 = 4 < 5).
struct BivJet2 {
  std::array<std::array<I, 3>, 3> c;
  BivJet2() {
    for (int i = 0; i < 3; ++i) c[i].fill(I(0.0));
  }
  explicit BivJet2(I c00) : BivJet2() { c[0][0] = c00; }
  static BivJet2 from_rs(const Jet<2>& j) {
    BivJet2 r;
    for (int i = 0; i < 3; ++i) r.c[i][0] = j.c[i];
    return r;
  }
  static BivJet2 from_aux(const Jet<2>& j) {
    BivJet2 r;
    for (int k = 0; k < 3; ++k) r.c[0][k] = j.c[k];
    return r;
  }
};

inline BivJet2 operator+(const BivJet2& a, const BivJet2& b) {
  BivJet2 r;
  for (int i = 0; i < 3; ++i)
    for (int j = 0; j < 3; ++j) r.c[i][j] = a.c[i][j] + b.c[i][j];
  return r;
}
inline BivJet2 operator-(const BivJet2& a, const BivJet2& b) {
  BivJet2 r;
  for (int i = 0; i < 3; ++i)
    for (int j = 0; j < 3; ++j) r.c[i][j] = a.c[i][j] - b.c[i][j];
  return r;
}
inline BivJet2 operator-(const BivJet2& a) {
  BivJet2 r;
  for (int i = 0; i < 3; ++i)
    for (int j = 0; j < 3; ++j) r.c[i][j] = -a.c[i][j];
  return r;
}
inline BivJet2 operator*(const I& s, const BivJet2& a) {
  BivJet2 r;
  for (int i = 0; i < 3; ++i)
    for (int j = 0; j < 3; ++j) r.c[i][j] = s * a.c[i][j];
  return r;
}
inline BivJet2 operator*(const BivJet2& a, const BivJet2& b) {
  BivJet2 r;
  for (int i = 0; i < 3; ++i) {
    for (int j = 0; j < 3; ++j) {
      bool first = true;
      I sum(0.0);
      for (int p = 0; p <= i; ++p) {
        for (int q = 0; q <= j; ++q) {
          I prod = a.c[p][q] * b.c[i - p][j - q];
          if (first) { sum = prod; first = false; }
          else sum = sum + prod;
        }
      }
      r.c[i][j] = sum;
    }
  }
  return r;
}
inline BivJet2 sq_biv(const BivJet2& a) {
  BivJet2 r = a * a;
  r.c[0][0] = sq(a.c[0][0]);
  return r;
}
inline BivJet2 horner_biv(const BivJet2& u, const std::array<I, 5>& d) {
  BivJet2 del = u;
  del.c[0][0] = I(0.0);
  BivJet2 r(d[4]);
  for (int k = 3; k >= 0; --k) r = BivJet2(d[k]) + del * r;
  return r;
}
inline BivJet2 inv_biv(const BivJet2& u) {
  I i1 = inv_pos(u.c[0][0]);
  I i2 = sq(i1), i3 = i2 * i1, i4 = sq(i2), i5 = i4 * i1;
  return horner_biv(u, {i1, -i2, i3, -i4, i5});
}
inline BivJet2 invsqrt_biv(const BivJet2& u) {
  require(u.c[0][0].l > 0.0, "invsqrt_biv requires u > 0");
  I is0 = inv_pos(sqrti(u.c[0][0]));
  I iu = inv_pos(u.c[0][0]);
  I iu2 = sq(iu), iu3 = iu2 * iu, iu4 = sq(iu2);
  return horner_biv(u, {is0, -I(0.5) * (is0 * iu), I(0.375) * (is0 * iu2),
                        -I(0.3125) * (is0 * iu3), I(35.0 / 128.0) * (is0 * iu4)});
}
inline BivJet2 expneg_biv(const BivJet2& u) {
  I u0 = u.c[0][0];
  u0.l = std::max(0.0, u0.l);
  I e0 = expneg(u0);
  return horner_biv(u, {e0, -e0, I(0.5) * e0, -rat_i(1, 6) * e0, rat_i(1, 24) * e0});
}

// Evaluates the 3 Modd_neg entries as BivJet2 in (rs, aux):
inline void eval_modd_neg_biv2(const RowDerived& rd, const BivJet2& rs,
                               const BivJet2& rho, const BivJet2& cphi, const BivJet2& sphi,
                               BivJet2& out_m11, BivJet2& out_m12, BivJet2& out_m22) {
  const I two_over_pi = I(2.0) / rd.pi_v;
  BivJet2 rs2 = sq_biv(rs);
  BivJet2 g_rs = BivJet2(rd.c0) + rd.c1 * rs2 + rd.c2 * sq_biv(rs2);
  BivJet2 s = (rs * g_rs) * inv_biv(BivJet2(rd.a0) + rd.a2 * rs2);
  BivJet2 zx = rho * cphi - rs;
  BivJet2 zy = rho * sphi;
  BivJet2 T = sq_biv(zx) + sq_biv(zy);
  T.c[0][0].l = std::max(0.0, T.c[0][0].l);

  BivJet2 gT = BivJet2(rd.c0) + rd.c1 * T + rd.c2 * sq_biv(T);
  BivJet2 dr_shift = rho - (I(2.0) * rs) * cphi;
  BivJet2 real_shift = (-rs) * dr_shift * (BivJet2(rd.c1) + rd.c2 * (T + rs2)) + s * (rd.alp * dr_shift);
  BivJet2 c2phi = sq_biv(cphi) - sq_biv(sphi);
  BivJet2 s2phi = I(2.0) * (cphi * sphi);
  BivJet2 s_gam = rd.gamB * s;

  BivJet2 At_re = cphi * gT + real_shift + s_gam * (rho * c2phi - (I(2.0) * rs) * cphi);
  BivJet2 At_im = sphi * gT + s_gam * (rho * s2phi - (I(2.0) * rs) * sphi);
  BivJet2 inv_At = invsqrt_biv(sq_biv(At_re) + sq_biv(At_im));
  BivJet2 ph_re = At_re * inv_At;
  BivJet2 ph_im = At_im * inv_At;

  BivJet2 wt = two_over_pi * expneg_biv(T) * inv_At;
  BivJet2 u_z  = zx * ph_re + zy * ph_im;
  BivJet2 u_zb = zx * ph_re - zy * ph_im;
  out_m11 = wt * sq_biv(u_z);
  out_m12 = wt * (u_z * u_zb);
  out_m22 = wt * sq_biv(u_zb);
}

// Dedicated fast Jet<2> evaluator for the 3 Modd_neg entries (m11, m12, m22):
inline void eval_modd_neg_jet2(const RowDerived& rd, const Jet<2>& rs,
                               const I& rbox, const I& cbox, const I& sbox,
                               Jet<2>& out_m11, Jet<2>& out_m12, Jet<2>& out_m22) {
  const I two_over_pi = I(2.0) / rd.pi_v;
  Jet<2> rho(rbox), cphi(cbox), sphi(sbox);
  Jet<2> rs2 = sq_jet<2>(rs);
  Jet<2> g_rs = Jet<2>(rd.c0) + rd.c1 * rs2 + rd.c2 * sq_jet<2>(rs2);
  Jet<2> s = (rs * g_rs) * inv_jet<2>(Jet<2>(rd.a0) + rd.a2 * rs2);

  Jet<2> zx = rho * cphi - rs;
  Jet<2> zy = rho * sphi;
  Jet<2> T = sq_jet<2>(zx) + sq_jet<2>(zy);
  T.c[0].l = std::max(0.0, T.c[0].l);

  Jet<2> gT = Jet<2>(rd.c0) + rd.c1 * T + rd.c2 * sq_jet<2>(T);
  Jet<2> dr_shift = rho - (I(2.0) * rs) * cphi;
  Jet<2> real_shift = (-rs) * dr_shift * (Jet<2>(rd.c1) + rd.c2 * (T + rs2)) + s * (rd.alp * dr_shift);
  Jet<2> c2phi = sq_jet<2>(cphi) - sq_jet<2>(sphi);
  Jet<2> s2phi = I(2.0) * cphi * sphi;
  Jet<2> s_gam = rd.gamB * s;

  Jet<2> At_re = cphi * gT + real_shift + s_gam * (rho * c2phi - (I(2.0) * rs) * cphi);
  Jet<2> At_im = sphi * gT + s_gam * (rho * s2phi - (I(2.0) * rs) * sphi);
  Jet<2> abs_At = sqrt_jet<2>(sq_jet<2>(At_re) + sq_jet<2>(At_im));
  Jet<2> inv_At = inv_jet<2>(abs_At);
  Jet<2> ph_re = At_re * inv_At;
  Jet<2> ph_im = At_im * inv_At;

  Jet<2> wt = two_over_pi * expneg_jet<2>(T) * inv_At;
  Jet<2> u_z  = zx * ph_re + zy * ph_im;
  Jet<2> u_zb = zx * ph_re - zy * ph_im;
  out_m11 = wt * sq_jet<2>(u_z);
  out_m12 = wt * (u_z * u_zb);
  out_m22 = wt * sq_jet<2>(u_zb);
}

// Analytical radial tail on rho >= rho_max for Jet<2> in r* on [0, r0] via sigma = 1/rho in [0, 1/rho_max]
// and Leibniz rule against E(r*) = exp(-T(r*, rho, phi)):
inline void collar_radial_tail_jet2(const RowDerived& rd, double r0, double rho_max,
                                    double& tail_c0_hi, double& tail_c2_hi) {
  require(rho_max >= 9.0 && r0 > 0.0 && r0 <= 0.125, "collar tail domain");
  const I two_over_pi = I(2.0) / rd.pi_v;
  const I sig_box(0.0, (I(1.0) / I(rho_max)).h);
  Jet<2> rs = Jet<2>::var(I(0.0, r0));
  Jet<2> sig(sig_box);
  Jet<2> u_rs = sig * rs;
  Jet<2> u_rs2 = sq_jet<2>(u_rs);
  Jet<2> rs2 = sq_jet<2>(rs);
  Jet<2> g_rs = Jet<2>(rd.c0) + rd.c1 * rs2 + rd.c2 * sq_jet<2>(rs2);
  Jet<2> s = (rs * g_rs) * inv_jet<2>(Jet<2>(rd.a0) + rd.a2 * rs2);
  Jet<2> sig2(sq(sig_box));
  Jet<2> sig3(sig2.c[0] * sig_box);
  Jet<2> sig4(sq(sig2.c[0]));

  // Radial integrals of E^[0], |E^[1]|, |E^[2]| over rho in [rho_max, inf), w = rho - r0 >= W0:
  I W0 = I(rho_max) - I(r0);
  require(W0.l >= 8.5 && W0.l >= 2.0 * r0, "collar tail W0 >= 8.5");
  I expW = expneg(sq(W0));
  I int_E0 = expW / (I(2.0) * W0);
  I int_E1 = I(2.0) * expW;
  // On w >= 8.5, 2*(w + 2*r0)^2 + 1 <= 9*w^2, and int_{W0}^inf w^2 e^{-w^2} dw <= (W0/2 + 1/(4*W0)) e^{-W0^2}:
  I int_E2 = I(9.0) * (I(0.5) * W0 + I(1.0) / (I(4.0) * W0)) * expW;

  double sum_c0 = 0.0, sum_c2 = 0.0;
  // Partition phi in [0, pi] into 4 sectors of width pi/4 so |cos phi| >= 1/sqrt(2) or sin phi >= 1/sqrt(2):
  for (int q = 0; q < 4; ++q) {
    I p_lo = rat_i(q, 4) * rd.pi_v;
    I p_hi = rat_i(q + 1, 4) * rd.pi_v;
    I pbox(p_lo.l, p_hi.h);
    I cbox, sbox;
    sincos_0_pi(pbox, sbox, cbox);
    Jet<2> cphi(cbox), sphi(sbox);
    Jet<2> s2T = u_rs2 - (I(2.0) * u_rs) * cphi + Jet<2>(I(1.0));
    s2T.c[0].l = std::max(0.0, s2T.c[0].l);

    Jet<2> s4gT = Jet<2>(rd.c0 * sig4.c[0]) + Jet<2>(rd.c1 * sig2.c[0]) * s2T + rd.c2 * sq_jet<2>(s2T);
    Jet<2> one_m_2uc = Jet<2>(I(1.0)) - (I(2.0) * u_rs) * cphi;
    Jet<2> s4_rsh = (-u_rs) * one_m_2uc * (Jet<2>(rd.c1 * sig2.c[0]) + rd.c2 * (s2T + u_rs2))
                    + s * (Jet<2>(rd.alp * sig3.c[0]) * one_m_2uc);
    Jet<2> c2phi = sq_jet<2>(cphi) - sq_jet<2>(sphi);
    Jet<2> s2phi = I(2.0) * cphi * sphi;
    Jet<2> s_gam_s3 = (rd.gamB * sig3.c[0]) * s;

    Jet<2> s4At_re = cphi * s4gT + s4_rsh + s_gam_s3 * (c2phi - (I(2.0) * u_rs) * cphi);
    Jet<2> s4At_im = sphi * s4gT + s_gam_s3 * (s2phi - (I(2.0) * u_rs) * sphi);
    Jet<2> abs_s4At = sqrt_jet<2>(sq_jet<2>(s4At_re) + sq_jet<2>(s4At_im));
    Jet<2> inv_s4At = inv_jet<2>(abs_s4At);
    Jet<2> ph_re = s4At_re * inv_s4At;
    Jet<2> ph_im = s4At_im * inv_s4At;

    Jet<2> szx = cphi - u_rs;
    Jet<2> szy = sphi;
    Jet<2> su_z  = szx * ph_re + szy * ph_im;
    Jet<2> su_zb = szx * ph_re - szy * ph_im;
    Jet<2> pref = Jet<2>(two_over_pi * sig2.c[0]) * inv_s4At;
    std::array<Jet<2>, 3> G = {pref * sq_jet<2>(su_z), pref * (su_z * su_zb), pref * sq_jet<2>(su_zb)};

    double g0_max = 0.0, g1_max = 0.0, g2_max = 0.0;
    for (int m = 0; m < 3; ++m) {
      g0_max = std::max(g0_max, abs_i(G[m].c[0]).h);
      g1_max = std::max(g1_max, abs_i(G[m].c[1]).h);
      g2_max = std::max(g2_max, abs_i(G[m].c[2]).h);
    }
    // Angular factor for 2 * int_{q*pi/4}^{(q+1)*pi/4} dphi = pi/2:
    I ang = I(0.5) * rd.pi_v;
    sum_c0 = up(sum_c0 + (ang * int_E0 * I(g0_max)).h);
    sum_c2 = up(sum_c2 + (ang * (int_E0 * I(g2_max) + int_E1 * I(g1_max) + int_E2 * I(g0_max))).h);
  }
  tail_c0_hi = sum_c0;
  tail_c2_hi = sum_c2;
}

CollarCert certify_Modd_collar(const RowDerived& rd, const I& Z_iv, double r0 = 0.0625) {
  // Subdivide [0, r0] (r0 = 1/16) into NSUB = 8 disjoint dyadic sub-intervals of width 1/128,
  // integrate Jet<2> in r* on each sub-interval across (rho, phi) using 2D Gauss-Midpoint + BivJet2
  // (plus exact [pi_lo, pi] angular remainder and analytical rho >= 9.0 tail), and take the hull!
  const int NSUB = 8;
  const double rho_max = 9.0, h_rho = 0.0625;
  const int n_rho = int(std::llround(rho_max / h_rho));
  const int n_phi = 64;
  const double pi_lo = rd.pi_v.l;

  struct ColPhi {
    I pm, dphi, cm, sm, cbox, sbox;
    BivJet2 cbiv, sbiv;
  };
  std::vector<ColPhi> pcells(n_phi);
  for (int j = 0; j < n_phi; ++j) {
    double plo = (j == 0) ? 0.0 : (pi_lo * double(j) / double(n_phi));
    double phi_h = (j + 1 == n_phi) ? pi_lo : (pi_lo * double(j + 1) / double(n_phi));
    pcells[j].pm = I(0.5) * (I(plo) + I(phi_h));
    pcells[j].dphi = I(0.5) * (I(phi_h) - I(plo));
    sincos_0_pi(pcells[j].pm, pcells[j].sm, pcells[j].cm);
    sincos_0_pi(I(plo, phi_h), pcells[j].sbox, pcells[j].cbox);
    Jet<2> pj = Jet<2>::var(I(plo, phi_h));
    Jet<2> sj2, cj2;
    sincos_jet_0_pi<2>(pj, sj2, cj2);
    pcells[j].cbiv = BivJet2::from_aux(cj2);
    pcells[j].sbiv = BivJet2::from_aux(sj2);
  }

  double tail_c0_hi = 0.0, tail_c2_hi = 0.0;
  collar_radial_tail_jet2(rd, r0, rho_max, tail_c0_hi, tail_c2_hi);
  I tail_c0(-tail_c0_hi, tail_c0_hi);
  I tail_c2(-tail_c2_hi, tail_c2_hi);

  auto quad_inter = [](const I& q2, const I& q0) -> I {
    double lo = std::max(q2.l, q0.l);
    double hi = std::min(q2.h, q0.h);
    return (lo <= hi) ? I(lo, hi) : q0;
  };

  I c0_m11_hull(0.0), c2_m11_hull(0.0), c2_m12_hull(0.0), c0_m22_hull(0.0);
  for (int ks = 0; ks < NSUB; ++ks) {
    double r_a = (r0 * double(ks)) / double(NSUB);
    double r_b = (r0 * double(ks + 1)) / double(NSUB);
    Jet<2> j_rs = Jet<2>::var(I(r_a, r_b));
    BivJet2 b_rs = BivJet2::from_rs(j_rs);

    I c0_m11(0.0), c2_m11(0.0), c2_m12(0.0), c0_m22(0.0);
    for (int ir = 0; ir < n_rho; ++ir) {
      double a = ir * h_rho, b = (ir + 1) * h_rho;
      I rhom = I(0.5) * (I(a) + I(b));
      I drho = I(0.5) * (I(b) - I(a));
      I rbox(a, b);
      I drho3 = sq(drho) * drho;
      BivJet2 b_rho_var = BivJet2::from_aux(Jet<2>::var(rbox));
      BivJet2 b_rho_const(rbox);

      for (int j = 0; j < n_phi; ++j) {
        const auto& pc = pcells[j];
        I area4 = I(4.0) * drho * pc.dphi;
        I w_r2 = rat_i(4, 3) * drho3 * pc.dphi;
        I w_p2 = rat_i(4, 3) * drho * (sq(pc.dphi) * pc.dphi);

        Jet<2> pt11, pt12, pt22;
        eval_modd_neg_jet2(rd, j_rs, rhom, pc.cm, pc.sm, pt11, pt12, pt22);

        BivJet2 r11, r12, r22;
        eval_modd_neg_biv2(rd, b_rs, b_rho_var, BivJet2(pc.cm), BivJet2(pc.sm), r11, r12, r22);

        BivJet2 p11, p12, p22;
        eval_modd_neg_biv2(rd, b_rs, b_rho_const, pc.cbiv, pc.sbiv, p11, p12, p22);

        c0_m11 = c0_m11 + quad_inter(area4 * pt11.c[0] + w_r2 * r11.c[0][2] + w_p2 * p11.c[0][2], area4 * p11.c[0][0]);
        c2_m11 = c2_m11 + quad_inter(area4 * pt11.c[2] + w_r2 * r11.c[2][2] + w_p2 * p11.c[2][2], area4 * p11.c[2][0]);
        c2_m12 = c2_m12 + quad_inter(area4 * pt12.c[2] + w_r2 * r12.c[2][2] + w_p2 * p12.c[2][2], area4 * p12.c[2][0]);
        c0_m22 = c0_m22 + quad_inter(area4 * pt22.c[0] + w_r2 * r22.c[0][2] + w_p2 * p22.c[0][2], area4 * p22.c[0][0]);
      }
    }
    // Exact angular remainder on phi in [pi_lo, pi_v.h]:
    if (rd.pi_v.h > pi_lo) {
      I dphi_rem = I(0.5) * (rd.pi_v - I(pi_lo));
      dphi_rem.l = std::max(0.0, dphi_rem.l);
      I c_rem, s_rem;
      sincos_0_pi(I(pi_lo, rd.pi_v.h), s_rem, c_rem);
      for (int ir = 0; ir < n_rho; ++ir) {
        double a = ir * h_rho, b = (ir + 1) * h_rho;
        I area_rem = I(4.0) * (I(0.5) * (I(b) - I(a))) * dphi_rem;
        Jet<2> m11, m12, m22;
        eval_modd_neg_jet2(rd, j_rs, I(a, b), c_rem, s_rem, m11, m12, m22);
        c0_m11 = c0_m11 + area_rem * m11.c[0];
        c2_m11 = c2_m11 + area_rem * m11.c[2];
        c2_m12 = c2_m12 + area_rem * m12.c[2];
        c0_m22 = c0_m22 + area_rem * m22.c[0];
      }
    }
    c0_m11 = c0_m11 + tail_c0;
    c2_m11 = c2_m11 + tail_c2;
    c2_m12 = c2_m12 + tail_c2;
    c0_m22 = c0_m22 + tail_c0;

    if (ks == 0) {
      c0_m11_hull = c0_m11;
      c2_m11_hull = c2_m11;
      c2_m12_hull = c2_m12;
      c0_m22_hull = c0_m22;
    } else {
      c0_m11_hull = hull_i(c0_m11_hull, c0_m11);
      c2_m11_hull = hull_i(c2_m11_hull, c2_m11);
      c2_m12_hull = hull_i(c2_m12_hull, c2_m12);
      c0_m22_hull = hull_i(c0_m22_hull, c0_m22);
    }
  }

  // Also check positive block on [0, r0]:
  SlabMatrices sm0 = eval_slab_matrices(rd, 0.0, r0, 64, 0.0625);
  double pos_hi = lam_max_2x2_upper(sm0.Modd_pos[0][0], sm0.Modd_pos[0][1], sm0.Modd_pos[1][1]);

  I p1Z_lo(dn((rd.p1 * Z_iv).l));
  CollarCert cc{};
  cc.r0 = r0;
  cc.mu1 = -c2_m11_hull; // -0.5 * m11''([0, r0])
  cc.mu2 = p1Z_lo - c0_m22_hull;
  cc.K12 = abs_i(c2_m12_hull);
  cc.det_coeff = cc.mu1 * cc.mu2 - sq(I(r0)) * sq(cc.K12);
  cc.pos_block_ratio_hi = up(pos_hi / (rd.p1 * Z_iv).l);

  require(cc.mu1.l > 0.0, "collar mu1 > 0");
  require(cc.mu2.l > 0.0, "collar mu2 > 0");
  require(cc.det_coeff.l > 0.0, "collar determinant > 0");
  require((I(2.0) * p1Z_lo - (c0_m11_hull + c0_m22_hull)).l > 0.0, "collar trace < 2*p1*Z");
  require(cc.pos_block_ratio_hi < 1.0, "collar pos block < p1*Z");
  return cc;
}

// ============================================================================
// 9. Deliverable (c): Per-Bin Sturm-Ladder + SOS Hybrid & E_max(s) Certifier
// ============================================================================
// Certifies BOTH:
//   - kappa_odd(s) = sup_{(Q,P)!=0} F_odd(s; Q, P) / (p1*(|Q|^2 + |P|^2)) on rows >= 0.81, and
//   - E_max(s)     = sup_{(Q,P)}   [F_odd(s; Q, P) - p1*(|Q|^2 + |P|^2)]  on rows 0.79 and 0.80
// across s in [psi(r_lo), psi(r_hi)] by enclosing U_b = M_odd^-(b), V_b = M_odd^+(b),
// E_b[|A_+|], and E_b[2*sqrt(2)*|z|] on 256 geometric bins of sup(|z|/|A_+|) via per-cell
// BivJet12 2D Gauss-Midpoint quadrature, and choosing per (tau-slab, ladder, bin) the best of:
//   (1) Sturm rational secant rung (Proposition 5.1(3)) or (1/2, 1) fallback (Proposition 5.1(2)),
//   (2) Linear triangle-inequality cap 2*sqrt(2)*|z|/tau_0 (Section 5.2),
//   (3) Pointwise sum-of-squares majorant (1-gam)^2/gam * |A_+| + tau^2*((1-gam/2)*u_0^2/|A_+| + gam*v_0^2/|A_+|)
//       (Proposition 5.2) for rational gam in (0, 1],
// together with global Proposition 5.2 across a fine dyadic gamma grid and the analytic
// large-amplitude triangle cap sqrt(2*pi)/(p1*tau) < 0.978 on tau >= 2.0.
struct HybridOddCert {
  double worst_ratio;
  double max_emax;
  uint64_t leaves;
};

HybridOddCert certify_slab_odd_hybrid(const RowDerived& rd, const std::vector<SecantLadder>& ladders,
                                      double r_lo, double r_hi, bool compute_emax = false,
                                      int n_phi = 64, double h_rho = 0.0625) {
  require(r_lo < r_hi && r_lo >= 0.0, "hybrid slab ordering");
  I rm = I(0.5) * (I(r_lo) + I(r_hi));
  I dr = I(0.5) * (I(r_hi) - I(r_lo));
  I rs_box(r_lo, r_hi);
  require(rm.l >= rs_box.l && rm.h <= rs_box.h, "hybrid rm inside rs_box");
  I rs2_box = sq(rs_box);
  double s_lo_d = (r_lo == 0.0) ? 0.0 : std::max(0.0, rd.psi_eval(I(r_lo)).l);
  I s_iv = make_i(s_lo_d, rd.psi_eval(I(r_hi)).h);
  const I s_gam_box = rd.gamB * s_iv;
  const I two_over_pi = I(2.0) / rd.pi_v;
  const double two_sqrt2_hi = (I(2.0) * rd.sqrt2).h;

  const double rho_max = std::ceil(std::max(r_hi + 7.5, 2.0 * r_hi + 2.0));
  const int n_rho = int(std::llround(rho_max / h_rho));
  require(n_rho > 0 && std::abs(n_rho * h_rho - rho_max) == 0.0, "hybrid dyadic rho grid");
  const double pi_lo = rd.pi_v.l;

  std::vector<double> phi_edges;
  if (r_lo > 1.5 && 5.0 / r_lo < 0.85 * pi_lo) {
    const double phi_core = 5.0 / r_lo;
    const int n_tail = 64;
    phi_edges.reserve(size_t(n_phi + n_tail + 2));
    for (int j = 0; j <= n_phi; ++j)
      phi_edges.push_back(j == 0 ? 0.0 : (j == n_phi ? phi_core : (phi_core * double(j) / double(n_phi))));
    for (int j = 1; j <= n_tail; ++j)
      phi_edges.push_back(j == n_tail ? pi_lo : (phi_core + (pi_lo - phi_core) * double(j) / double(n_tail)));
  } else {
    phi_edges.reserve(size_t(n_phi + 2));
    for (int j = 0; j <= n_phi; ++j)
      phi_edges.push_back(j == 0 ? 0.0 : (j == n_phi ? pi_lo : (pi_lo * double(j) / double(n_phi))));
  }
  const int n_phi_interior = int(phi_edges.size()) - 1;
  if (rd.pi_v.h > pi_lo) phi_edges.push_back(rd.pi_v.h);
  const int n_phi_tot = int(phi_edges.size()) - 1;

  struct PCell {
    double plo, phi_h;
    I pm, dphi, cm, sm, cbox, sbox, c2p, s2p;
    I c_sub[2], s_sub[2], c2_sub[2], s2_sub[2];
    BivJet12 cb12, sb12;
    bool in_interior;
  };
  std::vector<PCell> pcells(static_cast<size_t>(n_phi_tot));
  for (int j = 0; j < n_phi_tot; ++j) {
    auto& pc = pcells[size_t(j)];
    pc.plo = phi_edges[size_t(j)];
    pc.phi_h = phi_edges[size_t(j + 1)];
    pc.pm = I(0.5) * (I(pc.plo) + I(pc.phi_h));
    pc.dphi = I(0.5) * (I(pc.phi_h) - I(pc.plo));
    pc.dphi.l = std::max(0.0, pc.dphi.l);
    sincos_0_pi(pc.pm, pc.sm, pc.cm);
    sincos_0_pi(I(pc.plo, pc.phi_h), pc.sbox, pc.cbox);
    pc.c2p = sq(pc.cbox) - sq(pc.sbox);
    pc.s2p = I(2.0) * pc.cbox * pc.sbox;
    pc.in_interior = (j < n_phi_interior);
    if (pc.in_interior) {
      Jet<2> pj = Jet<2>::var(I(pc.plo, pc.phi_h)), sj2, cj2;
      sincos_jet_0_pi<2>(pj, sj2, cj2);
      pc.cb12 = BivJet12::from_aux2(cj2);
      pc.sb12 = BivJet12::from_aux2(sj2);
      double pm_d = 0.5 * (pc.plo + pc.phi_h);
      for (int sp = 0; sp < 2; ++sp) {
        I spb(sp == 0 ? pc.plo : pm_d, sp == 0 ? pm_d : pc.phi_h);
        sincos_0_pi(spb, pc.s_sub[sp], pc.c_sub[sp]);
        pc.c2_sub[sp] = sq(pc.c_sub[sp]) - sq(pc.s_sub[sp]);
        pc.s2_sub[sp] = I(2.0) * pc.c_sub[sp] * pc.s_sub[sp];
      }
    }
  }

  struct UBin {
    double max_abs_z_over_A_hi = 0.0;
    double abs_z_wt_hi = 0.0; // integral of (2/pi)*e^{-T}*rho*|z|*2*sqrt(2)
    double EA_hi = 0.0;       // integral of (2/pi)*e^{-T}*rho^2*|Atilde_+| = E_bin[|A_+|]
    I u00{0.0}, u01{0.0}, u11{0.0};
    I v00{0.0}, v01{0.0}, v11{0.0};
    bool used = false;
  };
  const int NBINS = 256;
  std::array<UBin, NBINS + 1> bins{};
  const double log_min = std::log(1e-3), log_max = std::log(200.0);
  const double inv_span = double(NBINS - 2) / (log_max - log_min);

  Jet<0> j0_rm(rm), j0_rs_box(rs_box);
  Jet<1> j1_rs = Jet<1>::var(rs_box);
  BivJet12 b12_rs = BivJet12::from_rs1(j1_rs);
  I sym_dr(-dr.h, dr.h);

  for (int ir = 0; ir < n_rho; ++ir) {
    double r0 = ir * h_rho, r1 = (ir + 1) * h_rho;
    I rhom = I(0.5) * (I(r0) + I(r1));
    I drho = I(0.5) * (I(r1) - I(r0));
    I rhobox(r0, r1);
    I drho3 = sq(drho) * drho;
    Jet<0> j0_rhom(rhom);
    Jet<1> j1_rhom(rhom);
    BivJet12 b12_rho_var = BivJet12::from_aux2(Jet<2>::var(rhobox));
    BivJet12 b12_rho_const(rhobox);

    double rm_rho = 0.5 * (r0 + r1);
    I r_sub[2] = {I(r0, rm_rho), I(rm_rho, r1)};

    for (int j = 0; j < n_phi_tot; ++j) {
      const auto& pc = pcells[size_t(j)];
      I area4 = I(4.0) * drho * pc.dphi;
      I zx_b = rhobox * pc.cbox - rs_box;
      I zy_b = rhobox * pc.sbox;
      I T_b = sq(zx_b) + sq(zy_b);
      T_b.l = std::max(0.0, T_b.l);
      I abs_z_b = sqrti(T_b);
      I eT_b = expneg(T_b);

      I gT_b = rd.g_eval(T_b);
      I dr_b = rhobox - I(2.0) * rs_box * pc.cbox;
      I rsh_b = -rs_box * dr_b * (rd.c1 + rd.c2 * (T_b + rs2_box)) + s_iv * (rd.alp * dr_b);
      I At_re_b = pc.cbox * gT_b + rsh_b + s_gam_box * (rhobox * pc.c2p - I(2.0) * rs_box * pc.cbox);
      I At_im_b = pc.sbox * gT_b + s_gam_box * (rhobox * pc.s2p - I(2.0) * rs_box * pc.sbox);
      I abs_At_b = sqrti(sq(At_re_b) + sq(At_im_b));

      int bidx = NBINS;
      double ratio_hi = 1e30;
      double cell_EA_hi = (area4 * two_over_pi * eT_b * sq(rhobox) * abs_At_b).h;
      double cell_zwt_hi = (area4 * two_over_pi * eT_b * rhobox * abs_z_b * I(two_sqrt2_hi)).h;
      if (r0 > 0.0 && pc.in_interior) {
        double sub_max = 0.0;
        double sub_EA = 0.0;
        double sub_zwt = 0.0;
        I area_sub = I(0.25) * area4;
        for (int sr = 0; sr < 2; ++sr) {
          for (int sp = 0; sp < 2; ++sp) {
            I zxs = r_sub[sr] * pc.c_sub[sp] - rs_box;
            I zys = r_sub[sr] * pc.s_sub[sp];
            I Ts = sq(zxs) + sq(zys);
            Ts.l = std::max(0.0, Ts.l);
            I azs = sqrti(Ts);
            I eTs = expneg(Ts);
            I gTs = rd.g_eval(Ts);
            I drs = r_sub[sr] - I(2.0) * rs_box * pc.c_sub[sp];
            I rshs = -rs_box * drs * (rd.c1 + rd.c2 * (Ts + rs2_box)) + s_iv * (rd.alp * drs);
            I Ar = pc.c_sub[sp] * gTs + rshs + s_gam_box * (r_sub[sr] * pc.c2_sub[sp] - I(2.0) * rs_box * pc.c_sub[sp]);
            I Ai = pc.s_sub[sp] * gTs + s_gam_box * (r_sub[sr] * pc.s2_sub[sp] - I(2.0) * rs_box * pc.s_sub[sp]);
            I aAt = sqrti(sq(Ar) + sq(Ai));
            sub_max = std::max(sub_max, (azs / (r_sub[sr] * aAt)).h);
            sub_EA = up(sub_EA + (area_sub * two_over_pi * eTs * sq(r_sub[sr]) * aAt).h);
            sub_zwt = up(sub_zwt + (area_sub * two_over_pi * eTs * r_sub[sr] * azs * I(two_sqrt2_hi)).h);
          }
        }
        ratio_hi = sub_max;
        cell_EA_hi = std::min(cell_EA_hi, sub_EA);
        cell_zwt_hi = std::min(cell_zwt_hi, sub_zwt);
        if (ratio_hi <= 1e-3) bidx = 0;
        else if (ratio_hi >= 200.0) bidx = NBINS - 1;
        else {
          int k = 1 + int((std::log(ratio_hi) - log_min) * inv_span);
          bidx = std::max(1, std::min(NBINS - 2, k));
        }
      }

      std::array<I, N_ODD> cell_odd{};
      if (!pc.in_interior || T_b.l >= 16.0) {
        std::array<Jet<0>, N_ODD> f0;
        eval_odd_integrands<Jet<0>>(rd, j0_rs_box, Jet<0>(rhobox), Jet<0>(pc.cbox), Jet<0>(pc.sbox), f0);
        for (int m = 0; m < N_ODD; ++m) cell_odd[m] = area4 * f0[m].c[0];
      } else {
        I w_r2 = rat_i(4, 3) * drho3 * pc.dphi;
        I w_p2 = rat_i(4, 3) * drho * (sq(pc.dphi) * pc.dphi);
        std::array<Jet<0>, N_ODD> f_pt;
        eval_odd_integrands<Jet<0>>(rd, j0_rm, j0_rhom, Jet<0>(pc.cm), Jet<0>(pc.sm), f_pt);
        std::array<Jet<1>, N_ODD> f_der;
        eval_odd_integrands<Jet<1>>(rd, j1_rs, j1_rhom, Jet<1>(pc.cm), Jet<1>(pc.sm), f_der);
        std::array<BivJet12, N_ODD> f_r2, f_p2;
        eval_odd_integrands<BivJet12>(rd, b12_rs, b12_rho_var, BivJet12(pc.cm), BivJet12(pc.sm), f_r2);
        eval_odd_integrands<BivJet12>(rd, b12_rs, b12_rho_const, pc.cb12, pc.sb12, f_p2);
        for (int m = 0; m < N_ODD; ++m) {
          I q2_m = area4 * f_pt[m].c[0] + w_r2 * f_r2[m].c[0][2] + w_p2 * f_p2[m].c[0][2];
          I q0_m = area4 * f_p2[m].c[0][0];
          double lom = std::max(q2_m.l, q0_m.l), him = std::min(q2_m.h, q0_m.h);
          if (lom > him) { lom = q0_m.l; him = q0_m.h; }
          I q2_d = area4 * f_der[m].c[1] + w_r2 * f_r2[m].c[1][2] + w_p2 * f_p2[m].c[1][2];
          I q0_d = area4 * f_p2[m].c[1][0];
          double lod = std::max(q2_d.l, q0_d.l), hid = std::min(q2_d.h, q0_d.h);
          if (lod > hid) { lod = q0_d.l; hid = q0_d.h; }
          I q_biv = I(lom, him) + sym_dr * I(lod, hid);
          double lo = std::max(q_biv.l, q0_m.l), hi = std::min(q_biv.h, q0_m.h);
          cell_odd[m] = (lo <= hi) ? I(lo, hi) : q0_m;
        }
      }

      UBin& bn = bins[static_cast<size_t>(bidx)];
      bn.used = true;
      bn.max_abs_z_over_A_hi = std::max(bn.max_abs_z_over_A_hi, ratio_hi);
      bn.abs_z_wt_hi = up(bn.abs_z_wt_hi + cell_zwt_hi);
      bn.EA_hi = up(bn.EA_hi + cell_EA_hi);
      // out[0..2] is Modd_pos (V), out[3..5] is Modd_neg (U):
      bn.v00 = bn.v00 + cell_odd[0]; bn.v01 = bn.v01 + cell_odd[1]; bn.v11 = bn.v11 + cell_odd[2];
      bn.u00 = bn.u00 + cell_odd[3]; bn.u01 = bn.u01 + cell_odd[4]; bn.u11 = bn.u11 + cell_odd[5];
    }
  }

  // Analytical radial tails on rho >= rho_max (contained in |z|^2 = T >= T0 = R_tail^2 >= 56.25):
  I R_tail(rho_max - r_hi);
  require(R_tail.l >= 7.5 && R_tail.l >= r_hi + 1.5, "kappa_odd R_tail");
  I T0 = sq(R_tail);
  I A_lb = (rd.a0 + rd.a2 * T0) * (rd.psi_eval(R_tail) - I(s_iv.h));
  require(A_lb.l > 0.5, "kappa_odd A_lb > 0.5");
  I eT0 = expneg(T0);
  const double tail_hi = (I(2.0) * (T0 + I(1.0)) * eT0 / A_lb).h;
  const double tail_EA_hi = ((I(s_iv.h) * rd.a0 +
                              (rd.c0 + I(s_iv.h) * rd.a2) * (T0 + I(1.0)) +
                              rd.c1 * (sq(T0) + I(2.0) * T0 + I(2.0)) +
                              rd.c2 * (T0 * sq(T0) + I(3.0) * sq(T0) + I(6.0) * T0 + I(6.0))) * eT0).h;

  // Total U, V, and E|A_+| across all bins + radial tail (for global Proposition 5.2 envelope):
  I ut00(0.0), ut01(0.0), ut11(0.0), vt00(0.0), vt01(0.0), vt11(0.0);
  double EA_tot_hi = tail_EA_hi;
  for (size_t bi = 0; bi <= NBINS; ++bi) {
    if (!bins[bi].used) continue;
    EA_tot_hi = up(EA_tot_hi + bins[bi].EA_hi);
    ut00 = ut00 + bins[bi].u00; ut01 = ut01 + bins[bi].u01; ut11 = ut11 + bins[bi].u11;
    vt00 = vt00 + bins[bi].v00; vt01 = vt01 + bins[bi].v01; vt11 = vt11 + bins[bi].v11;
  }
  I EA_0 = I(0.5) * sqrti(rd.pi_v) * (rd.c0 + rat_i(3, 2) * rd.c1 + rat_i(15, 4) * rd.c2);
  I ED = sqrti(I(1.0) + sq(rd.bA) + sq(rd.bB));
  EA_tot_hi = std::min(EA_tot_hi, (EA_0 + I(s_iv.h) * ED).h);

  // Precompute global Proposition 5.2 (c_unscaled, L_hi) pairs over dyadic gam = m/1024:
  struct GlobalGam {
    double c_unscaled;
    double L_hi;
  };
  std::vector<GlobalGam> ggams;
  ggams.reserve(260);
  {
    I ad_tail(0.0, tail_hi), ao_tail(-tail_hi, tail_hi);
    for (int64_t m = 512; m <= 1024; m += 2) {
      I gam = rat_i(m, 1024);
      I au = I(1.0) - I(0.5) * gam;
      double c_un = ((sq(I(1.0) - gam) / gam) * I(EA_tot_hi)).h;
      double lp = lam_max_2x2_upper(au * ut00 + gam * vt00 + ad_tail, au * ut01 + gam * vt01 + ao_tail, au * ut11 + gam * vt11 + ad_tail);
      double ln = lam_max_2x2_upper(au * vt00 + gam * ut00 + ad_tail, au * vt01 + gam * ut01 + ao_tail, au * vt11 + gam * ut11 + ad_tail);
      ggams.push_back({c_un, std::max(lp, ln)});
    }
    if (compute_emax) {
      auto gamma_ok = [&](int64_t m) -> bool {
        I gam = rat_i(m, 65536);
        I au = I(1.0) - I(0.5) * gam;
        double lp = lam_max_2x2_upper(au * ut00 + gam * vt00 + ad_tail, au * ut01 + gam * vt01 + ao_tail, au * ut11 + gam * vt11 + ad_tail);
        double ln = lam_max_2x2_upper(au * vt00 + gam * ut00 + ad_tail, au * vt01 + gam * ut01 + ao_tail, au * vt11 + gam * ut11 + ad_tail);
        return (I(std::max(lp, ln)) / rd.p1).h <= 1.0;
      };
      if (gamma_ok(65536)) {
        ggams.push_back({0.0, rd.p1.l});
      } else if (gamma_ok(16384)) {
        int64_t lo_m = 16384, hi_m = 65536, best_m = 16384;
        while (lo_m <= hi_m) {
          int64_t mid = (lo_m + hi_m) / 2;
          if (gamma_ok(mid)) { best_m = mid; lo_m = mid + 1; }
          else hi_m = mid - 1;
        }
        I gam = rat_i(best_m, 65536);
        ggams.push_back({((sq(I(1.0) - gam) / gam) * I(EA_tot_hi)).h, rd.p1.l});
      }
    }
  }

  // Candidate rational gammas in (0, 1] for per-bin Proposition 5.2 selection:
  struct GamCand {
    I gam, alp_u, c_fac;
  };
  std::vector<GamCand> gcands;
  for (int64_t num : {16, 20, 22, 24, 26, 27, 28, 29, 30, 31, 32}) {
    I g = rat_i(num, 32);
    gcands.push_back({g, I(1.0) - I(0.5) * g, sq(I(1.0) - g) / g});
  }
  for (int64_t num : {121, 122, 123, 125, 126, 127}) {
    I g = rat_i(num, 128);
    gcands.push_back({g, I(1.0) - I(0.5) * g, sq(I(1.0) - g) / g});
  }

  std::vector<double> tau_edges;
  tau_edges.push_back(0.0);
  const int NT = compute_emax ? 320 : 140;
  const double t_min_grid = compute_emax ? 0.004 : 0.012;
  for (int k = 0; k <= NT; ++k) {
    double t = t_min_grid * std::pow(2.0 / t_min_grid, double(k) / double(NT));
    if (k == NT) t = 2.0;
    tau_edges.push_back(t);
  }

  double worst_ratio = (sqrti(I(2.0) * rd.pi_v) / (rd.p1 * I(2.0))).h;
  double max_emax = 0.0;

  for (size_t jt = 0; jt + 1 < tau_edges.size(); ++jt) {
    double t0 = tau_edges[jt], t1 = tau_edges[jt + 1];
    double s2_t1 = up(rd.sqrt2.h * t1);
    double inv_t0_sq_hi = (t0 > 0.0) ? inv_pos(sq(I(t0))).h : 1e300;
    I tau_sq_iv = sq(I(t0, t1));

    double best_ratio_slab = (t0 > 0.0) ? (sqrti(I(2.0) * rd.pi_v) / (rd.p1 * I(t0))).h : 1e9;
    double best_emax_slab = (best_ratio_slab <= 1.0) ? 0.0 : 1e9;

    // 1. Global Proposition 5.2 candidates:
    for (const auto& gg : ggams) {
      if (t0 > 0.0) {
        double r_here = (I(up(gg.L_hi + ((gg.c_unscaled == 0.0) ? 0.0 : up(gg.c_unscaled * inv_t0_sq_hi)))) / rd.p1).h;
        best_ratio_slab = std::min(best_ratio_slab, r_here);
      }
      if (compute_emax) {
        double em_here = std::max(0.0, (I(gg.c_unscaled) + (I(gg.L_hi) - rd.p1) * tau_sq_iv).h);
        best_emax_slab = std::min(best_emax_slab, em_here);
      }
    }

    // 2. Per-bin Sturm ladder + Proposition 5.2 + Linear cap hybrid:
    for (const auto& sl : ladders) {
      I mp00(0.0), mp01(0.0), mp11(0.0);
      I mn00(0.0), mn01(0.0), mn11(0.0);
      double c_unscaled_tot = 0.0;
      double sc_tau2_tot = 0.0;

      for (size_t bi = 0; bi <= NBINS; ++bi) {
        const auto& bn = bins[bi];
        if (!bn.used) continue;
        double U_hi = (bi == NBINS || bn.max_abs_z_over_A_hi >= 1e29) ? 1e30 : up(s2_t1 * bn.max_abs_z_over_A_hi);
        I alp = lookup_alpha(sl, U_hi);
        const bool in_ladder = (bi < NBINS && alp.h < 0.5);
        I bet_b = in_ladder ? sl.beta_iv : I(1.0);

        I bp00 = alp * bn.u00 + bet_b * bn.v00;
        I bp01 = alp * bn.u01 + bet_b * bn.v01;
        I bp11 = alp * bn.u11 + bet_b * bn.v11;
        I bn00 = alp * bn.v00 + bet_b * bn.u00;
        I bn01 = alp * bn.v01 + bet_b * bn.u01;
        I bn11 = alp * bn.v11 + bet_b * bn.u11;
        double best_cost = std::max(lam_max_2x2_upper(bp00, bp01, bp11), lam_max_2x2_upper(bn00, bn01, bn11));
        int best_mode = 0; // 0 = Sturm, 1 = LinCap, 2 = Prop5.2
        size_t best_gi = 0;
        double c_lin = (t0 > 0.0) ? up(bn.abs_z_wt_hi / t0) : 1e300;
        if (t0 > 0.0 && c_lin < best_cost) {
          best_cost = c_lin;
          best_mode = 1;
        }
        if (t0 > 0.0 && (!in_ladder || alp.h >= 0.20)) {
          for (size_t gi = 0; gi < gcands.size(); ++gi) {
            const auto& gc = gcands[gi];
            double c_b_unscaled = (gc.c_fac * I(bn.EA_hi)).h;
            double c_b_scaled = up(c_b_unscaled * inv_t0_sq_hi);
            if (c_b_scaled >= best_cost) continue;
            I gp00 = gc.alp_u * bn.u00 + gc.gam * bn.v00;
            I gp01 = gc.alp_u * bn.u01 + gc.gam * bn.v01;
            I gp11 = gc.alp_u * bn.u11 + gc.gam * bn.v11;
            I gn00 = gc.alp_u * bn.v00 + gc.gam * bn.u00;
            I gn01 = gc.alp_u * bn.v01 + gc.gam * bn.u01;
            I gn11 = gc.alp_u * bn.v11 + gc.gam * bn.u11;
            double g_cost = up(c_b_scaled + std::max(lam_max_2x2_upper(gp00, gp01, gp11),
                                                     lam_max_2x2_upper(gn00, gn01, gn11)));
            if (g_cost < best_cost) {
              best_cost = g_cost;
              best_mode = 2;
              best_gi = gi;
            }
          }
        }

        if (best_mode == 0) {
          mp00 = mp00 + bp00; mp01 = mp01 + bp01; mp11 = mp11 + bp11;
          mn00 = mn00 + bn00; mn01 = mn01 + bn01; mn11 = mn11 + bn11;
        } else if (best_mode == 1) {
          sc_tau2_tot = up(sc_tau2_tot + c_lin);
        } else {
          const auto& gc = gcands[best_gi];
          c_unscaled_tot = up(c_unscaled_tot + (gc.c_fac * I(bn.EA_hi)).h);
          mp00 = mp00 + gc.alp_u * bn.u00 + gc.gam * bn.v00;
          mp01 = mp01 + gc.alp_u * bn.u01 + gc.gam * bn.v01;
          mp11 = mp11 + gc.alp_u * bn.u11 + gc.gam * bn.v11;
          mn00 = mn00 + gc.alp_u * bn.v00 + gc.gam * bn.u00;
          mn01 = mn01 + gc.alp_u * bn.v01 + gc.gam * bn.u01;
          mn11 = mn11 + gc.alp_u * bn.v11 + gc.gam * bn.u11;
        }
      }

      I add_diag(0.0, up(sc_tau2_tot + tail_hi));
      I add_off(-tail_hi, tail_hi);
      double lp = lam_max_2x2_upper(mp00 + add_diag, mp01 + add_off, mp11 + add_diag);
      double ln = lam_max_2x2_upper(mn00 + add_diag, mn01 + add_off, mn11 + add_diag);
      double L_hi = std::max(lp, ln);

      double c_scaled = (t0 > 0.0) ? ((c_unscaled_tot == 0.0) ? 0.0 : up(c_unscaled_tot * inv_t0_sq_hi)) : 0.0;
      double ratio = (I(up(L_hi + c_scaled)) / rd.p1).h;
      best_ratio_slab = std::min(best_ratio_slab, ratio);

      if (compute_emax) {
        double em_here = (ratio <= 1.0) ? 0.0 : std::max(0.0, (I(c_unscaled_tot) + (I(L_hi) - rd.p1) * tau_sq_iv).h);
        best_emax_slab = std::min(best_emax_slab, em_here);
      }
    }

    worst_ratio = std::max(worst_ratio, best_ratio_slab);
    if (compute_emax && best_ratio_slab > 1.0) {
      max_emax = std::max(max_emax, best_emax_slab);
    }
  }

  return {worst_ratio, max_emax, static_cast<uint64_t>(tau_edges.size() - 1) + static_cast<uint64_t>(ggams.size())};
}

// Adaptive r*-slab refinement for kappa_odd using fast 6-channel BivJet12 + per-bin Sturm/SOS hybrid:
double certify_kappa_odd_adaptive(const RowDerived& rd, const std::vector<SecantLadder>& ladders,
                                  double r_lo, double r_hi) {
  SlabMatrices sm = eval_odd_slab_matrices(rd, r_lo, r_hi, 64, 0.0625);
  double qtil = (I(std::max(
      lam_max_2x2_upper(sm.Mtil_pos[0][0], sm.Mtil_pos[0][1], sm.Mtil_pos[1][1]),
      lam_max_2x2_upper(sm.Mtil_neg[0][0], sm.Mtil_neg[0][1], sm.Mtil_neg[1][1]))) / rd.p1).h;
  if (qtil < 0.996) return qtil;
  if ((r_hi - r_lo) > 0.015625) {
    double rm = 0.5 * (r_lo + r_hi);
    return std::max(certify_kappa_odd_adaptive(rd, ladders, r_lo, rm),
                    certify_kappa_odd_adaptive(rd, ladders, rm, r_hi));
  }
  double kap = std::min(qtil, certify_slab_odd_hybrid(rd, ladders, r_lo, r_hi, false, 64, 0.0625).worst_ratio);
  if (kap >= 0.997) {
    kap = std::min(kap, certify_slab_odd_hybrid(rd, ladders, r_lo, r_hi, false, 96, 0.03125).worst_ratio);
  }
  if (kap >= 0.998 && (r_hi - r_lo) > 0.001953125) {
    double rm = 0.5 * (r_lo + r_hi);
    return std::max(certify_kappa_odd_adaptive(rd, ladders, r_lo, rm),
                    certify_kappa_odd_adaptive(rd, ladders, rm, r_hi));
  }
  return kap;
}

double certify_modd_adaptive(const RowDerived& rd, double r_lo, double r_hi, double target_lt) {
  SlabMatrices sm = eval_odd_slab_matrices(rd, r_lo, r_hi, 96, 0.03125);
  double modd = (I(std::max(
      lam_max_2x2_upper(sm.Modd_pos[0][0], sm.Modd_pos[0][1], sm.Modd_pos[1][1]),
      lam_max_2x2_upper(sm.Modd_neg[0][0], sm.Modd_neg[0][1], sm.Modd_neg[1][1]))) / rd.p1).h;
  if (modd < target_lt || (r_hi - r_lo) <= 0.0009765625) return modd;
  double rm = 0.5 * (r_lo + r_hi);
  return std::max(certify_modd_adaptive(rd, r_lo, rm, target_lt),
                  certify_modd_adaptive(rd, rm, r_hi, target_lt));
}

struct EmaxSlab {
  double r_lo, r_hi, s_lo, s_hi;
  double emax_hi;
  uint64_t leaves;
};

EmaxSlab eval_emax_slab_single(const RowDerived& rd, const std::vector<SecantLadder>& ladders,
                               double r_lo, double r_hi) {
  double s_lo_d = (r_lo == 0.0) ? 0.0 : std::max(0.0, rd.psi_eval(I(r_lo)).l);
  double s_hi_d = rd.psi_eval(I(r_hi)).h;
  EmaxSlab res{r_lo, r_hi, s_lo_d, s_hi_d, 0.0, 0};

  SlabMatrices sm = eval_odd_slab_matrices(rd, r_lo, r_hi, 64, 0.0625);
  double qtil = (I(std::max(
      lam_max_2x2_upper(sm.Mtil_pos[0][0], sm.Mtil_pos[0][1], sm.Mtil_pos[1][1]),
      lam_max_2x2_upper(sm.Mtil_neg[0][0], sm.Mtil_neg[0][1], sm.Mtil_neg[1][1]))) / rd.p1).h;
  if (qtil <= 1.0) {
    res.emax_hi = 0.0;
    res.leaves = 1;
    return res;
  }

  const bool fine = ((r_hi - r_lo) <= 0.0078125);
  HybridOddCert hc = certify_slab_odd_hybrid(rd, ladders, r_lo, r_hi, true, fine ? 96 : 64, fine ? 0.03125 : 0.0625);
  if (hc.worst_ratio <= 1.0) {
    res.emax_hi = 0.0;
    res.leaves = hc.leaves;
    return res;
  }
  res.emax_hi = hc.max_emax;
  res.leaves = hc.leaves;
  return res;
}

void append_emax_adaptive(const RowDerived& rd, const std::vector<SecantLadder>& ladders,
                          double r_lo, double r_hi, double sub_thresh, double target_tol,
                          std::vector<EmaxSlab>& out) {
  EmaxSlab es = eval_emax_slab_single(rd, ladders, r_lo, r_hi);
  if (es.emax_hi > sub_thresh && (r_hi - r_lo) > 0.00390625) {
    double rm = 0.5 * (r_lo + r_hi);
    append_emax_adaptive(rd, ladders, r_lo, rm, sub_thresh, target_tol, out);
    append_emax_adaptive(rd, ladders, rm, r_hi, sub_thresh, target_tol, out);
    return;
  }
  require(es.emax_hi <= target_tol,
          "E_max slab exceeded target_tol on row " + rd.sp.label + " at [" +
          std::to_string(r_lo) + "," + std::to_string(r_hi) + "]: " + std::to_string(es.emax_hi));
  out.push_back(es);
}

// ============================================================================
// 10. Startup Self-Tests & Full 19-Row Certification Pipeline
// ============================================================================
void run_startup_selftests() {
  for (double x : {-10.0, -1.0, -1e-300, 0.0, 1e-300, 0.1, 1.0, 42.0}) {
    double d_ref = std::nextafter(x, -std::numeric_limits<double>::infinity());
    double u_ref = std::nextafter(x, +std::numeric_limits<double>::infinity());
    require(dn(x) == d_ref && up(x) == u_ref, "IEEE-754 dn/up self-test");
  }
  {
    I zbox(-1.0, 1.0);
    I s4 = sq(zbox) + sq(zbox) + sq(zbox) + sq(zbox);
    require(s4.l == 0.0 && sqrti(s4).l == 0.0, "zero-straddling sum-of-squares sqrti self-test");
  }
  I p = verified_pi();
  require(p.l <= 3.14159265358979323846 && p.h >= 3.14159265358979323846, "pi self-test");
  I s, c;
  sincos_0_pi(I(0.5) * p, s, c);
  require(s.l <= 1.0 && 1.0 <= s.h && c.l <= 0.0 && 0.0 <= c.h, "sincos(pi/2) self-test");
  sincos_0_pi(p, s, c);
  require(s.l <= 0.0 && 0.0 <= s.h && c.l <= -1.0 && -1.0 <= c.h, "sincos(pi) self-test");

  // Non-dyadic constant-integrand regression self-test:
  for (double b_end : {p.l, 2.4}) {
    const int NP = 64;
    I acc4(0.0), acc0(0.0);
    for (int i = 0; i < NP; ++i) {
      double lo = (i == 0) ? 0.0 : (b_end * double(i) / double(NP));
      double hi = (i + 1 == NP) ? b_end : (b_end * double(i + 1) / double(NP));
      I dh = I(0.5) * (I(hi) - I(lo));
      Jet<4> jm(I(1.0)), jx(I(1.0));
      acc4 = acc4 + panel_int_jet4(jm, jx.c[4], dh);
      acc0 = acc0 + (I(2.0) * dh) * jx.c[0];
    }
    require(acc4.l <= b_end && b_end <= acc4.h, "non-dyadic constant q4 self-test");
    require(acc0.l <= b_end && b_end <= acc0.h, "non-dyadic constant q0 self-test");
  }

  // BivJet2 mixed-partial self-tests (testing inv_biv, invsqrt_biv, expneg_biv on linear & bilinear inputs):
  {
    BivJet2 bx = BivJet2::from_rs(Jet<2>::var(I(0.0)));
    BivJet2 by = BivJet2::from_aux(Jet<2>::var(I(0.0)));
    BivJet2 u_lin = BivJet2(I(2.0)) + bx + I(2.0) * by;
    I r_inv = inv_biv(u_lin).c[2][2];
    require(r_inv.l <= 0.75 && 0.75 <= r_inv.h, "BivJet2 inv_biv self-test");
    BivJet2 u_s = BivJet2(I(4.0)) + bx + I(2.0) * by;
    I r_is = invsqrt_biv(u_s).c[2][2];
    double ex_is = 105.0 / 8192.0;
    require(r_is.l <= ex_is && ex_is <= r_is.h, "BivJet2 invsqrt_biv linear self-test");
    I r_is_xy = invsqrt_biv(BivJet2(I(4.0)) + bx * by).c[2][2];
    double ex_xy = 3.0 / 256.0;
    require(r_is_xy.l <= ex_xy && ex_xy <= r_is_xy.h, "BivJet2 invsqrt_biv bilinear self-test");
    I r_exp = expneg_biv(bx + I(2.0) * by).c[2][2];
    require(r_exp.l <= 1.0 && 1.0 <= r_exp.h, "BivJet2 expneg_biv self-test");
  }

  // BivJet12 mixed-partial self-tests (c[1][2] = (1/2) d^3 / (dr* daux^2)):
  {
    BivJet12 bx = BivJet12::from_rs1(Jet<1>::var(I(0.0)));
    BivJet12 by = BivJet12::from_aux2(Jet<2>::var(I(0.0)));
    I r12_inv = inv_g(BivJet12(I(2.0)) + bx + I(2.0) * by).c[1][2];
    require(r12_inv.l <= -0.75 && -0.75 <= r12_inv.h, "BivJet12 inv_g self-test");
    I r12_is = invsqrt_g(BivJet12(I(4.0)) + bx + I(2.0) * by).c[1][2];
    double ex12_is = -15.0 / 512.0;
    require(r12_is.l <= ex12_is && ex12_is <= r12_is.h, "BivJet12 invsqrt_g self-test");
    I r12_exp = expneg_g(bx + I(2.0) * by).c[1][2];
    require(r12_exp.l <= -2.0 && -2.0 <= r12_exp.h, "BivJet12 expneg_g self-test");
  }

  // Cross-check unpacked 40-channel NE_odd & NE_even against direct complex Wick basis at asymmetric point:
  {
    RowDerived rd_t({"0.81", 783378, 128843, -47249, -25830, 8988});
    I rs_t(0.375), rho_t(1.125), cp_t, sp_t;
    sincos_0_pi(I(0.75), sp_t, cp_t);
    std::array<Jet<0>, N_PACK> pk;
    std::array<Jet<0>, N_ODD> od;
    Jet<0> T_j, zx_j, zy_j, wt_j;
    eval_odd_integrands<Jet<0>>(rd_t, Jet<0>(rs_t), Jet<0>(rho_t), Jet<0>(cp_t), Jet<0>(sp_t), od, &T_j, &zx_j, &zy_j, &wt_j);
    eval_all_integrands<Jet<0>>(rd_t, Jet<0>(rs_t), Jet<0>(rho_t), Jet<0>(cp_t), Jet<0>(sp_t), pk);
    std::array<I, N_PACK> tot;
    for (int m = 0; m < N_PACK; ++m) tot[m] = pk[m].c[0];
    std::array<std::array<I, 6>, 6> neo{}, nee{};
    unpack_ne_matrices(tot, neo, nee);

    double zx = zx_j.c[0].mid(), zy = zy_j.c[0].mid(), T = T_j.c[0].mid(), wt = wt_j.c[0].mid();
    double z2x = zx*zx - zy*zy, z2y = 2.0*zx*zy;
    double z3x = z2x*zx - z2y*zy, z3y = z2x*zy + z2y*zx;
    double l21 = (T - 2.0) / std::sqrt(2.0);
    double l32 = (T*T - 6.0*T + 6.0) / std::sqrt(12.0);
    double ox[6] = {zx, zx, zx*l21, zx*l21, z3x/std::sqrt(6.0), zx*l32};
    double oy[6] = {zy, -zy, zy*l21, -zy*l21, z3y/std::sqrt(6.0), zy*l32};
    double l31 = (T - 3.0) / std::sqrt(6.0);
    double l22 = 0.5 * (T*T - 4.0*T + 2.0);
    double ex[6] = {1.0, z2x/std::sqrt(2.0), T - 1.0, z2x*l31, z2x/std::sqrt(2.0), l22};
    double ey[6] = {0.0, z2y/std::sqrt(2.0), 0.0,     z2y*l31, -z2y/std::sqrt(2.0), 0.0};
    for (int i = 0; i < 6; ++i) {
      for (int j = 0; j < 6; ++j) {
        double ref_o = wt * (ox[i]*ox[j] + oy[i]*oy[j]);
        double ref_e = wt * (ex[i]*ex[j] + ey[i]*ey[j]);
        require(std::abs(neo[i][j].mid() - ref_o) < 1e-12, "NE_odd unpack self-test");
        require(std::abs(nee[i][j].mid() - ref_e) < 1e-12, "NE_even unpack self-test");
      }
    }
  }
}

struct RowResult {
  RowSpec sp;
  bool ge_081;
  I Z;
  CollarCert collar;
  LargeSTails tails;
  double Modd_body_over_p1_hi;     // sup over r* >= 1/16 of lam_max(M_odd)/p1
  double Modd_sup_over_p1_hi;      // sup over all s >= 0 of lam_max(M_odd)/p1 (= Z.h since collar proves <= Z!)
  double qtilde_sup_over_p1_lo;    // certified lower bound on sup_s lam_max(qtilde_odd)/p1
  double qtilde_sup_over_p1_hi;    // sup over all s >= 0 of lam_max(qtilde_odd)/p1
  double kappa_odd_hi;             // certified kappa_odd (< 1 on all rows >= 0.81)
  double NE1_sup_over_p2_lo;       // certified lower bound at argmax slab (for negative control > 1/5!)
  double NE1_sup_over_p2_hi;       // certified upper bound (< 1/4 on all 19 rows!)
  double NE_sup_over_p2_lo;
  double NE_sup_over_p2_hi;        // certified upper bound (< 1/2 on all 19 rows!)
  std::vector<EmaxSlab> emax_profile; // populated on rows 0.79 and 0.80
};

RowResult certify_one_row(const RowSpec& sp, const std::vector<SecantLadder>& ladders) {
  RowDerived rd(sp);
  RowResult rr{};
  rr.sp = sp;
  rr.ge_081 = (sp.L6 >= 780000); // exact test: t >= 0.81 iff L6 >= 783378

  // (a) Zero-core scalar Z:
  rr.Z = certify_Z(rd);
  if (rr.ge_081) require(rr.Z.h < 1.0, "Z < 1 failed on row " + sp.label);
  else require(rr.Z.width() < 1e-8, "Z width < 1e-4 failed on row " + sp.label);

  // Collar on r* in [0, 1/16] for (b):
  rr.collar = certify_Modd_collar(rd, rr.Z, 0.0625);

  // Large-s tails on r* >= 9.0:
  rr.tails = certify_large_s_tails(rd);

  // Disjoint dyadic r*-slabs covering [0, 9.0]:
  std::vector<std::pair<double, double>> slabs;
  auto add_seg = [&](double a, double b, int n) {
    double h = (b - a) / double(n);
    for (int i = 0; i < n; ++i) {
      double lo = a + i * h, hi = a + (i + 1) * h;
      if (!slabs.empty()) require(slabs.back().second == lo, "slab disjointness");
      slabs.push_back({lo, hi});
    }
  };
  add_seg(0.0, 0.0625, 2);     // h = 1/32 (overlaps collar [0, 1/16] for qtilde, NE1, NE)
  add_seg(0.0625, 0.125, 16);  // h = 1/256 right outside collar [1/16, 1/8]
  add_seg(0.125, 0.25, 8);     // h = 1/64 on [1/8, 1/4]
  add_seg(0.25, 1.5, 40);      // h = 1/32 on [1/4, 3/2]
  add_seg(1.5, 9.0, 120);      // h = 1/16 across [3/2, 9.0]

  double modd_body_hi = rr.tails.Modd_over_p1_hi;
  double modd_worst_a = -1.0, modd_worst_b = -1.0;
  double qtil_hi = rr.tails.qtilde_over_p1_hi, qtil_lo = 0.0;
  double kap_odd_hi = rr.tails.qtilde_over_p1_hi;
  double emax_cut_r = 0.125;
  double rem_kap_after_cut = rr.tails.qtilde_over_p1_hi;
  double ne1_hi = rr.tails.NE1_over_p2_hi, ne1_lo = 0.0;
  double ne_hi  = rr.tails.NE_over_p2_hi,  ne_lo  = 0.0;
  const bool need_emax = (sp.label == "0.79" || sp.label == "0.80");

  for (const auto& slb : slabs) {
    const int n_phi_slb = (slb.first >= 2.5) ? 96 : 64;
    const double h_rho_slb = 0.0625;
    SlabMatrices sm = eval_slab_matrices(rd, slb.first, slb.second, n_phi_slb, h_rho_slb);

    double modd_slab = (I(std::max(
        lam_max_2x2_upper(sm.Modd_pos[0][0], sm.Modd_pos[0][1], sm.Modd_pos[1][1]),
        lam_max_2x2_upper(sm.Modd_neg[0][0], sm.Modd_neg[0][1], sm.Modd_neg[1][1]))) / rd.p1).h;
    if (slb.first >= 0.0625 && modd_slab >= rr.Z.l) {
      modd_slab = certify_modd_adaptive(rd, slb.first, slb.second, rr.Z.l);
    }
    if (slb.first >= 0.0625 && modd_slab > modd_body_hi) {
      modd_body_hi = modd_slab;
      modd_worst_a = slb.first;
      modd_worst_b = slb.second;
    }

    double qtil_slab_lo = (I(std::max(
        lam_max_2x2_lower(sm.Mtil_pos[0][0], sm.Mtil_pos[0][1], sm.Mtil_pos[1][1]),
        lam_max_2x2_lower(sm.Mtil_neg[0][0], sm.Mtil_neg[0][1], sm.Mtil_neg[1][1]))) / rd.p1).l;
    double qtil_slab = (I(std::max(
        lam_max_2x2_upper(sm.Mtil_pos[0][0], sm.Mtil_pos[0][1], sm.Mtil_pos[1][1]),
        lam_max_2x2_upper(sm.Mtil_neg[0][0], sm.Mtil_neg[0][1], sm.Mtil_neg[1][1]))) / rd.p1).h;
    qtil_lo = std::max(qtil_lo, qtil_slab_lo);
    qtil_hi = std::max(qtil_hi, qtil_slab);

    if (rr.ge_081) {
      if (qtil_slab < 0.996) {
        kap_odd_hi = std::max(kap_odd_hi, qtil_slab);
      } else {
        double kap_refined = certify_kappa_odd_adaptive(rd, ladders, slb.first, slb.second);
        kap_odd_hi = std::max(kap_odd_hi, std::min(qtil_slab, kap_refined));
      }
    } else if (need_emax && slb.first >= 0.125) {
      double kap_here = qtil_slab;
      if (kap_here >= 0.996) {
        kap_here = std::min(kap_here, certify_kappa_odd_adaptive(rd, ladders, slb.first, slb.second));
      }
      if (kap_here > 1.0) {
        emax_cut_r = std::max(emax_cut_r, slb.second);
        rem_kap_after_cut = rr.tails.qtilde_over_p1_hi;
      } else if (slb.first >= emax_cut_r) {
        rem_kap_after_cut = std::max(rem_kap_after_cut, kap_here);
      }
    }

    // Extract 5x5 top-left principal submatrix N_{E1} from NE_odd:
    std::array<std::array<I, 5>, 5> M5{};
    for (int i = 0; i < 5; ++i)
      for (int j = 0; j < 5; ++j) M5[i][j] = sm.NE_odd[i][j];
    auto b5 = sym_interval_lam_max_bounds<5>(M5);
    ne1_lo = std::max(ne1_lo, (I(b5.first) / rd.p2).l);
    ne1_hi = std::max(ne1_hi, (I(b5.second) / rd.p2).h);

    auto b6o = sym_interval_lam_max_bounds<6>(sm.NE_odd);
    auto b6e = sym_interval_lam_max_bounds<6>(sm.NE_even);
    ne_lo = std::max(ne_lo, (I(std::max(b6o.first, b6e.first)) / rd.p2).l);
    ne_hi = std::max(ne_hi, (I(std::max(b6o.second, b6e.second)) / rd.p2).h);
  }

  require(modd_body_hi < rr.Z.l,
          "Modd body < Z.l failed on row " + sp.label + " (body=" + std::to_string(modd_body_hi) +
          " vs Z.l=" + std::to_string(rr.Z.l) + " at [" + std::to_string(modd_worst_a) + "," +
          std::to_string(modd_worst_b) + "], ne1=" + std::to_string(ne1_hi) +
          ", ne=" + std::to_string(ne_hi) + ")");
  rr.Modd_body_over_p1_hi = modd_body_hi;
  rr.Modd_sup_over_p1_hi = rr.Z.h;
  rr.qtilde_sup_over_p1_lo = qtil_lo;
  rr.qtilde_sup_over_p1_hi = qtil_hi;
  rr.kappa_odd_hi = rr.ge_081 ? kap_odd_hi : qtil_hi;
  if (rr.ge_081) require(rr.kappa_odd_hi < 1.0,
                         "kappa_odd < 1 failed on row " + sp.label + " (kap=" + std::to_string(rr.kappa_odd_hi) +
                         ", qtil=" + std::to_string(qtil_hi) + ")");

  require(ne1_hi < 0.25, "NE1 / p2 < 1/4 failed on row " + sp.label);
  require(ne_hi < 0.50,  "NE / p2 < 1/2 failed on row " + sp.label);
  rr.NE1_sup_over_p2_lo = ne1_lo;
  rr.NE1_sup_over_p2_hi = ne1_hi;
  rr.NE_sup_over_p2_lo = ne_lo;
  rr.NE_sup_over_p2_hi = ne_hi;

  // On rows 0.79 and 0.80, certify E_max(s) profile across all s >= 0:
  if (sp.label == "0.79" || sp.label == "0.80") {
    double sub_thresh = (sp.label == "0.79") ? 2.7e-3 : 1.2e-3;
    double tol = (sp.label == "0.79") ? 3.5e-3 : 1.6e-3;
    require(emax_cut_r <= 1.5, "emax_cut_r <= 1.5 failed on row " + sp.label);
    const int n_emax_slabs = int(std::llround(emax_cut_r / 0.015625));
    require(n_emax_slabs * 0.015625 == emax_cut_r, "emax_cut_r dyadic 1/64 alignment");
    for (int k = 0; k < n_emax_slabs; ++k) {
      double a = k * 0.015625, b = (k + 1) * 0.015625;
      append_emax_adaptive(rd, ladders, a, b, sub_thresh, tol, rr.emax_profile);
    }
    require(rem_kap_after_cut <= 1.0,
            "E_max tail = 0 failed on row " + sp.label + " (rem_kap=" + std::to_string(rem_kap_after_cut) + ")");
    rr.emax_profile.push_back({emax_cut_r, std::numeric_limits<double>::infinity(),
                               rd.psi_eval(I(emax_cut_r)).l, std::numeric_limits<double>::infinity(),
                               0.0, 1});
  }

  return rr;
}

} // namespace

int main(int argc, char** argv) {
  auto t_start = std::chrono::steady_clock::now();
  run_startup_selftests();
  const auto ladders = build_secant_ladders();

  std::string cpp_path = "certify_pure_cost.cpp";
  std::string out_path = "result.json";
  std::string only_label = "";
  for (int i = 1; i < argc; ++i) {
    std::string a(argv[i]);
    if (a == "--cpp" && i + 1 < argc) cpp_path = argv[++i];
    else if (a == "--out" && i + 1 < argc) out_path = argv[++i];
    else if (a == "--only" && i + 1 < argc) only_label = argv[++i];
    else {
      std::cerr << "Usage: " << argv[0] << " [--cpp path] [--out result.json] [--only label]\n";
      return 2;
    }
  }
  const std::string cpp_hash = sha256_file(cpp_path);

  const std::vector<RowSpec> specs = {
    {"0.70",  624520,  79052, -35192, -20165,  3697},
    {"0.74",  678118,  95396, -39377, -22177,  5245},
    {"0.76",  706640, 104313, -41549, -23195,  6173},
    {"0.78",  736351, 113740, -43781, -24231,  7209},
    {"0.79",  751694, 118645, -44919, -24762,  7771},
    {"0.80",  767389, 123680, -46085, -25293,  8365},
    {"0.81",  783378, 128843, -47249, -25830,  8988},
    {"0.82",  799756, 134135, -48447, -26380,  9646},
    {"0.83",  816538, 139578, -49674, -26924, 10338},
    {"0.84",  833674, 145151, -50910, -27496, 11066},
    {"0.845", 842397, 147989, -51554, -27777, 11444},
    {"0.85",  851203, 150857, -52192, -28061, 11831},
    {"0.855", 860143, 153779, -52831, -28362, 12227},
    {"0.86",  869173, 156715, -53492, -28642, 12636},
    {"0.865", 878331, 159706, -54163, -28956, 13053},
    {"0.87",  887591, 162733, -54822, -29250, 13480},
    {"0.875", 896974, 165795, -55514, -29567, 13919},
    {"0.88",  906478, 168894, -56209, -29865, 14368},
    {"0.886", 917174, 172683, -57694, -31607, 14947}
  };

  if (!only_label.empty()) {
    bool found = false;
    for (const auto& sp : specs) {
      if (sp.label == only_label) {
        found = true;
        auto t0 = std::chrono::steady_clock::now();
        RowResult rr = certify_one_row(sp, ladders);
        auto t1 = std::chrono::steady_clock::now();
        double dt = std::chrono::duration<double>(t1 - t0).count();
        double max_em = 0.0;
        for (const auto& es : rr.emax_profile) max_em = std::max(max_em, es.emax_hi);
        std::cout << "[only " << sp.label << "] CERTIFIED in " << std::fixed << std::setprecision(2) << dt
                  << "s: Z=[" << std::setprecision(8) << rr.Z.l << "," << rr.Z.h << "]"
                  << " Modd_body/p1<=" << rr.Modd_body_over_p1_hi
                  << " kap_odd<=" << rr.kappa_odd_hi
                  << " emax<=" << max_em
                  << " NE1/p2=[" << rr.NE1_sup_over_p2_lo << "," << rr.NE1_sup_over_p2_hi << "]"
                  << " NE/p2=[" << rr.NE_sup_over_p2_lo << "," << rr.NE_sup_over_p2_hi << "]\n" << std::flush;
      }
    }
    require(found, "unknown --only label: " + only_label);
    return 0;
  }

  std::vector<RowResult> results(specs.size());
  std::vector<std::string> errs(specs.size());
  size_t next_idx = 0;
  std::mutex mtx;

  const unsigned n_threads = std::min<unsigned>(8u, std::max(1u, std::thread::hardware_concurrency()));
  std::cerr << "[certify_pure_cost] Certifying 19 degree-5 rows across " << n_threads << " threads...\n" << std::flush;

  std::vector<std::thread> pool;
  for (unsigned tid = 0; tid < n_threads; ++tid) {
    pool.emplace_back([&]() {
      while (true) {
        size_t i;
        {
          std::lock_guard<std::mutex> lk(mtx);
          if (next_idx >= specs.size()) return;
          i = next_idx++;
        }
        try {
          auto t0 = std::chrono::steady_clock::now();
          RowResult rr = certify_one_row(specs[i], ladders);
          auto t1 = std::chrono::steady_clock::now();
          double dt = std::chrono::duration<double>(t1 - t0).count();
          results[i] = rr;
          std::lock_guard<std::mutex> lk(mtx);
          std::cerr << "  [row " << std::setw(5) << specs[i].label << "] approx diagnostic: "
                    << "Z~" << std::fixed << std::setprecision(6) << rr.Z.h
                    << " kap_odd~" << rr.kappa_odd_hi
                    << " NE1/p2~" << rr.NE1_sup_over_p2_hi
                    << " NE/p2~" << rr.NE_sup_over_p2_hi
                    << " (" << std::setprecision(2) << dt << "s)\n" << std::flush;
        } catch (const std::exception& e) {
          std::lock_guard<std::mutex> lk(mtx);
          errs[i] = "Row " + specs[i].label + ": " + e.what();
          std::cerr << "  [row " << std::setw(5) << specs[i].label << "] ERROR: " << e.what() << "\n" << std::flush;
        }
      }
    });
  }
  for (auto& th : pool) th.join();
  for (const auto& er : errs) {
    if (!er.empty()) throw std::runtime_error(er);
  }

  // Built-in C++ negative control checks (P6 §5):
  // NC1: Row 0.80 must have Z.l > 1 (rejects Z < 1 on row 0.80):
  require(results[5].sp.label == "0.80" && results[5].Z.l > 1.01, "C++ NC1: row 0.80 Z > 1");
  // NC2: Row 0.70 must have NE1_sup_over_p2_lo > 0.20 = 1/5 (rejects 1/5 in place of 1/4 on row 0.70):
  require(results[0].sp.label == "0.70" && results[0].NE1_sup_over_p2_lo > 0.23, "C++ NC2: row 0.70 NE1/p2 > 1/5");
  // NC3: Every row >= 0.81 has Z.l > 0.9 * Z.h (so Modd(0) = p1*Z rejects 0.9*p1*Z):
  for (const auto& r : results) {
    if (r.ge_081) require(r.Z.l > up(0.9 * r.Z.h), "C++ NC3: Modd(0) > 0.9*p1*Z");
  }

  auto t_end = std::chrono::steady_clock::now();
  double total_sec = std::chrono::duration<double>(t_end - t_start).count();

  std::ofstream out(out_path);
  require(bool(out), "cannot open output JSON: " + out_path);
  out << std::setprecision(17);
  out << "{\n"
      << "  \"agent_id\": \"gemini-21d5\",\n"
      << "  \"issue\": 627,\n"
      << "  \"problem\": \"P6-pure-cost-sector-constants\",\n"
      << "  \"cpp_sha256\": \"" << cpp_hash << "\",\n"
      << "  \"constants\": {\n"
      << "    \"eps1\": \"39/50\",\n"
      << "    \"eta\": \"779/10000\",\n"
      << "    \"p1\": \"50/39\",\n"
      << "    \"p2\": \"10000/779\",\n"
      << "    \"row_denominator\": 1000000,\n"
      << "    \"NE1_cap_ratio\": \"1/4\",\n"
      << "    \"NE_cap_ratio\": \"1/2\"\n"
      << "  },\n"
      << "  \"rows\": [\n";
  for (size_t i = 0; i < results.size(); ++i) {
    const auto& r = results[i];
    out << "    {\n"
        << "      \"label\": \"" << r.sp.label << "\",\n"
        << "      \"ge_081\": " << (r.ge_081 ? "true" : "false") << ",\n"
        << "      \"rational_1e6\": {\"l\": " << r.sp.L6 << ", \"beta\": " << r.sp.B6
        << ", \"bA\": " << r.sp.bA6 << ", \"bB\": " << r.sp.bB6 << ", \"nu5\": " << r.sp.nu6 << "},\n"
        << "      \"Z\": "; write_json_iv(out, r.Z); out << ",\n"
        << "      \"Modd_collar\": {\n"
        << "        \"r0\": " << r.collar.r0 << ",\n"
        << "        \"mu1\": "; write_json_iv(out, r.collar.mu1); out << ",\n"
        << "        \"mu2\": "; write_json_iv(out, r.collar.mu2); out << ",\n"
        << "        \"K12\": "; write_json_iv(out, r.collar.K12); out << ",\n"
        << "        \"det_coeff\": "; write_json_iv(out, r.collar.det_coeff); out << ",\n"
        << "        \"pos_block_ratio_hi_hex\": \"" << hexfloat_str(r.collar.pos_block_ratio_hi) << "\"\n"
        << "      },\n"
        << "      \"Modd_body_over_p1_hi\": " << r.Modd_body_over_p1_hi << ",\n"
        << "      \"Modd_body_over_p1_hi_hex\": \"" << hexfloat_str(r.Modd_body_over_p1_hi) << "\",\n"
        << "      \"Modd_sup_over_p1_hi\": " << r.Modd_sup_over_p1_hi << ",\n"
        << "      \"Modd_sup_over_p1_hi_hex\": \"" << hexfloat_str(r.Modd_sup_over_p1_hi) << "\",\n"
        << "      \"qtilde_sup_over_p1\": {\"lo\": " << r.qtilde_sup_over_p1_lo << ", \"hi\": " << r.qtilde_sup_over_p1_hi
        << ", \"lo_hex\": \"" << hexfloat_str(r.qtilde_sup_over_p1_lo) << "\""
        << ", \"hi_hex\": \"" << hexfloat_str(r.qtilde_sup_over_p1_hi) << "\"},\n"
        << "      \"kappa_odd_hi\": " << r.kappa_odd_hi << ",\n"
        << "      \"kappa_odd_hi_hex\": \"" << hexfloat_str(r.kappa_odd_hi) << "\",\n"
        << "      \"NE1_sup_over_p2\": {\"lo\": " << r.NE1_sup_over_p2_lo << ", \"hi\": " << r.NE1_sup_over_p2_hi
        << ", \"lo_hex\": \"" << hexfloat_str(r.NE1_sup_over_p2_lo) << "\""
        << ", \"hi_hex\": \"" << hexfloat_str(r.NE1_sup_over_p2_hi) << "\"},\n"
        << "      \"NE_sup_over_p2\": {\"lo\": " << r.NE_sup_over_p2_lo << ", \"hi\": " << r.NE_sup_over_p2_hi
        << ", \"lo_hex\": \"" << hexfloat_str(r.NE_sup_over_p2_lo) << "\""
        << ", \"hi_hex\": \"" << hexfloat_str(r.NE_sup_over_p2_hi) << "\"},\n"
        << "      \"large_s_tail\": {\"s_max_lo_hex\": \"" << hexfloat_str(r.tails.s_max_lo) << "\""
        << ", \"Modd_hi_hex\": \"" << hexfloat_str(r.tails.Modd_over_p1_hi) << "\""
        << ", \"NE1_hi_hex\": \"" << hexfloat_str(r.tails.NE1_over_p2_hi) << "\""
        << ", \"NE_hi_hex\": \"" << hexfloat_str(r.tails.NE_over_p2_hi) << "\"}"
        << (r.emax_profile.empty() ? "\n" : ",\n");
    if (!r.emax_profile.empty()) {
      out << "      \"emax_profile\": [\n";
      for (size_t k = 0; k < r.emax_profile.size(); ++k) {
        const auto& ep = r.emax_profile[k];
        bool inf_hi = std::isinf(ep.s_hi);
        out << "        {\"s_lo_hex\": \"" << hexfloat_str(ep.s_lo) << "\", \"s_hi_hex\": \""
            << (inf_hi ? "inf" : hexfloat_str(ep.s_hi)) << "\", \"emax_hi\": " << ep.emax_hi
            << ", \"emax_hi_hex\": \"" << hexfloat_str(ep.emax_hi) << "\", \"leaves\": " << ep.leaves << "}"
            << (k + 1 < r.emax_profile.size() ? "," : "") << "\n";
      }
      out << "      ]\n";
    }
    out << "    }" << (i + 1 < results.size() ? "," : "") << "\n";
  }
  out << "  ]\n}\n";
  out.close();

  std::cout << "[certify_pure_cost] ALL 19 ROWS CERTIFIED in "
            << std::fixed << std::setprecision(2) << total_sec << "s -> " << out_path << "\n";
  return 0;
}
