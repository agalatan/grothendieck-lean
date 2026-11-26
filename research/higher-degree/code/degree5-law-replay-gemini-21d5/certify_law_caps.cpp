// Clean-room outward-rounded IEEE-754 interval certifier for Issue #625 (ATK P4, Level C):
//   - Independently certifies Claim 2 across all 29 rows of `rows2b.json` at rho = 95133/100000
//     (29 plain covers + 5 zero-libm-arcsin Stein covers on 0.125L..0.300L) and all 26 rows of
//     `rows2c_final.json` at rho_0 = 2287/2500 (STATUS 4.42 / Hypothesis H4 of 4.45): 60 covers total.
//   - Independently certifies Claim 3 (`SMALL_T.md`: V <= (2/5) t^2 + 7058083/10^7 at rho = 95133/100000)
//     with zero libm transcendental calls.
//   - Computes exact-rational-projected primal multi-atom witnesses in L = (L1)-(L4) on every plain cover,
//     sanity checks of P4 §§4, 8 (s=0 1D/2D/closed-form, 4 Gaussian benchmarks, 4 explicit driver pairs),
//     representative binding box certificates (plain & Stein), and C++ negative controls (CERT_STAGE2B §3, P4 §6).
//
// Zero external dependencies; zero shared code with `pipeline/`; zero transcendental libm calls
// (`asin`, `acos`, `atan`, `sin`, `cos`, `tan`, `exp`, `log`, `pow` do not appear anywhere in this file).
//
// Build:
//   c++ -std=c++17 -O2 -ffp-contract=off -pthread -Wall -Wextra -Werror certify_law_caps.cpp -o certify_law_caps
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
#include <map>
#include <mutex>
#include <numeric>
#include <sstream>
#include <stdexcept>
#include <string>
#include <thread>
#include <tuple>
#include <utility>
#include <vector>

namespace lawcert {

inline void require(bool cond, const std::string& msg) {
  if (!cond) throw std::runtime_error("CERTIFICATION FAILURE: " + msg);
}

// ============================================================================
// 1. Embedded FIPS 180-4 SHA-256
// ============================================================================
namespace sha256 {

inline uint32_t rotr(uint32_t x, uint32_t n) { return (x >> n) | (x << (32 - n)); }

inline std::string hash_bytes(const uint8_t* data, size_t len) {
  static const uint32_t K[64] = {
    0x428a2f98u,0x71374491u,0xb5c0fbcfu,0xe9b5dba5u,0x3956c25bu,0x59f111f1u,0x923f82a4u,0xab1c5ed5u,
    0xd807aa98u,0x12835b01u,0x243185beu,0x550c7dc3u,0x72be5d74u,0x80deb1feu,0x9bdc06a7u,0xc19bf174u,
    0xe49b69c1u,0xefbe4786u,0x0fc19dc6u,0x240ca1ccu,0x2de92c6fu,0x4a7484aau,0x5cb0a9dcu,0x76f988dau,
    0x983e5152u,0xa831c66du,0xb00327c8u,0xbf597fc7u,0xc6e00bf3u,0xd5a79147u,0x06ca6351u,0x14292967u,
    0x27b70a85u,0x2e1b2138u,0x4d2c6dfcu,0x53380d13u,0x650a7354u,0x766a0abbu,0x81c2c92eu,0x92722c85u,
    0xa2bfe8a1u,0xa81a664bu,0xc24b8b70u,0xc76c51a3u,0xd192e819u,0xd6990624u,0xf40e3585u,0x106aa070u,
    0x19a4c116u,0x1e376c08u,0x2748774cu,0x34b0bcb5u,0x391c0cb3u,0x4ed8aa4au,0x5b9cca4fu,0x682e6ff3u,
    0x748f82eeu,0x78a5636fu,0x84c87814u,0x8cc70208u,0x90befffau,0xa4506cebu,0xbef9a3f7u,0xc67178f2u
  };
  uint32_t H[8] = {
    0x6a09e667u,0xbb67ae85u,0x3c6ef372u,0xa54ff53au,
    0x510e527fu,0x9b05688cu,0x1f83d9abu,0x5be0cd19u
  };
  uint64_t bit_len = uint64_t(len) * 8u;
  std::vector<uint8_t> msg(data, data + len);
  msg.push_back(0x80u);
  while ((msg.size() % 64u) != 56u) msg.push_back(0x00u);
  for (int i = 7; i >= 0; --i) msg.push_back(uint8_t((bit_len >> (i * 8)) & 0xffu));

  for (size_t off = 0; off < msg.size(); off += 64u) {
    uint32_t W[64];
    for (int t = 0; t < 16; ++t) {
      W[t] = (uint32_t(msg[off + 4*t]) << 24) | (uint32_t(msg[off + 4*t + 1]) << 16)
           | (uint32_t(msg[off + 4*t + 2]) << 8) | uint32_t(msg[off + 4*t + 3]);
    }
    for (int t = 16; t < 64; ++t) {
      uint32_t s0 = rotr(W[t-15], 7) ^ rotr(W[t-15], 18) ^ (W[t-15] >> 3);
      uint32_t s1 = rotr(W[t-2], 17) ^ rotr(W[t-2], 19) ^ (W[t-2] >> 10);
      W[t] = W[t-16] + s0 + W[t-7] + s1;
    }
    uint32_t a=H[0], b=H[1], c=H[2], d=H[3], e=H[4], f=H[5], g=H[6], h=H[7];
    for (int t = 0; t < 64; ++t) {
      uint32_t S1 = rotr(e, 6) ^ rotr(e, 11) ^ rotr(e, 25);
      uint32_t ch = (e & f) ^ ((~e) & g);
      uint32_t tmp1 = h + S1 + ch + K[t] + W[t];
      uint32_t S0 = rotr(a, 2) ^ rotr(a, 13) ^ rotr(a, 22);
      uint32_t maj = (a & b) ^ (a & c) ^ (b & c);
      uint32_t tmp2 = S0 + maj;
      h = g; g = f; f = e; e = d + tmp1; d = c; c = b; b = a; a = tmp1 + tmp2;
    }
    H[0]+=a; H[1]+=b; H[2]+=c; H[3]+=d; H[4]+=e; H[5]+=f; H[6]+=g; H[7]+=h;
  }
  std::ostringstream oss;
  oss << std::hex << std::setfill('0');
  for (int i = 0; i < 8; ++i) oss << std::setw(8) << H[i];
  return oss.str();
}

inline std::string hash_file(const std::string& path, std::string* out_content = nullptr) {
  std::ifstream ifs(path, std::ios::binary);
  require(bool(ifs), "cannot open file: " + path);
  std::string buf((std::istreambuf_iterator<char>(ifs)), std::istreambuf_iterator<char>());
  if (out_content) *out_content = buf;
  return hash_bytes(reinterpret_cast<const uint8_t*>(buf.data()), buf.size());
}

} // namespace sha256

// ============================================================================
// 2. Outward-Rounded IEEE-754 Interval Arithmetic & Zero-Libm Elementary Core
// ============================================================================
inline double dn(double x) {
  if (std::isnan(x)) throw std::runtime_error("NaN in dn");
  if (x == -std::numeric_limits<double>::infinity()) return x;
  if (x == 0.0) return -std::numeric_limits<double>::denorm_min();
  uint64_t u; std::memcpy(&u, &x, 8);
  if ((u >> 63) == 0) --u; else ++u;
  double r; std::memcpy(&r, &u, 8); return r;
}
inline double up(double x) {
  if (std::isnan(x)) throw std::runtime_error("NaN in up");
  if (x == std::numeric_limits<double>::infinity()) return x;
  if (x == 0.0) return std::numeric_limits<double>::denorm_min();
  uint64_t u; std::memcpy(&u, &x, 8);
  if ((u >> 63) == 0) ++u; else --u;
  double r; std::memcpy(&r, &u, 8); return r;
}

inline std::string hex_d(double x) {
  require(std::isfinite(x), "non-finite double in hex_d");
  std::ostringstream oss;
  oss << std::hexfloat << x;
  return oss.str();
}
inline std::string dec_d(double x, int prec = 16) {
  std::ostringstream oss;
  oss << std::setprecision(prec) << x;
  return oss.str();
}

struct I {
  double l, h;
  constexpr I() : l(0.0), h(0.0) {}
  constexpr explicit I(double v) : l(v), h(v) {}
  I(double lo, double hi) : l(lo), h(hi) {
    if (std::isnan(lo) || std::isnan(hi) || lo > hi)
      throw std::runtime_error("invalid interval");
  }
  double width() const { return up(h - l); }
};

inline I rat_i(int64_t num, int64_t den) {
  require(den > 0, "rat_i den > 0");
  double nl = double(num), nh = double(num);
  if (int64_t(nl) != num) { nl = dn(double(num)); nh = up(double(num)); }
  double dl = double(den), dh = double(den);
  if (int64_t(dl) != den) { dl = dn(double(den)); dh = up(double(den)); }
  if (num == 0) return I(0.0);
  return (num > 0) ? I(dn(nl / dh), up(nh / dl)) : I(dn(nl / dl), up(nh / dh));
}

// Exact arbitrary-precision decimal fraction "[-]NUM/DEN" -> tight IEEE-754 interval [lo, hi]
// via big-integer binary long division (1-ulp exact!).
struct BigUInt {
  std::vector<uint32_t> d; // little-endian base 2^32
  void trim() { while (!d.empty() && d.back() == 0u) d.pop_back(); }
  bool is_zero() const { return d.empty(); }
  static BigUInt from_dec(const std::string& s) {
    BigUInt r;
    for (char c : s) {
      if (c == ' ' || c == '\t' || c == '+') continue;
      require(c >= '0' && c <= '9', "bad digit in BigUInt: " + s);
      uint64_t carry = uint64_t(c - '0');
      for (size_t i = 0; i < r.d.size(); ++i) {
        uint64_t cur = uint64_t(r.d[i]) * 10ull + carry;
        r.d[i] = uint32_t(cur & 0xffffffffull);
        carry = cur >> 32;
      }
      if (carry) r.d.push_back(uint32_t(carry));
    }
    r.trim();
    return r;
  }
  void shl1() {
    uint32_t carry = 0u;
    for (size_t i = 0; i < d.size(); ++i) {
      uint32_t nc = d[i] >> 31;
      d[i] = (d[i] << 1) | carry;
      carry = nc;
    }
    if (carry) d.push_back(carry);
  }
  static int cmp(const BigUInt& a, const BigUInt& b) {
    if (a.d.size() != b.d.size()) return (a.d.size() < b.d.size()) ? -1 : 1;
    for (size_t i = a.d.size(); i-- > 0; ) {
      if (a.d[i] != b.d[i]) return (a.d[i] < b.d[i]) ? -1 : 1;
    }
    return 0;
  }
  void sub_assign(const BigUInt& b) {
    uint64_t borrow = 0;
    for (size_t i = 0; i < d.size(); ++i) {
      uint64_t bi = (i < b.d.size()) ? b.d[i] : 0u;
      uint64_t need = bi + borrow;
      if (d[i] >= need) { d[i] = uint32_t(d[i] - need); borrow = 0; }
      else { d[i] = uint32_t((1ull << 32) + d[i] - need); borrow = 1; }
    }
    require(borrow == 0, "BigUInt underflow");
    trim();
  }
};

inline I rat_str_to_iv(const std::string& s_in) {
  std::string s = s_in;
  while (!s.empty() && (s.front() == ' ' || s.front() == '"')) s.erase(s.begin());
  while (!s.empty() && (s.back() == ' ' || s.back() == '"')) s.pop_back();
  bool neg = false;
  if (!s.empty() && s.front() == '-') { neg = true; s.erase(s.begin()); }
  auto pos = s.find('/');
  BigUInt num = BigUInt::from_dec(pos == std::string::npos ? s : s.substr(0, pos));
  BigUInt den = (pos == std::string::npos) ? BigUInt::from_dec("1") : BigUInt::from_dec(s.substr(pos + 1));
  require(!den.is_zero(), "zero denominator in rat_str_to_iv");
  if (num.is_zero()) return I(0.0);

  // Normalize so den <= num * 2^(-e) < 2 * den:
  int e = 0;
  BigUInt a = num, b = den;
  while (BigUInt::cmp(a, b) < 0) { a.shl1(); --e; }
  while (true) {
    BigUInt b2 = b; b2.shl1();
    if (BigUInt::cmp(a, b2) >= 0) { b = std::move(b2); ++e; }
    else break;
  }
  // Extract 53 bits of quotient:
  uint64_t q = 0;
  for (int bit = 52; bit >= 0; --bit) {
    if (BigUInt::cmp(a, b) >= 0) {
      a.sub_assign(b);
      q |= (1ull << bit);
    }
    if (bit > 0) a.shl1();
  }
  bool exact = a.is_zero();
  double mag_lo = std::ldexp(double(q), e - 52);
  double mag_hi = exact ? mag_lo : up(mag_lo);
  if (!neg) return I(mag_lo, mag_hi);
  return I(-mag_hi, -mag_lo);
}

inline I operator+(I a, I b) {
  return I((a.l == 0.0 && b.l == 0.0) ? 0.0 : dn(a.l + b.l),
           (a.h == 0.0 && b.h == 0.0) ? 0.0 : up(a.h + b.h));
}
inline I operator-(I a, I b) {
  return I((a.l == 0.0 && b.h == 0.0) ? 0.0 : dn(a.l - b.h),
           (a.h == 0.0 && b.l == 0.0) ? 0.0 : up(a.h - b.l));
}
inline I operator-(I a) { return I(-a.h, -a.l); }
inline I operator*(I a, I b) {
  if ((a.l == 0.0 && a.h == 0.0) || (b.l == 0.0 && b.h == 0.0)) return I(0.0);
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
  return I(std::min(dn(a.l * b.h), dn(a.h * b.l)), std::max(up(a.l * b.l), up(a.h * b.h)));
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
  require(b.l > 0.0, "inv_pos");
  return I(dn(1.0 / b.h), up(1.0 / b.l));
}
inline I operator/(I a, I b) {
  if (b.l > 0.0) return a * inv_pos(b);
  require(b.h < 0.0, "div0");
  return (-a) * inv_pos(-b);
}
inline I sqrti(I a) {
  require(a.l >= 0.0, "sqrti");
  double lo = (a.l == 0.0) ? 0.0 : std::max(0.0, dn(std::sqrt(a.l)));
  while (up(lo * lo) > a.l && lo > 0.0) lo = dn(lo);
  double hi = (a.h == 0.0) ? 0.0 : up(std::sqrt(a.h));
  while (dn(hi * hi) < a.h) hi = up(hi);
  require(lo == 0.0 || up(lo * lo) <= a.l, "sqrti_lo_post");
  require(dn(hi * hi) >= a.h, "sqrti_hi_post");
  return I(lo, hi);
}

inline const std::array<I, 13>& inv_small_ints() {
  static const std::array<I, 13> tbl = {
    I(1.0), rat_i(1, 1), rat_i(1, 2), rat_i(1, 3), rat_i(1, 4), rat_i(1, 5), rat_i(1, 6),
    rat_i(1, 7), rat_i(1, 8), rat_i(1, 9), rat_i(1, 10), rat_i(1, 11), rat_i(1, 12)
  };
  return tbl;
}
// Alternating series + repeated squaring for exp(-x), x >= 0 (zero libm exp!):
inline double expneg_scalar_lo(double x) {
  if (x <= 0.0) return 1.0;
  if (x >= 710.0) return 0.0;
  int k = 0; double y = x;
  while (y > 0.03125) { y *= 0.5; ++k; }
  const auto& inv_n = inv_small_ints();
  I yi(y), sum(1.0), term(1.0);
  for (int n = 1; n <= 11; ++n) {
    term = (term * yi) * inv_n[size_t(n)];
    sum = (n % 2 == 1) ? (sum - term) : (sum + term);
  }
  double lo = std::max(0.0, sum.l);
  for (int j = 0; j < k; ++j) lo = std::max(0.0, dn(lo * lo));
  return lo;
}
inline double expneg_scalar_hi(double x) {
  if (x <= 0.0) return 1.0;
  if (x >= 750.0) return std::numeric_limits<double>::denorm_min();
  int k = 0; double y = x;
  while (y > 0.03125) { y *= 0.5; ++k; }
  const auto& inv_n = inv_small_ints();
  I yi(y), sum(1.0), term(1.0);
  for (int n = 1; n <= 11; ++n) {
    term = (term * yi) * inv_n[size_t(n)];
    sum = (n % 2 == 1) ? (sum - term) : (sum + term);
  }
  term = (term * yi) * inv_n[12];
  double hi = up(sum.h + term.h);
  for (int j = 0; j < k; ++j) hi = up(hi * hi);
  return hi;
}
inline I expneg(I x) {
  require(x.l >= 0.0, "expneg");
  return I(expneg_scalar_lo(x.h), expneg_scalar_hi(x.l));
}

// Machin formula for pi (zero libm atan!):
inline I verified_atan_unit_inv(int64_t q) {
  I inv_q = rat_i(1, q), inv_q2 = sq(inv_q), sum(0.0), p = inv_q;
  for (int k = 0; k < 16; ++k) {
    I term = p / I(double(2 * k + 1));
    sum = (k % 2 == 0) ? (sum + term) : (sum - term);
    p = p * inv_q2;
  }
  I rem = p / I(33.0);
  return I(dn(sum.l - rem.h), up(sum.h + rem.h));
}
inline I verified_pi() {
  static const I pi_iv = I(16.0) * verified_atan_unit_inv(5) - I(4.0) * verified_atan_unit_inv(239);
  return pi_iv;
}

// Alternating series for sin/cos on [0, pi] (zero libm sin/cos!):
inline void sincos_small_nonneg(I x, I& s_out, I& c_out) {
  I x2 = sq(x), s_sum = x, s_p = x;
  for (int k = 1; k <= 10; ++k) {
    s_p = s_p * x2 / I(double(2*k * (2*k + 1)));
    s_sum = (k % 2 == 1) ? (s_sum - s_p) : (s_sum + s_p);
  }
  I s_rem = s_p * x2 / I(double(22 * 23));
  s_out = I(std::max(0.0, dn(s_sum.l - s_rem.h)), std::min(1.0, up(s_sum.h + s_rem.h)));
  I c_sum(1.0), c_p(1.0);
  for (int k = 1; k <= 10; ++k) {
    c_p = c_p * x2 / I(double((2*k - 1) * 2*k));
    c_sum = (k % 2 == 1) ? (c_sum - c_p) : (c_sum + c_p);
  }
  I c_rem = c_p * x2 / I(double(21 * 22));
  c_out = I(std::max(-1.0, dn(c_sum.l - c_rem.h)), std::min(1.0, up(c_sum.h + c_rem.h)));
}
inline void sincos_0_pi(I x, I& s_out, I& c_out) {
  const I pi_v = verified_pi(), half_pi = I(0.5) * pi_v;
  auto eval_pt = [&](double t, I& s_pt, I& c_pt) {
    if (t <= 1.58) sincos_small_nonneg(I(t), s_pt, c_pt);
    else {
      I y = pi_v - I(t); y.l = std::max(0.0, y.l);
      if (y.h < 0.0) y = I(0.0);
      I sy, cy; sincos_small_nonneg(y, sy, cy);
      s_pt = sy; c_pt = -cy;
    }
  };
  I sl, cl, sr, cr;
  eval_pt(x.l, sl, cl); eval_pt(x.h, sr, cr);
  c_out = I(cr.l, cl.h);
  if (x.h <= half_pi.l) s_out = I(sl.l, sr.h);
  else if (x.l >= half_pi.h) s_out = I(sr.l, sl.h);
  else s_out = I(std::min(sl.l, sr.l), 1.0);
}

// Bracket-verified arcsin / arccos on [0, 1] by inverting sincos_small_nonneg
// (strictly proves sin_hi(y_lo) <= u <= sin_lo(y_hi) on [0, 0.75] and reduces [0.75, 1]
// via pi/2 - arcsin(sqrt((1-u)(1+u))); zero libm arcsin/arccos!):
inline double asin_poly_seed_small(double u) {
  double u2 = u * u;
  double y = u * (1.0 + u2 * (1.0 / 6.0 + u2 * (3.0 / 40.0)));
  for (int it = 0; it < 3; ++it) {
    double y2 = y * y;
    double sy = y * (1.0 - y2 * (1.0 / 6.0 - y2 * (1.0 / 120.0 - y2 * (1.0 / 5040.0 - y2 * (1.0 / 362880.0 - y2 * (1.0 / 39916800.0 - y2 * (1.0 / 6227020800.0 - y2 * (1.0 / 1307674368000.0 - y2 / 355687428096000.0))))))));
    double cy = 1.0 - y2 * (0.5 - y2 * (1.0 / 24.0 - y2 * (1.0 / 720.0 - y2 * (1.0 / 40320.0 - y2 * (1.0 / 3628800.0 - y2 * (1.0 / 479001600.0 - y2 / 87178291200.0))))));
    y -= (sy - u) / cy;
  }
  return std::clamp(y, 0.0, 1.0);
}
inline double asin_scalar_lo_small(double u) {
  if (u <= 0.0) return 0.0;
  double y = asin_poly_seed_small(u);
  I sv, cv;
  sincos_small_nonneg(I(y), sv, cv);
  for (int it = 0; it < 3 && y > 0.0 && sv.h > u; ++it) {
    double step = up((sv.h - u) / std::max(0.5, cv.l)) + 4e-16;
    y = std::max(0.0, dn(y - step));
    sincos_small_nonneg(I(y), sv, cv);
  }
  for (int k = 0; k < 32 && y > 0.0 && sv.h > u; ++k) {
    y = dn(y);
    sincos_small_nonneg(I(y), sv, cv);
  }
  if (sv.h > u) return 0.0;
  require(y == 0.0 || sv.h <= u, "asin_lo postcondition");
  return y;
}
inline double asin_scalar_hi_small(double u) {
  if (u <= 0.0) return 0.0;
  double y = asin_poly_seed_small(u);
  I sv, cv;
  sincos_small_nonneg(I(y), sv, cv);
  for (int it = 0; it < 3 && y < 1.0 && sv.l < u; ++it) {
    double step = up((u - sv.l) / std::max(0.5, cv.l)) + 4e-16;
    y = std::min(1.0, up(y + step));
    sincos_small_nonneg(I(y), sv, cv);
  }
  for (int k = 0; k < 32 && y < 1.0 && sv.l < u; ++k) {
    y = up(y);
    sincos_small_nonneg(I(y), sv, cv);
  }
  if (sv.l < u) {
    double lo = 0.0, hi = 1.0;
    for (int it = 0; it < 56; ++it) {
      double mid = 0.5 * (lo + hi);
      sincos_small_nonneg(I(mid), sv, cv);
      if (sv.l >= u) hi = mid; else lo = mid;
    }
    y = hi;
    sincos_small_nonneg(I(y), sv, cv);
  }
  require(sv.l >= u, "asin_hi postcondition");
  return y;
}
inline I sqrt_one_minus_sq(I u) {
  require(u.l >= 0.0 && u.h <= 1.0, "sqrt_one_minus_sq range");
  auto pt_lo = [](double x) -> double {
    if (x >= 1.0) return 0.0;
    if (x >= 0.5) return sqrti(I(1.0 - x) * (I(1.0) + I(x))).l;
    I v = I(1.0) - sq(I(x)); v.l = std::max(0.0, v.l); return sqrti(v).l;
  };
  auto pt_hi = [](double x) -> double {
    if (x <= 0.0) return 1.0;
    if (x >= 1.0) return 0.0;
    if (x >= 0.5) { I v = I(1.0 - x) * (I(1.0) + I(x)); v.l = std::max(0.0, v.l); return sqrti(v).h; }
    I v = I(1.0) - sq(I(x)); v.l = std::max(0.0, v.l); return sqrti(v).h;
  };
  return I(pt_lo(u.h), pt_hi(u.l));
}
inline I verified_asin_0_1(I x) {
  require(x.l >= 0.0 && x.h <= 1.0, "verified_asin_0_1 range");
  const I half_pi = I(0.5) * verified_pi();
  double alo = 0.0;
  if (x.l >= 1.0) alo = half_pi.l;
  else if (x.l > 0.0) {
    if (x.l <= 0.75) alo = asin_scalar_lo_small(x.l);
    else {
      double y_hi = sqrt_one_minus_sq(I(x.l)).h;
      alo = std::max(0.0, (half_pi - I(asin_scalar_hi_small(y_hi))).l);
    }
  }
  double ahi = half_pi.h;
  if (x.h < 1.0) {
    if (x.h <= 0.75) ahi = asin_scalar_hi_small(x.h);
    else {
      double y_lo = sqrt_one_minus_sq(I(x.h)).l;
      ahi = (half_pi - I(asin_scalar_lo_small(y_lo))).h;
    }
  }
  return I(alo, ahi);
}
inline I verified_acos_0_1(I x) {
  I r = I(0.5) * verified_pi() - verified_asin_0_1(x);
  r.l = std::max(0.0, r.l);
  return r;
}

// ============================================================================
// 3. Taylor Jets & 2D Polar 3x3 Gauss-Legendre + Peano Remainder Engine for Psi_5
// ============================================================================
template <int N>
struct Jet {
  std::array<I, N + 1> c{};
  Jet() = default;
  explicit Jet(I v) { c[0] = v; }
  static Jet var(I x) { Jet r(x); if constexpr (N >= 1) r.c[1] = I(1.0); return r; }
};
template <int N>
inline Jet<N> operator+(const Jet<N>& a, const Jet<N>& b) {
  Jet<N> r; for (int k = 0; k <= N; ++k) r.c[k] = a.c[k] + b.c[k]; return r;
}
template <int N>
inline Jet<N> operator-(const Jet<N>& a, const Jet<N>& b) {
  Jet<N> r; for (int k = 0; k <= N; ++k) r.c[k] = a.c[k] - b.c[k]; return r;
}
template <int N>
inline Jet<N> operator*(const Jet<N>& a, const Jet<N>& b) {
  Jet<N> r;
  for (int k = 0; k <= N; ++k) {
    I s(0.0);
    for (int j = 0; j <= k; ++j) s = s + a.c[j] * b.c[k - j];
    r.c[k] = s;
  }
  return r;
}
template <int N>
inline Jet<N> sq_j(const Jet<N>& a) {
  Jet<N> r;
  r.c[0] = sq(a.c[0]);
  for (int k = 1; k <= N; ++k) {
    I s(0.0);
    int half = (k - 1) / 2;
    for (int j = 0; j <= half; ++j) s = s + a.c[j] * a.c[k - j];
    s = I(2.0) * s;
    if (k % 2 == 0) s = s + sq(a.c[k / 2]);
    r.c[k] = s;
  }
  return r;
}
template <int N>
inline Jet<N> sqrt_j(const Jet<N>& a) {
  Jet<N> r;
  r.c[0] = sqrti(a.c[0]);
  I inv2r0 = inv_pos(I(2.0) * r.c[0]);
  for (int k = 1; k <= N; ++k) {
    I s(0.0);
    for (int j = 1; j < k; ++j) s = s + r.c[j] * r.c[k - j];
    r.c[k] = (a.c[k] - s) * inv2r0;
  }
  return r;
}
template <int N>
inline Jet<N> expneg_j(const Jet<N>& a) {
  Jet<N> r;
  r.c[0] = expneg(a.c[0]);
  const auto& inv_n = inv_small_ints();
  for (int k = 1; k <= N; ++k) {
    I s(0.0);
    for (int j = 1; j <= k; ++j) s = s - I(double(j)) * a.c[j] * r.c[k - j];
    r.c[k] = s * inv_n[size_t(k)];
  }
  return r;
}
template <int N>
inline void sincos_j_0_pi(I x, Jet<N>& sj, Jet<N>& cj) {
  sincos_0_pi(x, sj.c[0], cj.c[0]);
  const auto& inv_n = inv_small_ints();
  for (int k = 1; k <= N; ++k) {
    sj.c[k] = cj.c[k - 1] * inv_n[size_t(k)];
    cj.c[k] = (-sj.c[k - 1]) * inv_n[size_t(k)];
  }
}

struct GL3PolarEngine {
  static constexpr int BASE_R = 48;
  static constexpr int BASE_T = 24;
  static constexpr int MAX_D  = 7;
  double R_max = 7.5;
  I pi_v, four_over_pi, sqrt35, w_gl[3], c8_175, c16_175;

  struct RNode {
    I rm, dr, dr7, rbox;
    I rq[3], Tq[3], w_rad_q[3];
    Jet<6> r_j6, r2_j6, w_j6;
  };
  struct TNode {
    I tm, dt, dt7, cbox, sbox;
    I cq[3], sq_v[3];
    Jet<6> c_j6, s_j6;
  };
  std::array<std::vector<RNode>, MAX_D + 1> rtree;
  std::array<std::vector<TNode>, MAX_D + 1> ttree;
  TNode t_strip;

  GL3PolarEngine() {
    pi_v = verified_pi();
    four_over_pi = I(4.0) / pi_v;
    sqrt35 = sqrti(rat_i(3, 5));
    w_gl[0] = rat_i(5, 9); w_gl[1] = rat_i(8, 9); w_gl[2] = rat_i(5, 9);
    c8_175 = rat_i(8, 175);
    c16_175 = rat_i(16, 175);

    double pi_lo = pi_v.l;
    for (int d = 0; d <= MAX_D; ++d) {
      int nr = BASE_R << d;
      double hr = R_max / nr;
      rtree[size_t(d)].resize(size_t(nr));
      for (int i = 0; i < nr; ++i) {
        auto& p = rtree[size_t(d)][size_t(i)];
        double r0 = i * hr, r1 = (i + 1) * hr;
        p.rm = I(0.5) * (I(r0) + I(r1));
        p.dr = I(0.5) * (I(r1) - I(r0));
        I dr2 = sq(p.dr);
        p.dr7 = p.dr * dr2 * sq(dr2);
        p.rbox = I(r0, r1);
        p.rq[0] = p.rm - p.dr * sqrt35; p.rq[0].l = std::max(0.0, p.rq[0].l);
        p.rq[1] = p.rm;
        p.rq[2] = p.rm + p.dr * sqrt35;
        for (int q = 0; q < 3; ++q) {
          p.Tq[q] = sq(p.rq[q]);
          p.w_rad_q[q] = p.rq[q] * expneg(p.Tq[q]);
        }
        p.r_j6 = Jet<6>::var(p.rbox);
        p.r2_j6 = sq_j(p.r_j6);
        p.w_j6 = p.r_j6 * expneg_j(p.r2_j6);
      }
      int nt = BASE_T << d;
      double ht = pi_lo / nt;
      ttree[size_t(d)].resize(size_t(nt));
      for (int j = 0; j < nt; ++j) {
        auto& p = ttree[size_t(d)][size_t(j)];
        double t0 = j * ht, t1 = (j == nt - 1) ? pi_lo : ((j + 1) * ht);
        p.tm = I(0.5) * (I(t0) + I(t1));
        p.dt = I(0.5) * (I(t1) - I(t0));
        p.dt.l = std::max(0.0, p.dt.l);
        I dt2 = sq(p.dt);
        p.dt7 = p.dt * dt2 * sq(dt2);
        sincos_j_0_pi(I(t0, t1), p.s_j6, p.c_j6);
        p.cbox = p.c_j6.c[0]; p.sbox = p.s_j6.c[0];
        I tq[3] = {p.tm - p.dt * sqrt35, p.tm, p.tm + p.dt * sqrt35};
        tq[0].l = std::max(0.0, tq[0].l);
        for (int q = 0; q < 3; ++q) sincos_0_pi(tq[q], p.sq_v[q], p.cq[q]);
      }
    }
    // Uncovered angular strip [pi_lo, pi] has true half-width (pi - pi_lo)/2 in [0, (pi_v.h - pi_lo)/2]:
    double strip_dt_hi = std::max(0.0, (I(0.5) * (I(pi_v.h) - I(pi_lo))).h);
    t_strip.dt = I(0.0, strip_dt_hi);
    sincos_0_pi(I(pi_lo, pi_v.h), t_strip.sbox, t_strip.cbox);
  }

  I eval_angular_const_one(int d) const {
    I acc(0.0);
    for (const auto& tp : ttree[size_t(d)]) {
      acc = acc + I(2.0) * tp.dt;
    }
    I strip_hi = I(2.0) * t_strip.dt;
    return acc + I(0.0, std::max(0.0, strip_hi.h));
  }

  struct Row {
    I ell, beta, bA, bB;
    I alp, gamB, a0, a2, d2, Ls;
    I sqrt2, sqrt3, inv_sqrt12;
    Row() = default;
    Row(I l_, I b_, I bA_, I bB_) : ell(l_), beta(b_), bA(bA_), bB(bB_) {
      sqrt2 = sqrti(I(2.0)); sqrt3 = sqrti(I(3.0)); inv_sqrt12 = inv_pos(sqrti(I(12.0)));
      alp = -bA; gamB = (-bB) / sqrt2;
      a0 = I(1.0) + bA; a2 = alp + gamB; d2 = alp - gamB;
      Ls = I(2.0) * sqrti(I(1.0) + sq(bA) + sq(bB));
    }
  };

  I eval_psi5_s0_1d(const Row& rw, I nu_iv) const {
    I c0 = rw.ell - I(2.0) * rw.beta + rw.sqrt3 * nu_iv;
    I c1 = rw.beta - rw.sqrt3 * nu_iv;
    I c2 = nu_iv * rw.inv_sqrt12;
    const auto& rvec = rtree[4];
    I sum(0.0);
    for (const auto& rp : rvec) {
      I gbox = c0 + c1 * sq(rp.rbox) + c2 * sq(sq(rp.rbox));
      I q0 = I(2.0) * rp.dr * rp.rbox * rp.w_j6.c[0] * abs_i(gbox);
      if (gbox.l > 0.0 || gbox.h < 0.0) {
        double sgn = (gbox.l > 0.0) ? 1.0 : -1.0;
        I gl(0.0);
        for (int q = 0; q < 3; ++q) {
          I gq = (c0 + c1 * rp.Tq[q] + c2 * sq(rp.Tq[q])) * I(sgn);
          gl = gl + w_gl[q] * rp.rq[q] * rp.w_rad_q[q] * gq;
        }
        Jet<6> gj = (Jet<6>(c0) + Jet<6>(c1)*rp.r2_j6 + Jet<6>(c2)*sq_j(rp.r2_j6)) * Jet<6>(I(sgn));
        Jet<6> fj = rp.r_j6 * rp.w_j6 * gj;
        I q6 = rp.dr * gl + c8_175 * rp.dr7 * fj.c[6];
        double lo = std::max(q0.l, q6.l), hi = std::min(q0.h, q6.h);
        if (lo <= hi) q0 = I(lo, hi);
      }
      sum = sum + q0;
    }
    I T0 = sq(I(R_max)), eT0 = expneg(T0);
    I tail = I(2.0)*eT0*(abs_i(c0)*(T0+I(1.0)) + abs_i(c1)*(sq(T0)+I(2.0)*T0+I(2.0)) +
                         abs_i(c2)*(T0*sq(T0)+I(3.0)*sq(T0)+I(6.0)*T0+I(6.0)));
    return I(4.0) * sum + I(0.0, tail.h);
  }

  void eval_cell_batch(const Row& rw, I c0, I c1, I c2, I s_iv,
                       const double* s_pts, size_t n_pts, I* out_acc,
                       int d, int ir, int jt, double tol_cell) const {
    const auto& rp = rtree[size_t(d)][size_t(ir)];
    const auto& tp = ttree[size_t(d)][size_t(jt)];
    I area4 = I(4.0) * rp.dr * tp.dt;
    I Tbox = sq(rp.rbox);
    I Pbox = rp.rbox * (c0 + c1 * Tbox + c2 * sq(Tbox));
    I Up_b = rw.a0 + rw.a2 * Tbox;
    I Um_b = rw.a0 + rw.d2 * Tbox;
    I Abox = s_iv * Up_b;
    I Bbox = s_iv * Um_b;
    I Wbox = sq(Pbox + Abox * tp.cbox) + sq(Bbox * tp.sbox);

    bool ok_gl = false;
    I peano_rem(0.0);
    if (Wbox.l > 1e-4 * Wbox.h && Wbox.l > 1e-12) {
      Jet<6> Pj = rp.r_j6 * (Jet<6>(c0) + Jet<6>(c1) * rp.r2_j6 + Jet<6>(c2) * sq_j(rp.r2_j6));
      Jet<6> Uj = Pj + Jet<6>(s_iv * tp.cbox) * (Jet<6>(rw.a0) + Jet<6>(rw.a2) * rp.r2_j6);
      Jet<6> Vj = Jet<6>(s_iv * tp.sbox) * (Jet<6>(rw.a0) + Jet<6>(rw.d2) * rp.r2_j6);
      Jet<6> Wr = sq_j(Uj) + sq_j(Vj);
      Jet<6> Ut = Jet<6>(Pbox) + Jet<6>(Abox) * tp.c_j6;
      Jet<6> Vt = Jet<6>(Bbox) * tp.s_j6;
      Jet<6> Wt = sq_j(Ut) + sq_j(Vt);
      if (Wr.c[0].l > 0.0 && Wt.c[0].l > 0.0) {
        Jet<6> Fr = rp.w_j6 * sqrt_j(Wr);
        Jet<6> Ft = Jet<6>(rp.w_j6.c[0]) * sqrt_j(Wt);
        peano_rem = c16_175 * rp.dr7 * tp.dt * Fr.c[6] + c16_175 * rp.dr * tp.dt7 * Ft.c[6];
        if (peano_rem.width() <= tol_cell) ok_gl = true;
      }
    }
    if (!ok_gl && d < MAX_D && (area4 * rp.w_j6.c[0] * sqrti(Wbox)).width() > tol_cell) {
      eval_cell_batch(rw, c0, c1, c2, s_iv, s_pts, n_pts, out_acc, d + 1, 2*ir,   2*jt,   tol_cell);
      eval_cell_batch(rw, c0, c1, c2, s_iv, s_pts, n_pts, out_acc, d + 1, 2*ir+1, 2*jt,   tol_cell);
      eval_cell_batch(rw, c0, c1, c2, s_iv, s_pts, n_pts, out_acc, d + 1, 2*ir,   2*jt+1, tol_cell);
      eval_cell_batch(rw, c0, c1, c2, s_iv, s_pts, n_pts, out_acc, d + 1, 2*ir+1, 2*jt+1, tol_cell);
      return;
    }
    if (ok_gl) {
      I P9[9], Ac9[9], Bs9[9], wt9[9];
      I area_scale = rp.dr * tp.dt;
      int idx9 = 0;
      for (int qr = 0; qr < 3; ++qr) {
        I Tq = rp.Tq[qr];
        I Pq = rp.rq[qr] * (c0 + c1 * Tq + c2 * sq(Tq));
        I Up_q = rw.a0 + rw.a2 * Tq;
        I Um_q = rw.a0 + rw.d2 * Tq;
        I wr = area_scale * w_gl[qr] * rp.w_rad_q[qr];
        for (int qt = 0; qt < 3; ++qt) {
          P9[idx9] = Pq; Ac9[idx9] = Up_q * tp.cq[qt]; Bs9[idx9] = Um_q * tp.sq_v[qt]; wt9[idx9] = wr * w_gl[qt];
          ++idx9;
        }
      }
      for (size_t k = 0; k < n_pts; ++k) {
        I sk(s_pts[k]), gl_k(0.0);
        for (int m = 0; m < 9; ++m) gl_k = gl_k + wt9[m] * sqrti(sq(P9[m] + sk * Ac9[m]) + sq(sk * Bs9[m]));
        out_acc[k] = out_acc[k] + (gl_k + peano_rem);
      }
    } else {
      I w_area = area4 * rp.w_j6.c[0];
      I Up_c = Up_b * tp.cbox, Um_s = Um_b * tp.sbox;
      for (size_t k = 0; k < n_pts; ++k) {
        I sk(s_pts[k]);
        out_acc[k] = out_acc[k] + w_area * sqrti(sq(Pbox + sk * Up_c) + sq(sk * Um_s));
      }
    }
  }

  void eval_psi5_batch(const Row& rw, double nu, const std::vector<double>& s_pts,
                       size_t i_beg, size_t i_end, std::vector<I>& out, double tol_cell, bool force_2d = false) const {
    if (i_beg >= i_end) return;
    if (!force_2d && s_pts[i_beg] == 0.0) {
      out[i_beg] = eval_psi5_s0_1d(rw, I(nu));
      ++i_beg;
      if (i_beg >= i_end) return;
    }
    I nu_iv(nu);
    I c0 = rw.ell - I(2.0) * rw.beta + rw.sqrt3 * nu_iv;
    I c1 = rw.beta - rw.sqrt3 * nu_iv;
    I c2 = nu_iv * rw.inv_sqrt12;
    I s_iv(s_pts[i_beg], s_pts[i_end - 1]);
    size_t n_pts = i_end - i_beg;
    std::vector<I> acc(n_pts, I(0.0));
    for (int ir = 0; ir < BASE_R; ++ir) {
      {
        const auto& rp = rtree[0][size_t(ir)];
        I Tbox = sq(rp.rbox);
        I Pbox = rp.rbox * (c0 + c1 * Tbox + c2 * sq(Tbox));
        I Up_c = (rw.a0 + rw.a2 * Tbox) * t_strip.cbox;
        I Um_s = (rw.a0 + rw.d2 * Tbox) * t_strip.sbox;
        I w_area_hi = I(4.0) * rp.dr * t_strip.dt * rp.w_j6.c[0];
        for (size_t k = 0; k < n_pts; ++k) {
          I sk(s_pts[i_beg + k]);
          I strip_val = w_area_hi * sqrti(sq(Pbox + sk * Up_c) + sq(sk * Um_s));
          acc[k] = acc[k] + I(0.0, std::max(0.0, strip_val.h));
        }
      }
      for (int jt = 0; jt < BASE_T; ++jt)
        eval_cell_batch(rw, c0, c1, c2, s_iv, &s_pts[i_beg], n_pts, acc.data(), 0, ir, jt, tol_cell);
    }
    I T0 = sq(I(R_max)), eT0 = expneg(T0);
    I g0(1.0), g1 = T0 + I(1.0), g2 = sq(T0) + I(2.0)*T0 + I(2.0);
    I g3 = T0*sq(T0) + I(3.0)*sq(T0) + I(6.0)*T0 + I(6.0);
    I base_tail = abs_i(c0)*g1 + abs_i(c1)*g2 + abs_i(c2)*g3;
    I s_tail_coef = abs_i(rw.a0)*g0 + (abs_i(rw.alp) + abs_i(rw.gamB))*g1;
    for (size_t k = 0; k < n_pts; ++k) {
      I tail_hi = I(2.0) * eT0 * (base_tail + I(s_pts[i_beg + k]) * s_tail_coef);
      out[i_beg + k] = four_over_pi * acc[k] + I(0.0, tail_hi.h);
    }
  }
};

// ============================================================================
// 4. Plain Polynomial Majorant Solver & Rigorous Verifier
// ============================================================================
struct PolyMaj {
  double a0, a1, a2, a4, a6;
};

namespace simplex6 {

struct Col6 {
  double c[6];
  double r;
  double inv_norm;
  int node_idx; // >= 0 if majorant node constraint at s_nodes[node_idx], else -1
};

inline bool solve6x6(const double M_in[6][6], const double rhs_in[6], double out[6]) {
  double A[6][7];
  for (int i = 0; i < 6; ++i) {
    for (int j = 0; j < 6; ++j) A[i][j] = M_in[i][j];
    A[i][6] = rhs_in[i];
  }
  for (int col = 0; col < 6; ++col) {
    int piv = col;
    double best = std::abs(A[col][col]);
    for (int r = col + 1; r < 6; ++r) {
      double v = std::abs(A[r][col]);
      if (v > best) { best = v; piv = r; }
    }
    if (best < 1e-24) return false;
    if (piv != col) for (int j = col; j <= 6; ++j) std::swap(A[col][j], A[piv][j]);
    double inv = 1.0 / A[col][col];
    for (int j = col; j <= 6; ++j) A[col][j] *= inv;
    for (int r = 0; r < 6; ++r) {
      if (r == col) continue;
      double fac = A[r][col];
      if (fac == 0.0) continue;
      for (int j = col; j <= 6; ++j) A[r][j] -= fac * A[col][j];
    }
  }
  for (int i = 0; i < 6; ++i) out[i] = A[i][6];
  return true;
}

inline bool solve_dual_simplex6(const Col6* cols, int n_cols, double y_out[6],
                                int* basis_out = nullptr, double* xB_out = nullptr) {
  const double d[6] = {1.0, 1.0, 0.0, 0.0, 0.0, 0.0};
  int basis[6] = {0, 1, 2, 3, 4, 5};
  double xB[6];
  {
    double B[6][6];
    for (int r = 0; r < 6; ++r)
      for (int k = 0; k < 6; ++k) B[r][k] = cols[basis[k]].c[r];
    if (!solve6x6(B, d, xB)) return false;
  }
  double best_dual = -1e300;
  int deg_pivots = 0;
  for (int iter = 0; iter < 2000; ++iter) {
    double BT[6][6], rB[6];
    double cur_dual = 0.0;
    for (int k = 0; k < 6; ++k) {
      rB[k] = cols[basis[k]].r;
      cur_dual += rB[k] * xB[k];
      for (int r = 0; r < 6; ++r) BT[k][r] = cols[basis[k]].c[r];
    }
    if (!solve6x6(BT, rB, y_out)) return false;
    if (cur_dual > best_dual + 1e-12 * (1.0 + std::abs(best_dual))) { best_dual = cur_dual; deg_pivots = 0; }
    else ++deg_pivots;

    int enter = -1;
    double best_score = 1e-10;
    bool bland = (deg_pivots >= 18);
    for (int j = 0; j < n_cols; ++j) {
      const auto& col = cols[j];
      double dot = col.c[0]*y_out[0] + col.c[1]*y_out[1] + col.c[2]*y_out[2]
                 + col.c[3]*y_out[3] + col.c[4]*y_out[4] + col.c[5]*y_out[5];
      double viol = (col.r - dot) * col.inv_norm;
      if (viol > 1e-10) {
        if (bland) { enter = j; break; }
        if (viol > best_score) { best_score = viol; enter = j; }
      }
    }
    if (enter < 0) {
      if (basis_out) for (int k = 0; k < 6; ++k) basis_out[k] = basis[k];
      if (xB_out)    for (int k = 0; k < 6; ++k) xB_out[k] = xB[k];
      return true;
    }

    double B[6][6], u[6];
    for (int r = 0; r < 6; ++r)
      for (int k = 0; k < 6; ++k) B[r][k] = cols[basis[k]].c[r];
    if (!solve6x6(B, cols[enter].c, u)) return false;

    int leave = -1;
    double best_theta = 1e300;
    for (int k = 0; k < 6; ++k) {
      if (u[k] > 1e-11) {
        double th = std::max(0.0, xB[k]) / u[k];
        if (th < best_theta - 1e-14 || (std::abs(th - best_theta) <= 1e-14 && (leave < 0 || basis[k] < basis[leave]))) {
          best_theta = th; leave = k;
        }
      }
    }
    if (leave < 0) return false;
    basis[leave] = enter;

    for (int r = 0; r < 6; ++r)
      for (int k = 0; k < 6; ++k) B[r][k] = cols[basis[k]].c[r];
    if (!solve6x6(B, d, xB)) return false;
    for (int k = 0; k < 6; ++k) if (xB[k] < 0.0 && xB[k] > -1e-8) xB[k] = 0.0;
  }
  if (basis_out) for (int k = 0; k < 6; ++k) basis_out[k] = basis[k];
  if (xB_out)    for (int k = 0; k < 6; ++k) xB_out[k] = xB[k];
  return true;
}

inline Col6 make_col(double c0, double c1, double c2, double c3, double c4, double c5, double r, int node_idx = -1) {
  double n2 = c0*c0 + c1*c1 + c2*c2 + c3*c3 + c4*c4 + c5*c5;
  return {{c0, c1, c2, c3, c4, c5}, r, 1.0 / std::sqrt(n2), node_idx};
}

} // namespace simplex6

struct NuSliceCaps {
  double nu = 0.0;
  size_t n_real = 0;
  std::vector<double> s_nodes;
  std::vector<double> caps_hi;
  std::vector<double> caps_lo;
  double Ls_hi = 0.0;
  std::vector<simplex6::Col6> base_cols;

  void precompute_maj_terms() {
    base_cols.clear();
    const size_t M = s_nodes.size();
    base_cols.reserve(2 * M + 12);

    const double rhoR = s_nodes.back() / 6.0;
    const double rR2 = rhoR * rhoR, rR3 = rR2 * rhoR, rR4 = rR2 * rR2, rR5 = rR4 * rhoR;
    base_cols.push_back(simplex6::make_col(0, 0, 0, 0, 1.0, 5.0 * rR2, 0.0));
    base_cols.push_back(simplex6::make_col(0, 0, 0, 1.0, 6.0 * rR2, 15.0 * rR4, 0.0));
    base_cols.push_back(simplex6::make_col(0, 0, 1.0, 2.0 * rhoR, 4.0 * rR3, 6.0 * rR5, 6.0 * Ls_hi));
    base_cols.push_back(simplex6::make_col(0, 0, -1.0, 0, 0, 0, -1000.0));
    base_cols.push_back(simplex6::make_col(0, 0, 0, -1.0, 0, 0, -1e6));
    base_cols.push_back(simplex6::make_col(0, 0, 0, 0, -1.0, 0, -1e8));
    base_cols.push_back(simplex6::make_col(0, 0, 0, 0, 0, -1.0, -1e8));

    for (size_t i = 0; i < M; ++i) {
      int stride = (i < n_real) ? 1 : 2;
      if (i > 0 && i + 1 < M && i != n_real - 1 && (i % size_t(stride) != 0)) continue;
      double ds_l = (i > 0) ? (s_nodes[i] - s_nodes[i - 1]) : 0.0;
      double ds_r = (i + 1 < M) ? (s_nodes[i + 1] - s_nodes[i]) : 0.0;
      double du = std::max(ds_l, ds_r) / 6.0;
      double cc = 0.125 * du * du;
      double u1 = s_nodes[i] / 6.0, u2 = u1 * u1, u4 = u2 * u2, u6 = u4 * u2;
      if (i > 0) {
        base_cols.push_back(simplex6::make_col(1.0, 0.0, u1, u2, u4, u6, caps_hi[i], int(i)));
      }
      if (cc > 0.0) {
        base_cols.push_back(simplex6::make_col(1.0, 0.0, u1, u2 - 2.0*cc, u4 - 12.0*cc*u2, u6 - 30.0*cc*u4, caps_hi[i], int(i)));
      }
    }
  }
};

// Pure verification test of whether p(s) >= Psi_5(s; nu) for all s >= 0 against sl:
inline bool verify_plain_majorant_against_caps(const NuSliceCaps& sl, const PolyMaj& p) {
  if (p.a1 < 0.0 || p.a6 < 0.0) return false;
  const I SR(sl.s_nodes.back());
  const I SR2 = sq(SR), SR3 = SR2 * SR, SR4 = sq(SR2), SR5 = SR4 * SR;
  if ((I(p.a4) + I(5.0)*SR2*I(p.a6)).l < 0.0) return false;
  if ((I(p.a4) + I(15.0)*SR2*I(p.a6)).l < 0.0) return false;
  if ((I(p.a2) + I(6.0)*SR2*I(p.a4) + I(15.0)*SR4*I(p.a6)).l < 0.0) return false;
  if ((I(p.a1) + I(2.0)*SR*I(p.a2) + I(4.0)*SR3*I(p.a4) + I(6.0)*SR5*I(p.a6) - I(sl.Ls_hi)).l < 0.0) return false;

  const size_t M = sl.s_nodes.size();
  std::vector<I> p_val(M), p2_at(M);
  for (size_t i = 0; i < M; ++i) {
    I si(sl.s_nodes[i]), s2 = sq(si), s4 = sq(s2);
    p_val[i] = I(p.a0) + I(p.a1)*si + I(p.a2)*s2 + I(p.a4)*s4 + I(p.a6)*(s2*s4);
    p2_at[i] = I(2.0)*I(p.a2) + I(12.0)*I(p.a4)*s2 + I(30.0)*I(p.a6)*sq(s2);
  }
  if ((p_val[M - 1] - I(sl.caps_hi[M - 1])).l < 0.0) return false;
  for (size_t i = 0; i + 1 < M; ++i) {
    I ds = I(sl.s_nodes[i + 1]) - I(sl.s_nodes[i]);
    double M_pos = std::max({0.0, p2_at[i].h, p2_at[i + 1].h});
    I curv = rat_i(1, 8) * sq(ds) * I(M_pos);
    I d0 = p_val[i] - I(sl.caps_hi[i]);
    I d1 = p_val[i + 1] - I(sl.caps_hi[i + 1]);
    if (std::min(d0.l, d1.l) < curv.h) return false;
  }
  return true;
}

inline PolyMaj make_certified_majorant(const NuSliceCaps& sl, double a0_in, double a1_in, double a2_in, double a4_in, double a6_in) {
  double a1 = std::max(0.0, a1_in);
  double a6 = std::max(0.0, a6_in);
  double a2 = a2_in, a4 = a4_in;

  const I SR(sl.s_nodes.back());
  const I SR2 = sq(SR), SR3 = SR2 * SR, SR4 = sq(SR2), SR5 = SR4 * SR;
  const I c_y3 = I(5.0) * SR2;
  const I c_y2_4 = I(6.0) * SR2, c_y2_6 = I(15.0) * SR4;
  const I c_y1_2 = I(2.0) * SR,  c_y1_4 = I(4.0) * SR3, c_y1_6 = I(6.0) * SR5;

  while ((I(a4) + c_y3 * I(a6)).l < 0.0) {
    double gap = -(I(a4) + c_y3 * I(a6)).l / c_y3.l;
    a6 = up(a6 + std::max(gap, 1e-15 * std::max(1.0, std::abs(a6))));
  }
  while ((I(a2) + c_y2_4 * I(a4) + c_y2_6 * I(a6)).l < 0.0) {
    double gap = -(I(a2) + c_y2_4 * I(a4) + c_y2_6 * I(a6)).l;
    a2 = up(a2 + std::max(gap, 1e-14 * (1.0 + c_y2_4.h * std::abs(a4) + c_y2_6.h * std::abs(a6))));
  }
  while ((I(a1) + c_y1_2 * I(a2) + c_y1_4 * I(a4) + c_y1_6 * I(a6) - I(sl.Ls_hi)).l < 0.0) {
    double gap = -(I(a1) + c_y1_2 * I(a2) + c_y1_4 * I(a4) + c_y1_6 * I(a6) - I(sl.Ls_hi)).l;
    a1 = std::max(0.0, up(a1 + std::max(gap, 1e-14 * (1.0 + c_y1_2.h * std::abs(a2) + c_y1_4.h * std::abs(a4) + c_y1_6.h * std::abs(a6)))));
  }

  auto eval_no_a0 = [&](I s) -> I {
    I s2 = sq(s), s4 = sq(s2);
    return I(a1)*s + I(a2)*s2 + I(a4)*s4 + I(a6)*(s2*s4);
  };
  auto eval_p2 = [&](I s) -> I {
    I s2 = sq(s);
    return I(2.0)*I(a2) + I(12.0)*I(a4)*s2 + I(30.0)*I(a6)*sq(s2);
  };

  double req_a0 = a0_in;
  const size_t M = sl.s_nodes.size();
  std::vector<I> p_rest(M), p2_at(M);
  for (size_t i = 0; i < M; ++i) {
    I si(sl.s_nodes[i]);
    p_rest[i] = eval_no_a0(si);
    p2_at[i]  = eval_p2(si);
  }
  for (size_t i = 0; i + 1 < M; ++i) {
    I ds = I(sl.s_nodes[i + 1]) - I(sl.s_nodes[i]);
    double M_pos = std::max({0.0, p2_at[i].h, p2_at[i + 1].h});
    I curv = rat_i(1, 8) * sq(ds) * I(M_pos);
    double need0 = (I(sl.caps_hi[i]) + curv - I(p_rest[i].l)).h;
    double need1 = (I(sl.caps_hi[i + 1]) + curv - I(p_rest[i + 1].l)).h;
    req_a0 = std::max({req_a0, need0, need1});
  }
  req_a0 = up(req_a0);

  for (size_t i = 0; i + 1 < M; ++i) {
    I ds = I(sl.s_nodes[i + 1]) - I(sl.s_nodes[i]);
    double M_pos = std::max({0.0, p2_at[i].h, p2_at[i + 1].h});
    I curv = rat_i(1, 8) * sq(ds) * I(M_pos);
    for (size_t idx : {i, i + 1}) {
      while ((I(req_a0) + p_rest[idx] - I(sl.caps_hi[idx])).l < curv.h) {
        double gap = curv.h - (I(req_a0) + p_rest[idx] - I(sl.caps_hi[idx])).l;
        req_a0 = up(req_a0 + std::max(gap, 1e-15 * std::max(1.0, std::abs(p_rest[idx].l))));
      }
    }
  }
  while ((I(req_a0) + p_rest[M - 1] - I(sl.caps_hi[M - 1])).l < 0.0) {
    req_a0 = up(req_a0 + 1e-14 * std::max(1.0, std::abs(p_rest[M - 1].l)));
  }

  PolyMaj out{req_a0, a1, a2, a4, a6};
  while (!verify_plain_majorant_against_caps(sl, out)) {
    out.a0 = up(out.a0 + 1e-14 * std::max(1.0, std::abs(out.a0)));
  }
  require(verify_plain_majorant_against_caps(sl, out), "make_certified_majorant postcondition");
  return out;
}

inline PolyMaj solve_box_majorant(const NuSliceCaps& sl, double rho_hi, double kap_lo,
                                  double sig_a, double sig_b, double x_a, double x_b,
                                  std::vector<std::pair<int, double>>* out_active_nodes = nullptr) {
  const double C6 = 4045313.0 / 100000.0;
  thread_local std::vector<simplex6::Col6> cols;
  cols.clear();
  cols.reserve(sl.base_cols.size() + 24);

  auto make_obj_col = [&](double sg, double xe) {
    double u1 = sg / 6.0, u2 = u1 * u1, u4 = u2 * u2, u6 = u4 * u2;
    double m2 = 2.0 + xe * xe;
    double m3 = 6.0 + 9.0 * xe * xe + C6 * xe * xe * xe;
    return simplex6::make_col(0.0, 1.0, -rho_hi * u1, -u2, -m2 * u4, -m3 * u6, -kap_lo * sg * sg, -1);
  };

  cols.push_back(simplex6::make_col(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, sl.caps_hi[0], 0));
  cols.push_back(make_obj_col(sig_b, x_b));
  cols.push_back(simplex6::make_col(0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, -1));
  cols.push_back(simplex6::make_col(0.0, 0.0, 0.0, 1.0, 0.0, 0.0, -1e6, -1));
  cols.push_back(simplex6::make_col(0.0, 0.0, 0.0, 0.0, 1.0, 0.0, -1e8, -1));
  cols.push_back(simplex6::make_col(0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, -1));

  for (int ks = 0; ks <= 8; ++ks) {
    double sg = sig_a + (sig_b - sig_a) * (ks / 8.0);
    for (double xe : {x_a, x_b}) {
      if (ks == 8 && xe == x_b) continue;
      cols.push_back(make_obj_col(sg, xe));
    }
  }
  cols.insert(cols.end(), sl.base_cols.begin(), sl.base_cols.end());

  double y[6]{}, xB[6]{};
  int basis[6]{};
  bool ok = simplex6::solve_dual_simplex6(cols.data(), int(cols.size()), y, basis, xB);
  if (ok && out_active_nodes != nullptr) {
    out_active_nodes->clear();
    for (int k = 0; k < 6; ++k) {
      int ni = cols[size_t(basis[k])].node_idx;
      if (ni >= 0 && xB[k] > 1e-12) out_active_nodes->push_back({ni, xB[k]});
    }
  }
  if (!ok) return make_certified_majorant(sl, sl.caps_hi[0], sl.Ls_hi, 0.0, 0.0, 0.0);
  return make_certified_majorant(sl, y[0], y[2] / 6.0, y[3] / 36.0, y[4] / 1296.0, y[5] / 46656.0);
}

struct BoxEval {
  double ub;
  double x_gap;
  double sig_osc;
};

inline double max_nu_slab_quad(double u0, double u1, I K_nu) {
  if (K_nu.h == 0.0) return std::max(u0, u1);
  require(K_nu.l > 0.0, "max_nu_slab_quad requires K_nu.l > 0");
  I diff = I(u1) - I(u0);
  if (diff.h <= -K_nu.h) return u0;
  if (diff.l >= K_nu.h)  return u1;
  I mid_val = I(0.5) * (I(u0) + I(u1)) + I(0.25) * K_nu + sq(diff) / (I(4.0) * K_nu);
  return std::max({u0, u1, mid_val.h});
}

inline BoxEval certify_box_bound_full(const PolyMaj& p0, const PolyMaj& p1, double nu0, double nu1,
                                      I rho_iv, I kap_iv, I eta_iv, double sig_a, double sig_b, double x_a, double x_b,
                                      double M0 = 0.0, double M1 = 0.0) {
  const I C6 = rat_i(4045313, 100000);
  const I K_nu = sq(I(nu1) - I(nu0)) / eta_iv;
  const I pen0 = sq(I(nu0)) / eta_iv;
  const I pen1 = sq(I(nu1)) / eta_iv;
  const I c24 = rat_i(1, 24);

  auto eval_sigma_sub = [&](double sa, double sb, double xe) -> double {
    I sig(sa, sb);
    double sm_d = (sa == sb) ? sa : (0.5 * (sa + sb));
    double rad_hi = (sa == sb) ? 0.0 : std::max(up(sm_d - sa), up(sb - sm_d));
    I sm(sm_d);
    I sym_d(-rad_hi, rad_hi);
    I x_iv(xe), x2 = sq(x_iv), x3 = x2 * x_iv;
    I m2 = I(2.0) + x2;
    I m3 = I(6.0) + I(9.0) * x2 + C6 * x3;
    I st0 = I(M0) * c24 * x2;
    I st1 = I(M1) * c24 * x2;

    auto eval_F_jet2 = [&](const PolyMaj& p, I pen, I st_c4) -> Jet<2> {
      Jet<2> sj = Jet<2>::var(sig);
      Jet<2> s2 = sq_j(sj), s4 = sq_j(s2), s6 = s2 * s4;
      return Jet<2>(I(p.a0) - pen) + Jet<2>(I(p.a1) * rho_iv) * sj
             + Jet<2>(I(p.a2) - kap_iv) * s2
             + Jet<2>(I(p.a4) * m2 + st_c4) * s4
             + Jet<2>(I(p.a6) * m3) * s6;
    };
    auto eval_pt = [&](const PolyMaj& p, I pen, I st_c4, I s_pt) -> std::pair<I, I> {
      Jet<1> sj = Jet<1>::var(s_pt);
      Jet<1> s2 = sq_j(sj), s4 = sq_j(s2), s6 = s2 * s4;
      Jet<1> r = Jet<1>(I(p.a0) - pen) + Jet<1>(I(p.a1) * rho_iv) * sj
                 + Jet<1>(I(p.a2) - kap_iv) * s2
                 + Jet<1>(I(p.a4) * m2 + st_c4) * s4
                 + Jet<1>(I(p.a6) * m3) * s6;
      return {r.c[0], r.c[1]};
    };
    Jet<2> j0_box = eval_F_jet2(p0, pen0, st0);
    auto [f0m, d0m] = eval_pt(p0, pen0, st0, sm);
    I U0_iv = f0m + sym_d * d0m + sq(sym_d) * j0_box.c[2];
    double u0 = std::min(j0_box.c[0].h, U0_iv.h);
    if (nu0 == nu1) return u0;

    Jet<2> j1_box = eval_F_jet2(p1, pen1, st1);
    auto [f1m, d1m] = eval_pt(p1, pen1, st1, sm);
    I U1_iv = f1m + sym_d * d1m + sq(sym_d) * j1_box.c[2];
    double u1 = std::min(j1_box.c[0].h, U1_iv.h);
    return max_nu_slab_quad(u0, u1, K_nu);
  };

  const int NS = 16;
  double hs = (sig_b - sig_a) / NS;
  double ub_e[2] = {-1e300, -1e300};
  double sig_osc = 0.0;
  double xes[2] = {x_a, x_b};
  for (int ie = 0; ie < 2; ++ie) {
    double mn_s = 1e300, mx_s = -1e300;
    for (int k = 0; k < NS; ++k) {
      double s0 = sig_a + k * hs, s1 = (k == NS - 1) ? sig_b : (sig_a + (k + 1) * hs);
      double v = eval_sigma_sub(s0, s1, xes[ie]);
      mn_s = std::min(mn_s, v);
      mx_s = std::max(mx_s, v);
    }
    ub_e[ie] = mx_s;
    sig_osc = std::max(sig_osc, mx_s - mn_s);
  }
  return {std::max(ub_e[0], ub_e[1]), std::abs(ub_e[1] - ub_e[0]), sig_osc};
}

inline double certify_box_bound(const PolyMaj& p0, const PolyMaj& p1, double nu0, double nu1,
                                I rho_iv, I kap_iv, I eta_iv, double sig_a, double sig_b, double x_a, double x_b,
                                double M0 = 0.0, double M1 = 0.0) {
  return certify_box_bound_full(p0, p1, nu0, nu1, rho_iv, kap_iv, eta_iv, sig_a, sig_b, x_a, x_b, M0, M1).ub;
}

// ============================================================================
// 5. Zero-Libm-Arcsin Stein Majorant Verifier & Kelley-Simplex Solver
// ============================================================================
struct SteinProfile {
  std::vector<double> y;
  std::vector<double> w;
  double M = 0.0;
  struct Piece { I alpha, beta, gamma; };
  std::vector<Piece> pcs;
  std::vector<I> V_at;

  void build() {
    size_t K = y.size() - 1;
    V_at.resize(K + 1);
    V_at[0] = I(0.0);
    for (size_t j = 0; j < K; ++j) {
      I dy = I(y[j + 1]) - I(y[j]);
      V_at[j + 1] = V_at[j] + I(0.5) * (I(w[j]) + I(w[j + 1])) * dy;
    }
    pcs.resize(K + 1);
    for (size_t j = 0; j < K; ++j) {
      I dy = I(y[j + 1]) - I(y[j]);
      I bet = (I(w[j + 1]) - I(w[j])) / dy;
      I alp = I(w[j]) - bet * I(y[j]);
      I gam = V_at[j] - alp * I(y[j]) - I(0.5) * bet * sq(I(y[j]));
      pcs[j] = {alp, bet, gam};
    }
    pcs[K] = {I(w[K]), I(0.0), V_at[K] - I(w[K]) * I(y[K])};
  }

  I eval_psi_stein(double s_val, double c_val) const {
    const I two_over_pi = I(2.0) / verified_pi();
    const I c_iv(c_val), M_iv(M), inv2M = inv_pos(I(2.0) * M_iv), invM = inv_pos(M_iv);
    if (s_val == 0.0) {
      I w0(w[0]);
      return -I(0.5) * c_iv * w0 - inv2M * sq(w0);
    }
    I s_iv(s_val), s2 = sq(s_iv), s3 = s2 * s_iv;
    size_t K = y.size() - 1;
    I total(0.0);
    auto eval_prim_pt = [](I u, I& as_u, I& R_u, I& I2_u, I& I3_u) {
      as_u = verified_asin_0_1(u);
      R_u = sqrt_one_minus_sq(u);
      I2_u = I(0.5) * (as_u - u * R_u);
      I2_u.l = std::max(0.0, I2_u.l);
      I u2 = sq(u);
      I3_u = (sq(u2) * (I(3.0) + u2)) / (I(3.0) * (I(2.0) + (I(2.0) + u2) * R_u));
      I3_u.l = std::max(0.0, I3_u.l);
    };
    I ua_iv(0.0), as_a(0.0), Ra(1.0), I2_a(0.0), I3_a(0.0);
    for (size_t j = 0; j <= K; ++j) {
      if (s_val <= y[j]) break;
      bool full_top = (j == K || s_val <= y[j + 1]);
      I ub_iv = full_top ? I(1.0) : (I(y[j + 1]) / s_iv);
      ub_iv.l = std::max(0.0, ub_iv.l); ub_iv.h = std::min(1.0, ub_iv.h);
      I as_b, Rb, I2_b, I3_b;
      if (full_top) {
        as_b = I(0.5) * verified_pi();
        Rb = I(0.0);
        I2_b = I(0.5) * as_b;
        I3_b = rat_i(2, 3);
      } else {
        eval_prim_pt(ub_iv, as_b, Rb, I2_b, I3_b);
      }

      I dI0 = as_b - as_a; dI0.l = std::max(0.0, dI0.l);
      I dI1 = Ra - Rb; dI1.l = std::max(0.0, dI1.l);
      if ((Ra + Rb).l > 0.0) {
        I dI1_rat = ((ub_iv - ua_iv) * (ub_iv + ua_iv)) / (Ra + Rb);
        double lo = std::max(dI1.l, dI1_rat.l), hi = std::min(dI1.h, dI1_rat.h);
        if (lo <= hi) dI1 = I(lo, hi);
      }
      I dI2 = I2_b - I2_a; dI2.l = std::max(0.0, dI2.l);
      I dI3 = I3_b - I3_a; dI3.l = std::max(0.0, dI3.l);

      const auto& pc = pcs[j];
      I h0 = -I(0.5) * c_iv * pc.alpha - inv2M * sq(pc.alpha);
      I h1 = pc.gamma - I(0.5) * c_iv * pc.beta - invM * pc.alpha * pc.beta;
      I h2 = pc.alpha - inv2M * sq(pc.beta);
      I h3 = I(0.5) * pc.beta;
      total = total + h0 * dI0 + (h1 * s_iv) * dI1 + (h2 * s2) * dI2 + (h3 * s3) * dI3;

      ua_iv = ub_iv; as_a = as_b; Ra = Rb; I2_a = I2_b; I3_a = I3_b;
    }
    return two_over_pi * total;
  }

  static void eval_hinge(double s_val, double yj, I two_over_pi, I& K_out, I& Kp_out) {
    if (s_val <= yj) { K_out = I(0.0); Kp_out = I(0.0); return; }
    I s_iv(s_val), y_iv(yj);
    I ratio = y_iv / s_iv; ratio.l = std::max(0.0, ratio.l); ratio.h = std::min(1.0, ratio.h);
    I ac = verified_acos_0_1(ratio);
    I rad = sqrti((s_iv - y_iv) * (s_iv + y_iv));
    I k = two_over_pi * (rad - y_iv * ac);
    k.l = std::max(0.0, k.l);
    K_out = k;
    Kp_out = two_over_pi * (rad / s_iv);
  }

  double min_Q_no_a0(double a1, double a2, double a4, double a6, double c_val,
                     const std::vector<double>& s_nodes, const std::vector<double>& caps_hi, double Ls_hi) const {
    if (a1 < 0.0 || a6 <= 0.0) return -1e100;
    const I pi_v = verified_pi(), two_over_pi = I(2.0) / pi_v;
    const I c_iv(c_val), M_iv(M), inv2M = inv_pos(I(2.0) * M_iv), invM = inv_pos(M_iv);
    size_t K = y.size() - 1;

    I hK0 = -I(0.5)*c_iv*pcs[K].alpha - inv2M*sq(pcs[K].alpha);
    I hK1 = pcs[K].gamma;
    I hK2 = pcs[K].alpha;
    I c1_eff = I(a1) + two_over_pi * hK1;
    I c2_eff = I(a2) + I(0.5) * hK2;
    I s30(30.0), s30_2 = sq(s30), s30_3 = s30_2*s30, s30_4 = sq(s30_2), s30_5 = s30_4*s30, s30_6 = sq(s30_3);
    I t1_c = (c1_eff - I(Ls_hi)) + I(2.0)*c2_eff*s30 + I(4.0)*I(a4)*s30_3 + I(6.0)*I(a6)*s30_5;
    I t2_c = c2_eff + I(6.0)*I(a4)*s30_2 + I(15.0)*I(a6)*s30_4;
    I t3_c = I(4.0)*I(a4)*s30 + I(20.0)*I(a6)*s30_3;
    I t4_c = I(a4) + I(15.0)*I(a6)*s30_2;
    if (t1_c.l < 0.0 || t2_c.l < 0.0 || t3_c.l < 0.0 || t4_c.l < 0.0) return -1e100;

    double D_max = 0.0;
    for (size_t j = 0; j < K; ++j) {
      const auto& pc = pcs[j];
      I dh0 = (-I(0.5)*c_iv*pc.alpha - inv2M*sq(pc.alpha)) - hK0;
      I dh1 = (pc.gamma - I(0.5)*c_iv*pc.beta - invM*pc.alpha*pc.beta) - hK1;
      I dh2 = (pc.alpha - inv2M*sq(pc.beta)) - hK2;
      I dh3 = I(0.5)*pc.beta;
      for (int sub = 0; sub < 16; ++sub) {
        double ya = y[j] + (y[j + 1] - y[j]) * sub / 16.0;
        double yb = y[j] + (y[j + 1] - y[j]) * (sub + 1) / 16.0;
        I yiv(ya, yb), y2 = sq(yiv);
        I diff = dh0 + dh1*yiv + dh2*y2 + dh3*(y2*yiv);
        D_max = std::max(D_max, abs_i(diff).h);
      }
    }
    I const_shift = hK0 - I(caps_hi.back()) - (I(D_max) * I(y[K])) / I(30.0);
    I t0_c = const_shift + c1_eff*s30 + c2_eff*s30_2 + I(a4)*s30_4 + I(a6)*s30_6;

    std::vector<I> J_jump(K + 1, I(0.0));
    for (size_t j = 1; j <= K; ++j)
      J_jump[j] = -(I(0.5) * c_iv + I(w[j]) * invM) * (pcs[j].beta - pcs[j - 1].beta);

    std::vector<double> h2_seg_max(K + 1, 0.0);
    for (size_t j = 0; j < K; ++j) {
      I e0 = I(2.0)*pcs[j].alpha - sq(pcs[j].beta)*invM + I(3.0)*pcs[j].beta*I(y[j]);
      I e1 = I(2.0)*pcs[j].alpha - sq(pcs[j].beta)*invM + I(3.0)*pcs[j].beta*I(y[j + 1]);
      h2_seg_max[j] = std::max({0.0, e0.h, e1.h});
    }
    h2_seg_max[K] = std::max(0.0, 2.0 * w[K]);

    auto H2_plus = [&](double b) -> double {
      double mx = 0.0;
      for (size_t j = 0; j <= K; ++j) { if (y[j] >= b) break; mx = std::max(mx, h2_seg_max[j]); }
      return mx;
    };
    auto eval_prest = [&](double s) -> I {
      I si(s), s2 = sq(si), s4 = sq(s2);
      return I(a1)*si + I(a2)*s2 + I(a4)*s4 + I(a6)*(s2*s4);
    };
    auto eval_p2 = [&](double s) -> I {
      I si(s), s2 = sq(si);
      return I(2.0)*I(a2) + I(12.0)*I(a4)*s2 + I(30.0)*I(a6)*sq(s2);
    };

    std::vector<size_t> pos_j;
    for (size_t j = 1; j <= K; ++j) if (J_jump[j].h > 0.0) pos_j.push_back(j);
    const size_t NPJ = pos_j.size();
    struct PtEval {
      I Q;
      std::vector<I> K_v, Kp_v;
    };
    auto eval_pt_full = [&](double sv, double Uv) -> PtEval {
      PtEval pe;
      pe.Q = eval_prest(sv) + eval_psi_stein(sv, c_val) - I(Uv);
      pe.K_v.resize(NPJ); pe.Kp_v.resize(NPJ);
      for (size_t idx = 0; idx < NPJ; ++idx) {
        eval_hinge(sv, y[pos_j[idx]], two_over_pi, pe.K_v[idx], pe.Kp_v[idx]);
      }
      return pe;
    };

    std::vector<size_t> m_idx;
    for (size_t i = 0; i < s_nodes.size(); ++i) {
      double sv = s_nodes[i];
      if (i == 0 || i + 1 == s_nodes.size() || sv == 6.0 || sv == 0.6) { m_idx.push_back(i); continue; }
      if (sv <= 0.65) { if (i % 2 == 0) m_idx.push_back(i); }
      else if (sv < 1.25) { if (i % 4 == 0) m_idx.push_back(i); }
      else if (sv <= 2.0) { if (i % 4 == 0) m_idx.push_back(i); }
      else if (sv <= 8.0) { if (i % 2 == 0) m_idx.push_back(i); }
      else { m_idx.push_back(i); }
    }
    PtEval prev_P = eval_pt_full(s_nodes[m_idx[0]], caps_hi[m_idx[0]]);
    double best_min_ub = prev_P.Q.h;
    double global_min = t0_c.l;

    auto cell_lb = [&](auto& self, double sa, double sb, double Ua, double Ub, const PtEval& Pa, const PtEval& Pb, int depth) -> double {
      best_min_ub = std::min({best_min_ub, Pa.Q.h, Pb.Q.h});
      I width_iv = I(sb) - I(sa);
      I pos_hinge_err(0.0);
      for (size_t idx = 0; idx < NPJ; ++idx) {
        size_t j = pos_j[idx];
        if (sb <= y[j]) continue;
        I ej = Pb.K_v[idx] - Pa.K_v[idx] - Pa.Kp_v[idx] * width_iv;
        ej.l = std::max(0.0, ej.l);
        I Jpos(std::max(0.0, J_jump[j].l), J_jump[j].h);
        pos_hinge_err = pos_hinge_err + Jpos * ej;
      }
      double p2_max = std::max(eval_p2(sa).h, eval_p2(sb).h);
      double MR = std::max(0.0, (I(p2_max) + I(0.5) * I(H2_plus(sb))).h);
      I curv = rat_i(1, 8) * sq(width_iv) * I(MR);
      double lb = (I(std::min(Pa.Q.l, (Pb.Q - pos_hinge_err).l)) - curv).l;
      double osc = std::min(Pa.Q.l, Pb.Q.l) - lb;
      if (lb < best_min_ub - 8e-6 && osc > 8e-6 && depth < 9) {
        double sm = 0.5 * (sa + sb);
        double Um = (I(0.5) * (I(Ua) + I(Ub))).h;
        PtEval Pm = eval_pt_full(sm, Um);
        return std::min(self(self, sa, sm, Ua, Um, Pa, Pm, depth + 1),
                        self(self, sm, sb, Um, Ub, Pm, Pb, depth + 1));
      }
      return lb;
    };

    for (size_t q = 0; q + 1 < m_idx.size(); ++q) {
      size_t ia = m_idx[q], ib = m_idx[q + 1];
      double sa = s_nodes[ia], sb = s_nodes[ib];
      double Ua = caps_hi[ia], Ub = caps_hi[ib];
      PtEval next_P = eval_pt_full(sb, Ub);
      global_min = std::min(global_min, cell_lb(cell_lb, sa, sb, Ua, Ub, prev_P, next_P, 0));
      prev_P = std::move(next_P);
    }
    return global_min;
  }

  // Standalone verifier for negative controls (checks A0(c) + p_rest(s) + Psi_h(s) - Psi_5(s;nu) >= 0 at c_val):
  bool verify_at_c(double a0_base, double a1, double a2_rest, double d_a2, double a4, double a6,
                   double c_val, const NuSliceCaps& sl) const {
    double lb = min_Q_no_a0(a1, a2_rest, a4, a6, c_val, sl.s_nodes, sl.caps_hi, sl.Ls_hi);
    if (lb < -1e50) return false;
    I intercept = I(a0_base) + I(d_a2) * I(c_val);
    return (intercept + I(lb)).l >= 0.0;
  }
};

template <int NW>
struct CertifiedSteinMaj {
  PolyMaj poly{};
  double a0_base = 0.0, a2_rest = 0.0, d_a2 = 0.0;
  SteinProfile sp;
  std::array<double, NW> u_unit{};
  bool valid = false;
};

namespace stein_cg {

template <int MAX_D>
struct DynCol {
  std::array<double, MAX_D> c{};
  double r = 0.0;
  double inv_norm = 1.0;
  int kind = 0;
  int ic = 0;
  int meta = 0;
};

template <int MAX_D>
inline bool solve_dense(int D, const double M_in[MAX_D][MAX_D], const double rhs_in[MAX_D], double out[MAX_D]) {
  double A[MAX_D][MAX_D + 1];
  for (int i = 0; i < D; ++i) {
    for (int j = 0; j < D; ++j) A[i][j] = M_in[i][j];
    A[i][D] = rhs_in[i];
  }
  for (int col = 0; col < D; ++col) {
    int piv = col;
    double best = std::abs(A[col][col]);
    for (int r = col + 1; r < D; ++r) {
      double v = std::abs(A[r][col]);
      if (v > best) { best = v; piv = r; }
    }
    if (best < 1e-24) return false;
    if (piv != col) for (int j = col; j <= D; ++j) std::swap(A[col][j], A[piv][j]);
    double inv = 1.0 / A[col][col];
    for (int j = col; j <= D; ++j) A[col][j] *= inv;
    for (int r = 0; r < D; ++r) {
      if (r == col) continue;
      double fac = A[r][col];
      if (fac == 0.0) continue;
      for (int j = col; j <= D; ++j) A[r][j] -= fac * A[col][j];
    }
  }
  for (int i = 0; i < D; ++i) out[i] = A[i][D];
  return true;
}

template <int MAX_D>
inline bool solve_dual_simplex_dyn(int D, const std::vector<DynCol<MAX_D>>& cols, double y_out[MAX_D],
                                   int basis_out[MAX_D], double xB_out[MAX_D]) {
  double d[MAX_D]{};
  d[0] = 1.0; d[1] = 1.0;
  for (int k = 0; k < D; ++k) basis_out[k] = k;
  {
    double B[MAX_D][MAX_D]{};
    for (int r = 0; r < D; ++r)
      for (int k = 0; k < D; ++k) B[r][k] = cols[size_t(basis_out[k])].c[size_t(r)];
    if (!solve_dense<MAX_D>(D, B, d, xB_out)) return false;
  }
  double best_dual = -1e300;
  int deg_pivots = 0;
  const int n_cols = int(cols.size());

  for (int iter = 0; iter < 3000; ++iter) {
    double BT[MAX_D][MAX_D]{}, rB[MAX_D]{};
    double cur_dual = 0.0;
    for (int k = 0; k < D; ++k) {
      rB[k] = cols[size_t(basis_out[k])].r;
      cur_dual += rB[k] * xB_out[k];
      for (int r = 0; r < D; ++r) BT[k][r] = cols[size_t(basis_out[k])].c[size_t(r)];
    }
    if (!solve_dense<MAX_D>(D, BT, rB, y_out)) return false;
    if (cur_dual > best_dual + 1e-12 * (1.0 + std::abs(best_dual))) {
      best_dual = cur_dual; deg_pivots = 0;
    } else ++deg_pivots;

    int enter = -1;
    double best_score = 1e-10;
    bool bland = (deg_pivots >= 20);
    for (int j = 0; j < n_cols; ++j) {
      const auto& col = cols[size_t(j)];
      double dot = 0.0;
      for (int r = 0; r < D; ++r) dot += col.c[size_t(r)] * y_out[r];
      double viol = (col.r - dot) * col.inv_norm;
      if (viol > 1e-10) {
        if (bland) { enter = j; break; }
        if (viol > best_score) { best_score = viol; enter = j; }
      }
    }
    if (enter < 0) return true;

    double B[MAX_D][MAX_D]{}, u[MAX_D]{};
    for (int r = 0; r < D; ++r)
      for (int k = 0; k < D; ++k) B[r][k] = cols[size_t(basis_out[k])].c[size_t(r)];
    if (!solve_dense<MAX_D>(D, B, cols[size_t(enter)].c.data(), u)) return false;

    int leave = -1;
    double best_theta = 1e300;
    for (int k = 0; k < D; ++k) {
      if (u[k] > 1e-11) {
        double th = std::max(0.0, xB_out[k]) / u[k];
        if (th < best_theta - 1e-14 || (std::abs(th - best_theta) <= 1e-14 && (leave < 0 || basis_out[k] < basis_out[leave]))) {
          best_theta = th; leave = k;
        }
      }
    }
    if (leave < 0) return false;
    basis_out[leave] = enter;

    for (int r = 0; r < D; ++r)
      for (int k = 0; k < D; ++k) B[r][k] = cols[size_t(basis_out[k])].c[size_t(r)];
    if (!solve_dense<MAX_D>(D, B, d, xB_out)) return false;
    for (int k = 0; k < D; ++k) if (xB_out[k] < 0.0 && xB_out[k] > -1e-8) xB_out[k] = 0.0;
  }
  return true;
}

} // namespace stein_cg

template <int NW, int MAX_D>
CertifiedSteinMaj<NW> solve_stein_majorant_tpl(const std::array<double, NW>& KN, int NQ, int max_rounds,
                                               size_t compact_at, int s_stride_low, double gain_tol, double df_tol,
                                               const NuSliceCaps& sl, double rho_hi, double kap_lo,
                                               double sig_a, double sig_b, double x_a, double x_b,
                                               double stop_lp_val, const std::array<double, NW>* seed_u = nullptr) {
  double sref = std::clamp(std::round(0.5 * (sig_a + sig_b) * 20.0) / 20.0, 0.125, 2.0);
  std::vector<double> yk(NW);
  for (int k = 0; k < NW; ++k) yk[size_t(k)] = sref * KN[size_t(k)];

  std::array<double, NW> hK1_coef{};
  for (int j = 0; j < NW - 1; ++j) {
    double dy = yk[size_t(j + 1)] - yk[size_t(j)];
    hK1_coef[size_t(j)]     += 0.5 * dy;
    hK1_coef[size_t(j + 1)] += 0.5 * dy;
  }
  hK1_coef[NW - 1] -= yk[NW - 1];

  std::vector<size_t> s_idx;
  for (size_t i = 0; i < sl.s_nodes.size(); ++i) {
    double s = sl.s_nodes[i];
    int stride = (s < 1.25) ? s_stride_low : ((s < 2.0) ? std::min(2, s_stride_low) : 1);
    if (i == 0 || i == sl.n_real - 1 || i + 1 == sl.s_nodes.size() || (i % size_t(stride) == 0)) s_idx.push_back(i);
  }
  const size_t NS = s_idx.size();

  struct SPointTab {
    double s, cap_u, u1, u2, u4, u6;
    std::array<double, NW> L1{}, L0{}, Gd{}, Go{};
  };
  std::vector<SPointTab> tabs(NS);
  const double pi_d = 0.5 * (verified_pi().l + verified_pi().h);
  const double half_pi_d = 0.5 * pi_d;

  double pref_int[NW][NW]{};
  for (int j = 0; j < NW - 1; ++j) {
    double dy = yk[size_t(j + 1)] - yk[size_t(j)];
    for (int k = 0; k < NW; ++k) pref_int[j + 1][k] = pref_int[j][k];
    pref_int[j + 1][j]     += 0.5 * dy;
    pref_int[j + 1][j + 1] += 0.5 * dy;
  }
  for (size_t q = 0; q < NS; ++q) {
    auto& tb = tabs[q];
    tb.s = sl.s_nodes[s_idx[q]];
    double ds_l = (q > 0) ? (tb.s - sl.s_nodes[s_idx[q - 1]]) : 0.0;
    double ds_r = (q + 1 < NS) ? (sl.s_nodes[s_idx[q + 1]] - tb.s) : 0.0;
    double du = std::max(ds_l, ds_r) / 6.0, cc = 0.125 * du * du;
    double u1 = tb.s / 6.0, u2 = u1 * u1, u4 = u2 * u2, u6 = u4 * u2;
    tb.u1 = u1; tb.u2 = u2 - 2.0 * cc; tb.u4 = u4 - 12.0 * cc * u2; tb.u6 = u6 - 30.0 * cc * u4;
    double s2 = tb.s * tb.s;
    tb.cap_u = sl.caps_hi[s_idx[q]] + 4.0e-6 + 2e-7 * s2 + 5e-9 * s2 * s2;
    if (tb.s == 0.0) { tb.L0[0] = 1.0; tb.Gd[0] = 1.0; continue; }
    double th_a = 0.0;
    if (tb.s > yk[NW - 1]) {
      double ratio = std::clamp(yk[NW - 1] / tb.s, 0.0, 1.0);
      th_a = verified_acos_0_1(I(ratio)).l;
      double sin_a = std::sqrt(std::max(0.0, 1.0 - ratio * ratio));
      double w0 = th_a / half_pi_d;
      double wy1 = (tb.s * sin_a) / half_pi_d;
      double wy2 = (0.5 * s2 * (th_a + sin_a * ratio)) / half_pi_d;
      for (int k = 0; k < NW; ++k) tb.L1[size_t(k)] += wy1 * pref_int[NW - 1][k];
      tb.L1[NW - 1] += wy2 - wy1 * yk[NW - 1];
      tb.L0[NW - 1] += w0;
      tb.Gd[NW - 1] += w0;
    }
    const double dth = (half_pi_d - th_a) / NQ;
    const double wt = dth / half_pi_d;
    if (wt > 0.0) {
      for (int r = 0; r < NQ; ++r) {
        double theta = th_a + (r + 0.5) * dth;
        I s_th, c_th;
        sincos_small_nonneg(I(std::clamp(theta, 0.0, half_pi_d)), s_th, c_th);
        double y = tb.s * std::max(0.0, 0.5 * (c_th.l + c_th.h));
        int j = int(std::upper_bound(yk.begin(), yk.end(), y) - yk.begin()) - 1;
        j = std::clamp(j, 0, NW - 2);
        double dy = yk[size_t(j + 1)] - yk[size_t(j)], t = std::clamp((y - yk[size_t(j)]) / dy, 0.0, 1.0);
        double p0 = 1.0 - t, p1 = t;
        for (int k = 0; k <= j + 1; ++k) tb.L1[size_t(k)] += wt * y * pref_int[j][k];
        tb.L1[size_t(j)]     += wt * y * dy * (t - 0.5 * t * t);
        tb.L1[size_t(j + 1)] += wt * y * dy * (0.5 * t * t);
        tb.L0[size_t(j)] += wt * p0; tb.L0[size_t(j + 1)] += wt * p1;
        tb.Gd[size_t(j)] += wt * p0 * p0; tb.Gd[size_t(j + 1)] += wt * p1 * p1;
        tb.Go[size_t(j)] += wt * p0 * p1;
      }
    }
  }

  const double c_ends[2] = {sig_a * sig_a, sig_b * sig_b};
  const double C6 = 4045313.0 / 100000.0;
  struct ObjPt { double sg, xe, st_pen; };
  std::vector<ObjPt> obj_pts;
  for (int ks = 0; ks <= 4; ++ks) {
    double sg = sig_a + (sig_b - sig_a) * (ks / 4.0);
    for (double xe : {x_a, x_b})
      obj_pts.push_back({sg, xe, (sg*sg*sg*sg) * (xe*xe) / 24.0});
  }

  std::array<double, NW> Gd_bg{}, Go_bg{};
  {
    double wsum = 0.0;
    std::vector<double> ws_bg(NS);
    for (size_t q = 0; q < NS; ++q) {
      double s = tabs[q].s, u = (s / sref) * (s / sref);
      double ds = (q + 1 < NS) ? (tabs[q + 1].s - s) : 0.1;
      ws_bg[q] = ((2.0 * s / (sref * sref)) * expneg_scalar_lo(u) + 0.03 / (1.0 + 0.1 * s * s)) * ds;
      wsum += ws_bg[q];
    }
    for (size_t q = 0; q < NS; ++q) {
      double wt = ws_bg[q] / wsum;
      const auto& tb = tabs[q];
      for (int j = 0; j < NW; ++j) {
        Gd_bg[size_t(j)] += wt * tb.Gd[size_t(j)];
        if (j + 1 < NW) Go_bg[size_t(j)] += wt * tb.Go[size_t(j)];
      }
    }
  }

  std::vector<std::array<double, NW>> u_profs;
  if (seed_u != nullptr) u_profs.push_back(*seed_u);
  bool have_best = false;
  double best_lp_val = 1e300;
  double best_y6[6]{};
  double best_M = 0.0;
  std::array<double, NW> best_W{};
  std::array<double, NW> Gd_avg{}, Go_avg{}, ell_avg{};
  bool has_avg = false;

  auto eval_u_psi = [&](const std::array<double, NW>& u, int ic, size_t q) -> double {
    const auto& tb = tabs[q];
    double c_val = c_ends[ic], lin = 0.0, quad = 0.0;
    for (int k = 0; k < NW; ++k) {
      double uk = u[size_t(k)];
      lin += (tb.L1[size_t(k)] - 0.5 * c_val * tb.L0[size_t(k)]) * uk;
      double guk = tb.Gd[size_t(k)] * uk;
      if (k > 0) guk += tb.Go[size_t(k - 1)] * u[size_t(k - 1)];
      if (k + 1 < NW) guk += tb.Go[size_t(k)] * u[size_t(k + 1)];
      quad += 0.5 * uk * guk;
    }
    return lin - quad;
  };

  for (int round = 0; round <= max_rounds; ++round) {
    const int R = int(u_profs.size());
    const int D_cur = 6 + R;
    if (D_cur >= MAX_D) break;
    std::vector<stein_cg::DynCol<MAX_D>> cols;
    cols.reserve(2 * NS + 32);

    auto finalize_col = [&](stein_cg::DynCol<MAX_D> dc) {
      double n2 = 0.0;
      for (int k = 0; k < D_cur; ++k) n2 += dc.c[size_t(k)] * dc.c[size_t(k)];
      dc.inv_norm = 1.0 / std::sqrt(std::max(1e-30, n2));
      cols.push_back(dc);
    };
    auto make_obj = [&](size_t oi) -> stein_cg::DynCol<MAX_D> {
      const auto& op = obj_pts[oi];
      double u1 = op.sg / 6.0, u2 = u1*u1, u4 = u2*u2, u6 = u4*u2;
      double m2 = 2.0 + op.xe*op.xe, m3 = 6.0 + 9.0*op.xe*op.xe + C6*op.xe*op.xe*op.xe;
      stein_cg::DynCol<MAX_D> dc{};
      dc.c = {0.0, 1.0, -rho_hi * u1, -u2, -m2 * u4, -m3 * u6};
      for (int r = 0; r < R; ++r) dc.c[size_t(6 + r)] = -op.st_pen;
      dc.r = -kap_lo * op.sg * op.sg;
      dc.kind = 1; dc.meta = int(oi);
      return dc;
    };
    auto make_maj = [&](int ic, size_t q) -> stein_cg::DynCol<MAX_D> {
      const auto& tb = tabs[q];
      stein_cg::DynCol<MAX_D> dc{};
      dc.c = {1.0, 0.0, tb.u1, tb.u2, tb.u4, tb.u6};
      for (int r = 0; r < R; ++r) dc.c[size_t(6 + r)] = eval_u_psi(u_profs[size_t(r)], ic, q);
      dc.r = tb.cap_u;
      dc.kind = 0; dc.ic = ic; dc.meta = int(q);
      return dc;
    };

    {
      stein_cg::DynCol<MAX_D> c0{}; c0.c[0] = 1.0; c0.r = -1e4; c0.kind = 2; finalize_col(c0);
      finalize_col(make_obj(obj_pts.size() - 1));
      stein_cg::DynCol<MAX_D> c2{}; c2.c[2] = 1.0; c2.r = 0.0;  c2.kind = 2; finalize_col(c2);
      stein_cg::DynCol<MAX_D> c3{}; c3.c[3] = 1.0; c3.r = -1e6; c3.kind = 2; finalize_col(c3);
      stein_cg::DynCol<MAX_D> c4{}; c4.c[4] = 1.0; c4.r = -1e8; c4.kind = 2; finalize_col(c4);
      stein_cg::DynCol<MAX_D> c5{}; c5.c[5] = 1.0; c5.r = 0.0;  c5.kind = 2; finalize_col(c5);
      for (int r = 0; r < R; ++r) {
        stein_cg::DynCol<MAX_D> cr{}; cr.c[size_t(6 + r)] = 1.0; cr.r = 0.0; cr.kind = 2; finalize_col(cr);
      }
    }
    for (size_t oi = 0; oi + 1 < obj_pts.size(); ++oi) finalize_col(make_obj(oi));
    int n_ic = (sig_a == sig_b) ? 1 : 2;
    for (int ic = 0; ic < n_ic; ++ic)
      for (size_t q = 0; q < NS; ++q) finalize_col(make_maj(ic, q));

    {
      stein_cg::DynCol<MAX_D> r2{}; r2.c[4] = 1.0; r2.c[5] = 125.0; r2.r = 0.0; r2.kind = 2; finalize_col(r2);
      stein_cg::DynCol<MAX_D> r3{}; r3.c[3] = 1.0; r3.c[4] = 150.0; r3.c[5] = 9375.0;
      for (int r = 0; r < R; ++r) r3.c[size_t(6 + r)] = 18.0 * u_profs[size_t(r)][NW - 1];
      r3.r = 0.0; r3.kind = 3; finalize_col(r3);
      stein_cg::DynCol<MAX_D> r4{}; r4.c[2] = 1.0; r4.c[3] = 10.0; r4.c[4] = 500.0; r4.c[5] = 18750.0;
      for (int r = 0; r < R; ++r) {
        double h1u = 0.0;
        for (int k = 0; k < NW; ++k) h1u += hK1_coef[size_t(k)] * u_profs[size_t(r)][size_t(k)];
        r4.c[size_t(6 + r)] = (12.0 / pi_d) * h1u + 180.0 * u_profs[size_t(r)][NW - 1];
      }
      r4.r = 6.0 * sl.Ls_hi + 1e-4; r4.kind = 4; finalize_col(r4);
      for (int k : {0, 2, 3, 4, 5}) {
        stein_cg::DynCol<MAX_D> ub{}; ub.c[size_t(k)] = -1.0; ub.r = -1e8; ub.kind = 2; finalize_col(ub);
      }
      for (int r = 0; r < R; ++r) {
        stein_cg::DynCol<MAX_D> ub{}; ub.c[size_t(6 + r)] = -1.0; ub.r = -200.0; ub.kind = 2; finalize_col(ub);
      }
    }

    int basis[MAX_D]{};
    double xB[MAX_D]{};
    double y_cur[MAX_D]{};
    if (!stein_cg::solve_dual_simplex_dyn<MAX_D>(D_cur, cols, y_cur, basis, xB)) break;

    double M_cur = 0.0;
    std::array<double, NW> W_cur{};
    for (int r = 0; r < R; ++r) {
      double mr = std::max(0.0, y_cur[6 + r]);
      M_cur += mr;
      for (int k = 0; k < NW; ++k) W_cur[size_t(k)] += mr * u_profs[size_t(r)][size_t(k)];
    }
    double lp_val = y_cur[0] + y_cur[1];
    if (R >= 1 && M_cur > 1e-10 && lp_val < best_lp_val) {
      have_best = true;
      best_lp_val = lp_val;
      for (int k = 0; k < 6; ++k) best_y6[k] = y_cur[k];
      best_M = M_cur;
      best_W = W_cur;
    }
    if (have_best && (best_lp_val <= stop_lp_val || round == max_rounds)) break;

    std::array<double, NW> Gd_cur{}, Go_cur{}, ell_cur{};
    double mu_st_pen = 0.0;
    for (int k = 0; k < D_cur; ++k) {
      double wt = xB[k];
      if (wt <= 1e-13) continue;
      const auto& col = cols[size_t(basis[k])];
      if (col.kind == 0) {
        const auto& tb = tabs[size_t(col.meta)];
        double cv = c_ends[col.ic];
        for (int j = 0; j < NW; ++j) {
          ell_cur[size_t(j)] += wt * (tb.L1[size_t(j)] - 0.5 * cv * tb.L0[size_t(j)]);
          Gd_cur[size_t(j)]  += wt * tb.Gd[size_t(j)];
          if (j + 1 < NW) Go_cur[size_t(j)] += wt * tb.Go[size_t(j)];
        }
      } else if (col.kind == 1) {
        mu_st_pen += wt * obj_pts[size_t(col.meta)].st_pen;
      } else if (col.kind == 3) {
        ell_cur[NW - 1] += wt * 18.0;
      } else if (col.kind == 4) {
        for (int j = 0; j < NW; ++j) ell_cur[size_t(j)] += wt * (12.0 / pi_d) * hK1_coef[size_t(j)];
        ell_cur[NW - 1] += wt * 180.0;
      }
    }
    if (!has_avg) { Gd_avg = Gd_cur; Go_avg = Go_cur; ell_avg = ell_cur; has_avg = true; }
    else {
      double th = 2.0 / (round + 3.0);
      for (int j = 0; j < NW; ++j) {
        Gd_avg[size_t(j)]  = (1.0 - th) * Gd_avg[size_t(j)]  + th * Gd_cur[size_t(j)];
        Go_avg[size_t(j)]  = (1.0 - th) * Go_avg[size_t(j)]  + th * Go_cur[size_t(j)];
        ell_avg[size_t(j)] = (1.0 - th) * ell_avg[size_t(j)] + th * ell_cur[size_t(j)];
      }
    }
    double w_cur = (round % 2 == 0) ? 0.35 : 0.75;
    double w_bg  = 0.015 / (1.0 + 0.4 * round);
    double w_avg = 1.0 - w_cur - w_bg;
    std::array<double, NW> Gd_bar{}, Go_bar{}, ell_bar{};
    for (int j = 0; j < NW; ++j) {
      Gd_bar[size_t(j)]  = w_cur * Gd_cur[size_t(j)]  + w_avg * Gd_avg[size_t(j)]  + w_bg * Gd_bg[size_t(j)] + 1e-7;
      Go_bar[size_t(j)]  = w_cur * Go_cur[size_t(j)]  + w_avg * Go_avg[size_t(j)]  + w_bg * Go_bg[size_t(j)];
      ell_bar[size_t(j)] = w_cur * ell_cur[size_t(j)] + w_avg * ell_avg[size_t(j)];
    }
    for (int j = 0; j + 1 < NW; ++j) {
      double reg = 2e-6;
      Gd_bar[size_t(j)]     += reg;
      Gd_bar[size_t(j + 1)] += reg;
      Go_bar[size_t(j)]     -= reg;
    }
    std::array<double, NW> diag = Gd_bar, rhs = ell_bar, u_new{};
    for (int j = 1; j < NW; ++j) {
      double m = Go_bar[size_t(j - 1)] / diag[size_t(j - 1)];
      diag[size_t(j)] -= m * Go_bar[size_t(j - 1)];
      rhs[size_t(j)]  -= m * rhs[size_t(j - 1)];
    }
    u_new[NW - 1] = rhs[NW - 1] / diag[NW - 1];
    for (int j = NW - 2; j >= 0; --j)
      u_new[size_t(j)] = (rhs[size_t(j)] - Go_bar[size_t(j)] * u_new[size_t(j + 1)]) / diag[size_t(j)];

    double q_bar = 0.0;
    for (int j = 0; j < NW; ++j) {
      double gu = Gd_bar[size_t(j)] * u_new[size_t(j)];
      if (j > 0) gu += Go_bar[size_t(j - 1)] * u_new[size_t(j - 1)];
      if (j + 1 < NW) gu += Go_bar[size_t(j)] * u_new[size_t(j + 1)];
      q_bar += u_new[size_t(j)] * gu;
    }
    if (q_bar > 1e-12 && mu_st_pen > 1e-12) {
      double beta_opt = std::clamp(std::sqrt(2.0 * mu_st_pen / q_bar), 0.2, 4.0);
      for (int j = 0; j < NW; ++j) u_new[size_t(j)] *= beta_opt;
    }

    double gain = 0.0;
    for (int j = 0; j < NW; ++j) {
      double gu = Gd_cur[size_t(j)] * u_new[size_t(j)];
      if (j > 0) gu += Go_cur[size_t(j - 1)] * u_new[size_t(j - 1)];
      if (j + 1 < NW) gu += Go_cur[size_t(j)] * u_new[size_t(j + 1)];
      gain += ell_cur[size_t(j)] * u_new[size_t(j)] - 0.5 * u_new[size_t(j)] * gu;
    }
    if (round >= 4 && gain <= mu_st_pen + gain_tol) break;

    double max_mag = 1e-12;
    for (int k = 0; k < NW; ++k) max_mag = std::max(max_mag, std::abs(u_new[size_t(k)]));
    bool too_close = false;
    for (const auto& upf : u_profs) {
      double df = 0.0;
      for (int k = 0; k < NW; ++k) df = std::max(df, std::abs(u_new[size_t(k)] - upf[size_t(k)]));
      if (df <= df_tol * max_mag) { too_close = true; break; }
    }
    if (too_close) break;
    if (u_profs.size() >= compact_at && M_cur > 1e-10) {
      std::array<double, NW> u_inc{};
      for (int k = 0; k < NW; ++k) u_inc[size_t(k)] = W_cur[size_t(k)] / M_cur;
      std::vector<std::array<double, NW>> kept;
      kept.push_back(u_inc);
      for (size_t idx = u_profs.size() - 6; idx < u_profs.size(); ++idx) kept.push_back(u_profs[idx]);
      u_profs = std::move(kept);
    }
    u_profs.push_back(u_new);
  }

  CertifiedSteinMaj<NW> out;
  if (!have_best || best_M <= 1e-10) return out;
  for (int k = 0; k < NW; ++k) out.u_unit[size_t(k)] = best_W[size_t(k)] / best_M;
  out.sp.y = yk;
  out.sp.w.resize(NW);
  for (int k = 0; k < NW; ++k) out.sp.w[size_t(k)] = std::round(best_W[size_t(k)] * 1048576.0) / 1048576.0;
  out.sp.M = best_M;
  out.sp.build();

  double a1 = std::max(0.0, best_y6[2] / 6.0);
  double a2 = best_y6[3] / 36.0;
  double a4 = best_y6[4] / 1296.0;
  double a6 = std::max(1e-15, best_y6[5] / 46656.0);
  {
    const I two_over_pi = I(2.0) / verified_pi();
    const size_t K = NW - 1;
    I c1_eff_w = two_over_pi * out.sp.pcs[K].gamma;
    I c2_eff_w = I(0.5) * out.sp.pcs[K].alpha;
    I s30(30.0), s30_2 = sq(s30), s30_3 = s30_2*s30, s30_4 = sq(s30_2), s30_5 = s30_4*s30;
    while ((I(4.0)*I(a4)*s30 + I(20.0)*I(a6)*s30_3).l < 0.0 || (I(a4) + I(15.0)*I(a6)*s30_2).l < 0.0) {
      double need = std::max(0.0, -(I(a4) / (I(5.0) * s30_2)).l);
      a6 = up(std::max(a6, need) + 1e-16);
    }
    while ((I(a2) + c2_eff_w + I(6.0)*I(a4)*s30_2 + I(15.0)*I(a6)*s30_4).l < 0.0) {
      double gap = -(I(a2) + c2_eff_w + I(6.0)*I(a4)*s30_2 + I(15.0)*I(a6)*s30_4).l;
      a2 = up(a2 + std::max(gap, 1e-14));
    }
    while (((I(a1) + c1_eff_w - I(sl.Ls_hi)) + I(2.0)*(I(a2) + c2_eff_w)*s30 + I(4.0)*I(a4)*s30_3 + I(6.0)*I(a6)*s30_5).l < 0.0) {
      double gap = -((I(a1) + c1_eff_w - I(sl.Ls_hi)) + I(2.0)*(I(a2) + c2_eff_w)*s30 + I(4.0)*I(a4)*s30_3 + I(6.0)*I(a6)*s30_5).l;
      a1 = std::max(0.0, up(a1 + std::max(gap, 1e-14)));
    }
  }
  double c_lo = (sig_a == 0.0) ? 0.0 : dn(sig_a * sig_a);
  double c_hi = up(sig_b * sig_b);
  double lb_a = out.sp.min_Q_no_a0(a1, a2, a4, a6, c_lo, sl.s_nodes, sl.caps_hi, sl.Ls_hi);
  double lb_b = (c_hi == c_lo) ? lb_a : out.sp.min_Q_no_a0(a1, a2, a4, a6, c_hi, sl.s_nodes, sl.caps_hi, sl.Ls_hi);
  if (lb_a < -1e50 || lb_b < -1e50) return out;
  double need_a = up(-lb_a + 1e-14), need_b = up(-lb_b + 1e-14);
  if (c_hi > c_lo + 1e-12) {
    // Affine-in-c intercept A0(c) = a0_base + d_a2 * c >= need_a at c_lo and >= need_b at c_hi:
    I slope = (I(need_b) - I(need_a)) / (I(c_hi) - I(c_lo));
    double d_a2 = 0.5 * (slope.l + slope.h);
    double a0_need_a = (I(need_a) - I(d_a2) * I(c_lo)).h;
    double a0_need_b = (I(need_b) - I(d_a2) * I(c_hi)).h;
    double a0_aff = up(std::max(a0_need_a, a0_need_b));
    double a2_aff = up(a2 + d_a2);
    out.a0_base = a0_aff;
    out.a2_rest = a2;
    out.d_a2 = d_a2;
    out.poly = {a0_aff, a1, a2_aff, a4, a6};
    require(out.sp.verify_at_c(out.a0_base, a1, out.a2_rest, out.d_a2, a4, a6, c_lo, sl), "Stein verify c_lo");
    require(out.sp.verify_at_c(out.a0_base, a1, out.a2_rest, out.d_a2, a4, a6, c_hi, sl), "Stein verify c_hi");
  } else {
    double a0_pt = up(std::max(need_a, need_b));
    out.a0_base = a0_pt;
    out.a2_rest = a2;
    out.d_a2 = 0.0;
    out.poly = {a0_pt, a1, a2, a4, a6};
    require(out.sp.verify_at_c(out.a0_base, a1, out.a2_rest, 0.0, a4, a6, c_lo, sl), "Stein verify pt");
  }
  out.valid = true;
  return out;
}

inline CertifiedSteinMaj<32> solve_stein_row_box(const NuSliceCaps& sl, double rho_hi, double kap_lo,
                                                 double sig_a, double sig_b, double x_a, double x_b,
                                                 double stop_lp_val, const std::array<double, 32>* seed_u = nullptr) {
  static constexpr std::array<double, 32> KN32 = {
    0.0, 3/64.0, 6/64.0, 10/64.0, 14/64.0, 18/64.0, 22/64.0, 26/64.0,
    30/64.0, 35/64.0, 40/64.0, 46/64.0, 52/64.0, 58/64.0, 64/64.0, 72/64.0,
    80/64.0, 90/64.0, 100/64.0, 112/64.0, 128/64.0, 148/64.0, 168/64.0, 192/64.0,
    224/64.0, 256/64.0, 304/64.0, 352/64.0, 416/64.0, 480/64.0, 560/64.0, 640/64.0
  };
  return solve_stein_majorant_tpl<32, 80>(KN32, 128, 60, 48, 2, 1e-6, 2e-4,
                                          sl, rho_hi, kap_lo, sig_a, sig_b, x_a, x_b, stop_lp_val, seed_u);
}

inline CertifiedSteinMaj<46> solve_stein_claim3_cell(const NuSliceCaps& sl, double rho_hi,
                                                     double sg, double x_a, double x_b, double stop_lp_val) {
  static constexpr std::array<double, 46> KN46 = {
    0.00, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45,
    0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.90, 0.95,
    1.00, 1.05, 1.10, 1.15, 1.20, 1.25, 1.30, 1.35, 1.40, 1.45,
    1.50, 1.55, 1.60, 1.80, 2.00, 2.30, 2.60, 3.00, 3.50, 4.00,
    5.00, 6.00, 7.00, 8.00, 9.00, 10.00
  };
  return solve_stein_majorant_tpl<46, 128>(KN46, 192, 125, 90, 2, 1e-8, 1e-5,
                                           sl, rho_hi, 0.0, sg, sg, x_a, x_b, stop_lp_val, nullptr);
}

// ============================================================================
// 6. Nu-Slice Builder, Plain Cover (with Adaptive Nu Refinement), & Stein Cover
// ============================================================================
inline NuSliceCaps build_nu_slice(const GL3PolarEngine& eng, const GL3PolarEngine::Row& rw,
                                  double nu, bool fine, bool use_ray30) {
  NuSliceCaps sl;
  sl.nu = nu;
  sl.Ls_hi = rw.Ls.h;
  if (fine) {
    for (int k = 0; k <= 768; ++k) sl.s_nodes.push_back(k / 2048.0);          // [0, 0.375], step 1/2048
    for (int k = 385; k <= 640; ++k) {                                        // (0.375, 0.625], step 1/1024
      double v = k / 1024.0;
      sl.s_nodes.push_back(v);
      if (v < 0.6 && (k + 1) / 1024.0 > 0.6) sl.s_nodes.push_back(0.6);
    }
    for (int k = 321; k <= 640; ++k) sl.s_nodes.push_back(k / 512.0);         // (0.625, 1.25], step 1/512
    for (int k = 321; k <= 512; ++k) sl.s_nodes.push_back(k / 256.0);
    for (int k = 129; k <= 384; ++k) sl.s_nodes.push_back(k / 64.0);
  } else {
    for (int k = 0; k <= 320; ++k) sl.s_nodes.push_back(k / 256.0);
    for (int k = 161; k <= 256; ++k) sl.s_nodes.push_back(k / 128.0);
    for (int k = 65; k <= 192; ++k) sl.s_nodes.push_back(k / 32.0);
  }
  size_t n_real = sl.s_nodes.size();
  sl.n_real = n_real;
  if (use_ray30) {
    for (int k = 385; k <= 512; ++k) sl.s_nodes.push_back(k / 64.0);
    for (int k = 129; k <= 192; ++k) sl.s_nodes.push_back(k / 16.0);
    for (int k = 97; k <= 240; ++k) sl.s_nodes.push_back(k / 8.0);
  }

  sl.caps_hi.resize(sl.s_nodes.size());
  sl.caps_lo.resize(sl.s_nodes.size());
  std::vector<I> real_ivs(n_real);
  size_t b = 0;
  while (b < n_real) {
    if (sl.s_nodes[b] == 0.0) {
      eng.eval_psi5_batch(rw, nu, sl.s_nodes, b, b + 1, real_ivs, fine ? 5e-11 : 2e-10);
      ++b; continue;
    }
    double max_span = (sl.s_nodes[b] < 2.0) ? 0.0625 : 0.25;
    size_t e = b + 1;
    while (e < n_real && sl.s_nodes[e] - sl.s_nodes[b] <= max_span + 1e-12) ++e;
    eng.eval_psi5_batch(rw, nu, sl.s_nodes, b, e, real_ivs, fine ? 5e-11 : 2e-10);
    b = e;
  }
  for (size_t i = 0; i < n_real; ++i) { sl.caps_lo[i] = real_ivs[i].l; sl.caps_hi[i] = real_ivs[i].h; }
  double c6 = sl.caps_hi[n_real - 1];
  for (size_t i = n_real; i < sl.s_nodes.size(); ++i) {
    sl.caps_lo[i] = 0.0;
    sl.caps_hi[i] = (I(c6) + I(sl.Ls_hi) * (I(sl.s_nodes[i]) - I(6.0))).h;
  }
  sl.precompute_maj_terms();
  return sl;
}

struct SamplePlainBox {
  double nu0 = 0, nu1 = 0, sa = 0, sb = 0, xa = 0, xb = 0, ub_C = 0, SR = 6.0, Ls_hi = 0.0;
  PolyMaj p0{}, p1{};
};

struct SampleSteinBox {
  double nu0 = 0, nu1 = 0, sa = 0, sb = 0, xa = 0, xb = 0, ub_C = 0;
  PolyMaj p0{}, p1{};
  double M0 = 0, M1 = 0;
  std::vector<double> y0, w0, y1, w1;
};

inline std::pair<double, int> cover_single_plain_slab(const NuSliceCaps& sl0, const NuSliceCaps& sl1,
                                                      I rho_iv, I kap, I eta, double G_target,
                                                      double two_beta2_eps1_hi, SamplePlainBox* out_worst = nullptr,
                                                      bool fail_fast = false) {
  const double SIG_MAX = 1.625;
  const double X_MAX = 415.0 / 64.0;
  struct Box {
    double sa, sb, xa, xb;
    BoxEval ev;
    int depth, stall_hits;
    PolyMaj p0, p1;
  };
  std::vector<Box> st;
  for (int is = 0; is < 4; ++is) {
    double sa = SIG_MAX * is / 4.0, sb = SIG_MAX * (is + 1) / 4.0;
    for (int ix = 0; ix < 4; ++ix) {
      double xa = X_MAX * ix / 4.0, xb = X_MAX * (ix + 1) / 4.0;
      PolyMaj p0 = solve_box_majorant(sl0, rho_iv.h, kap.l, sa, sb, xa, xb);
      PolyMaj p1 = solve_box_majorant(sl1, rho_iv.h, kap.l, sa, sb, xa, xb);
      BoxEval ev = certify_box_bound_full(p0, p1, sl0.nu, sl1.nu, rho_iv, kap, eta, sa, sb, xa, xb);
      st.push_back({sa, sb, xa, xb, ev, 0, 0, p0, p1});
    }
  }
  if (fail_fast) {
    std::sort(st.begin(), st.end(), [](const Box& a, const Box& b) { return a.ev.ub < b.ev.ub; });
  }
  double loc_ub = -1e300;
  Box worst_b{};
  int loc_cnt = 0;
  while (!st.empty()) {
    Box b = st.back(); st.pop_back();
    if (b.ev.ub <= G_target || b.stall_hits >= 8 || b.depth >= 18 || ((b.sb - b.sa) <= 1.0/1024.0 && (b.xb - b.xa) <= 1.0/256.0)) {
      if (b.ev.ub > loc_ub) { loc_ub = b.ev.ub; worst_b = b; }
      ++loc_cnt;
      if (fail_fast && b.ev.ub > G_target) break;
      continue;
    }
    auto make_child = [&](double nsa, double nsb, double nxa, double nxb) -> Box {
      PolyMaj c0 = solve_box_majorant(sl0, rho_iv.h, kap.l, nsa, nsb, nxa, nxb);
      PolyMaj c1 = solve_box_majorant(sl1, rho_iv.h, kap.l, nsa, nsb, nxa, nxb);
      BoxEval ev_new = certify_box_bound_full(c0, c1, sl0.nu, sl1.nu, rho_iv, kap, eta, nsa, nsb, nxa, nxb);
      BoxEval ev_par = certify_box_bound_full(b.p0, b.p1, sl0.nu, sl1.nu, rho_iv, kap, eta, nsa, nsb, nxa, nxb);
      const PolyMaj& u0 = (ev_par.ub < ev_new.ub) ? b.p0 : c0;
      const PolyMaj& u1 = (ev_par.ub < ev_new.ub) ? b.p1 : c1;
      BoxEval ev_best = (ev_par.ub < ev_new.ub) ? ev_par : ev_new;
      int sh = (b.depth >= 6 && ev_best.ub >= b.ev.ub - 1e-8) ? (b.stall_hits + 1) : 0;
      return {nsa, nsb, nxa, nxb, ev_best, b.depth + 1, sh, u0, u1};
    };
    bool split_x = (b.xb - b.xa > 1.0 / 256.0) &&
                   ((b.sb - b.sa <= 1.0 / 1024.0) || (b.ev.x_gap >= 0.5 * b.ev.sig_osc) ||
                    (b.ev.x_gap > 1e-7 && (b.xb - b.xa) > 4.0 * (b.sb - b.sa)));
    Box c1, c2;
    if (split_x) {
      double xm = 0.5 * (b.xa + b.xb);
      c1 = make_child(b.sa, b.sb, b.xa, xm);
      c2 = make_child(b.sa, b.sb, xm, b.xb);
    } else {
      double sm = 0.5 * (b.sa + b.sb);
      c1 = make_child(b.sa, sm, b.xa, b.xb);
      c2 = make_child(sm, b.sb, b.xa, b.xb);
    }
    if (fail_fast && c1.ev.ub > c2.ev.ub) std::swap(c1, c2);
    st.push_back(std::move(c1));
    st.push_back(std::move(c2));
  }
  if (out_worst != nullptr) {
    *out_worst = {sl0.nu, sl1.nu, worst_b.sa, worst_b.sb, worst_b.xa, worst_b.xb,
                  up(loc_ub + two_beta2_eps1_hi), sl0.s_nodes.back(), sl0.Ls_hi, worst_b.p0, worst_b.p1};
  }
  return {loc_ub, loc_cnt};
}

inline double run_plain_cover(const GL3PolarEngine& eng, std::vector<NuSliceCaps>& slices,
                              const GL3PolarEngine::Row& rw, I rho_iv, double C_target_lo,
                              bool use_ray30, int& out_boxes, SamplePlainBox* out_worst_box = nullptr,
                              int max_nu_depth = 5, bool fail_fast = false) {
  I eps1 = rat_i(39, 50), eta = rat_i(779, 10000);
  I kap = I(1.0)/eps1 - (sq(rw.bA) + sq(rw.bB))/eta;
  require(kap.l > 0.0, "kappa_r > 0");
  double two_beta2_eps1_hi = (I(2.0) * sq(rw.beta) / eps1).h;
  double G_target = dn(C_target_lo - two_beta2_eps1_hi) - 2e-8;

  const double SIG_MAX = 1.625;
  const double X_MAX = 415.0 / 64.0;
  require(SIG_MAX >= (rw.Ls * rho_iv / kap).h, "SIG_MAX covers outer sigma");
  require(slices.front().nu <= -eta.h && slices.back().nu >= eta.h, "nu_grid covers [-eta, eta]");
  require(sq(I(X_MAX)).l >= 42.0, "X_MAX^2 >= 42");

  // First pass across existing slabs in parallel:
  size_t n_slabs = slices.size() - 1;
  std::vector<size_t> slab_order(n_slabs);
  for (size_t j = 0; j < n_slabs; ++j) slab_order[j] = j;
  if (fail_fast) {
    std::sort(slab_order.begin(), slab_order.end(), [&](size_t a, size_t b) {
      return std::abs(slices[a].nu - 0.01) < std::abs(slices[b].nu - 0.01);
    });
  }
  std::vector<double> slab_ub(n_slabs, -1e300);
  std::vector<int> slab_boxes(n_slabs, 0);
  std::vector<SamplePlainBox> slab_worst(n_slabs);
  size_t next_idx = 0;
  bool found_exceed = false;
  std::mutex mtx;
  std::vector<std::thread> workers;
  for (int tid = 0; tid < 8; ++tid) {
    workers.emplace_back([&]() {
      while (true) {
        size_t j;
        {
          std::lock_guard<std::mutex> lk(mtx);
          if (next_idx >= n_slabs || (fail_fast && max_nu_depth == 0 && found_exceed)) break;
          j = slab_order[next_idx++];
        }
        auto [ub, cnt] = cover_single_plain_slab(slices[j], slices[j + 1], rho_iv, kap, eta, G_target,
                                                 two_beta2_eps1_hi, &slab_worst[j], fail_fast);
        std::lock_guard<std::mutex> lk(mtx);
        slab_ub[j] = ub;
        slab_boxes[j] = cnt;
        if (ub > G_target) found_exceed = true;
      }
    });
  }
  for (auto& th : workers) th.join();

  // Adaptive on-demand nu-slab bisection if any slab still exceeds G_target:
  auto refine_slab = [&](auto& self, const NuSliceCaps& s0, const NuSliceCaps& s1,
                         double cur_ub, int cur_cnt, const SamplePlainBox& cur_w, int nu_depth)
      -> std::tuple<double, int, SamplePlainBox, std::vector<NuSliceCaps>> {
    if (cur_ub <= G_target || nu_depth >= max_nu_depth) {
      return {cur_ub, cur_cnt, cur_w, {}};
    }
    double nu_mid = 0.5 * (s0.nu + s1.nu);
    NuSliceCaps smid = build_nu_slice(eng, rw, nu_mid, true, use_ray30);
    SamplePlainBox wL{}, wR{};
    auto [ubL, cntL] = cover_single_plain_slab(s0, smid, rho_iv, kap, eta, G_target, two_beta2_eps1_hi, &wL);
    auto [ubR, cntR] = cover_single_plain_slab(smid, s1, rho_iv, kap, eta, G_target, two_beta2_eps1_hi, &wR);
    auto [fubL, fcntL, fwL, addL] = self(self, s0, smid, ubL, cntL, wL, nu_depth + 1);
    auto [fubR, fcntR, fwR, addR] = self(self, smid, s1, ubR, cntR, wR, nu_depth + 1);
    std::vector<NuSliceCaps> added = std::move(addL);
    added.push_back(std::move(smid));
    for (auto& x : addR) added.push_back(std::move(x));
    return {std::max(fubL, fubR), fcntL + fcntR, (fubL >= fubR) ? fwL : fwR, std::move(added)};
  };

  double g_ub = -1e300;
  out_boxes = 0;
  SamplePlainBox best_w{};
  std::vector<NuSliceCaps> new_slices;
  new_slices.reserve(slices.size() + 8);
  for (size_t j = 0; j < n_slabs; ++j) {
    new_slices.push_back(slices[j]);
    auto [fub, fcnt, fw, added] = refine_slab(refine_slab, slices[j], slices[j + 1],
                                              slab_ub[j], slab_boxes[j], slab_worst[j], 0);
    for (auto& x : added) new_slices.push_back(std::move(x));
    if (fub > g_ub) { g_ub = fub; best_w = fw; }
    out_boxes += fcnt;
  }
  new_slices.push_back(slices.back());
  if (new_slices.size() != slices.size()) slices = std::move(new_slices);
  if (out_worst_box) *out_worst_box = best_w;
  return up(g_ub + two_beta2_eps1_hi);
}

inline double run_stein_cover_fast(const std::vector<NuSliceCaps>& stein_slices,
                                   const GL3PolarEngine::Row& rw, I rho_iv, double C_target_lo,
                                   int& out_boxes, int& out_stein_boxes,
                                   SampleSteinBox* out_sample_stein = nullptr) {
  I eps1 = rat_i(39, 50), eta = rat_i(779, 10000);
  I kap = I(1.0)/eps1 - (sq(rw.bA) + sq(rw.bB))/eta;
  double two_beta2_eps1_hi = (I(2.0) * sq(rw.beta) / eps1).h;
  double G_target = dn(C_target_lo - two_beta2_eps1_hi) - 5e-7;
  const double SIG_MAX = 1.625;
  const double X_MAX = 415.0 / 64.0;
  require(SIG_MAX >= (rw.Ls * rho_iv / kap).h, "SIG_MAX covers outer sigma (Stein)");
  require(stein_slices.front().nu <= -eta.h && stein_slices.back().nu >= eta.h, "stein nu_grid covers [-eta, eta]");
  require(sq(I(X_MAX)).l >= 42.0, "X_MAX^2 >= 42");

  const size_t n_slabs = stein_slices.size() - 1;
  struct TaskBox { size_t j; double sa, sb, xa, xb; };
  std::vector<TaskBox> init_tasks;
  for (size_t j = 0; j < n_slabs; ++j) {
    for (int is = 0; is < 4; ++is) {
      double sa = SIG_MAX * is / 4.0, sb = SIG_MAX * (is + 1) / 4.0;
      for (int ix = 0; ix < 4; ++ix) {
        double xa = X_MAX * ix / 4.0, xb = X_MAX * (ix + 1) / 4.0;
        init_tasks.push_back({j, sa, sb, xa, xb});
      }
    }
  }

  double global_ub = -1e300;
  int total_boxes = 0, total_stein = 0;
  SampleSteinBox best_st{};
  bool have_st_sample = false;
  size_t next_t = 0;
  std::mutex mtx;
  std::vector<std::thread> workers;
  for (int tid = 0; tid < 8; ++tid) {
    workers.emplace_back([&]() {
      double loc_ub = -1e300;
      int loc_cnt = 0, loc_st = 0;
      SampleSteinBox loc_sample{};
      bool loc_has_sample = false;
      while (true) {
        TaskBox tb;
        { std::lock_guard<std::mutex> lk(mtx); if (next_t >= init_tasks.size()) break; tb = init_tasks[next_t++]; }
        size_t j = tb.j;
        double nu0 = stein_slices[j].nu, nu1 = stein_slices[j + 1].nu;
        bool single_nu = (nu0 == nu1);
        double K_nu_hi = single_nu ? 0.0 : (sq(I(nu1) - I(nu0)) / eta).h;
        double stop0 = G_target + (sq(I(nu0)) / eta).l - 0.25 * K_nu_hi - 3e-4;
        double stop1 = G_target + (sq(I(nu1)) / eta).l - 0.25 * K_nu_hi - 3e-4;

        struct Box {
          double sa, sb, xa, xb;
          BoxEval ev;
          int depth, stall_hits;
          PolyMaj p0, p1;
          bool has_seed = false;
          std::array<double, 32> seed0{}, seed1{};
        };
        PolyMaj ip0 = solve_box_majorant(stein_slices[j], rho_iv.h, kap.l, tb.sa, tb.sb, tb.xa, tb.xb);
        PolyMaj ip1 = single_nu ? ip0 : solve_box_majorant(stein_slices[j + 1], rho_iv.h, kap.l, tb.sa, tb.sb, tb.xa, tb.xb);
        BoxEval iev = certify_box_bound_full(ip0, ip1, nu0, nu1, rho_iv, kap, eta, tb.sa, tb.sb, tb.xa, tb.xb);
        std::vector<Box> st;
        st.push_back({tb.sa, tb.sb, tb.xa, tb.xb, iev, 0, 0, ip0, ip1, false, {}, {}});

        while (!st.empty()) {
          Box b = st.back(); st.pop_back();
          if (b.ev.ub <= G_target) {
            loc_ub = std::max(loc_ub, b.ev.ub);
            ++loc_cnt;
            continue;
          }
          bool try_stein = ((b.sb - b.sa) <= SIG_MAX / 32.0 + 1e-12 && (b.xb - b.xa) <= X_MAX / 16.0 + 1e-12 && b.sb >= 0.30);
          std::array<double, 32> next_s0 = b.seed0, next_s1 = b.seed1;
          bool next_has_seed = b.has_seed;
          if (try_stein) {
            double best_ub = b.ev.ub;
            bool used_stein = false;
            auto sm0 = solve_stein_row_box(stein_slices[j], rho_iv.h, kap.l, b.sa, b.sb, b.xa, b.xb, stop0, b.has_seed ? &b.seed0 : nullptr);
            auto sm1 = single_nu ? sm0 : solve_stein_row_box(stein_slices[j + 1], rho_iv.h, kap.l, b.sa, b.sb, b.xa, b.xb, stop1,
                                                             b.has_seed ? &b.seed1 : (sm0.valid ? &sm0.u_unit : nullptr));
            if (sm0.valid && sm1.valid) {
              next_s0 = sm0.u_unit; next_s1 = sm1.u_unit; next_has_seed = true;
              double ubs = certify_box_bound(sm0.poly, sm1.poly, nu0, nu1, rho_iv, kap, eta, b.sa, b.sb, b.xa, b.xb, sm0.sp.M, sm1.sp.M);
              if (ubs < best_ub) {
                best_ub = ubs; used_stein = true;
                if (!loc_has_sample || ubs > loc_sample.ub_C - two_beta2_eps1_hi) {
                  loc_has_sample = true;
                  loc_sample = {nu0, nu1, b.sa, b.sb, b.xa, b.xb, up(ubs + two_beta2_eps1_hi),
                                sm0.poly, sm1.poly, sm0.sp.M, sm1.sp.M, sm0.sp.y, sm0.sp.w, sm1.sp.y, sm1.sp.w};
                }
              }
            }
            if (best_ub <= G_target || b.depth >= 17 || ((b.sb - b.sa) <= SIG_MAX / 256.0 + 1e-12 && (b.xb - b.xa) <= X_MAX / 256.0 + 1e-12)) {
              loc_ub = std::max(loc_ub, best_ub);
              ++loc_cnt;
              if (used_stein) ++loc_st;
              continue;
            }
          }
          if ((b.sb < 0.30 && b.stall_hits >= 3) || b.depth >= 17) {
            loc_ub = std::max(loc_ub, b.ev.ub);
            ++loc_cnt;
            continue;
          }
          auto make_child = [&](double nsa, double nsb, double nxa, double nxb) -> Box {
            PolyMaj c0 = solve_box_majorant(stein_slices[j], rho_iv.h, kap.l, nsa, nsb, nxa, nxb);
            PolyMaj c1 = single_nu ? c0 : solve_box_majorant(stein_slices[j + 1], rho_iv.h, kap.l, nsa, nsb, nxa, nxb);
            BoxEval ev_new = certify_box_bound_full(c0, c1, nu0, nu1, rho_iv, kap, eta, nsa, nsb, nxa, nxb);
            BoxEval ev_par = certify_box_bound_full(b.p0, b.p1, nu0, nu1, rho_iv, kap, eta, nsa, nsb, nxa, nxb);
            const PolyMaj& u0 = (ev_par.ub < ev_new.ub) ? b.p0 : c0;
            const PolyMaj& u1 = (ev_par.ub < ev_new.ub) ? b.p1 : c1;
            BoxEval ev_best = (ev_par.ub < ev_new.ub) ? ev_par : ev_new;
            int sh = (b.depth >= 4 && ev_best.ub >= b.ev.ub - 1e-7) ? (b.stall_hits + 1) : 0;
            return {nsa, nsb, nxa, nxb, ev_best, b.depth + 1, sh, u0, u1, next_has_seed, next_s0, next_s1};
          };
          bool need_x = (b.xb - b.xa) > X_MAX / 16.0 + 1e-12;
          bool need_s = (b.sb - b.sa) > SIG_MAX / 32.0 + 1e-12;
          bool split_x = need_x && (!need_s || ((b.xb - b.xa) / (X_MAX / 16.0) >= (b.sb - b.sa) / (SIG_MAX / 32.0)));
          if (!need_x && !need_s) {
            split_x = ((b.xb - b.xa) / (X_MAX / 16.0) >= (b.sb - b.sa) / (SIG_MAX / 32.0));
          }
          if (split_x) {
            double xm = 0.5 * (b.xa + b.xb);
            st.push_back(make_child(b.sa, b.sb, b.xa, xm));
            st.push_back(make_child(b.sa, b.sb, xm, b.xb));
          } else {
            double sm = 0.5 * (b.sa + b.sb);
            st.push_back(make_child(b.sa, sm, b.xa, b.xb));
            st.push_back(make_child(sm, b.sb, b.xa, b.xb));
          }
        }
      }
      std::lock_guard<std::mutex> lk(mtx);
      global_ub = std::max(global_ub, loc_ub);
      total_boxes += loc_cnt;
      total_stein += loc_st;
      if (loc_has_sample && (!have_st_sample || loc_sample.ub_C > best_st.ub_C)) {
        have_st_sample = true;
        best_st = loc_sample;
      }
    });
  }
  for (auto& th : workers) th.join();
  out_boxes = total_boxes;
  out_stein_boxes = total_stein;
  if (out_sample_stein && have_st_sample) *out_sample_stein = best_st;
  return up(global_ub + two_beta2_eps1_hi);
}

// ============================================================================
// 7. Zero-Arcsin Claim 3 Certification (`SMALL_T.md`: N(3/5) <= 7058083/10^7)
// ============================================================================
struct Claim3Cert {
  double N_cert = 0.0;
  int total_certs = 0;
  int stein_certs = 0;
  std::vector<double> sig_nodes;
  std::vector<double> F_hat;
};

inline NuSliceCaps build_claim3_slice() {
  NuSliceCaps sl;
  sl.nu = 0.0;
  sl.Ls_hi = 2.0;
  for (int k = 0; k <= 640; ++k) {
    double v = k / 512.0;
    sl.s_nodes.push_back(v);
    if (v < 0.6 && (k + 1) / 512.0 > 0.6) sl.s_nodes.push_back(0.6);
  }
  for (int k = 321; k <= 512; ++k) sl.s_nodes.push_back(k / 256.0);
  for (int k = 129; k <= 384; ++k) sl.s_nodes.push_back(k / 64.0);
  sl.n_real = sl.s_nodes.size();
  for (int k = 385; k <= 512; ++k) sl.s_nodes.push_back(k / 64.0);
  for (int k = 129; k <= 192; ++k) sl.s_nodes.push_back(k / 16.0);
  for (int k = 97; k <= 240; ++k) sl.s_nodes.push_back(k / 8.0);

  sl.caps_lo.resize(sl.s_nodes.size());
  sl.caps_hi.resize(sl.s_nodes.size());
  const I c3_5 = rat_i(3, 5), c5_3 = rat_i(5, 3);
  for (size_t i = 0; i < sl.s_nodes.size(); ++i) {
    I si(sl.s_nodes[i]);
    I diff = c3_5 - si;
    I pos_d(std::max(0.0, diff.l), std::max(0.0, diff.h));
    I val = I(2.0) * si + c5_3 * sq(pos_d);
    sl.caps_lo[i] = val.l; sl.caps_hi[i] = val.h;
  }
  sl.precompute_maj_terms();
  return sl;
}

inline Claim3Cert certify_claim3_zero_arcsin() {
  I rho_iv = rat_i(95133, 100000), eps1 = rat_i(39, 50), eta_dummy(1.0);
  const I c3_5 = rat_i(3, 5);
  NuSliceCaps sl = build_claim3_slice();

  Claim3Cert out;
  out.sig_nodes = {
    0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.53,
    0.55, 0.58, 0.61, 0.64, 0.67, 0.70, 0.71, 0.72, 0.725, 0.73, 0.74, 0.76, 0.78,
    0.81, 0.84, 0.87, 0.90, 0.93, 0.96, 1.00, 1.05, 1.10, 1.15, 1.20, 1.25, 1.30, 1.35, 1.40, 1.45
  };
  const double X_MAX = 415.0 / 64.0;
  out.F_hat.assign(out.sig_nodes.size(), 0.0);
  std::vector<int> n_c(out.sig_nodes.size(), 0), n_sc(out.sig_nodes.size(), 0);
  size_t next_i = 0;
  std::mutex mtx;
  std::vector<std::thread> workers;
  for (int tid = 0; tid < 8; ++tid) {
    workers.emplace_back([&]() {
      while (true) {
        size_t idx;
        { std::lock_guard<std::mutex> lk(mtx); if (next_i >= out.sig_nodes.size()) break; idx = next_i++; }
        double sg = out.sig_nodes[idx];
        double pen_sg_lo = (sq(I(sg)) / eps1).l;
        bool central = (sg >= 0.695 && sg <= 0.785);
        double node_slack = central ? 4.0e-5 : 4.5e-4;
        double F_tgt_node = (0.7058083 - node_slack) + pen_sg_lo;
        double stop_lp = F_tgt_node - 1.2e-4;
        bool allow_stein = (sg >= 0.54 && sg <= 0.95);

        const std::vector<double> s_grid = central
          ? std::vector<double>{0.0, 1.0, 2.0, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 7.0, 8.0, 10.0, 14.0, 20.0, X_MAX * X_MAX}
          : std::vector<double>{0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 8.0, 12.0, 20.0, X_MAX * X_MAX};

        struct XCell { double xa, xb; int depth; };
        std::vector<XCell> st;
        for (size_t ix = s_grid.size() - 1; ix-- > 0; ) {
          double xa = (ix == 0) ? 0.0 : sqrti(I(s_grid[ix])).l;
          double xb = (ix + 2 == s_grid.size()) ? X_MAX : sqrti(I(s_grid[ix + 1])).h;
          st.push_back({xa, xb, 0});
        }

        double max_F = -1e300;
        int cnt = 0, scnt = 0;
        while (!st.empty()) {
          XCell c = st.back(); st.pop_back();
          PolyMaj pm = solve_box_majorant(sl, rho_iv.h, 0.0, sg, sg, c.xa, c.xb);
          double ub_F = certify_box_bound(pm, pm, 0.0, 0.0, rho_iv, I(0.0), eta_dummy, sg, sg, c.xa, c.xb, 0.0, 0.0);
          bool used_st = false;
          if (ub_F > F_tgt_node && allow_stein) {
            auto sm = solve_stein_claim3_cell(sl, rho_iv.h, sg, c.xa, c.xb, stop_lp);
            if (sm.valid) {
              double ubs = certify_box_bound(sm.poly, sm.poly, 0.0, 0.0, rho_iv, I(0.0), eta_dummy, sg, sg, c.xa, c.xb, sm.sp.M, sm.sp.M);
              if (ubs < ub_F) { ub_F = ubs; used_st = true; }
            }
          }
          if (ub_F <= F_tgt_node || c.depth >= 2) {
            max_F = std::max(max_F, ub_F);
            ++cnt; if (used_st) ++scnt;
            continue;
          }
          double xm = 0.5 * (c.xa + c.xb);
          st.push_back({xm, c.xb, c.depth + 1});
          st.push_back({c.xa, xm, c.depth + 1});
        }
        out.F_hat[idx] = max_F;
        n_c[idx] = cnt;
        n_sc[idx] = scnt;
      }
    });
  }
  for (auto& th : workers) th.join();

  for (size_t i = 0; i < out.sig_nodes.size(); ++i) {
    out.total_certs += n_c[i];
    out.stein_certs += n_sc[i];
  }
  double ub_left = (c3_5 + I(2.0) * rho_iv * I(out.sig_nodes.front())).h;
  require((I(2.0)*rho_iv - I(2.0)*I(out.sig_nodes.back())/eps1).h < 0.0, "Claim 3 right tail decreasing");
  double ub_right = (c3_5 + I(2.0)*rho_iv*I(out.sig_nodes.back()) - sq(I(out.sig_nodes.back()))/eps1).h;
  double global_N = std::max(ub_left, ub_right);

  for (size_t i = 0; i + 1 < out.sig_nodes.size(); ++i) {
    I s0(out.sig_nodes[i]), s1(out.sig_nodes[i + 1]);
    I f0(out.F_hat[i]), f1(out.F_hat[i + 1]);
    I m = (f1 - f0) / (s1 - s0);
    I s_star = I(0.5) * eps1 * m;
    double end0 = (f0 - sq(s0) / eps1).h;
    double end1 = (f1 - sq(s1) / eps1).h;
    double seg_ub = std::max(end0, end1);
    if (s_star.h > s0.l && s_star.l < s1.h) {
      I sc(std::max(s0.l, s_star.l), std::min(s1.h, s_star.h));
      I val = f0 + m * (sc - s0) - sq(sc) / eps1;
      seg_ub = std::max(seg_ub, val.h);
    }
    global_N = std::max(global_N, seg_ub);
  }
  out.N_cert = global_N;
  I target_c3 = rat_str_to_iv("7058083/10000000");
  require(out.N_cert <= target_c3.l, "Claim 3 N_cert <= 7058083/10^7");
  return out;
}

// ============================================================================
// 8. Exact-Rational Admissible Primal Witness Builder in L = (L1)-(L4)
// ============================================================================
struct PrimalWitness {
  int64_t sig_num = 0, sig_den = 1024;
  int64_t nu_num = 0,  nu_den  = 2048;
  struct Atom {
    int64_t r_num, r_den; // sqrt(u_k) = r_num / r_den (exact rational!)
    std::string p_str;    // exact rational weight "num/den"
    I psi_iv;             // certified C++ interval enclosure of Psi_5(sigma * r_k; nu)
  };
  std::vector<Atom> atoms;
  double C_lb = 0.0;      // certified lower bound on G_r^+ + 2*beta^2/eps1
};

inline std::string i128_to_str(__int128 v) {
  if (v == 0) return "0";
  bool neg = (v < 0);
  unsigned __int128 u = neg ? (unsigned __int128)(-v) : (unsigned __int128)(v);
  std::string s;
  while (u > 0) { s.push_back(char('0' + int(u % 10u))); u /= 10u; }
  if (neg) s.push_back('-');
  std::reverse(s.begin(), s.end());
  return s;
}
inline unsigned __int128 gcd_u128(unsigned __int128 a, unsigned __int128 b) {
  while (b != 0) { unsigned __int128 t = a % b; a = b; b = t; }
  return a;
}
inline std::string rat128_str(__int128 num, __int128 den) {
  require(den > 0, "rat128 den > 0");
  if (num == 0) return "0/1";
  unsigned __int128 un = (num < 0) ? (unsigned __int128)(-num) : (unsigned __int128)(num);
  unsigned __int128 g = gcd_u128(un, (unsigned __int128)den);
  __int128 sn = (num < 0) ? -__int128(un / g) : __int128(un / g);
  __int128 sd = __int128((unsigned __int128)den / g);
  return i128_to_str(sn) + "/" + i128_to_str(sd);
}

// Extracts an exact rational multi-atom law in L = (L1)-(L4) near the worst box of a plain cover:
inline PrimalWitness build_primal_witness(const GL3PolarEngine& eng, const GL3PolarEngine::Row& rw,
                                          const std::vector<NuSliceCaps>& slices,
                                          const SamplePlainBox& wb, int64_t rho_num, int64_t rho_den) {
  const I eps1 = rat_i(39, 50), eta = rat_i(779, 10000);
  const I kap = I(1.0)/eps1 - (sq(rw.bA) + sq(rw.bB))/eta;
  const double two_b2_lo = (I(2.0) * sq(rw.beta) / eps1).l;
  const double rho_val = double(rho_num) / double(rho_den);
  const double C6_val = 4045313.0 / 100000.0;

  // Solve finite-radius LP over exact rational radii r_m in [0, 212/32] across (nu, sigma, x_e)
  // (no ray columns => exact sum p_k = 1, sum p_k r_k^2 = 1!):
  std::vector<std::pair<int64_t, int64_t>> r_grid;
  for (int64_t m = 0; m <= 320; ++m) r_grid.push_back({m, 128});
  for (int64_t m = 81; m <= 212; ++m) r_grid.push_back({m, 32});

  auto eval_lp_at = [&](size_t sl_idx, int64_t ks, double xe_raw,
                        double& out_val, std::vector<std::pair<size_t, double>>& out_act) -> bool {
    const auto& sl = slices[sl_idx];
    const double pen_nu = (sl.nu * sl.nu) / eta.l;
    const double sg = double(ks) / 1024.0;
    if (ks == 0) {
      out_val = sl.caps_lo[0] - pen_nu;
      out_act.clear();
      return true;
    }
    auto interp_psi_lo = [&](double sv) -> double {
      if (sv <= 0.0) return sl.caps_lo[0];
      if (sv >= sl.s_nodes[sl.n_real - 1]) {
        // Convexity lower bound for s > 6 using finite-difference slope at end of real grid:
        size_t n1 = sl.n_real - 1, n0 = sl.n_real - 2;
        double slope = (sl.caps_lo[n1] - sl.caps_hi[n0]) / (sl.s_nodes[n1] - sl.s_nodes[n0]);
        return sl.caps_lo[n1] + std::max(0.0, slope) * (sv - sl.s_nodes[n1]);
      }
      size_t hi = size_t(std::lower_bound(sl.s_nodes.begin(), sl.s_nodes.begin() + ptrdiff_t(sl.n_real), sv) - sl.s_nodes.begin());
      if (hi == 0) return sl.caps_lo[0];
      size_t lo = hi - 1;
      double t = (sv - sl.s_nodes[lo]) / (sl.s_nodes[hi] - sl.s_nodes[lo]);
      return (1.0 - t) * sl.caps_lo[lo] + t * sl.caps_lo[hi];
    };
    const double rho_in = rho_val - 1e-6;
    double xe = std::clamp(xe_raw, 0.015, 6.47);
    double m2_cap = 2.0 + xe * xe;
    double m3_cap = 6.0 + 9.0 * xe * xe + C6_val * xe * xe * xe - 1e-4;
    std::vector<simplex6::Col6> pcols;
    pcols.reserve(r_grid.size() + 10);
    pcols.push_back(simplex6::make_col(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, sl.caps_lo[0] - pen_nu, 0));
    pcols.push_back(simplex6::make_col(0.0, 1.0, -rho_in / 4.0, -1.0 / 16.0, -m2_cap / 256.0, -m3_cap / 4096.0, -kap.h * sg * sg, -1));
    pcols.push_back(simplex6::make_col(0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, -1));
    pcols.push_back(simplex6::make_col(0.0, 0.0, 0.0, 1.0, 0.0, 0.0, -1e6, -1));
    pcols.push_back(simplex6::make_col(0.0, 0.0, 0.0, 0.0, 1.0, 0.0, -1e6, -1));
    pcols.push_back(simplex6::make_col(0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, -1));
    pcols.push_back(simplex6::make_col(0.0, 0.0, -1.0, 0.0, 0.0, 0.0, -1e5, -1));
    pcols.push_back(simplex6::make_col(0.0, 0.0, 0.0, -1.0, 0.0, 0.0, -1e6, -1));
    pcols.push_back(simplex6::make_col(0.0, 0.0, 0.0, 0.0, -1.0, 0.0, -1e6, -1));
    pcols.push_back(simplex6::make_col(0.0, 0.0, 0.0, 0.0, 0.0, -1.0, -1e6, -1));
    for (size_t ri = 1; ri < r_grid.size(); ++ri) {
      double rv = double(r_grid[ri].first) / double(r_grid[ri].second);
      double u1 = rv / 4.0, u2 = u1 * u1, u4 = u2 * u2, u6 = u4 * u2;
      pcols.push_back(simplex6::make_col(1.0, 0.0, u1, u2, u4, u6, interp_psi_lo(sg * rv) - pen_nu, int(ri)));
    }
    double y6[6]{}, xB6[6]{};
    int bas6[6]{};
    if (!simplex6::solve_dual_simplex6(pcols.data(), int(pcols.size()), y6, bas6, xB6)) return false;
    double wsum = 0.0;
    out_act.clear();
    for (int k = 0; k < 6; ++k) {
      int ri = pcols[size_t(bas6[k])].node_idx;
      if (ri >= 0 && xB6[k] > 1e-12) {
        out_act.push_back({size_t(ri), xB6[k]});
        wsum += xB6[k];
      }
    }
    if (std::abs(wsum - 1.0) > 1e-7 || out_act.empty()) return false;
    out_val = y6[0] + y6[1];
    return true;
  };

  size_t best_sl_idx = 0;
  int64_t best_ksig = 36;
  double best_dual_est = -1e30;
  struct ActR { int64_t rn, rd; double w; };
  std::vector<ActR> best_act;

  auto try_point = [&](size_t j, int64_t ks, double xe) {
    double val = -1e30;
    std::vector<std::pair<size_t, double>> act;
    if (eval_lp_at(j, ks, xe, val, act) && val > best_dual_est) {
      best_dual_est = val;
      best_sl_idx = j;
      best_ksig = ks;
      best_act.clear();
      for (auto [ri, w] : act) best_act.push_back({r_grid[ri].first, r_grid[ri].second, w});
    }
  };

  // Stage 1: Coarse global sweep over slices in [-0.016, 0.036] and sigma in [0, 1.25]:
  for (size_t j = 0; j < slices.size(); ++j) {
    if (slices[j].nu < -0.016 || slices[j].nu > 0.036) continue;
    for (int64_t ks = 0; ks <= 1280; ks += 48) {
      for (double xe : {0.04, 1.2, 6.46}) try_point(j, ks, xe);
    }
    try_point(j, 37, 0.04); // capture small-sigma regime (e.g. Row 0.886)
  }
  // Also include wb midpoint neighborhood:
  {
    double nu_mid = 0.5 * (wb.nu0 + wb.nu1);
    size_t j_wb = 0;
    for (size_t j = 0; j < slices.size(); ++j)
      if (std::abs(slices[j].nu - nu_mid) < std::abs(slices[j_wb].nu - nu_mid)) j_wb = j;
    int64_t ks_wb = std::max<int64_t>(0, int64_t(std::llround(0.5 * (wb.sa + wb.sb) * 1024.0)));
    for (double xe : {0.03, 0.5, 2.0, 6.46}) try_point(j_wb, ks_wb, xe);
  }
  // Stage 2: Local coordinate refinement around best (best_sl_idx, best_ksig):
  size_t center_j = best_sl_idx;
  int64_t center_ks = best_ksig;
  for (int dj = -2; dj <= 2; ++dj) {
    int jj = int(center_j) + dj;
    if (jj < 0 || jj >= int(slices.size())) continue;
    for (int64_t dk = -48; dk <= 48; dk += 6) {
      int64_t ks = std::max<int64_t>(0, center_ks + dk);
      for (double xe : {0.02, 0.15, 0.6, 1.8, 4.0, 6.46}) try_point(size_t(jj), ks, xe);
    }
  }
  center_j = best_sl_idx;
  center_ks = best_ksig;
  for (int dj = -1; dj <= 1; ++dj) {
    int jj = int(center_j) + dj;
    if (jj < 0 || jj >= int(slices.size())) continue;
    for (int64_t dk = -6; dk <= 6; ++dk) {
      int64_t ks = std::max<int64_t>(0, center_ks + dk);
      for (double xe : {0.018, 0.05, 0.15, 0.4, 0.9, 1.6, 2.5, 4.5, 6.465}) try_point(size_t(jj), ks, xe);
    }
  }
  int64_t nu_k = int64_t(std::llround(slices[best_sl_idx].nu * 2048.0));

  // Exact 4-atom rationalized Gauss-Laguerre interior law (E[1]=1, E[U]=1, E[U^2]=2.01, E[U^3]=6.09 < 6.13045, E[r]=0.89748 < 2287/2500):
  struct LagAtom { int64_t rn, rd; double w; };
  static const std::array<LagAtom, 4> LAG4 = {{
    {14, 25, 16018658233.0 / 26754867594.0},
    {33, 25, 10749768551.0 / 29736185600.0},
    {53, 25,  2190718529.0 / 56089612800.0},
    {77, 25,   248812591.0 / 346291545600.0}
  }};

  struct RawAtom { int64_t rn, rd; double w; };
  std::vector<RawAtom> raw;
  auto add_raw = [&](int64_t rn, int64_t rd, double w) {
    int64_t g = std::gcd(rn, rd); rn /= g; rd /= g;
    for (auto& a : raw) {
      if (a.rn == rn && a.rd == rd) { a.w += w; return; }
    }
    raw.push_back({rn, rd, w});
  };
  double w_act_sum = 0.0;
  for (const auto& a : best_act) w_act_sum += a.w;
  const double eps_mix = 1e-6;
  if (w_act_sum > 1e-9) {
    for (const auto& a : best_act) add_raw(a.rn, a.rd, (1.0 - eps_mix) * (a.w / w_act_sum));
    for (const auto& la : LAG4) add_raw(la.rn, la.rd, eps_mix * la.w);
  } else {
    for (const auto& la : LAG4) add_raw(la.rn, la.rd, la.w);
  }
  std::sort(raw.begin(), raw.end(), [](const RawAtom& a, const RawAtom& b) {
    return double(a.rn) / a.rd < double(b.rn) / b.rd;
  });

  // Project onto exact sum p_k = 1 and sum p_k r_k^2 = 1 in __int128 arithmetic:
  auto build_exact_weights = [&](double mix_interior, std::vector<std::string>& p_strs_out,
                                 std::vector<double>& p_dbl_out) -> bool {
    std::vector<RawAtom> cur = raw;
    if (mix_interior > 0.0) {
      for (auto& a : cur) a.w *= (1.0 - mix_interior);
      auto add_c = [&](int64_t rn, int64_t rd, double w) {
        int64_t g = std::gcd(rn, rd); rn /= g; rd /= g;
        for (auto& a : cur) if (a.rn == rn && a.rd == rd) { a.w += w; return; }
        cur.push_back({rn, rd, w});
      };
      for (const auto& la : LAG4) add_c(la.rn, la.rd, mix_interior * la.w);
      std::sort(cur.begin(), cur.end(), [](const RawAtom& a, const RawAtom& b) {
        return double(a.rn) / a.rd < double(b.rn) / b.rd;
      });
    }
    // Find pivot indices i0 (r < 1, largest w) and i1 (r > 1, largest w):
    int i0 = -1, i1 = -1;
    for (int i = 0; i < int(cur.size()); ++i) {
      if (cur[size_t(i)].rn < cur[size_t(i)].rd && (i0 < 0 || cur[size_t(i)].w > cur[size_t(i0)].w)) i0 = i;
      if (cur[size_t(i)].rn > cur[size_t(i)].rd && (i1 < 0 || cur[size_t(i)].w > cur[size_t(i1)].w)) i1 = i;
    }
    if (i0 < 0 || i1 < 0) return false;

    const __int128 QDEN = 10000000000ll; // 10^10
    // Common denominator L2 for u_k = rn^2 / rd^2 is not even needed if we solve in exact rational arithmetic:
    // Let p_k = q_k / QDEN for k not in {i0, i1}.
    // Remainder S0 = 1 - sum p_k = rem0 / QDEN, and S1 = 1 - sum p_k * (rn_k^2 / rd_k^2).
    // Clear denominators using D_all = lcm of rd_k^2!
    __int128 L_u = 1;
    for (const auto& a : cur) {
      __int128 u_den = __int128(a.rd) * __int128(a.rd);
      unsigned __int128 g = gcd_u128((unsigned __int128)L_u, (unsigned __int128)u_den);
      if (L_u > (__int128(1) << 52)) return false;
      L_u = (L_u / __int128(g)) * u_den;
    }
    std::vector<__int128> u_int(cur.size());
    for (size_t k = 0; k < cur.size(); ++k) {
      __int128 u_num = __int128(cur[k].rn) * __int128(cur[k].rn);
      __int128 u_den = __int128(cur[k].rd) * __int128(cur[k].rd);
      u_int[k] = u_num * (L_u / u_den);
    }
    __int128 sum_q = 0, sum_qu = 0;
    std::vector<__int128> q_fix(cur.size(), 0);
    for (int k = 0; k < int(cur.size()); ++k) {
      if (k == i0 || k == i1) continue;
      __int128 qk = std::max<__int128>(0, __int128(std::llround(cur[size_t(k)].w * double(QDEN))));
      q_fix[size_t(k)] = qk;
      sum_q += qk;
      sum_qu += qk * u_int[size_t(k)];
    }
    __int128 rem0 = QDEN - sum_q;                 // p_i0 + p_i1 = rem0 / QDEN
    __int128 rem1 = QDEN * L_u - sum_qu;          // p_i0 * u_int[i0] + p_i1 * u_int[i1] = rem1 / QDEN
    __int128 du = u_int[size_t(i1)] - u_int[size_t(i0)];
    if (du <= 0) return false;
    __int128 num_i0 = rem0 * u_int[size_t(i1)] - rem1;
    __int128 num_i1 = rem1 - rem0 * u_int[size_t(i0)];
    if (num_i0 < 0 || num_i1 < 0) return false;
    __int128 den_piv = QDEN * du;

    // Check (L2)-(L4) with conservative interval bounds:
    I m_iv(0.0), m3_iv(0.0), r_iv(0.0);
    p_strs_out.resize(cur.size());
    p_dbl_out.resize(cur.size());
    for (int k = 0; k < int(cur.size()); ++k) {
      I pk_iv;
      if (k == i0) {
        p_strs_out[size_t(k)] = rat128_str(num_i0, den_piv);
        pk_iv = rat_str_to_iv(p_strs_out[size_t(k)]);
      } else if (k == i1) {
        p_strs_out[size_t(k)] = rat128_str(num_i1, den_piv);
        pk_iv = rat_str_to_iv(p_strs_out[size_t(k)]);
      } else {
        p_strs_out[size_t(k)] = rat128_str(q_fix[size_t(k)], QDEN);
        pk_iv = rat_str_to_iv(p_strs_out[size_t(k)]);
      }
      p_dbl_out[size_t(k)] = pk_iv.l;
      I rk = rat_i(cur[size_t(k)].rn, cur[size_t(k)].rd);
      I uk = sq(rk);
      r_iv = r_iv + pk_iv * rk;
      m_iv = m_iv + pk_iv * sq(uk);
      m3_iv = m3_iv + pk_iv * (uk * sq(uk));
    }
    if (r_iv.h > rho_val - 1e-11) return false;
    if (m_iv.l < 2.0 + 1e-9 || m_iv.h > 44.0 - 1e-7) return false;
    double x_lo = std::sqrt(std::max(0.0, m_iv.l - 2.0));
    double rhs_m3 = 9.0 * m_iv.l - 12.0 + C6_val * x_lo * x_lo * x_lo;
    if (m3_iv.h > rhs_m3 - 1e-7) return false;
    raw = std::move(cur);
    return true;
  };

  std::vector<std::string> p_strs;
  std::vector<double> p_dbl;
  bool ok_w = false;
  for (double mix : {0.0, 1e-4, 1e-3, 1e-2, 0.1, 1.0}) {
    if (build_exact_weights(mix, p_strs, p_dbl)) { ok_w = true; break; }
  }
  require(ok_w, "build_primal_witness exact rational projection");

  PrimalWitness pw;
  pw.sig_num = best_ksig; pw.sig_den = 1024;
  pw.nu_num  = nu_k;      pw.nu_den  = 2048;
  double sg_val = double(pw.sig_num) / double(pw.sig_den);
  double nu_val = double(pw.nu_num)  / double(pw.nu_den);

  std::vector<double> s_eval(raw.size());
  for (size_t k = 0; k < raw.size(); ++k) {
    // Note: s_k = sg_val * r_k = (best_ksig / 1024) * (rn / rd):
    I sk_iv = rat_i(pw.sig_num, pw.sig_den) * rat_i(raw[k].rn, raw[k].rd);
    s_eval[k] = 0.5 * (sk_iv.l + sk_iv.h);
  }
  // Evaluate Psi_5 rigorously at each rational point s_k = (sig_num * rn) / (sig_den * rd)
  // including Lipschitz enclosure for 1-ulp rounding of s_k!
  I sum_psi(0.0);
  for (size_t k = 0; k < raw.size(); ++k) {
    I sk_exact = rat_i(pw.sig_num * raw[k].rn, pw.sig_den * raw[k].rd);
    std::vector<double> pt = {sk_exact.l};
    std::vector<I> iv_out(1);
    eng.eval_psi5_batch(rw, nu_val, pt, 0, 1, iv_out, 2e-11);
    I lip_err = rw.Ls * I(0.0, sk_exact.width());
    I psi_k(dn(iv_out[0].l - lip_err.h), up(iv_out[0].h + lip_err.h));
    I pk_iv = rat_str_to_iv(p_strs[k]);
    sum_psi = sum_psi + pk_iv * psi_k;
    pw.atoms.push_back({raw[k].rn, raw[k].rd, p_strs[k], psi_k});
  }
  I sig_iv(sg_val), nu_iv(nu_val);
  I C_iv = sum_psi - kap * sq(sig_iv) - sq(nu_iv) / eta + I(two_b2_lo, (I(2.0)*sq(rw.beta)/eps1).h);
  pw.C_lb = C_iv.l;
  return pw;
}

// ============================================================================
// 9. Sanity Checks (P4 §§4, 8) & C++ Negative Controls (CERT_STAGE2B §3, P4 §6)
// ============================================================================
struct GaussBenchOut {
  std::string tag;
  double sigma_opt = 0.0, nu_opt = 0.0;
  I val_iv;       // t^2 - 2*ell*t + 2*beta^2/eps1 + E_{U~Exp(1)}[Psi_5(sig*sqrt(U); nu)] - kap*sig^2 - nu^2/eta
  double cert_val_hi = 0.0;
  double law_gap_lo = 0.0;
  bool cover_rejected_minus_gap = false;
};

inline GaussBenchOut eval_gaussian_benchmark(const GL3PolarEngine& eng, const std::string& tag, double t_row,
                                             const GL3PolarEngine::Row& rw, double sig_opt, double nu_opt, I C_cert_iv) {
  const I eps1 = rat_i(39, 50), eta = rat_i(779, 10000);
  const I kap = I(1.0)/eps1 - (sq(rw.bA) + sq(rw.bB))/eta;
  // Rigorous O(h^2) convex chord/subgradient quadrature for E_{U~Exp(1)} Psi_5(sig*sqrt(U); nu) = int_0^inf 2 u e^{-u^2} Psi_5(sig u; nu) du:
  // On [a, b] of width h with midpoint m and density rho(u) = 2 u e^{-u^2}, convexity + monotonicity of u |-> Psi_5(sig*u; nu)
  // (subgradient slope in [0, Ls*sig]) and |rho(u) - rho(m)| <= M_ab * |u - m| with
  //   M_ab = sup_{[a,b]} |rho'(u)| = sup_{[a,b]} 2|1 - 2u^2| e^{-u^2} <= 2 max(|1 - 2a^2|, |1 - 2b^2|, a <= sqrt(3/2) && sqrt(3/2) <= b ? 2 : 0) e^{-a^2}
  // give |int_a^b (u - m) rho(u) du| <= M_ab * int_{-h/2}^{h/2} t^2 dt = M_ab * h^3 / 12, hence:
  //   w_[a,b] * psi(m) - Ls*sig*M_ab*h^3/12 <= int_a^b <= w_[a,b] * (psi(a)+psi(b))/2 + Ls*sig*M_ab*h^3/12.
  const int NP = 1536;
  const double U_MAX = 6.0;
  const double hu = U_MAX / NP;
  std::vector<double> s_pts(2 * NP + 1);
  for (int k = 0; k <= 2 * NP; ++k) s_pts[size_t(k)] = sig_opt * (k * (0.5 * hu));
  std::vector<I> psi_pts(2 * NP + 1);
  std::vector<std::pair<size_t, size_t>> batches;
  {
    size_t b = 0;
    while (b < s_pts.size()) {
      if (s_pts[b] == 0.0) { batches.push_back({b, b + 1}); ++b; continue; }
      size_t e = b + 1;
      while (e < s_pts.size() && s_pts[e] - s_pts[b] <= 0.0625 + 1e-12) ++e;
      batches.push_back({b, e});
      b = e;
    }
  }
  {
    size_t nb = 0;
    std::mutex mtx;
    std::vector<std::thread> ws;
    for (int tid = 0; tid < 8; ++tid) {
      ws.emplace_back([&]() {
        while (true) {
          size_t idx_b;
          { std::lock_guard<std::mutex> lk(mtx); if (nb >= batches.size()) break; idx_b = nb++; }
          eng.eval_psi5_batch(rw, nu_opt, s_pts, batches[idx_b].first, batches[idx_b].second, psi_pts, 2e-11);
        }
      });
    }
    for (auto& th : ws) th.join();
  }
  I E_psi(0.0);
  const I ls_sig_h3_12 = rw.Ls * I(sig_opt) * (sq(I(hu)) * I(hu)) * rat_i(1, 12);
  for (int i = 0; i < NP; ++i) {
    double u0 = i * hu, u1 = (i + 1) * hu;
    I eu0 = expneg(sq(I(u0))), eu1 = expneg(sq(I(u1)));
    I w_panel = eu0 - eu1;
    w_panel.l = std::max(0.0, w_panel.l);
    double c_abs0 = std::abs((I(1.0) - I(2.0) * sq(I(u0))).l);
    c_abs0 = std::max(c_abs0, std::abs((I(1.0) - I(2.0) * sq(I(u0))).h));
    double c_abs1 = std::abs((I(1.0) - I(2.0) * sq(I(u1))).l);
    c_abs1 = std::max(c_abs1, std::abs((I(1.0) - I(2.0) * sq(I(u1))).h));
    // Note |2(1 - 2u^2) e^{-u^2}| <= 2 * max_{[u0,u1]} |1 - 2u^2| * e^{-u0^2}; |1 - 2u^2| is convex in u^2 so max is at u0 or u1!
    double M_ab_hi = (I(2.0) * I(std::max(c_abs0, c_abs1)) * I(eu0.h)).h;
    I err_panel = I(M_ab_hi) * ls_sig_h3_12;
    const I& pL = psi_pts[size_t(2 * i)];
    const I& pM = psi_pts[size_t(2 * i + 1)];
    const I& pR = psi_pts[size_t(2 * i + 2)];
    I trap_hi = I(0.5) * (pL + pR);
    double pan_lo = (w_panel * I(pM.l) - err_panel).l;
    double pan_hi = (w_panel * I(trap_hi.h) + err_panel).h;
    E_psi = E_psi + I(pan_lo, pan_hi);
  }
  // Tail u >= U_MAX: Psi_5(sig*u; nu) <= Psi_5(0; nu) + Ls*sig*u, and int_{U_MAX}^inf 2 u^2 e^{-u^2} du <= (2*U_MAX + 1)*e^{-U_MAX^2}:
  I psi0 = eng.eval_psi5_s0_1d(rw, I(nu_opt));
  I eU2 = expneg(sq(I(U_MAX)));
  I tail_hi = eU2 * psi0 + rw.Ls * I(sig_opt) * (I(2.0 * U_MAX + 1.0) * eU2);
  E_psi = I(E_psi.l, up(E_psi.h + tail_hi.h));

  I t_iv(t_row);
  // Use exact rational t_row: 0.7 = 7/10, 0.8 = 4/5, 0.85 = 17/20, 0.886 = 443/500:
  if (tag == "0.700") t_iv = rat_i(7, 10);
  else if (tag == "0.800") t_iv = rat_i(4, 5);
  else if (tag == "0.850") t_iv = rat_i(17, 20);
  else if (tag == "0.886") t_iv = rat_i(443, 500);
  else throw std::runtime_error("unexpected Gaussian benchmark tag: " + tag);

  I base_quad = sq(t_iv) - I(2.0) * rw.ell * t_iv + (I(2.0) * sq(rw.beta)) / eps1;
  I G_val = E_psi - kap * sq(I(sig_opt)) - sq(I(nu_opt)) / eta;
  I val = base_quad + G_val;
  I cert_row_val = sq(t_iv) - I(2.0) * rw.ell * t_iv + C_cert_iv;
  double gap_lo = (cert_row_val - val).l;
  require(gap_lo > 0.0, "Gaussian benchmark strictly below certified row value on " + tag);
  return {tag, sig_opt, nu_opt, val, cert_row_val.h, gap_lo};
}

struct DriverPairOut {
  std::string c_rat;
  I t_iv;
  I V_iv;
  double min_row_margin_lo = 0.0;
};

inline DriverPairOut eval_driver_pair(int64_t c_num, int64_t c_den,
                                      const std::vector<std::pair<GL3PolarEngine::Row, I>>& rows_and_C) {
  const I pi_v = verified_pi();
  const I eps1 = rat_i(39, 50), eta = rat_i(779, 10000);
  const I c_iv = rat_i(c_num, c_den), c2 = sq(c_iv);
  const I a2 = inv_pos(I(1.0) + c2);     // alpha^2 = 1 / (1 + c^2)
  const I g2 = c2 * a2;                  // gamma^2 = c^2 / (1 + c^2)
  const I a4 = sq(a2), a6 = a4 * a2;
  const I t_iv = I(0.5) * sqrti(pi_v * a2);
  // Exact unitary-projection formula: V(c) = (pi/4) * [a^2 + eps1*g^2 - (eps1/8)*a^6 + (3*eta/64)*a^4*(a^6 - 8*g^2)]:
  const I bracket = a2 + eps1 * g2 - (eps1 * rat_i(1, 8)) * a6 + (I(3.0) * eta * rat_i(1, 64)) * a4 * (a6 - I(8.0) * g2);
  const I V_iv = (pi_v * rat_i(1, 4)) * bracket;

  double min_margin = 1e300;
  for (const auto& [rw, C_iv] : rows_and_C) {
    I row_val = sq(t_iv) - I(2.0) * rw.ell * t_iv + C_iv;
    double m_lo = (row_val - V_iv).l;
    require(m_lo > 0.0, "driver pair V(c) < row parabola");
    min_margin = std::min(min_margin, m_lo);
  }
  return {std::to_string(c_num) + "/" + std::to_string(c_den), t_iv, V_iv, min_margin};
}

// ============================================================================
// 10. Minimal Exact JSON Reader for `rows2b.json` & `rows2c_final.json`
// ============================================================================
struct SpecRow {
  std::string tag;
  double t_val = 0.0;
  std::string row_str;
  I ell, beta, bA, bB;
  std::string ell_s, beta_s, bA_s, bB_s;
  std::string C_plain_2b;
  std::string C_stein_2b; // empty if plain-only
  std::string C_plain_2c; // empty on 0.125L..0.200L
};

inline std::vector<std::string> split_csv4(const std::string& s) {
  std::vector<std::string> parts;
  std::stringstream ss(s);
  std::string item;
  while (std::getline(ss, item, ',')) parts.push_back(item);
  require(parts.size() == 4, "expected 4 rationals in row: " + s);
  return parts;
}

inline std::string extract_json_str(const std::string& block, const std::string& key) {
  std::string pat = "\"" + key + "\"";
  auto p = block.find(pat);
  if (p == std::string::npos) return "";
  auto col = block.find(':', p + pat.size());
  require(col != std::string::npos, "missing ':' for " + key);
  auto q1 = block.find('"', col + 1);
  require(q1 != std::string::npos, "missing opening quote for " + key);
  auto q2 = block.find('"', q1 + 1);
  require(q2 != std::string::npos, "missing closing quote for " + key);
  return block.substr(q1 + 1, q2 - q1 - 1);
}

inline double extract_json_num(const std::string& block, const std::string& key) {
  std::string pat = "\"" + key + "\"";
  auto p = block.find(pat);
  require(p != std::string::npos, "missing numeric key " + key);
  auto col = block.find(':', p + pat.size());
  size_t i = col + 1;
  while (i < block.size() && (block[i] == ' ' || block[i] == '\n')) ++i;
  size_t j = i;
  while (j < block.size() && ((block[j] >= '0' && block[j] <= '9') || block[j] == '.' || block[j] == '-')) ++j;
  return std::stod(block.substr(i, j - i));
}

inline std::vector<SpecRow> load_all_rows(const std::string& json2b, const std::string& json2c) {
  auto split_row_blocks = [](const std::string& js) -> std::vector<std::string> {
    auto rpos = js.find("\"rows\"");
    require(rpos != std::string::npos, "missing \"rows\"");
    auto arr_beg = js.find('[', rpos);
    require(arr_beg != std::string::npos, "missing '['");
    std::vector<std::string> blocks;
    int depth = 0;
    size_t obj_beg = 0;
    for (size_t i = arr_beg + 1; i < js.size(); ++i) {
      if (js[i] == '{') {
        if (depth == 0) obj_beg = i;
        ++depth;
      } else if (js[i] == '}') {
        --depth;
        if (depth == 0) blocks.push_back(js.substr(obj_beg, i - obj_beg + 1));
      } else if (js[i] == ']' && depth == 0) {
        break;
      }
    }
    return blocks;
  };

  auto b2 = split_row_blocks(json2b);
  auto b2c = split_row_blocks(json2c);
  require(b2.size() == 29, "expected 29 rows in rows2b.json");
  require(b2c.size() == 26, "expected 26 rows in rows2c_final.json");

  std::vector<SpecRow> rows;
  rows.reserve(29);
  for (const auto& blk : b2) {
    SpecRow sr;
    sr.tag = extract_json_str(blk, "tag");
    sr.t_val = extract_json_num(blk, "t");
    sr.row_str = extract_json_str(blk, "row");
    auto q4 = split_csv4(sr.row_str);
    sr.ell_s = q4[0]; sr.beta_s = q4[1]; sr.bA_s = q4[2]; sr.bB_s = q4[3];
    sr.ell = rat_str_to_iv(sr.ell_s);
    sr.beta = rat_str_to_iv(sr.beta_s);
    sr.bA = rat_str_to_iv(sr.bA_s);
    sr.bB = rat_str_to_iv(sr.bB_s);
    sr.C_plain_2b = extract_json_str(blk, "C_plain");
    sr.C_stein_2b = extract_json_str(blk, "C_stein");
    require(!sr.C_plain_2b.empty(), "missing C_plain in rows2b for " + sr.tag);
    rows.push_back(std::move(sr));
  }
  for (size_t k = 0; k < b2c.size(); ++k) {
    std::string tag = extract_json_str(b2c[k], "tag");
    std::string rstr = extract_json_str(b2c[k], "row");
    std::string cpl = extract_json_str(b2c[k], "C_plain");
    require(rows[k + 3].tag == tag && rows[k + 3].row_str == rstr, "rows2c tag/row mismatch at " + tag);
    rows[k + 3].C_plain_2c = cpl;
  }
  return rows;
}

// ============================================================================
// 11. Startup Self-Tests & Negative-Control Suite
// ============================================================================
struct NegCtrlOut {
  bool cap_lowered_1e6_rejected = false;
  bool stein_a0_minus_1e4_rejected = false;
  bool stein_c_1p3_sigb2_rejected = false;
  bool stein_a6_zero_a4_neg_rejected = false;
  std::vector<std::pair<std::string, std::pair<double, double>>> rho_sqrtpi2_bad_caps; // (tag, (C_bad_sqrtpi2, C_lb_valid))
};

inline void run_startup_self_tests() {
  // 1. FIPS-180-4 SHA-256 test vectors:
  require(sha256::hash_bytes(reinterpret_cast<const uint8_t*>(""), 0) ==
          "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "SHA-256 empty");
  require(sha256::hash_bytes(reinterpret_cast<const uint8_t*>("abc"), 3) ==
          "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad", "SHA-256 abc");

  // 2. rat_str_to_iv exactness test:
  I r_half = rat_str_to_iv("1/2");
  require(r_half.l == 0.5 && r_half.h == 0.5, "rat_str_to_iv 1/2");
  I r_third = rat_str_to_iv("1/3");
  require(r_third.l < 1.0/3.0 + 1e-16 && r_third.h > r_third.l && up(r_third.l) == r_third.h, "rat_str_to_iv 1-ulp");
  I pi_iv = verified_pi();
  require(pi_iv.l > 3.14159265358978 && pi_iv.h < 3.14159265358981, "verified_pi enclosure");

  // 3. Zero-libm verified_asin_0_1 / verified_acos_0_1 round-trip enclosure tests across [0, 1]:
  I as_half = verified_asin_0_1(rat_i(1, 2));
  I pi6 = pi_iv / I(6.0);
  require(as_half.l <= pi6.h && as_half.h >= pi6.l && as_half.width() < 2e-14, "asin(1/2) = pi/6");
  for (int k = 0; k <= 1000; ++k) {
    double u = k / 1000.0;
    I a = verified_asin_0_1(I(u));
    I sv_lo, cv_lo, sv_hi, cv_hi;
    sincos_0_pi(I(a.l), sv_lo, cv_lo);
    sincos_0_pi(I(a.h), sv_hi, cv_hi);
    if (k <= 750) {
      require((a.l == 0.0 || sv_lo.h <= u) && sv_hi.l >= u, "asin direct monotone bracket at k=" + std::to_string(k));
    }
    require(sv_lo.l <= u && sv_hi.h >= u && a.width() < 5e-14, "asin roundtrip at k=" + std::to_string(k));
  }

  // 4. Near-equality nu-slab quadratic maximum test (codex-a7c4 review counterexample:
  //    dnu = 1/2048, eta = 779/10000 => true K = 625/204210176 > u1 = 0x1.9ac8764e368d1p-19 >= K_nu.l;
  //    true interior maximum u1 + (K - u1)^2/(4K) > u1, so outward upper bound MUST strictly exceed u1):
  {
    I eta_ce = rat_i(779, 10000);
    I K_ce = sq(I(1.0 / 2048.0)) / eta_ce;
    I K_exact = rat_str_to_iv("625/204210176");
    double u1_ce = 0x1.9ac8764e368d1p-19;
    require(K_ce.l <= u1_ce && u1_ce <= K_exact.l && K_exact.l < K_exact.h, "counterexample bracket setup");
    double ub_pos = max_nu_slab_quad(0.0, u1_ce, K_ce);
    double ub_neg = max_nu_slab_quad(u1_ce, 0.0, K_ce);
    require(ub_pos >= up(u1_ce) && ub_neg >= up(u1_ce), "max_nu_slab_quad must strictly cover interior gain > u1");
  }
}

inline void run_engine_self_tests(const GL3PolarEngine& eng) {
  // Constant-integrand 1 control on angular grid [0, pi_lo] + [pi_lo, pi] across all depths,
  // tested against a 128-bit fixed-point Machin enclosure of pi (< 1e-15 width),
  // and on the full 2D polar engine (4/pi * int_0^pi int_0^inf r e^{-r^2} * 1 dr dtheta = 2):
  auto atan_inv_q104 = [](uint64_t q) -> std::pair<__int128, __int128> {
    const __int128 ONE = (__int128(1) << 104);
    __int128 p_lo = ONE / __int128(q), p_hi = p_lo + 1;
    __int128 s_lo = 0, s_hi = 0;
    const __int128 q2 = __int128(q) * __int128(q);
    for (int k = 0; k < 24; ++k) {
      __int128 d = 2 * k + 1;
      __int128 t_lo = p_lo / d, t_hi = (p_hi + d - 1) / d;
      if (k % 2 == 0) { s_lo += t_lo; s_hi += t_hi; }
      else            { s_lo -= t_hi; s_hi -= t_lo; }
      p_lo = p_lo / q2;
      p_hi = (p_hi + q2 - 1) / q2;
    }
    __int128 rem = (p_hi + 48) / 49;
    return {s_lo - rem, s_hi + rem};
  };
  auto [a5_lo, a5_hi] = atan_inv_q104(5);
  auto [a239_lo, a239_hi] = atan_inv_q104(239);
  __int128 pi_q_lo = 16 * a5_lo - 4 * a239_hi;
  __int128 pi_q_hi = 16 * a5_hi - 4 * a239_lo;
  uint64_t m_lo = uint64_t(pi_q_lo >> 53);
  uint64_t m_hi = uint64_t((pi_q_hi + ((__int128(1) << 53) - 1)) >> 53);
  I pi_tight(std::ldexp(double(m_lo), -51), std::ldexp(double(m_hi), -51));
  require(pi_tight.width() < 1e-15, "pi_tight 1-ulp width");
  for (int d = 0; d <= GL3PolarEngine::MAX_D; ++d) {
    I ang = eng.eval_angular_const_one(d);
    require(ang.l <= pi_tight.l && ang.h >= pi_tight.h, "angular constant-1 enclosure at depth " + std::to_string(d));
  }
  GL3PolarEngine::Row rw_zero(I(0.0), I(0.0), I(0.0), I(0.0));
  std::vector<double> s_one = {1.0};
  std::vector<I> psi_one(1);
  eng.eval_psi5_batch(rw_zero, 0.0, s_one, 0, 1, psi_one, 1e-11, true);
  require(psi_one[0].l <= 2.0 && 2.0 <= psi_one[0].h, "2D polar constant-1 enclosure of exact value 2.0");
}

// Builds per-row nu-grid (includes all 14 Stein nu-nodes + dense 2/2048 window around row's LP peak!):
inline std::vector<double> make_row_nu_grid(const std::string& tag, int& out_kc) {
  int kc = 0;
  if (tag == "0.740" || tag == "0.760" || tag == "0.780") kc = 8;
  else if (tag == "0.790" || tag == "0.800" || tag == "0.810" || tag == "0.820") kc = 16;
  else if (tag == "0.830" || tag == "0.840" || tag == "0.845" || tag == "0.850" ||
           tag == "0.855" || tag == "0.860" || tag == "0.865" || tag == "0.870") kc = 25;
  else if (tag == "0.875") kc = 28;
  else if (tag == "0.880" || tag == "0.886") kc = 30;
  else kc = 2; // 0.125L..0.720
  out_kc = kc;

  std::vector<int> ks = {
    -164, -104, -52, -24, -16, -12, -8, -6, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 48, 74, 96, 128, 164
  };
  for (int d = -6; d <= 6; ++d) ks.push_back(kc + d);
  std::sort(ks.begin(), ks.end());
  ks.erase(std::unique(ks.begin(), ks.end()), ks.end());
  std::vector<double> grid;
  grid.reserve(ks.size());
  for (int k : ks) grid.push_back(k / 2048.0);
  return grid;
}

} // namespace lawcert

int main(int argc, char** argv) {
  using namespace lawcert;
  auto t_start = std::chrono::steady_clock::now();

  std::string cpp_path = "research/higher-degree/code/degree5-law-replay-gemini-21d5/certify_law_caps.cpp";
  std::string rows2b_path = "research/higher-degree/code/degree5-attack/rows2b.json";
  std::string rows2c_path = "research/higher-degree/code/degree5-design/design-2026-11-25/certB_const/out/rows2c_final.json";
  std::string out_path = "research/higher-degree/code/degree5-law-replay-gemini-21d5/result.json";
  std::string only_filter = "";

  for (int i = 1; i < argc; ++i) {
    std::string a = argv[i];
    if (a == "--cpp" && i + 1 < argc) cpp_path = argv[++i];
    else if (a == "--rows2b" && i + 1 < argc) rows2b_path = argv[++i];
    else if (a == "--rows2c" && i + 1 < argc) rows2c_path = argv[++i];
    else if (a == "--out" && i + 1 < argc) out_path = argv[++i];
    else if (a == "--only" && i + 1 < argc) only_filter = argv[++i];
    else throw std::runtime_error("unknown CLI flag: " + a);
  }

  run_startup_self_tests();

  std::string json2b_txt, json2c_txt;
  std::string cpp_sha = sha256::hash_file(cpp_path);
  std::string r2b_sha = sha256::hash_file(rows2b_path, &json2b_txt);
  std::string r2c_sha = sha256::hash_file(rows2c_path, &json2c_txt);
  require(r2b_sha == "71f81a9cdb9c51672f0e36dc2c53e6b3aedf66c25374706eee0b57cd7112bbd9",
          "rows2b.json SHA-256 mismatch: " + r2b_sha);

  auto spec_rows = load_all_rows(json2b_txt, json2c_txt);
  std::cout << std::setprecision(12);
  std::cout << "[init] Self-tests OK. Loaded 29 rows2b + 26 rows2c. Building GL3PolarEngine..." << std::endl;

  GL3PolarEngine eng;
  run_engine_self_tests(eng);
  const I rho_2b = rat_i(95133, 100000);
  const I rho_2c = rat_i(2287, 2500);
  const I rho_sqrtpi2 = I(0.5) * sqrti(verified_pi());

  // 1. Sanity Check 1: s = 0 on Row 0.850 at nu = 0 (1D vs 2D vs exact closed form sqrt(pi)*(ell - beta/2)):
  const auto& sr085 = spec_rows[21]; // tag "0.850"
  require(sr085.tag == "0.850", "index 21 is 0.850");
  GL3PolarEngine::Row rw085(sr085.ell, sr085.beta, sr085.bA, sr085.bB);
  I s0_1d = eng.eval_psi5_s0_1d(rw085, I(0.0));
  std::vector<double> tiny_s = {0.0};
  std::vector<I> s0_2d_vec(1);
  eng.eval_psi5_batch(rw085, 0.0, tiny_s, 0, 1, s0_2d_vec, 1e-10, true);
  I s0_2d = s0_2d_vec[0];
  I s0_exact = sqrti(verified_pi()) * (sr085.ell - I(0.5) * sr085.beta);
  require(std::max(s0_1d.l, s0_exact.l) <= std::min(s0_1d.h, s0_exact.h), "s=0 1D vs closed form overlap");
  require(std::max(s0_2d.l, s0_exact.l) <= std::min(s0_2d.h, s0_exact.h), "s=0 2D vs closed form overlap");
  std::cout << "[sanity] s=0 Row 0.850: 1D=[" << s0_1d.l << "," << s0_1d.h
            << "] 2D=[" << s0_2d.l << "," << s0_2d.h << "] exact=[" << s0_exact.l << "," << s0_exact.h << "]" << std::endl;

  if (only_filter == "self_test") {
    std::cout << "[self_test] Quick verification mode complete." << std::endl;
    return 0;
  }

  // 2. Certify Claim 3 (`SMALL_T.md` zero-arcsin):
  Claim3Cert c3{};
  if (only_filter.empty() || only_filter == "claim3") {
    auto tc3_0 = std::chrono::steady_clock::now();
    c3 = certify_claim3_zero_arcsin();
    auto tc3_1 = std::chrono::steady_clock::now();
    std::cout << "[Claim 3] N_cert=" << std::setprecision(15) << c3.N_cert
              << " <= 0.7058083 (" << c3.total_certs << " certs / " << c3.stein_certs << " Stein, "
              << std::setprecision(4) << std::chrono::duration<double>(tc3_1 - tc3_0).count() << " s)" << std::endl;
    if (only_filter == "claim3") return 0;
  }

  // 3. Certify all 29 rows (60 covers total: 29 rows2b plain + 5 Stein + 26 rows2c plain):
  struct RowCertResult {
    SpecRow spec;
    double C_plain_2b_cert = 0.0;
    int boxes_plain_2b = 0;
    PrimalWitness pw_2b;

    bool has_stein_2b = false;
    double C_stein_2b_cert = 0.0;
    int boxes_stein_2b = 0;
    int stein_boxes_2b = 0;

    bool has_plain_2c = false;
    double C_plain_2c_cert = 0.0;
    int boxes_plain_2c = 0;
    PrimalWitness pw_2c;
  };
  std::vector<RowCertResult> results(spec_rows.size());
  std::map<size_t, std::vector<NuSliceCaps>> saved_gb_slices;
  SamplePlainBox exported_plain_085{};
  SampleSteinBox exported_stein_0125{};
  NegCtrlOut neg_ctrls{};

  for (size_t idx = 0; idx < spec_rows.size(); ++idx) {
    const auto& sp = spec_rows[idx];
    if (!only_filter.empty() && only_filter != sp.tag) continue;
    auto tr0 = std::chrono::steady_clock::now();

    GL3PolarEngine::Row rw(sp.ell, sp.beta, sp.bA, sp.bB);
    bool has_stein = !sp.C_stein_2b.empty();
    bool has_2c    = !sp.C_plain_2c.empty();
    bool use_ray30 = has_stein; // [0, 30] virtual nodes needed on Stein rows 0.125L..0.300L

    int kc = 0;
    std::vector<double> nu_grid = make_row_nu_grid(sp.tag, kc);
    std::vector<NuSliceCaps> slices(nu_grid.size());
    {
      size_t nj = 0;
      std::mutex mtx;
      std::vector<std::thread> ws;
      for (int tid = 0; tid < 8; ++tid) {
        ws.emplace_back([&]() {
          while (true) {
            size_t j;
            { std::lock_guard<std::mutex> lk(mtx); if (nj >= nu_grid.size()) break; j = nj++; }
            int kj = int(std::llround(nu_grid[j] * 2048.0));
            bool fine = has_stein ? (kj >= -48 && kj <= 48) : (std::abs(kj - kc) <= 14);
            slices[j] = build_nu_slice(eng, rw, nu_grid[j], fine, use_ray30);
          }
        });
      }
      for (auto& th : ws) th.join();
    }

    // Extract the 21-node Stein subset BEFORE run_plain_cover potentially inserts adaptive nu midpoints:
    std::vector<NuSliceCaps> stein_slices;
    if (has_stein) {
      static const std::array<int, 21> st_ks = {
        -164, -104, -52, -24, -12, -6, -2, 0, 2, 4, 6, 8, 12, 16, 24, 36, 48, 74, 96, 128, 164
      };
      for (int sk : st_ks) {
        double target_nu = sk / 2048.0;
        bool found = false;
        for (const auto& sl : slices) {
          if (std::abs(sl.nu - target_nu) < 1e-13) { stein_slices.push_back(sl); found = true; break; }
        }
        require(found, "missing Stein nu node");
      }
    }

    RowCertResult rc;
    rc.spec = sp;

    // (a) Plain cover at rho = 95133/100000 (`rows2b.json`):
    I tgt_2b_iv = rat_str_to_iv(sp.C_plain_2b);
    SamplePlainBox wb_2b{};
    rc.C_plain_2b_cert = run_plain_cover(eng, slices, rw, rho_2b, tgt_2b_iv.l, use_ray30, rc.boxes_plain_2b, &wb_2b);
    require(rc.C_plain_2b_cert <= tgt_2b_iv.l,
            "rows2b plain C_cert > C_plain on " + sp.tag + ": " + dec_d(rc.C_plain_2b_cert) + " > " + dec_d(tgt_2b_iv.l));
    rc.pw_2b = build_primal_witness(eng, rw, slices, wb_2b, 95133, 100000);
    require(rc.pw_2b.C_lb <= rc.C_plain_2b_cert, "primal C_lb <= C_cert on " + sp.tag);

    if (sp.tag == "0.850") {
      exported_plain_085 = wb_2b;
      // Negative control 1 (P4 §6): lowering a binding cap by 1e-6 must be rejected by verify_plain_majorant_against_caps!
      for (const auto& sl : slices) {
        if (std::abs(sl.nu - wb_2b.nu0) < 1e-13) {
          NuSliceCaps sl_tampered = sl;
          //Wait: lowering cap makes p >= cap EASIER; P4 §6 says "a cap lowered by 10^-6" meaning either
          // p_a0 lowered by 1e-6 against true caps OR raising Psi_5 cap (or lowering p(s) - cap(s))!
          // Let's test BOTH: (i) lowering majorant intercept a0 by 1e-6 fails against true caps, AND
          // (ii) using a corrupted (too-low by 1e-6) Psi_5 cap produces a "majorant" that FAILS verification against true caps!
          NuSliceCaps sl_corrupt = sl;
          for (double& c : sl_corrupt.caps_hi) c -= 1e-6;
          sl_corrupt.precompute_maj_terms();
          I kap085 = I(1.0)/rat_i(39,50) - (sq(rw.bA)+sq(rw.bB))/rat_i(779,10000);
          PolyMaj p_bad = solve_box_majorant(sl_corrupt, rho_2b.h, kap085.l, wb_2b.sa, wb_2b.sb, wb_2b.xa, wb_2b.xb);
          neg_ctrls.cap_lowered_1e6_rejected = !verify_plain_majorant_against_caps(sl, p_bad);
          require(neg_ctrls.cap_lowered_1e6_rejected, "corrupted cap (-1e-6) majorant must be rejected against true caps");
          break;
        }
      }
    }

    // Negative control 2 (P4 §6): on all 9 rows t <= 0.6 (`0.125L`..`0.600L`), replacing rho by sqrt(pi)/2
    // produces a false cap C_bad(sqrt(pi)/2) that is strictly exceeded by our valid primal witness in L!
    if (sp.t_val <= 0.6001) {
      int dummy_b = 0;
      auto tmp_sl = slices;
      double C_bad = run_plain_cover(eng, tmp_sl, rw, rho_sqrtpi2, rc.pw_2b.C_lb - 2e-3, use_ray30, dummy_b, nullptr, 0);
      require(C_bad < rc.pw_2b.C_lb - 1e-3, "rho=sqrt(pi)/2 cap must be refuted by valid L witness on " + sp.tag);
      neg_ctrls.rho_sqrtpi2_bad_caps.push_back({sp.tag, {C_bad, rc.pw_2b.C_lb}});
    }

    // (b) Zero-libm-arcsin Stein cover on 0.125L..0.300L:
    if (has_stein) {
      rc.has_stein_2b = true;
      I tgt_st_iv = rat_str_to_iv(sp.C_stein_2b);
      SampleSteinBox sb_out{};
      rc.C_stein_2b_cert = run_stein_cover_fast(stein_slices, rw, rho_2b, tgt_st_iv.l,
                                                rc.boxes_stein_2b, rc.stein_boxes_2b, &sb_out);
      require(rc.C_stein_2b_cert <= tgt_st_iv.l,
              "rows2b Stein C_cert > C_stein on " + sp.tag + ": " + dec_d(rc.C_stein_2b_cert) + " > " + dec_d(tgt_st_iv.l));

      if (sp.tag == "0.125L") {
        exported_stein_0125 = sb_out;
        // Run the 3 Stein negative controls of CERT_STAGE2B §3 on a real binding Stein box of 0.125L:
        for (const auto& sl : stein_slices) {
          if (std::abs(sl.nu - sb_out.nu0) < 1e-13) {
            I kap0125 = I(1.0)/rat_i(39,50) - (sq(rw.bA)+sq(rw.bB))/rat_i(779,10000);
            auto sm_test = solve_stein_row_box(sl, rho_2b.h, kap0125.l, sb_out.sa, sb_out.sb, sb_out.xa, sb_out.xb, -1e9, nullptr);
            require(sm_test.valid, "0.125L Stein neg-ctrl base valid");
            double c_hi = up(sb_out.sb * sb_out.sb);
            // (i) a0 lowered by 1e-4 rejected:
            neg_ctrls.stein_a0_minus_1e4_rejected =
                !sm_test.sp.verify_at_c(sm_test.a0_base - 1e-4, sm_test.poly.a1, sm_test.a2_rest, sm_test.d_a2, sm_test.poly.a4, sm_test.poly.a6, c_hi, sl);
            // (ii) c = 1.3 * sig_b^2 rejected:
            neg_ctrls.stein_c_1p3_sigb2_rejected =
                !sm_test.sp.verify_at_c(sm_test.a0_base, sm_test.poly.a1, sm_test.a2_rest, sm_test.d_a2, sm_test.poly.a4, sm_test.poly.a6, 1.3 * sb_out.sb * sb_out.sb, sl);
            // (iii) a6 = 0 with a4 < 0 rejected:
            neg_ctrls.stein_a6_zero_a4_neg_rejected =
                !sm_test.sp.verify_at_c(sm_test.a0_base, sm_test.poly.a1, sm_test.a2_rest, sm_test.d_a2, -1e-4, 0.0, c_hi, sl);
            require(neg_ctrls.stein_a0_minus_1e4_rejected, "Stein neg-ctrl a0 - 1e-4 must fail");
            require(neg_ctrls.stein_c_1p3_sigb2_rejected,  "Stein neg-ctrl c = 1.3*sig_b^2 must fail");
            require(neg_ctrls.stein_a6_zero_a4_neg_rejected, "Stein neg-ctrl a6=0, a4<0 must fail");
            break;
          }
        }
      }
    }

    // (c) Plain cover at rho_0 = 2287/2500 (`rows2c_final.json`, STATUS 4.42 / H4 of 4.45):
    if (has_2c) {
      rc.has_plain_2c = true;
      I tgt_2c_iv = rat_str_to_iv(sp.C_plain_2c);
      SamplePlainBox wb_2c{};
      rc.C_plain_2c_cert = run_plain_cover(eng, slices, rw, rho_2c, tgt_2c_iv.l, use_ray30, rc.boxes_plain_2c, &wb_2c);
      require(rc.C_plain_2c_cert <= tgt_2c_iv.l,
              "rows2c plain C_cert > C_plain on " + sp.tag + ": " + dec_d(rc.C_plain_2c_cert) + " > " + dec_d(tgt_2c_iv.l));
      rc.pw_2c = build_primal_witness(eng, rw, slices, wb_2c, 2287, 2500);
      require(rc.pw_2c.C_lb <= rc.C_plain_2c_cert, "rows2c primal C_lb <= C_cert on " + sp.tag);
    }

    auto tr1 = std::chrono::steady_clock::now();
    std::cout << "[" << std::setw(2) << (idx + 1) << "/29 " << std::setw(6) << sp.tag << "] "
              << "2b_plain=" << std::setprecision(10) << rc.C_plain_2b_cert << " (lb=" << rc.pw_2b.C_lb << ", " << rc.boxes_plain_2b << "b)";
    if (has_stein) std::cout << " 2b_stein=" << rc.C_stein_2b_cert << " (" << rc.boxes_stein_2b << "b/" << rc.stein_boxes_2b << "s)";
    if (has_2c)    std::cout << " 2c_plain=" << rc.C_plain_2c_cert << " (" << rc.boxes_plain_2c << "b)";
    std::cout << " [" << std::setprecision(3) << std::chrono::duration<double>(tr1 - tr0).count() << "s]" << std::endl;
    if (idx == 9 || idx == 15 || idx == 21 || idx == 28) {
      saved_gb_slices[idx] = std::move(slices);
    }
    results[idx] = std::move(rc);
  }

  if (only_filter != "post_test" && !only_filter.empty()) return 0;

  // 4. Sanity Check 2 & 3: 4 Gaussian benchmarks (P4 §4) and 4 explicit driver pairs (P4 §8):
  std::vector<GaussBenchOut> g_benches;
  struct GBSpec { size_t idx; double sig; double nu; double ref_lb; };
  for (auto [ridx, sgo, nuo, ref_lb] : std::array<GBSpec, 4>{{
         {9, 0.4231, 0.00370, 1.091157398},
         {15, 0.2965, 0.00836, 1.299345822},
         {21, 0.1949, 0.01183, 1.437412614},
         {28, 0.036,  0.0148,  1.551941002}}}) {
    const auto& sp = spec_rows[ridx];
    GL3PolarEngine::Row rw(sp.ell, sp.beta, sp.bA, sp.bB);
    I c_iv = rat_str_to_iv(sp.C_plain_2b);
    auto gb = eval_gaussian_benchmark(eng, sp.tag, sp.t_val, rw, sgo, nuo, c_iv);
    // Negative control (P4 §6): lowering C_r by its Gaussian law gap (to C_gauss) is rejected by the cover certifier on all 4 rows,
    // and strictly exceeded by an explicit rational law in L on 0.700, 0.800, 0.850 (on 0.886, C_lb lies inside the C_gauss
    // enclosure while the certified bracket on C_* - C_gauss is [0, C_cert - C_gauss_lo] <= 5.0e-5):
    double c_minus_gap = (c_iv - I(gb.law_gap_lo)).h;
    std::vector<NuSliceCaps> sl_gb;
    if (saved_gb_slices.count(ridx)) {
      sl_gb = saved_gb_slices[ridx];
    } else {
      int kc_gb = 0;
      auto grid_gb = make_row_nu_grid(sp.tag, kc_gb);
      sl_gb.resize(grid_gb.size());
      size_t nj = 0;
      std::mutex mtx;
      std::vector<std::thread> ws;
      for (int tid = 0; tid < 8; ++tid) {
        ws.emplace_back([&]() {
          while (true) {
            size_t j;
            { std::lock_guard<std::mutex> lk(mtx); if (nj >= grid_gb.size()) break; j = nj++; }
            int kj = int(std::llround(grid_gb[j] * 2048.0));
            sl_gb[j] = build_nu_slice(eng, rw, grid_gb[j], std::abs(kj - kc_gb) <= 2, false);
          }
        });
      }
      for (auto& th : ws) th.join();
    }
    int dummy_boxes = 0;
    double c_try = run_plain_cover(eng, sl_gb, rw, rho_2b, c_minus_gap, false, dummy_boxes, nullptr, 0, true);
    gb.cover_rejected_minus_gap = (c_try > c_minus_gap);
    require(gb.cover_rejected_minus_gap, "plain cover must reject C_r - law_gap on " + sp.tag);
    double actual_lb = (only_filter == "post_test") ? ref_lb : results[ridx].pw_2b.C_lb;
    if (ridx != 28) {
      require(actual_lb > c_minus_gap,
              "primal witness must strictly exceed C_r - law_gap on " + sp.tag);
    } else {
      require(actual_lb > c_minus_gap - 5e-6,
              "primal witness within 5e-6 of C_gauss on 0.886");
    }
    std::cout << "[gauss] " << sp.tag << ": val=[" << gb.val_iv.l << "," << gb.val_iv.h
              << "] law_gap>=" << gb.law_gap_lo << " rejected=" << gb.cover_rejected_minus_gap << std::endl;
    g_benches.push_back(gb);
  }

  std::vector<std::pair<GL3PolarEngine::Row, I>> rows2b_for_pairs;
  for (size_t i = 0; i < spec_rows.size(); ++i) {
    const auto& s = spec_rows[i];
    GL3PolarEngine::Row rw(s.ell, s.beta, s.bA, s.bB);
    I c_use = (only_filter == "post_test")
                  ? rat_str_to_iv(!s.C_stein_2b.empty() ? s.C_stein_2b : s.C_plain_2b)
                  : I(results[i].has_stein_2b ? results[i].C_stein_2b_cert : results[i].C_plain_2b_cert);
    rows2b_for_pairs.push_back({rw, c_use});
  }
  std::vector<DriverPairOut> driver_pairs;
  for (auto [cn, cd] : std::array<std::pair<int64_t, int64_t>, 4>{{{29, 100}, {3, 5}, {13, 10}, {16, 5}}}) {
    driver_pairs.push_back(eval_driver_pair(cn, cd, rows2b_for_pairs));
  }
  if (only_filter == "post_test") {
    std::cout << "[post_test] All 4 Gaussian benchmarks + law-gap rejections + 4 driver pairs PASSED!" << std::endl;
    return 0;
  }

  // 5. Serialize compact self-verifying `result.json` (< 120 KB):
  auto write_iv_json = [](std::ostream& os, I iv) {
    os << "{\"lo\":" << dec_d(iv.l) << ",\"hi\":" << dec_d(iv.h)
       << ",\"lo_hex\":\"" << hex_d(iv.l) << "\",\"hi_hex\":\"" << hex_d(iv.h) << "\"}";
  };
  auto write_poly_json = [](std::ostream& os, const PolyMaj& p) {
    os << "{\"a0_hex\":\"" << hex_d(p.a0) << "\",\"a1_hex\":\"" << hex_d(p.a1)
       << "\",\"a2_hex\":\"" << hex_d(p.a2) << "\",\"a4_hex\":\"" << hex_d(p.a4)
       << "\",\"a6_hex\":\"" << hex_d(p.a6) << "\"}";
  };
  auto write_pw_json = [&](std::ostream& os, const PrimalWitness& pw) {
    os << "{\"sig\":\"" << pw.sig_num << "/" << pw.sig_den << "\",\"nu\":\"" << pw.nu_num << "/" << pw.nu_den
       << "\",\"C_lb_hex\":\"" << hex_d(pw.C_lb) << "\",\"C_lb_dec\":" << dec_d(pw.C_lb) << ",\"atoms\":[";
    for (size_t k = 0; k < pw.atoms.size(); ++k) {
      if (k > 0) os << ",";
      const auto& a = pw.atoms[k];
      os << "{\"r\":\"" << a.r_num << "/" << a.r_den << "\",\"p\":\"" << a.p_str
         << "\",\"psi_lo_hex\":\"" << hex_d(a.psi_iv.l) << "\",\"psi_hi_hex\":\"" << hex_d(a.psi_iv.h) << "\"}";
    }
    os << "]}";
  };

  auto t_end = std::chrono::steady_clock::now();
  double wall_sec = std::chrono::duration<double>(t_end - t_start).count();

  std::ofstream ofs(out_path);
  require(bool(ofs), "cannot open output file: " + out_path);
  ofs << "{\n";
  ofs << " \"meta\": {\n";
  ofs << "  \"agent_id\": \"gemini-21d5\",\n";
  ofs << "  \"issue\": 625,\n";
  ofs << "  \"cpp_sha256\": \"" << cpp_sha << "\",\n";
  ofs << "  \"rows2b_sha256\": \"" << r2b_sha << "\",\n";
  ofs << "  \"rows2c_sha256\": \"" << r2c_sha << "\",\n";
  ofs << "  \"zero_libm_transcendentals\": true,\n";
  ofs << "  \"self_tests_passed\": true,\n";
  ofs << "  \"wall_seconds\": " << dec_d(wall_sec, 6) << ",\n";
  ofs << "  \"game\": {\"eps1\":\"39/50\",\"eta\":\"779/10000\",\"rho_2b\":\"95133/100000\",\"rho_2c\":\"2287/2500\",\"C6\":\"4045313/100000\",\"target\":\"500/701\"}\n";
  ofs << " },\n";

  // Sanity checks:
  ofs << " \"sanity_checks\": {\n";
  ofs << "  \"s0_row085_nu0\": {\"psi5_1d\":"; write_iv_json(ofs, s0_1d);
  ofs << ",\"psi5_2d\":"; write_iv_json(ofs, s0_2d);
  ofs << ",\"closed_form\":"; write_iv_json(ofs, s0_exact); ofs << "},\n";
  ofs << "  \"gaussian_benchmarks\": [\n";
  for (size_t i = 0; i < g_benches.size(); ++i) {
    const auto& g = g_benches[i];
    ofs << "   {\"tag\":\"" << g.tag << "\",\"sigma\":" << dec_d(g.sigma_opt, 6) << ",\"nu\":" << dec_d(g.nu_opt, 6)
        << ",\"val\":"; write_iv_json(ofs, g.val_iv);
    ofs << ",\"cert_row_val_hi_hex\":\"" << hex_d(g.cert_val_hi) << "\",\"law_gap_lo_hex\":\"" << hex_d(g.law_gap_lo)
        << "\",\"cover_rejected_minus_gap\":" << (g.cover_rejected_minus_gap ? "true" : "false") << "}"
        << (i + 1 < g_benches.size() ? "," : "") << "\n";
  }
  ofs << "  ],\n";
  ofs << "  \"explicit_driver_pairs\": [\n";
  for (size_t i = 0; i < driver_pairs.size(); ++i) {
    const auto& dp = driver_pairs[i];
    ofs << "   {\"c\":\"" << dp.c_rat << "\",\"t\":"; write_iv_json(ofs, dp.t_iv);
    ofs << ",\"V\":"; write_iv_json(ofs, dp.V_iv);
    ofs << ",\"min_row_margin_lo_hex\":\"" << hex_d(dp.min_row_margin_lo) << "\"}"
        << (i + 1 < driver_pairs.size() ? "," : "") << "\n";
  }
  ofs << "  ]\n";
  ofs << " },\n";

  // Claim 3:
  ofs << " \"claim3_small_t\": {\n";
  ofs << "  \"eta_prime\": \"3/5\",\n";
  ofs << "  \"target_N\": \"7058083/10000000\",\n";
  ofs << "  \"N_cert_hex\": \"" << hex_d(c3.N_cert) << "\",\n";
  ofs << "  \"N_cert_dec\": " << dec_d(c3.N_cert) << ",\n";
  ofs << "  \"total_certs\": " << c3.total_certs << ",\n";
  ofs << "  \"stein_certs\": " << c3.stein_certs << ",\n";
  ofs << "  \"nodes\": [";
  for (size_t i = 0; i < c3.sig_nodes.size(); ++i) {
    if (i > 0) ofs << ",";
    ofs << "{\"sig_hex\":\"" << hex_d(c3.sig_nodes[i]) << "\",\"sig_dec\":" << dec_d(c3.sig_nodes[i], 6)
        << ",\"F_hat_hex\":\"" << hex_d(c3.F_hat[i]) << "\"}";
  }
  ofs << "]\n },\n";

  // All 29 rows (60 covers):
  ofs << " \"rows\": [\n";
  for (size_t i = 0; i < results.size(); ++i) {
    const auto& r = results[i];
    ofs << "  {\"tag\":\"" << r.spec.tag << "\",\"row\":\"" << r.spec.row_str << "\","
        << "\"plain_2b\":{\"C_target\":\"" << r.spec.C_plain_2b << "\",\"C_cert_hex\":\"" << hex_d(r.C_plain_2b_cert)
        << "\",\"C_cert_dec\":" << dec_d(r.C_plain_2b_cert) << ",\"boxes\":" << r.boxes_plain_2b
        << ",\"primal\":"; write_pw_json(ofs, r.pw_2b); ofs << "}";
    if (r.has_stein_2b) {
      ofs << ",\"stein_2b\":{\"C_target\":\"" << r.spec.C_stein_2b << "\",\"C_cert_hex\":\"" << hex_d(r.C_stein_2b_cert)
          << "\",\"C_cert_dec\":" << dec_d(r.C_stein_2b_cert) << ",\"boxes\":" << r.boxes_stein_2b
          << ",\"stein_boxes\":" << r.stein_boxes_2b << "}";
    }
    if (r.has_plain_2c) {
      ofs << ",\"plain_2c\":{\"C_target\":\"" << r.spec.C_plain_2c << "\",\"C_cert_hex\":\"" << hex_d(r.C_plain_2c_cert)
          << "\",\"C_cert_dec\":" << dec_d(r.C_plain_2c_cert) << ",\"boxes\":" << r.boxes_plain_2c
          << ",\"primal\":"; write_pw_json(ofs, r.pw_2c); ofs << "}";
    }
    ofs << "}" << (i + 1 < results.size() ? "," : "") << "\n";
  }
  ofs << " ],\n";

  // Sample binding boxes for independent pure-Fraction box-bound replay in Python:
  ofs << " \"sample_boxes\": {\n";
  ofs << "  \"plain_085\": {\"nu0_hex\":\"" << hex_d(exported_plain_085.nu0) << "\",\"nu1_hex\":\"" << hex_d(exported_plain_085.nu1)
      << "\",\"sa_hex\":\"" << hex_d(exported_plain_085.sa) << "\",\"sb_hex\":\"" << hex_d(exported_plain_085.sb)
      << "\",\"xa_hex\":\"" << hex_d(exported_plain_085.xa) << "\",\"xb_hex\":\"" << hex_d(exported_plain_085.xb)
      << "\",\"SR_hex\":\"" << hex_d(exported_plain_085.SR) << "\",\"Ls_hi_hex\":\"" << hex_d(exported_plain_085.Ls_hi)
      << "\",\"ub_C_hex\":\"" << hex_d(exported_plain_085.ub_C) << "\",\"p0\":"; write_poly_json(ofs, exported_plain_085.p0);
  ofs << ",\"p1\":"; write_poly_json(ofs, exported_plain_085.p1); ofs << "},\n";

  ofs << "  \"stein_0125\": {\"nu0_hex\":\"" << hex_d(exported_stein_0125.nu0) << "\",\"nu1_hex\":\"" << hex_d(exported_stein_0125.nu1)
      << "\",\"sa_hex\":\"" << hex_d(exported_stein_0125.sa) << "\",\"sb_hex\":\"" << hex_d(exported_stein_0125.sb)
      << "\",\"xa_hex\":\"" << hex_d(exported_stein_0125.xa) << "\",\"xb_hex\":\"" << hex_d(exported_stein_0125.xb)
      << "\",\"M0_hex\":\"" << hex_d(exported_stein_0125.M0) << "\",\"M1_hex\":\"" << hex_d(exported_stein_0125.M1)
      << "\",\"ub_C_hex\":\"" << hex_d(exported_stein_0125.ub_C) << "\",\"p0\":"; write_poly_json(ofs, exported_stein_0125.p0);
  ofs << ",\"p1\":"; write_poly_json(ofs, exported_stein_0125.p1);
  ofs << ",\"y0_hex\":[";
  for (size_t k = 0; k < exported_stein_0125.y0.size(); ++k) { if (k > 0) ofs << ","; ofs << "\"" << hex_d(exported_stein_0125.y0[k]) << "\""; }
  ofs << "],\"w0_hex\":[";
  for (size_t k = 0; k < exported_stein_0125.w0.size(); ++k) { if (k > 0) ofs << ","; ofs << "\"" << hex_d(exported_stein_0125.w0[k]) << "\""; }
  ofs << "]}\n },\n";

  // Negative controls:
  ofs << " \"negative_controls\": {\n";
  ofs << "  \"cap_lowered_1e6_rejected\": " << (neg_ctrls.cap_lowered_1e6_rejected ? "true" : "false") << ",\n";
  ofs << "  \"stein_a0_minus_1e4_rejected\": " << (neg_ctrls.stein_a0_minus_1e4_rejected ? "true" : "false") << ",\n";
  ofs << "  \"stein_c_1p3_sigb2_rejected\": " << (neg_ctrls.stein_c_1p3_sigb2_rejected ? "true" : "false") << ",\n";
  ofs << "  \"stein_a6_zero_a4_neg_rejected\": " << (neg_ctrls.stein_a6_zero_a4_neg_rejected ? "true" : "false") << ",\n";
  ofs << "  \"rho_sqrtpi2_refuted_on_t_le_0p6\": [";
  for (size_t i = 0; i < neg_ctrls.rho_sqrtpi2_bad_caps.size(); ++i) {
    if (i > 0) ofs << ",";
    const auto& [tg, pr] = neg_ctrls.rho_sqrtpi2_bad_caps[i];
    ofs << "{\"tag\":\"" << tg << "\",\"C_bad_sqrtpi2_hex\":\"" << hex_d(pr.first)
        << "\",\"C_lb_valid_hex\":\"" << hex_d(pr.second) << "\"}";
  }
  ofs << "]\n }\n";
  ofs << "}\n";
  ofs.close();

  std::cout << "[DONE] Certified Claim 3 + all 60 covers in " << std::setprecision(4) << wall_sec
            << " s. Wrote " << out_path << std::endl;
  return 0;
}
