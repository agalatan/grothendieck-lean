# P1. The first-chaos content of a cubic chaos element against its fourth cumulant, per cell of energy and fourth excess

**Summary.** For q in the complex Wick chaos H₂,₁ (any dimension) and an explicit radial profile h, bound the first
chaos part of q·h(|q|²) by θ·δ·Ω̂[h], where δ is the fourth cumulant of |q|, Ω̂ a functional of the law of |q|, and θ a
given allowance, and only for q that satisfy an explicit side condition. Two cases:

- **Case I (§2.0; the one the current certificate design needs).** The allowance θ_j(u, χ) depends on the energy
  u = E|q|² and on the fourth excess χ = δ/u². Seventeen pieces of the design (fourteen profile pairs, with the tilt
  (2/5, 3/20)), each on a band of energies.
- **Case II (§2.1–2.2).** One constant θ_room(u) per energy. Eleven profile pairs with the tilt (2/5, 3/10), on a
  band of energies each. It is the stronger form of the hypothesis; its allowances rest on a margin that is not
  available at that tilt (§2.4).

**The statement is open in both directions.** In Case I the largest ratio found is 2.9 to 22 times below the
allowance of its cell, but only cubics in at most 13 variables were tested there, and the largest ratio found grows
with the number of variables. In Case II the largest ratio found is 1.3 to 12 times below the allowance, and with
the margin that the scans allow at that tilt it is above the allowance on the lowest pieces. A proof, a
counterexample, or a proof on a class that contains the known extremal structures are all wanted.

Source record (not needed to do the work): ledger rows 4.19, 4.28–4.32, 4.43–4.45 and §5 item 2 of
`research/higher-degree/STATUS.md`; for Case I the note
`research/higher-degree/sources/degree5-design-2026-11-25/DESIGN.md` (§4 the design, §5 the theorem in which this
statement is hypothesis H6) with its files under `research/higher-degree/code/degree5-design/design-2026-11-25/`
(written DSGN below); for Case II the problem statement
`research/higher-degree/sources/content-problem-v2-2026-11-16/PROBLEM_V3.md` (longer tables of searches); profile
files under `research/higher-degree/code/degree5-content/` (repository `agalatan/grothendieck-lean`, master). Search
scripts that are not in the repository are copied to
`research/higher-degree/code/degree5-attack/ref/`.

Labels: **P** proved on paper, **C** certified by exact or interval arithmetic, **N** floating point (a search gives
a lower bound of a supremum, never an upper bound); "author only" when nobody but the author has checked it.

---

## 1. Setting and notation

**Gaussian space.** y = (y₁, …, y_n): independent standard complex Gaussians (density π⁻¹e^{−|y|²}; E|y_j|² = 1,
E y_j² = 0). n is arbitrary. ⟨f, g⟩ = E[conj(f)·g].

**Chaos.** H_{a,b} is the closed span of the Wick polynomials of holomorphic degree a and antiholomorphic degree b.
An orthonormal basis of H₂,₁(ℂⁿ): y_i(|y_i|² − 2)/√2; y_i²ȳ_k/√2 (k ≠ i); y_a(|y_b|² − 1) (a ≠ b); y_i y_j ȳ_k (i < j,
k ∉ {i, j}). H₁,₀ is the span of y₁, …, y_n and Π₁ the orthogonal projection onto it.

**The cubic and its scalars.** q ∈ H₂,₁(ℂⁿ) ("remote cubic"). V = |q|², u = E V (the energy),
δ = E V² − 2u² ≥ 0 (the fourth cumulant of the circular variable q), χ = δ/u² ∈ [0, 42] (P; χ = 42 exactly for the
*junta* H(X) = X(|X|² − 2)/√2).

**Profiles and their transforms.** A profile is a real, bounded, continuous h on [0, ∞). With τ ~ Exp(1)
independent of everything:

    k(v) = E h(v + u·τ)        (so k − u·k′ = h, i.e. k′(v) = (k(v) − h(v))/u).

**Content.** c[h] = Π₁[q·h(V)], i.e. the vector with components c_j = E[ȳ_j·q·h(V)]; ‖c[h]‖² = Σ_j|c_j|².

**The law functional** (it depends on q only through the law of V):

    Ω̂[h] = (3/2)·E[V·k′(V)²] − (3/4)·(E[V·k′(V)])²/u.

**Ratio.** r_h(q) = ‖c[h]‖²/(δ·Ω̂[h]); invariant under unitary changes of y.

**The response function.** ρ(x) = E|Z + √x| for a standard complex Gaussian Z:
ρ(x) = (√π/2)·e^{−x/2}·[(1 + x)·I₀(x/2) + x·I₁(x/2)] (modified Bessel functions). ε₁ = 39/50.

### 1.1 The row profiles

A *row* is five real numbers (ℓ, β, b_A, b_B, ν₅). With z a standard complex Gaussian, T = |z|²,
e₁₁ = T − 1, e₂₀ = z²/√2, e₃₂ = z(T² − 6T + 6)/√12 and ph(a) = a/|a|:

    L′(z) = z(ℓ + β(T − 2)) + ν₅·e₃₂(z),    D(z) = 1 − b_A·e₁₁(z) − b_B·e₂₀(z),    A_±(z; s) = L′(z) ± s·D(z)   (s ≥ 0),
    Γ_A(s) = Re E_z[conj(e₁₁)·(ph A₊ − ph A₋)],   Γ_B(s) = Re E_z[conj(e₂₀)·(ph A₊ − ph A₋)],   Γ₀(s) = Re E_z[ph A₊ − ph A₋],
    G_A = Γ_A + σ_A·Γ₀,     G_B = Γ_B + σ_B·Γ₀,     h_X(v) = G_X(√v)/√v     (X = A, B),

with the tilt (σ_A, σ_B) = (2/5, 3/20) in Case I and (2/5, 3/10) in Case II.

So h_A and h_B are explicit two-dimensional integrals; there is no closed form. Tables: each JSON file below has
`row` (the five numbers: keys `l`, `beta`, `bA`, `bB`, `nu5`), `S` (705 amplitudes in [0, 6]), `GA`, `GB`, `G0` (Γ_A,
Γ_B, Γ₀ on `S`), `ustar` (the reference energy u\*), and for the covering rows also the derivatives `dGA`, `dGB`,
`dG0`, the cap `ucap`, `t_lo`, and the list `allowance` (θ_room(u) at 17–19 energies with the binding χ).

- Band rows (six files): `research/higher-degree/code/degree5-content/profiles/band_row_<t>.json`,
  t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855.
- Covering rows (five files): `research/higher-degree/code/degree5-content/profiles_low/band_row_<t>.json`,
  t = 0.70, 0.72, 0.74, 0.76, 0.78. The label is the *piece* of the parameter t that the file serves; the row inside
  is tuned at a larger value (0.79, 0.79, 0.80, 0.81, 0.82).
- **Rows of Case I.** The design uses the rows tuned at 0.74, 0.76, 0.78, 0.79, 0.80, 0.81, 0.82, 0.83, 0.84, 0.845,
  0.85, 0.855, 0.86, 0.865 (and 0.87–0.886, where no bound is asked). Their constants (ℓ, β, b_A, b_B, ν₅) are in the
  table after this list (floating point; files `DSGN/tables/g078/rows_all.lines` and
  `DSGN/tables/g078hi/rows_all.lines`, one JSON object per line). The tables Γ_A, Γ_B, Γ₀ do not depend on the tilt, so the files above serve Case I for the rows they
  contain: the row 0.79 is in `profiles_low/band_row_0.70.json`, 0.80 in `band_row_0.74.json`, 0.81 in
  `band_row_0.76.json`, 0.82 in `band_row_0.78.json` (use `S`, `GA`, `GB`, `G0` and the derivatives only; their fields
  `t_lo`, `ucap`, `allowance`, `mu` belong to Case II). The six band-row files hold rows that differ from the
  design's in the fifth digit. For the rows 0.74, 0.76, 0.78, 0.83, 0.86, 0.865 there is no table in the repository:
  compute the profiles from the definitions.

The rows of Case I (the last column is the rational row of the certificate, which the float row approximates
to 3·10⁻⁵; the profiles of the design are those of the float rows):

| row | ℓ | β | b_A | b_B | ν₅ | rational (ℓ, β, b_A, b_B) of the certificate |
|---|---|---|---|---|---|---|
| 0.74 | 0.6781275617 | 0.0953932705 | −0.0393731320 | −0.0221742450 | 0.0052458663 | 339059/500000, 23849/250000, −39377/1000000, −22177/1000000 |
| 0.76 | 0.7066343986 | 0.1043137728 | −0.0415482538 | −0.0231979308 | 0.0061726497 | 8833/12500, 104313/1000000, −41549/1000000, −4639/200000 |
| 0.78 | 0.7363510125 | 0.1137393945 | −0.0437792082 | −0.0242357469 | 0.0072092911 | 736351/1000000, 5687/50000, −43781/1000000, −24231/1000000 |
| 0.79 | 0.7516941250 | 0.1186447826 | −0.0449189246 | −0.0247617045 | 0.0077710644 | 150341/200000, 118641/1000000, −44931/1000000, −24757/1000000 |
| 0.80 | 0.7673768889 | 0.1236771773 | −0.0460822580 | −0.0252948733 | 0.0083646511 | 767389/1000000, 773/6250, −9217/200000, −25293/1000000 |
| 0.81 | 0.7833928369 | 0.1288444847 | −0.0472555239 | −0.0258320225 | 0.0089889776 | 391689/500000, 128843/1000000, −47249/1000000, −2583/100000 |
| 0.82 | 0.7997734631 | 0.1341438338 | −0.0484518154 | −0.0263775777 | 0.0096464217 | 199939/250000, 26827/200000, −48447/1000000, −1319/50000 |
| 0.83 | 0.8165376104 | 0.1395777828 | −0.0496759046 | −0.0269310092 | 0.0103384386 | 408269/500000, 69789/500000, −24837/500000, −6731/250000 |
| 0.84 | 0.8336645770 | 0.1451519412 | −0.0509133069 | −0.0274951172 | 0.0110647875 | 416837/500000, 145151/1000000, −5091/100000, −3437/125000 |
| 0.845 | 0.8423927726 | 0.1479900406 | −0.0515499607 | −0.0277793267 | 0.0114432938 | 842397/1000000, 147989/1000000, −25777/500000, −27777/1000000 |
| 0.85 | 0.8512127525 | 0.1508655802 | −0.0521827315 | −0.0280674857 | 0.0118303347 | 851203/1000000, 150857/1000000, −1631/31250, −28061/1000000 |
| 0.855 | 0.8601447483 | 0.1537754070 | −0.0528381719 | −0.0283598224 | 0.0122281207 | 860143/1000000, 153779/1000000, −52831/1000000, −14181/500000 |
| 0.86 | 0.8691800158 | 0.1567236782 | −0.0534880794 | −0.0286521564 | 0.0126351334 | 869173/1000000, 31343/200000, −13373/250000, −14321/500000 |
| 0.865 | 0.8783259514 | 0.1597092307 | −0.0541428475 | −0.0289517453 | 0.0130521634 | 878331/1000000, 79853/500000, −54163/1000000, −7239/250000 |

**How to evaluate.** Interpolate `GA + 0.4·G0` (or `GB + σ_B·G0`, σ_B = 0.15 or 0.3) by a cubic spline in s on [0, 6];
beyond s = 6 use the constant G_X(6) (0.787 and 0.615 on the row of the piece 0.70 at the tilt (2/5, 3/10)).
h_X(0) = G_X′(0) (−0.483 for h_A there: h_A is negative near 0, changes sign near s ≈ 0.5 and decays like const/√v). The tables agree with the
definitions to 3·10⁻⁵ (checked for this file on two rows with an independent quadrature). For rigorous work use the
definitions, not the tables.

---

## 2. The statement

### 2.0 Case I: the target per cell (u, χ), tilt (2/5, 3/20)

The design (ledger 4.44; DSGN `ASSEMBLY_CONSTANTS.md`) cuts t ∈ [0.649, 0.886227] into 21 pieces. Piece j has a row
r_j, whose profiles h_A, h_B are taken at the tilt (2/5, 3/20); a lower end t_lo = a_j; the cap
u_cap = 4ε₁²·B·(A − t_lo) with A = 0.88676278, B = 0.432306903 (the tangent ρ(x) ≤ A + Bx inserted in (R1) below); and
an allowance θ_j(u, χ).

> **(T-cell).** For j = 1, …, 17, every n, and every q ∈ H₂,₁(ℂⁿ) with energy u = E|q|² ∈ [0.60·u_cap, 0.92·u_cap] and
> fourth excess χ = δ/u² that satisfies the response restriction
>
>     E ρ(λ²·|q|²) ≥ t_lo + λ·u/ε₁        for all λ > 0,                                               (R1)
>
> and both profiles h ∈ {h_A, h_B} of the row r_j:
>
>     ‖Π₁[q·h(|q|²)]‖² ≤ θ_j(u, χ)·δ(q)·Ω̂[h].

| j | piece of t | row tuned at | t_lo | u_cap | room of the piece | smallest θ_j on the grid (at u/u_cap, χ) | smallest allowance/ratio found, per cell | the same with one constant per energy |
|---|---|---|---|---|---|---|---|---|
| 1 | [0.649, 0.670] | 0.74 | 0.649000 | 0.250141 | 8.3445·10⁻³ | 0.108 (0.70, 42) | 2.87 | 0.84 |
| 2 | [0.670, 0.690] | 0.76 | 0.670000 | 0.228048 | 5.5987·10⁻³ | 0.128 (0.78, 42) | 2.99 | 0.94 |
| 3 | [0.690, 0.710] | 0.76 | 0.690000 | 0.207007 | 6.6643·10⁻³ | 0.142 (0.78, 42) | 3.14 | 0.98 |
| 4 | [0.710, 0.730] | 0.78 | 0.710000 | 0.185965 | 4.1301·10⁻³ | 0.183 (0.78, 42) | 3.18 | 1.11 |
| 5 | [0.730, 0.750] | 0.79 | 0.730000 | 0.164924 | 3.3748·10⁻³ | 0.226 (0.78, 42) | 3.26 | 1.23 |
| 6 | [0.750, 0.770] | 0.80 | 0.750000 | 0.143883 | 2.6430·10⁻³ | 0.290 (0.78, 42) | 3.32 | 1.40 |
| 7 | [0.770, 0.790] | 0.81 | 0.770000 | 0.122842 | 1.9357·10⁻³ | 0.385 (0.85, 24) | 3.38 | 1.66 |
| 8 | [0.790, 0.810] | 0.82 | 0.790000 | 0.101800 | 1.2639·10⁻³ | 0.501 (0.85, 30) | 3.44 | 1.97 |
| 9 | [0.810, 0.814337] | 0.81 | 0.810000 | 0.080759 | 1.1563·10⁻³ | 0.620 (0.85, 36) | 3.54 | 2.13 |
| 10 | [0.814337, 0.824827] | 0.82 | 0.814337 | 0.076197 | 7.4029·10⁻⁴ | 0.705 (0.92, 12) | 3.52 | 2.39 |
| 11 | [0.824827, 0.834856] | 0.83 | 0.824827 | 0.065160 | 4.7347·10⁻⁴ | 0.929 (0.92, 14) | 3.87 | 2.88 |
| 12 | [0.834856, 0.842337] | 0.84 | 0.834856 | 0.054610 | 3.9982·10⁻⁴ | 1.177 (0.92, 16) | 4.24 | 3.19 |
| 13 | [0.842337, 0.847521] | 0.845 | 0.842337 | 0.046739 | 3.7356·10⁻⁴ | 1.642 (0.92, 14) | 5.10 | 4.39 |
| 14 | [0.847521, 0.852400] | 0.85 | 0.847521 | 0.041284 | 3.7356·10⁻⁴ | 2.226 (0.92, 14) | 5.84 | 5.48 |
| 15 | [0.852400, 0.857393] | 0.855 | 0.852400 | 0.036152 | 3.8569·10⁻⁴ | 3.158 (0.92, 12) | 7.29 | 6.77 |
| 16 | [0.857393, 0.863036] | 0.86 | 0.857393 | 0.030899 | 4.3808·10⁻⁴ | 5.101 (0.92, 10) | 10.28 | 9.97 |
| 17 | [0.863036, 0.866656] | 0.865 | 0.863036 | 0.024962 | 5.3919·10⁻⁴ | 12.834 (0.92, 6) | 22.33 | 22.18 |

On the pieces 18–21 (rows 0.87–0.886) the design needs no bound at the grid energies.

**The allowances θ_j(u, χ)** (N; printed by `DSGN/checks/theta_table.py` from `DSGN/tables/fin_table.json`). They are
given at five energies and fifteen values of χ. For χ between two grid values the design takes the value at the
grid value above. Between two grid energies the design fixes nothing; interpolate linearly in u (a convention of
this problem). "-" means that the file has no value: at an energy with other entries, no law of the certificate's
law class with that χ satisfies (R1) there; an energy without a line has no value at all. "none" means that no
bound is needed in the cell. The last column is the largest ratio found at that energy among cubics satisfying (R1)
(§3.1), with its χ.

**Piece 1: t ∈ [0.649000, 0.670000], row tuned at 0.740.** t_lo = 0.649000, u_cap = 0.250141, margin μ = 0.2522, room 8.3445e-03, smallest factor per cell 2.87.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.15008 | 1.701 | 0.897 | 0.633 | 0.501 | 0.369 | 0.301 | 0.259 | 0.231 | 0.210 | 0.195 | 0.173 | 0.158 | 0.141 | 0.129 | 0.122 | 0.145 (1.9) |
| 0.70 | 0.17510 | 1.431 | 0.757 | 0.536 | 0.427 | 0.317 | 0.260 | 0.225 | 0.202 | 0.185 | 0.172 | 0.153 | 0.140 | 0.126 | 0.115 | 0.108 | 0.128 (1.8) |
| 0.78 | 0.19511 | 1.354 | 0.715 | 0.507 | 0.404 | 0.300 | 0.246 | 0.214 | 0.192 | 0.175 | 0.163 | 0.146 | 0.134 | 0.120 | 0.110 | - | 0.115 (1.8) |
| 0.85 | 0.21262 | 1.350 | 0.711 | 0.502 | 0.400 | 0.296 | 0.243 | 0.211 | 0.189 | - | - | - | - | - | - | - | - |

**Piece 2: t ∈ [0.670000, 0.690000], row tuned at 0.760.** t_lo = 0.670000, u_cap = 0.228048, margin μ = 0.2889, room 5.5987e-03, smallest factor per cell 2.99.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.13683 | 1.754 | 0.948 | 0.684 | 0.550 | 0.415 | 0.344 | 0.300 | 0.271 | 0.248 | 0.232 | 0.208 | 0.192 | 0.175 | 0.165 | 0.158 | 0.164 (1.9) |
| 0.70 | 0.15963 | 1.503 | 0.814 | 0.589 | 0.475 | 0.360 | 0.300 | 0.262 | 0.237 | 0.218 | 0.204 | 0.184 | 0.169 | 0.154 | 0.144 | 0.137 | 0.145 (1.9) |
| 0.78 | 0.17788 | 1.449 | 0.773 | 0.563 | 0.453 | 0.343 | 0.285 | 0.249 | 0.225 | 0.207 | 0.194 | 0.175 | 0.161 | 0.145 | 0.134 | 0.128 | 0.132 (1.8) |
| 0.85 | 0.19384 | 1.466 | 0.785 | 0.563 | 0.451 | 0.339 | 0.281 | 0.245 | 0.221 | 0.203 | - | - | - | - | - | - | 0.046 (1.1) |

**Piece 3: t ∈ [0.690000, 0.710000], row tuned at 0.760.** t_lo = 0.690000, u_cap = 0.207007, margin μ = 0.2889, room 6.6643e-03, smallest factor per cell 3.14.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.12420 | 2.396 | 1.270 | 0.900 | 0.709 | 0.525 | 0.428 | 0.369 | 0.329 | 0.297 | 0.277 | 0.249 | 0.229 | 0.208 | 0.195 | 0.184 | 0.176 (1.9) |
| 0.70 | 0.14490 | 1.911 | 1.019 | 0.727 | 0.580 | 0.432 | 0.355 | 0.307 | 0.276 | 0.252 | 0.234 | 0.209 | 0.192 | 0.174 | 0.163 | 0.156 | 0.157 (1.9) |
| 0.78 | 0.16147 | 1.730 | 0.923 | 0.660 | 0.527 | 0.393 | 0.324 | 0.281 | 0.253 | 0.231 | 0.215 | 0.192 | 0.176 | 0.160 | 0.149 | 0.142 | 0.144 (1.9) |
| 0.85 | 0.17596 | 1.661 | 0.884 | 0.631 | 0.504 | 0.376 | 0.309 | 0.268 | 0.241 | 0.221 | 0.206 | - | - | - | - | - | 0.134 (1.8) |

**Piece 4: t ∈ [0.710000, 0.730000], row tuned at 0.780.** t_lo = 0.710000, u_cap = 0.185965, margin μ = 0.3240, room 4.1301e-03, smallest factor per cell 3.18.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.11158 | 2.372 | 1.301 | 0.947 | 0.765 | 0.581 | 0.484 | 0.423 | 0.383 | 0.351 | 0.332 | 0.303 | 0.286 | 0.265 | 0.252 | 0.242 | 0.199 (2.0) |
| 0.70 | 0.13018 | 1.934 | 1.066 | 0.780 | 0.630 | 0.485 | 0.406 | 0.356 | 0.323 | 0.295 | 0.279 | 0.253 | 0.239 | 0.222 | 0.210 | 0.203 | 0.179 (1.9) |
| 0.78 | 0.14505 | 1.792 | 0.985 | 0.719 | 0.580 | 0.446 | 0.373 | 0.328 | 0.297 | 0.272 | 0.256 | 0.231 | 0.216 | 0.201 | 0.190 | 0.183 | 0.164 (1.9) |
| 0.85 | 0.15807 | 1.755 | 0.958 | 0.697 | 0.563 | 0.429 | 0.358 | 0.314 | 0.284 | 0.262 | 0.245 | 0.221 | - | - | - | - | 0.154 (1.9) |

**Piece 5: t ∈ [0.730000, 0.750000], row tuned at 0.790.** t_lo = 0.730000, u_cap = 0.164924, margin μ = 0.3410, room 3.3748e-03, smallest factor per cell 3.26.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.09895 | 2.766 | 1.533 | 1.123 | 0.912 | 0.697 | 0.582 | 0.510 | 0.462 | 0.432 | 0.412 | 0.380 | 0.360 | 0.337 | 0.322 | 0.313 | 0.221 (2.1) |
| 0.70 | 0.11545 | 2.198 | 1.222 | 0.905 | 0.737 | 0.570 | 0.479 | 0.422 | 0.380 | 0.354 | 0.337 | 0.310 | 0.292 | 0.275 | 0.263 | 0.253 | 0.198 (2.0) |
| 0.78 | 0.12864 | 1.996 | 1.107 | 0.820 | 0.668 | 0.516 | 0.435 | 0.383 | 0.348 | 0.320 | 0.303 | 0.278 | 0.261 | 0.246 | 0.235 | 0.226 | 0.184 (2.0) |
| 0.85 | 0.14019 | 1.924 | 1.066 | 0.783 | 0.637 | 0.490 | 0.411 | 0.362 | 0.329 | 0.303 | 0.282 | 0.261 | - | - | - | - | 0.172 (1.9) |
| 0.92 | 0.15173 | 1.912 | 1.049 | - | - | - | - | - | - | - | - | - | - | - | - | - | - |

**Piece 6: t ∈ [0.750000, 0.770000], row tuned at 0.800.** t_lo = 0.750000, u_cap = 0.143883, margin μ = 0.3577, room 2.6430e-03, smallest factor per cell 3.32.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.08633 | 3.253 | 1.822 | 1.350 | 1.098 | 0.849 | 0.712 | 0.627 | 0.582 | 0.549 | 0.526 | 0.489 | 0.466 | 0.446 | 0.430 | 0.419 | 0.247 (2.1) |
| 0.70 | 0.10072 | 2.516 | 1.423 | 1.065 | 0.876 | 0.681 | 0.577 | 0.509 | 0.465 | 0.438 | 0.416 | 0.390 | 0.371 | 0.353 | 0.340 | 0.332 | 0.222 (2.1) |
| 0.78 | 0.11223 | 2.238 | 1.265 | 0.947 | 0.780 | 0.608 | 0.515 | 0.455 | 0.417 | 0.387 | 0.368 | 0.344 | 0.326 | 0.310 | 0.297 | 0.290 | 0.207 (2.0) |
| 0.85 | 0.12230 | 2.119 | 1.192 | 0.890 | 0.728 | 0.568 | 0.481 | 0.425 | 0.388 | 0.359 | 0.339 | 0.317 | 0.301 | - | - | - | 0.195 (2.0) |
| 0.92 | 0.13237 | 2.077 | 1.161 | 0.860 | 0.704 | - | - | - | - | - | - | - | - | - | - | - | - |

**Piece 7: t ∈ [0.770000, 0.790000], row tuned at 0.810.** t_lo = 0.770000, u_cap = 0.122842, margin μ = 0.3740, room 1.9357e-03, smallest factor per cell 3.38.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.07371 | 3.848 | 2.193 | 1.639 | 1.354 | 1.054 | 0.897 | 0.808 | 0.759 | 0.722 | 0.692 | 0.657 | 0.632 | 0.614 | 0.605 | 0.605 | 0.280 (2.2) |
| 0.70 | 0.08599 | 2.891 | 1.679 | 1.264 | 1.054 | 0.831 | 0.708 | 0.630 | 0.591 | 0.561 | 0.539 | 0.511 | 0.492 | 0.474 | 0.464 | 0.459 | 0.252 (2.2) |
| 0.78 | 0.09582 | 2.515 | 1.464 | 1.109 | 0.923 | 0.730 | 0.624 | 0.552 | 0.514 | 0.487 | 0.467 | 0.442 | 0.423 | 0.407 | 0.397 | 0.392 | 0.235 (2.1) |
| 0.85 | 0.10442 | 2.342 | 1.358 | 1.027 | 0.853 | 0.673 | 0.575 | 0.511 | 0.469 | 0.444 | 0.424 | 0.401 | 0.385 | none | - | - | 0.220 (2.1) |
| 0.92 | 0.11301 | 2.250 | 1.300 | 0.978 | 0.809 | 0.635 | - | - | - | - | - | - | - | - | - | - | 0.125 (1.2) |

**Piece 8: t ∈ [0.790000, 0.810000], row tuned at 0.820.** t_lo = 0.790000, u_cap = 0.101800, margin μ = 0.3899, room 1.2639e-03, smallest factor per cell 3.44.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.06108 | 4.511 | 2.669 | 2.029 | 1.688 | 1.334 | 1.165 | 1.080 | 1.029 | 0.989 | 0.962 | 0.927 | 0.907 | 0.907 | 0.924 | 0.965 | 0.317 (2.2) |
| 0.70 | 0.07126 | 3.286 | 1.976 | 1.528 | 1.286 | 1.033 | 0.887 | 0.819 | 0.780 | 0.749 | 0.727 | 0.700 | 0.683 | 0.673 | 0.673 | 0.686 | 0.291 (2.2) |
| 0.78 | 0.07940 | 2.798 | 1.691 | 1.311 | 1.107 | 0.893 | 0.773 | 0.700 | 0.665 | 0.637 | 0.617 | 0.593 | 0.577 | 0.566 | 0.560 | 0.563 | 0.269 (2.2) |
| 0.85 | 0.08653 | 2.558 | 1.536 | 1.195 | 1.008 | 0.813 | 0.702 | 0.632 | 0.598 | 0.574 | 0.552 | 0.529 | 0.513 | 0.501 | - | - | 0.255 (2.2) |
| 0.92 | 0.09366 | 2.429 | 1.450 | 1.121 | 0.943 | 0.758 | 0.652 | - | - | - | - | - | - | - | - | - | 0.243 (2.1) |

**Piece 9: t ∈ [0.810000, 0.814337], row tuned at 0.810.** t_lo = 0.810000, u_cap = 0.080759, margin μ = 0.3740, room 1.1563e-03, smallest factor per cell 3.54.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.04846 | 8.653 | 4.802 | 3.486 | 2.852 | 2.273 | 1.975 | 1.786 | 1.682 | 1.603 | 1.544 | 1.483 | 1.455 | 1.477 | 1.551 | 1.769 | 0.359 (2.2) |
| 0.70 | 0.05653 | 5.356 | 3.081 | 2.299 | 1.890 | 1.484 | 1.297 | 1.182 | 1.119 | 1.071 | 1.032 | 0.989 | 0.965 | 0.955 | 0.967 | 1.006 | 0.327 (2.2) |
| 0.78 | 0.06299 | 3.904 | 2.310 | 1.760 | 1.458 | 1.162 | 1.009 | 0.923 | 0.876 | 0.842 | 0.811 | 0.778 | 0.757 | 0.745 | 0.745 | 0.758 | 0.307 (2.2) |
| 0.85 | 0.06865 | 3.115 | 1.879 | 1.453 | 1.224 | 0.985 | 0.844 | 0.777 | 0.738 | 0.707 | 0.685 | 0.657 | 0.639 | 0.628 | 0.620 | - | 0.292 (2.2) |
| 0.92 | 0.07430 | 2.588 | 1.586 | 1.243 | 1.056 | 0.858 | 0.746 | 0.676 | 0.644 | - | - | - | - | - | - | - | 0.277 (2.2) |

**Piece 10: t ∈ [0.814337, 0.824827], row tuned at 0.820.** t_lo = 0.814337, u_cap = 0.076197, margin μ = 0.3899, room 7.4029e-04, smallest factor per cell 3.52.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.04572 | 7.388 | 4.285 | 3.214 | 2.653 | 2.181 | 1.931 | 1.799 | 1.728 | 1.664 | 1.627 | 1.604 | 1.604 | 1.694 | 1.881 | 2.791 | 0.377 (2.6) |
| 0.70 | 0.05334 | 4.590 | 2.788 | 2.157 | 1.818 | 1.469 | 1.318 | 1.225 | 1.177 | 1.141 | 1.115 | 1.092 | 1.081 | 1.102 | 1.147 | 1.234 | 0.340 (2.2) |
| 0.78 | 0.05943 | 3.406 | 2.137 | 1.687 | 1.442 | 1.180 | 1.040 | 0.976 | 0.940 | 0.912 | 0.891 | 0.871 | 0.861 | 0.865 | 0.885 | 0.922 | 0.324 (2.2) |
| 0.85 | 0.06477 | 2.778 | 1.772 | 1.425 | 1.228 | 1.019 | 0.893 | 0.835 | 0.803 | 0.779 | 0.761 | 0.743 | 0.731 | 0.731 | 0.741 | none | 0.306 (2.2) |
| 0.92 | 0.07010 | 2.382 | 1.546 | 1.249 | 1.082 | 0.904 | 0.792 | 0.736 | 0.705 | - | - | - | - | - | - | - | 0.294 (2.2) |

**Piece 11: t ∈ [0.824827, 0.834856], row tuned at 0.830.** t_lo = 0.824827, u_cap = 0.065160, margin μ = 0.4055, room 4.7347e-04, smallest factor per cell 3.87.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.03910 | 8.554 | 5.096 | 3.880 | 3.322 | 2.825 | 2.565 | 2.432 | 2.372 | 2.323 | 2.323 | 2.379 | 2.521 | 3.208 | none | none | 0.416 (2.2) |
| 0.70 | 0.04561 | 5.278 | 3.286 | 2.618 | 2.237 | 1.865 | 1.723 | 1.643 | 1.605 | 1.577 | 1.562 | 1.570 | 1.604 | 1.734 | 2.026 | none | 0.381 (2.2) |
| 0.78 | 0.05082 | 3.912 | 2.551 | 2.057 | 1.782 | 1.492 | 1.364 | 1.303 | 1.273 | 1.249 | 1.232 | 1.232 | 1.249 | 1.310 | 1.417 | 1.647 | 0.359 (2.2) |
| 0.85 | 0.05539 | 3.187 | 2.125 | 1.743 | 1.524 | 1.284 | 1.162 | 1.109 | 1.083 | 1.062 | 1.045 | 1.045 | 1.045 | 1.083 | 1.145 | none | 0.340 (2.2) |
| 0.92 | 0.05995 | 2.750 | 1.861 | 1.532 | 1.341 | 1.138 | 1.022 | 0.972 | 0.948 | 0.929 | - | - | - | - | - | - | 0.323 (2.2) |

**Piece 12: t ∈ [0.834856, 0.842337], row tuned at 0.840.** t_lo = 0.834856, u_cap = 0.054610, margin μ = 0.4208, room 3.9982e-04, smallest factor per cell 4.24.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.03277 | 11.00 | 6.511 | 5.034 | 4.366 | 3.695 | 3.366 | 3.201 | 3.120 | 3.078 | 3.094 | 3.221 | 3.564 | none | none | none | 0.462 (3.1) |
| 0.70 | 0.03823 | 6.942 | 4.303 | 3.358 | 2.861 | 2.433 | 2.253 | 2.150 | 2.092 | 2.048 | 2.048 | 2.077 | 2.152 | 2.422 | none | none | 0.425 (2.9) |
| 0.78 | 0.04260 | 5.234 | 3.327 | 2.651 | 2.283 | 1.911 | 1.774 | 1.696 | 1.651 | 1.625 | 1.610 | 1.610 | 1.642 | 1.746 | 2.006 | none | 0.373 (4.5) |
| 0.85 | 0.04642 | 4.305 | 2.799 | 2.250 | 1.952 | 1.636 | 1.502 | 1.436 | 1.396 | 1.371 | 1.348 | 1.348 | 1.367 | 1.429 | 1.555 | none | 0.385 (2.7) |
| 0.92 | 0.05024 | 3.707 | 2.439 | 1.974 | 1.720 | 1.426 | 1.311 | 1.251 | 1.216 | 1.192 | 1.177 | - | - | - | - | - | 0.369 (2.6) |

**Piece 13: t ∈ [0.842337, 0.847521], row tuned at 0.845.** t_lo = 0.842337, u_cap = 0.046739, margin μ = 0.4283, room 3.7356e-04, smallest factor per cell 5.10.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.02804 | 15.74 | 9.443 | 7.431 | 6.447 | 5.430 | 5.026 | 4.836 | 4.785 | 4.810 | 4.982 | 6.130 | none | none | none | none | 0.504 (3.5) |
| 0.70 | 0.03272 | 9.885 | 5.958 | 4.646 | 4.062 | 3.485 | 3.243 | 3.113 | 3.044 | 3.044 | 3.060 | 3.230 | 3.623 | none | none | none | 0.463 (3.2) |
| 0.78 | 0.03646 | 7.304 | 4.578 | 3.585 | 3.097 | 2.672 | 2.495 | 2.396 | 2.332 | 2.332 | 2.332 | 2.390 | 2.542 | 3.100 | none | none | 0.440 (3.1) |
| 0.85 | 0.03973 | 5.943 | 3.785 | 3.016 | 2.592 | 2.220 | 2.076 | 1.995 | 1.952 | 1.923 | 1.923 | 1.952 | 2.031 | 2.279 | 3.141 | none | 0.418 (2.9) |
| 0.92 | 0.04300 | 5.024 | 3.254 | 2.611 | 2.263 | 1.909 | 1.783 | 1.712 | 1.672 | 1.642 | 1.642 | none | - | - | - | - | 0.374 (4.5) |

**Piece 14: t ∈ [0.847521, 0.852400], row tuned at 0.850.** t_lo = 0.847521, u_cap = 0.041284, margin μ = 0.4358, room 3.7356e-04, smallest factor per cell 5.84.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.02477 | 21.39 | 13.11 | 10.32 | 8.939 | 7.624 | 7.138 | 7.014 | 7.169 | 7.708 | none | none | none | none | none | none | 0.535 (9.1) |
| 0.70 | 0.02890 | 13.26 | 7.921 | 6.340 | 5.558 | 4.783 | 4.467 | 4.338 | 4.295 | 4.340 | 4.495 | 5.270 | none | none | none | none | 0.501 (3.4) |
| 0.78 | 0.03220 | 9.868 | 6.048 | 4.739 | 4.174 | 3.620 | 3.389 | 3.284 | 3.240 | 3.240 | 3.290 | 3.531 | 4.146 | none | none | none | 0.471 (3.3) |
| 0.85 | 0.03509 | 8.004 | 4.989 | 3.929 | 3.423 | 3.001 | 2.800 | 2.697 | 2.642 | 2.642 | 2.669 | 2.785 | 3.050 | none | none | none | 0.452 (3.1) |
| 0.92 | 0.03798 | 6.745 | 4.253 | 3.389 | 2.920 | 2.534 | 2.381 | 2.293 | 2.252 | 2.226 | 2.226 | none | - | - | - | - | 0.406 (4.5) |

**Piece 15: t ∈ [0.852400, 0.857393], row tuned at 0.855.** t_lo = 0.852400, u_cap = 0.036152, margin μ = 0.4398, room 3.8569e-04, smallest factor per cell 7.29.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.02169 | 31.44 | 19.27 | 15.16 | 13.18 | 11.47 | 11.03 | 11.65 | none | none | none | none | none | none | none | none | 0.590 (9.1) |
| 0.70 | 0.02531 | 18.47 | 11.47 | 9.139 | 7.992 | 6.897 | 6.499 | 6.395 | 6.519 | 6.919 | 7.976 | none | none | none | none | none | 0.532 (9.1) |
| 0.78 | 0.02820 | 13.83 | 8.386 | 6.730 | 5.923 | 5.133 | 4.822 | 4.706 | 4.706 | 4.808 | 5.035 | 6.545 | none | none | none | none | 0.494 (9.1) |
| 0.85 | 0.03073 | 11.22 | 6.813 | 5.429 | 4.794 | 4.169 | 3.915 | 3.810 | 3.772 | 3.820 | 3.922 | 4.399 | none | none | none | none | 0.492 (3.4) |
| 0.92 | 0.03326 | 9.405 | 5.810 | 4.566 | 4.027 | 3.507 | 3.292 | 3.195 | 3.158 | 3.158 | 3.196 | none | - | - | - | - | 0.466 (3.2) |

**Piece 16: t ∈ [0.857393, 0.863036], row tuned at 0.860.** t_lo = 0.857393, u_cap = 0.030899, margin μ = 0.4493, room 4.3808e-04, smallest factor per cell 10.28.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.01854 | none | none | none | none | none | none | none | none | none | none | none | none | none | none | none | 0.656 (9.1) |
| 0.70 | 0.02163 | 33.50 | 20.40 | 16.07 | 14.00 | 12.22 | 11.91 | 13.47 | none | none | none | none | none | none | none | none | 0.596 (9.1) |
| 0.78 | 0.02410 | 23.48 | 14.39 | 11.47 | 9.995 | 8.638 | 8.193 | 8.193 | 8.678 | none | none | none | none | none | none | none | 0.561 (3.5) |
| 0.85 | 0.02626 | 18.34 | 11.35 | 9.042 | 7.899 | 6.807 | 6.408 | 6.300 | 6.420 | 6.806 | 7.825 | none | none | none | none | none | 0.535 (3.5) |
| 0.92 | 0.02843 | 15.33 | 9.263 | 7.415 | 6.493 | 5.592 | 5.239 | 5.101 | 5.101 | 5.284 | 5.588 | none | none | - | - | - | 0.512 (3.5) |

**Piece 17: t ∈ [0.863036, 0.866656], row tuned at 0.865.** t_lo = 0.863036, u_cap = 0.024962, margin μ = 0.4578, room 5.3919e-04, smallest factor per cell 22.33.

| u/u_cap | u | χ = 1 | 2 | 3 | 4 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 24 | 30 | 36 | 42 | largest ratio found (χ) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.60 | 0.01498 | none | none | none | none | none | none | none | none | none | none | none | none | none | none | none | 0.749 (9.1) |
| 0.70 | 0.01747 | none | none | none | none | none | none | none | none | none | none | none | none | none | none | none | 0.686 (9.1) |
| 0.78 | 0.01947 | none | none | none | none | none | none | none | none | none | none | none | none | none | none | none | 0.642 (9.1) |
| 0.85 | 0.02122 | 46.35 | 27.91 | 21.90 | 19.36 | 18.01 | none | none | none | none | none | none | none | none | none | none | 0.609 (9.1) |
| 0.92 | 0.02296 | 35.50 | 21.51 | 16.91 | 14.71 | 12.83 | 12.83 | none | none | none | none | none | none | - | - | - | 0.579 (9.1) |

**How θ_j is defined.** It is the largest constant for which this inequality, inserted in a convex program over the
laws of |q|² together with the proved bound of §3.2 (fourth bullet), keeps the row inside the room of its piece, with
the A/B margin μ of the row at the tilt (2/5, 3/20) taken as a constant (problem P2, Case I), the whole room given
to this sector, and a split of the deficit that depends on χ (DESIGN.md §4). Floating point, on the grid only.

### 2.1 Case II, covering rows: one constant per energy, tilt (2/5, 3/10)

For each of the five files of `profiles_low/`, with its `t_lo`, `ucap` and `allowance`:

> **(T-low).** For every n, every q ∈ H₂,₁(ℂⁿ) with u = E|q|² ∈ [0.30·`ucap`, `ucap`] that satisfies the response
> restriction
>
>     E ρ(λ²·|q|²) ≥ t_lo + λ·u/ε₁        for all λ > 0,                                               (R1)
>
> and both profiles h ∈ {h_A, h_B} of the file:
>
>     ‖Π₁[q·h(|q|²)]‖² ≤ θ_room(u)·δ(q)·Ω̂[h],
>
> where θ_room(u) is the piecewise-linear interpolation of the file's list `allowance` (and no condition where the
> list has `null`: there no q satisfies (R1)).

| piece | row tuned at | u\* | t_lo | ucap/u\* | band minimum of θ_room | at u/u\* | first two entries of the list | last energy with a possible q |
|---|---|---|---|---|---|---|---|---|
| 0.78 | 0.82 | 0.068249 | 0.7749 | 1.724 | 0.5232 | 1.448 | 5.90 at 0.52u\*, 2.02 at 0.69u\* | 1.586u\* |
| 0.76 | 0.81 | 0.078121 | 0.7549 | 1.776 | 0.4000 | 1.492 | 3.93 at 0.53u\*, 1.42 at 0.71u\* | 1.650u\* |
| 0.74 | 0.80 | 0.087869 | 0.7349 | 1.818 | 0.3141 | 1.455 | 2.60 at 0.55u\*, 1.00 at 0.73u\* | 1.673u\* |
| 0.72 | 0.79 | 0.097518 | 0.7149 | 1.854 | 0.2587 | 1.500 | 1.73 at 0.56u\*, 0.71 at 0.74u\* | 1.706u\* |
| 0.70 | 0.79 | 0.097518 | 0.6949 | 2.070 | 0.2190 | 1.612 | 0.855 at 0.62u\*, 0.455 at 0.83u\* | 1.822u\* |

The lists start at 0.30·`ucap`. Below that energy the record has no allowance for the covering rows (on the band
rows the proved bound of §3.2 alone suffices below u₀; the corresponding energy for the covers was not computed).
Above the last column no law of |q|² in the certificate's law class satisfies (R1).

(The cap is `ucap` = 4ε₁²·B·(A − t_lo) with A = 0.88676278, B = 0.432306903, the tangent ρ(x) ≤ A + Bx inserted in (R1);
checked for this file. θ_room is nearly flat within ±0.1u\* of its minimum and rises steeply below.)

### 2.2 Case II, the six band rows

> **(T).** For each band row, every n, every q ∈ H₂,₁(ℂⁿ) with u ∈ [u₀, u_cap] and both profiles:
> ‖Π₁[q·h(|q|²)]‖² ≤ θ_t·max(1, u\*/u)^{1.8}·δ·Ω̂[h]. The restriction (R1) with the row's t_lo may be assumed.

| row | u\* | u₀/u\* | u_cap/u\* | θ_t | t_lo |
|---|---|---|---|---|---|
| 0.80 | 0.087859 | 0.37 | 1.22 | 0.36 | 0.7850 |
| 0.82 | 0.068255 | 0.43 | 1.16 | 0.64 | 0.8117 |
| 0.84 | 0.048151 | 0.54 | 1.14 | 1.33 | 0.8348 |
| 0.845 | 0.043055 | 0.58 | 1.08 | 1.88 | 0.8424 |
| 0.85 | 0.037940 | 0.63 | 1.09 | 2.5 | 0.8476 |
| 0.855 | 0.032796 | 0.70 | 1.11 | 3.7 | 0.8523 |

In the design of §2.0 the rows 0.84–0.855 serve their own pieces and the pieces below 0.81 are served by covers
(for the piece 0.80 a row tuned at 0.82 has band minimum 0.72 instead of 0.36 at this tilt).

### 2.3 What is not needed

Energies outside the band; one constant for all energies (false, §4); in Case I, one constant for all χ at an energy
(§2.4); statements for all profiles; the supremum over directions in any intermediate bound; q that violate (R1).

### 2.4 The weakest version that suffices, and a warning about the allowances

- θ_room(u) is the largest constant for which this inequality, inserted in a convex program over laws of V
  together with one proved bound, keeps a row of a certificate inside its error budget. It is a floating-point
  output (N) and it is *sufficient, not necessary*: a different argument for the same row might need less. Any
  bound of ‖c[h]‖² by θ_room(u)·δ times a functional of the law of V and the row data would do.
- **The allowances rest on a constant μ, the "A/B margin" of the row** (the gain is bounded by ‖c‖²/(4μ), so they
  scale to first approximation proportionally with μ).
  - *Case II.* μ is the zero-amplitude value at the tilt (2/5, 3/10) (0.351, 0.351, 0.367, 0.384, 0.400 for the five
    covering rows; key `mu` of the files). Floating-point scans find that no constant above 0.59–0.66 of those values
    can hold there (0.2076, 0.2273, 0.2466, 0.2653 on the rows 0.79, 0.80, 0.81, 0.82; N). Recomputed with that
    constant, the band minima of the allowance on the covers of the pieces 0.80, 0.78, 0.76, 0.74, 0.72, 0.70 are
    0.396, 0.301, 0.220, 0.169, 0.138, 0.117, against largest recorded ratios 0.236, 0.242, 0.217, 0.196, 0.175, 0.179:
    quotients 1.68, 1.25, 1.01, 0.86, 0.79, 0.65. **So (T-low) with the allowances that a constant margin supports is
    contradicted by known cubics on the pieces t ≤ 0.74** (within the convex program, which is sufficient, not
    necessary). The lists `allowance` of the files are the values with the zero-amplitude margin; a proof of (T-low)
    with them is useful only together with a margin inequality that problem P2 (Case II) asks for.
  - *Case I.* μ is the zero-amplitude value at the tilt (2/5, 3/20) (0.2522 on the row 0.74 up to 0.4578 on 0.865),
    and the scans find no smaller value at any amplitude (N; that it is a valid constant is problem P2, Case I).
    With one constant per energy this design is still contradicted on its pieces 1–3 (last column of the table of
    §2.0: 0.84, 0.94, 0.98); the per-cell form is what leaves room.
  - *What Case I does not guarantee.* The whole room of each piece was given to this sector; with half of it the
    allowances are 9 to 44 % smaller on the three pieces computed (1, 4 and 13). The profiles are those of float rows
    that differ from the rational rows of the certificate by up to 3·10⁻⁵. The ratios were searched in at most 13
    variables and in sector A.
  So: a proof with room to spare (a factor 1.6 or more) is worth much more than one that just meets the table, and a
  method is worth more than a constant. State your result as "ratio ≤ F(row, u, χ)" so that it can be compared with
  whatever allowance the final certificate has.
- The game behind the rows may change (a variant raises every allowance by about 12 %).

---

## 3. What is known

### 3.1 Numerics (N): the largest ratio found, sector A (sector B is lower in every case run)

**Case I.** Cubics evaluated on each piece, among those satisfying (R1): the three-cluster family with c = 4
(13 variables; problem P5) maximised separately in ten bins of χ, and stored maximisers in 4, 5 and 6 variables
re-evaluated with the profile, tilt and energy of the piece (not re-optimised). The smallest quotient
allowance/ratio over the cells is in the table of §2.0: 2.87 on piece 1 (a c = 4 cubic with χ = 27.6 at 0.60·u_cap:
ratio 0.043 against 0.122), 2.99 to 3.44 on pieces 2–8, at least 3.52 above. The largest ratios themselves sit at
small χ (0.145 at χ = 1.9 on piece 1 at 0.60·u_cap, where the allowance of its cell is 0.897), and on the pieces
below 0.81 the smallest allowances at χ = 24–42.
Not run in Case I: searches over all of H₂,₁(ℂⁿ), families with more than 13 variables (in Case II the largest
ratios come from n = 25), sector B alone, energies off the grid. Every value is a lower bound of the largest ratio.

**Case II.**

| target | allowance at the binding energy | largest ratio found among q satisfying (R1) | where | factor |
|---|---|---|---|---|
| piece 0.70 | 0.2190 (1.612u\*); 0.2323 (1.449u\*) | 0.1650; 0.1787 | three clusters of 8 variables, n = 25 | 1.33; **1.30** |
| piece 0.72 | 0.2587 | 0.1749 | same family | 1.48 (1.44 at 1.40u\*) |
| piece 0.74 | 0.3141 | 0.1962 | same | 1.60 |
| piece 0.76 | 0.4000 | 0.2167 | same | 1.85 |
| piece 0.78 | 0.5232 | 0.2417 | same | 2.17 |
| row 0.80 | 0.36 at u\*; 0.49 at 0.85u\* | 0.2508; 0.2766 | same, n = 25 | 1.44; 1.76 |
| row 0.82 | 0.66; 0.91 | 0.3010; 0.3314 | three clusters of 6 / 4 | 2.2; 2.7 |
| rows 0.84–0.855 | 1.44–4.1 at u\*; 2.2–6.3 at 0.85u\* | 0.38–0.48; 0.42–0.52 | three clusters of 4 | 3.8–8.5; 5.2–12 |

- **Growth with the number of variables.** Row 0.80 at 0.85u\*, largest value found with at most n variables,
  n = 2, …, 13: 0.1595, 0.1925, 0.2105, 0.2246, 0.2386, 0.2483, 0.2532, 0.2575, 0.2588, 0.2630, 0.2666, 0.2756
  (searches over all of H₂,₁(ℂⁿ) for n ≤ 8, reduced families beyond). The three-cluster family for
  c = 4, …, 10 clusters size (n = 13, …, 31): 0.2743, 0.2736, 0.2758, 0.2743, 0.2766, 0.2734, 0.2724: flat. The data end
  at n = 31 and are from hand-chosen families for n ≥ 9; a larger value at some n is not excluded.
- **The shape of the maximisers.** With X the content direction and y the other variables:
  q = a·X(|X|² − 2)/√2 + X·Q(y) + R₃(y), Q(y) = Σ_j m_j(|y_j|² − 1) with complex m_j of positive real part, clustered
  in groups of equal values, and R₃ a cubic in y alone made of monomials y_a y_b ȳ_c whose three variables lie in
  three different clusters. Energy shares at n = 6: junta 0.12, X·Q 0.38, R₃ 0.50. Given y, q is a Gaussian in X with
  a non-zero conditional mean R₃(y), and |R₃|² is positively correlated with the cofactor Q
  (Cov(Q, |R₃|²) = Σ_j m_j·K_jj > 0). Replacing R₃(y) by an independent copy lowers the ratio by 17–48 %. χ of the
  maximisers falls with n (14.8 at n = 2, 2.1 at n = 13, 1.8 at n = 13 on the cover of 0.70).
- **Three clusters reduce to a one-dimensional law** (P; see problem P5 of this set, which is that special case).
- **Reproduced for this file:** the junta on the row 0.80: ‖c[h_A]‖²/δ = 0.01358, 0.01153, 0.00990 and Ω̂ = 0.10828,
  0.11542, 0.11993 at u/u\* = 0.7, 0.85, 1 (ratios 0.125, 0.100, 0.083); on the cover of the piece 0.70 the junta has
  ratio 0.0677, 0.0457, 0.0404 (h_A) and 0.0475, 0.0294, 0.0251 (h_B) at u/u\* = 1.035, 1.449, 1.612; the stored
  three-cluster cubic with c = 4 on that cover at 1.612u\*: 0.1594 (formula), 0.1609 (direct, two samples 0.1606,
  0.1611), satisfying (R1) with margin 0.717 against t_lo = 0.6949.

### 3.2 Proved (P unless said), all for every profile and every energy

- Two representations of the content from one Gaussian integration by parts (E[G·q] = Σ_j E[∂_jG·∂̄_jq] for
  q ∈ H₂,₁). With F_k = ∂̄_k q, a = Σ_j ∂_jq·F_j, c₂ = Σ_k|F_k|² (E c₂ = u), y_e = Σ e_j y_j:
  (I) c_e[h] = E[ȳ_e·k′(V)·(q̄·a + q·(c₂ − u))], hence |c_e|² ≤ δ·Ω_e with
  Ω_e = ‖P₂,₀G_e‖² + ¼‖P₃,₁G_e‖² + ½‖P₁,₁G′_e‖² + ½‖P₂,₂G′_e‖², G_e = y_e·q·k′(V), G′_e = y_e·q̄·k′(V), using the budget
  δ = ‖P₂,₀(q²)‖² + ‖P₃,₁(q²)‖² + 2‖c₂ − u‖². A second, "local" representation (II) uses k(v, c) = E h(v + cτ) at
  c = c₂ and the budget δ − 2‖c₂ − u‖².
- Class theorems (for *every* profile and energy): r_h ≤ 77/(9(m + 3)) for q = √u·X·m^{−1/2}Σ_{j≤m}(|Y_j|² − 1);
  r_h ≤ 5/3 for conditionally Gaussian cubics Σ_j X_j·(Y\*A_jY − tr A_j) + Σ_j Z̄_jF_j(U); r_h ≤ 209/126 for
  X·(Y\*AY − tr A) with A Hermitian; 6/11 and 173/594 for shared matrix blocks of size 2 and ≥ 3. Common hypothesis:
  every driver enters linearly and is independent of its cofactor (no term X|X|², X²ȳ, |X|²y). The maximisers of
  §3.1 are outside all of them.
- A limit model: for Q = αX(|X|² − 2) + βW with an independent Gaussian W, |E[X̄Q·h(|Q|²)]|² ≤ θ·168α⁴·Ω̂ with
  θ = 7/20, …, 18/5 for α/β ≤ 11/100, …, 3/5 (P + C). No finite-dimensional statement follows.
- A bound from two derivatives (P, author only): ‖Π₁[q·h(V)]‖ ≤ √(2u·Var a(V)) + √(u·E[V²h′(V)²]), a = h + V·h′. It
  is the "one proved bound" that θ_room already uses; it has a Gaussian floor (it does not vanish when q becomes
  Gaussian) and suffices alone only for u ≤ u₀.
- The sharp profile-free constant for a given q and direction e:
  θ\*(q, e) = (2/(3δ))·(E[|M_e(V)|²/V] + |E M_e(V)|²/u), M_e(v) = E[ȳ_e(q̄a + q(c₂ − u)) | V = v].

### 3.3 Counterexamples to stronger statements (exact unless said)

- **One constant for all energies:** as u → 0 the ratio tends to that of h(v) = v, which is 256/63 on the junta and
  16/(3(m + 3)) on X·P_m; these exceed θ_t on most rows.
- **Rows tuned at t itself for the pieces t ≤ 0.74** (not part of this problem): their allowances 0.160, 0.114,
  0.085 are exceeded by cubics satisfying (R1) (0.171, 0.148, 0.131; N). This is why covering rows are used.
- **Relaxing a driver's cofactor to an arbitrary centred law:** q = X·Z with Z two-valued gives ratio 2.19 on the
  row 0.80 (allowance 0.36). With the Cauchy–Schwarz moment constraints that every second-chaos cofactor
  satisfies, the relaxed supremum is still ≥ 0.82 there (N).
- **The bounds (I), (II) at the content direction** exceed the allowance of the row 0.80 on explicit two- and
  three-variable cubics (e.g. per unit δ at u\*: allowance 0.0416, (I) = 0.0478 on
  √u·X·(0.63·(|X|² − 2)/√2 + 0.777·e^{iπ/3}·(|Y|² − 1)); N). On the rows 0.84–0.855 they stay below it by factors
  1.7–6.0 on all test cubics.

---

## 4. Why the obvious approaches fail

- **Profile-free constants** cannot reach a self-interaction term: any bound valid for all profiles is at least
  the value at h(v) = v, i.e. 256/63 on the junta.
- **The supremum over directions e** in (I) or (II) is attained on cubics with zero content (X²Ȳ), where it reaches
  1.54·Ω̂.
- **Law-free corollaries** (‖c‖² ≤ (3/2)·sup_v(v·k′(v)²)·δ) are 2.8–4.9 times Ω̂; **Bessel forms** that relax the
  coupling of |y_e|² and V about 3–4.5 times Ω̂: the projections in Ω_e are essential.
- **Splitting q at its content direction** into a self-interaction part and a cofactor part: proved as an
  inequality, never better than (I).
- **Bounds of order δ^{3/2}** cover χ ≤ 10⁻⁷–3·10⁻⁵; the hard cases have χ = 2–42.
- **Compression to finitely many variables** has absolute errors of order 1/√m: unusable.
- **Perturbation from the direction-independent case** (Ω_e ≤ Ω̂ when q does not depend on y_e): the cubic part of
  q·k′(V) alone gives Ω_e up to 5 times its Gaussian value; the truth is small through a cancellation with the
  quintic part.
- **A bound on the kurtosis of the cofactor** is not enough (the two-point example); third-moment or Stein-type
  information on second-chaos variables is needed.

---

## 5. Suggested approaches

- **Decide the dimension question first.** Either find q (any n) above the allowance on a covering row, or
  identify what bounds the ratio as n grows. The three-cluster reduction (P5) shows the mechanism: the ratio
  depends on the bulk only through the law of one scalar whose second moment κ is bounded below by 2c/(c + 1).
  Is there a family outside the hypotheses (H1), (H2) of that reduction (unequal eigenvalues inside a cluster,
  more clusters, bulk monomials with repeated clusters) with a larger ratio at large n?
- **A same-law argument.** The inequality compares two functionals of q through the law of V and one direction.
  Conditioning on the cofactor variables makes q an affine function of the driver X with a random mean and a
  random variance; the content along X is then E over (mean, variance) of an explicit two-dimensional Gaussian
  integral of h. A proof could bound that integral by the conditional contribution to δ·Ω̂ and then control the
  joint law of (cofactor, |R₃|²) by chaos constraints (third cumulants, positive correlation bounds, the κ bound).
- **Rows 0.84–0.855 first.** There a certified majorant Ω_{e\*} ≤ θ·Ω̂ at the content direction e\* (or its local
  variant) with θ up to 1.33–3.7 suffices; the measured Ω_{e\*}/Ω̂ is at most 0.95–1.04.
- **Certified computation.** Any reduction to finitely many parameters must be a proof; after it, interval
  arithmetic over a compactified parameter domain with analytic exteriors is acceptable (this is how the
  analogous pointwise premise at degree 3 was closed: a cover of ℂ³ modulo symmetry by about 1.2·10⁶ boxes, C++
  with outward rounding, an exact rational verifier and negative controls). The profiles must then be enclosed
  from their definitions (two-dimensional integrals of ph of a polynomial), not read from the tables.

---

## 6. Deliverable

- A note with every step checkable: the class of q covered (all of H₂,₁, or a named class), the rows, the band, and
  the bound obtained as an explicit function of (row, u), compared with θ_room(u).
- Every number the proof uses produced by a script delivered with it, in exact rational or interval arithmetic
  (python-flint/Arb, or C++ with outward rounding and an exact verifier); negative controls (the same machinery
  must reject the allowance of an own row, e.g. 0.085 at the piece 0.70, and must reject one constant for all
  energies).
- For a counterexample: the cubic as a list of coefficients in the orthonormal basis of §1, its energy, a
  verification of (R1), and the three integrals with error estimates from two independent quadratures (δ exactly).
- Labels "P, author only", "C, author only", "N".

---

## 7. How to test a claimed inequality

Everything below needs numpy and scipy only. Run from the repository root; the profiles are in `research/higher-degree/code/degree5-content/` and the scripts in `research/higher-degree/code/degree5-attack/ref/`.

1. **The junta** (one-dimensional; with the tilt (2/5, 3/10) it must print 0.01540, 0.06732, 0.2287 on the row 0.84 at
   0.85u\*; for Case I replace 0.3 by 0.15 in the sector-B combination):

```python
import json, numpy as np
from scipy.interpolate import CubicSpline
from numpy.polynomial.laguerre import laggauss
from numpy.polynomial.legendre import leggauss
d = json.load(open('research/higher-degree/code/degree5-content/profiles/band_row_0.84.json')); S = np.array(d['S'])
GA = CubicSpline(S, np.array(d['GA']) + 0.4 * np.array(d['G0']))          # sector A; sector B: GB + 0.3 G0
def h(v):
    s = np.sqrt(np.maximum(v, 1e-18)); return GA(np.minimum(s, 6.0)) / s
tau, w = laggauss(64); u = 0.85 * d['ustar']
kp = lambda v: (np.array([w @ h(x + u * tau) for x in np.atleast_1d(v)]) - h(np.atleast_1d(v))) / u
x, wx = leggauss(40); T = []; W = []
for a, b in zip([0, .5, 1, 1.5, 2, 2.5, 3, 4, 6, 9, 14, 22, 34], [.5, 1, 1.5, 2, 2.5, 3, 4, 6, 9, 14, 22, 34, 60]):
    T.append((b - a) / 2 * x + (a + b) / 2); W.append((b - a) / 2 * wx)
T = np.concatenate(T); W = np.concatenate(W) * np.exp(-T); V = u * T * (T - 2) ** 2 / 2   # q = sqrt(u) H(X)
c = np.sqrt(u) * (W @ (T * (T - 2) / np.sqrt(2) * h(V))); K = kp(V)
Om = 1.5 * (W @ (V * K ** 2)) - 0.75 * (W @ (V * K)) ** 2 / u
print(c ** 2 / (42 * u * u), Om, c ** 2 / (42 * u * u * Om))                # content^2/delta, Omega-hat, ratio
```

2. **Two-variable test cubics** (all of norm √u; a three-dimensional quadrature): √u·X(|Y|² − 1) (χ = 16);
   √u·(H(X) + H(Y))/√2 (χ = 21; content direction (X + Y)/√2);
   √u·X·(0.63·(|X|² − 2)/√2 + 0.777·e^{iπ/3}(|Y|² − 1)) (χ = 16.02; close to the two-variable maximum). Reference, row
   0.80 at 0.85u\*, sector A, per unit δ: ‖c‖²/δ = 0.01025, 0.01427, 0.01773 and Ω̂ = 0.09141, 0.10912, 0.11241.
3. **The adversarial family.** `python3 research/higher-degree/code/degree5-attack/ref/kappa.py formula 0.70 1.612 4 research/higher-degree/code/degree5-attack/ref/bulk/bulk_c4.json research/higher-degree/code/degree5-content/profiles_low/ --direct`
   evaluates the stored three-cluster cubic (13 variables, quasi-Monte-Carlo with 2²¹ points; two minutes):
   it must print about 0.159 for the formula and 0.1609 for the direct evaluation, "a possible response".
   `research/higher-degree/code/degree5-attack/ref/bulk/bulk_c<c>.json`, c = 2, …, 10, hold the bulks; `research/higher-degree/code/degree5-attack/ref/bipartite.py` and `research/higher-degree/code/degree5-attack/ref/clusters.py` search the
   reduced families (their headers give usage and reference values).
4. **(R1).** For a candidate q evaluate min over λ ∈ [0.1, 8] of [E ρ(λ²V) − λu/ε₁] and compare with t_lo. For a
   Gaussian q, E ρ(λ²uτ) = (√π/2)·√(1 + λ²u) and the minimum is √(π/4 − u/ε₁²), so (R1) reads u ≤ ε₁²(π/4 − t_lo²)
   (use this to test the code).
5. **Accuracy.** δ must be computed exactly (q as a polynomial; E y^a ȳ^b = a!·[a = b]). For n ≥ 4 the value on the
   sample used by an optimiser is biased upward by 1–8 %; quote only the value of the returned cubic on an
   independent sample.
