import GrotheQuadKernel.Rotate

/-!
# The twisted operator: exact transposed Hermite ladders in the unnormalised basis

A vector `K' : (c, d) ↦ (lo, hi)` on the triangle `c + d ≤ D` (fixed scale `2^KTw`) represents the
linear functional `p ↦ K_s(p) = ∫ conj(p(w)) e^{−α|w|²} ph(r + b w) dγ` on the span of the
**unnormalised** Hermite polynomials `H_{c,d} = √(c! d!) h_{c,d}` through `K'_{c,d} = K_s(H_{c,d})`
(`docs/UPPER_CLOSURE.md` §8.1).  In this basis the ladders are integer,

    w H_{c,d} = H_{c+1,d} + d H_{c,d−1},     w̄ H_{c,d} = H_{c,d+1} + c H_{c−1,d}

(`ComplexHermite.A0/A1`, `pderiv1_H_succ`, `pderiv0_H_succ`, `H_succ_right`), so multiplying the
argument of the functional by `w`, `w̄`, `w ± w̄` or `w w̄` acts on the vector by **exact** integer
combinations (the transposed ladders)

    (wᵀK')_{c,d}    = K'_{c+1,d} + d K'_{c,d−1}
    (w̄ᵀK')_{c,d}    = K'_{c,d+1} + c K'_{c−1,d}
    ((ww̄)ᵀK')_{c,d} = K'_{c+1,d+1} + (c+d+1) K'_{c,d} + c d K'_{c−1,d−1},

each on one (two) degree(s) less, and linear combinations with real scalars act entrywise.  The
phase polynomial at the node, `Q_r = (r/2)(w − w̄) Σ_t C_t s^i (ww̄)^j ((r/2)(w + w̄))^k` (`Sphase`
in its monomial form, `t = (i, j, k)`), is applied by `applyQ`: Krylov vectors in the two commuting
operators `(ww̄)ᵀ` and `(w + w̄)ᵀ` (exact), the interval scalars `P_{jk}(s) (r/2)^k` accumulated by
exact products at the scale `2^{2 KTw}`, one final exact `(w − w̄)ᵀ` and the scalar `r/2`.  The only
roundings are the two per application (after the scalar sum and after `r/2`); the rounding of the
input `K'` and of the scalars is where the precision is set (`KTw = 512`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace GrotheQuad

/-- The fixed scale of the twisted operator. -/
def KTw : Nat := 512

/-- An interval at the scale `2^KTw`, as a pair. -/
def toTw (a : Ival) : Int × Int := (toFixedLo KTw a, toFixedHi KTw a)

/-- Round a scale-`2^{2 KTw}` pair outward to the scale `2^KTw`. -/
def roundTw (p : Int × Int) : Int × Int := (shDown KTw p.1, shUp KTw p.2)

/-- The product of two pairs (scale `2^{2 KTw}`), with the sign cases of `mulFx`. -/
def mulPair (a b : Int × Int) : Int × Int := mulFx ⟨a.1, a.2⟩ ⟨b.1, b.2⟩

/-- `n · p` for a natural `n` (exact, order-preserving). -/
def scalePair (n : Nat) (p : Int × Int) : Int × Int := ((n : Int) * p.1, (n : Int) * p.2)

/-- `−p`. -/
def negPair (p : Int × Int) : Int × Int := (-p.2, -p.1)

/-- A triangular vector of pairs: row `c = 0 … D`, entries `d = 0 … D − c`. -/
abbrev TwVec := Array (Array (Int × Int))

/-- Read an entry (`(0, 0)` outside the triangle). -/
def twGet (v : TwVec) (c d : Nat) : Int × Int := (v.getD c #[]).getD d (0, 0)

/-- The triangular vector of degree `D` with the entries `f c d`. -/
def twOfFn (D : Nat) (f : Nat → Nat → Int × Int) : TwVec :=
  Array.ofFn fun c : Fin (D + 1) => Array.ofFn fun d : Fin (D + 1 - c.val) => f c.val d.val

/-- `(wᵀK')_{c,d} = K'_{c+1,d} + d K'_{c,d−1}` on the degree `D − 1`. -/
def stepW (D : Nat) (K : TwVec) : TwVec :=
  twOfFn (D - 1) fun c d => addPair (twGet K (c + 1) d) (scalePair d (twGet K c (d - 1)))

/-- `(w̄ᵀK')_{c,d} = K'_{c,d+1} + c K'_{c−1,d}` on the degree `D − 1`. -/
def stepWbar (D : Nat) (K : TwVec) : TwVec :=
  twOfFn (D - 1) fun c d => addPair (twGet K c (d + 1)) (scalePair c (twGet K (c - 1) d))

/-- `((w + w̄)ᵀK')_{c,d}` as a pair. -/
def stepXPair (K : TwVec) (c d : Nat) : Int × Int :=
  addPair (addPair (twGet K (c + 1) d) (scalePair d (twGet K c (d - 1))))
    (addPair (twGet K c (d + 1)) (scalePair c (twGet K (c - 1) d)))

/-- `((w + w̄)ᵀK')` on the degree `D − 1`. -/
def stepX (D : Nat) (K : TwVec) : TwVec := twOfFn (D - 1) fun c d => stepXPair K c d

/-- `((w − w̄)ᵀK')_{c,d}` as a pair. -/
def stepYPair (K : TwVec) (c d : Nat) : Int × Int :=
  addPair (addPair (twGet K (c + 1) d) (scalePair d (twGet K c (d - 1))))
    (negPair (addPair (twGet K c (d + 1)) (scalePair c (twGet K (c - 1) d))))

/-- `((w − w̄)ᵀK')` on the degree `D − 1`. -/
def stepY (D : Nat) (K : TwVec) : TwVec := twOfFn (D - 1) fun c d => stepYPair K c d

/-- `((ww̄)ᵀK')_{c,d} = K'_{c+1,d+1} + (c+d+1) K'_{c,d} + c d K'_{c−1,d−1}` on the degree `D − 2`. -/
def stepV (D : Nat) (K : TwVec) : TwVec :=
  twOfFn (D - 2) fun c d =>
    addPair (addPair (twGet K (c + 1) (d + 1)) (scalePair (c + d + 1) (twGet K c d)))
      (scalePair (c * d) (twGet K (c - 1) (d - 1)))

/-- `acc + coef ⊗ X` on the accumulator's degree `D` (`acc` at the scale `2^{2 KTw}`, exact). -/
def axpy (coef : Int × Int) (D : Nat) (X : TwVec) (acc : TwVec) : TwVec :=
  twOfFn D fun c d => addPair (twGet acc c d) (mulPair coef (twGet X c d))

/-- The zero vector of degree `D`. -/
def twZero (D : Nat) : TwVec := twOfFn D fun _ _ => (0, 0)

/-- Round a scale-`2^{2 KTw}` vector to the scale `2^KTw`. -/
def roundVec (D : Nat) (acc : TwVec) : TwVec := twOfFn D fun c d => roundTw (twGet acc c d)

/-- `f ⊗ v` entrywise, rounded (`f` and `v` at the scale `2^KTw`). -/
def scaleTw (f : Int × Int) (D : Nat) (v : TwVec) : TwVec :=
  twOfFn D fun c d => roundTw (mulPair f (twGet v c d))

/-- The inner loop of one phase row `j'`: the Krylov vectors `X_k = ((w+w̄)ᵀ)^k V` for `k ≤ kMax`
(`V` on the degree `DV`), each accumulated with its scalar `coefs[k]` into `acc` (degree `Dacc`,
scale `2^{2 KTw}`). -/
def rowLoop (coefs : Array (Int × Int)) (kMax DV Dacc : Nat) (V : TwVec) (acc : TwVec) : TwVec :=
  ((List.range (kMax + 1)).foldl (fun (st : TwVec × TwVec) k =>
    if k = 0 then (st.1, axpy (coefs.getD 0 (0, 0)) Dacc st.1 st.2)
    else
      let X := stepX (DV - (k - 1)) st.1
      (X, axpy (coefs.getD k (0, 0)) Dacc X st.2)) (V, acc)).2

/-- The outer loop over the phase rows `j' = 0 … 17`: `V_{j'} = ((ww̄)ᵀ)^{j'} K'` (`K'` on the degree
`Din`), each row accumulated by `rowLoop` with `kMax = 34 − 2j'`. -/
def rowsLoop (coefs : Array (Array (Int × Int))) (Din Dacc : Nat) (K : TwVec) : TwVec :=
  ((List.range 18).foldl (fun (st : TwVec × TwVec) j' =>
    if j' = 0 then (st.1, rowLoop (coefs.getD 0 #[]) 34 Din Dacc st.1 st.2)
    else
      let V := stepV (Din - 2 * (j' - 1)) st.1
      (V, rowLoop (coefs.getD j' #[]) (34 - 2 * j') (Din - 2 * j') Dacc V st.2))
    (K, twZero Dacc)).2

/-- One application of `Q_rᵀ` in the unnormalised basis: `coefs[j'][k] ∋ P_{j'k}(s) (r/2)^k` and
`half ∋ r/2` at the scale `2^KTw`; `K'` on the degree `Dout + 35`, the result on the degree `Dout`
(scale `2^KTw`). -/
def applyQ (coefs : Array (Array (Int × Int))) (half : Int × Int) (Dout : Nat) (K : TwVec) : TwVec :=
  scaleTw half Dout (roundVec Dout (stepY (Dout + 1) (rowsLoop coefs (Dout + 35) (Dout + 1) K)))

/-- `(Q_rᵀ)^j K'`: `K'` on the degree `Dout + 35 j`, the result on `Dout`. -/
def applyQPow (coefs : Array (Array (Int × Int))) (half : Int × Int) (Dout : Nat) : Nat → TwVec → TwVec
  | 0, K => K
  | j + 1, K => applyQ coefs half Dout (applyQPow coefs half (Dout + 35) j K)

/-- A checksum (forces the evaluation of a vector in the driver). -/
def twChecksum (v : TwVec) : Int := v.foldl (fun s row => row.foldl (fun s p => s + p.1 + p.2) s) 0

/-- The widest entry (log₂ of `hi − lo`, scale `2^KTw`) of a vector. -/
def twMaxWidthLog2 (v : TwVec) : Int :=
  v.foldl (fun m row => row.foldl (fun m x =>
    let w := (x.2 - x.1).toNat
    if w == 0 then m else max m ((Nat.log2 w : Int) - KTw)) m) (-100000)

/-- The largest magnitude (log₂, scale `2^KTw`) of a vector. -/
def twMaxMagLog2 (v : TwVec) : Int :=
  v.foldl (fun m row => row.foldl (fun m x =>
    let u := (max (max (-x.1) x.2) 0).toNat
    if u == 0 then m else max m ((Nat.log2 u : Int) - KTw)) m) (-100000)

end GrotheQuad
