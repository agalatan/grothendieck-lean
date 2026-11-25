import Grothe.Lower.RowDataTypes

/-!
# Pure-kernel bridge for `Grothe.Lower.Row.nodeList`

`Grothe.Lower.Row.nodeList` parses the ASCII string `r.nodes` via `String.splitOn`, `String.toInt!`,
and `String.toNat!`, which are not directly kernel-reducible because `String.splitOnAux` is
`@[irreducible]`. This module proves once that whenever `r.nodes = String.ofList (capsChars toks)`
for a nonempty list `toks` of decimal rational pairs with every numeral `< 10^20`, then
`r.nodeList = toks.map evalCapTok`. Since `String.ofList (capsChars toks) = r.nodes` holds by
definitional equality (`rfl`), sublists of `r.nodeList` can be certified by `decide +kernel` with
zero `native_decide` axioms.
-/

open Grothe.Lower

namespace Grothe.LowerAnalytic

/-- Convert a decimal digit `d < 10` to its ASCII character. -/
def digitChar (d : ℕ) : Char :=
  match d with
  | 0 => '0' | 1 => '1' | 2 => '2' | 3 => '3' | 4 => '4'
  | 5 => '5' | 6 => '6' | 7 => '7' | 8 => '8' | _ => '9'

/-- Accumulator-passing decimal encoder with explicit structural fuel `k`. -/
def natCharsGo : ℕ → ℕ → List Char → List Char
  | 0, _, acc => acc
  | k + 1, n, acc =>
    let acc' := digitChar (n % 10) :: acc
    if n < 10 then acc' else natCharsGo k (n / 10) acc'

/-- Decimal representation of `n < 10^20` as a list of ASCII digit characters. -/
def natChars (n : ℕ) : List Char := natCharsGo 20 n []

/-- Encode `(n, none)` as `n` and `(n, some d)` as `n/d`, prepended onto `acc`. -/
def qChars : (ℕ × Option ℕ) → List Char → List Char
  | (n, none), acc => natCharsGo 20 n acc
  | (n, some d), acc => natCharsGo 20 n ('/' :: natCharsGo 20 d acc)

/-- Encode one node-cap pair `(x, y)` as `x:y`, prepended onto `acc`. -/
def capChars : ((ℕ × Option ℕ) × (ℕ × Option ℕ)) → List Char → List Char
  | (x, y), acc => qChars x (':' :: qChars y acc)

/-- Encode a list of node-cap pairs separated by `';'`. -/
def capsChars : List ((ℕ × Option ℕ) × (ℕ × Option ℕ)) → List Char
  | [] => []
  | [x] => capChars x []
  | x :: xs => capChars x (';' :: capsChars xs)

/-- Rational value of a decimal rational token. -/
def evalQTok : ℕ × Option ℕ → ℚ
  | (n, none) => ((Int.ofNat n) : ℚ)
  | (n, some d) => ((Int.ofNat n) : ℚ) / (d : ℚ)

/-- Pair of rationals represented by a node-cap token. -/
def evalCapTok : ((ℕ × Option ℕ) × (ℕ × Option ℕ)) → ℚ × ℚ
  | (x, y) => (evalQTok x, evalQTok y)

/-- Range check ensuring every numeral in a token has at most 20 decimal digits. -/
def qTokInRange : ℕ × Option ℕ → Bool
  | (n, none) => decide (n < 10 ^ 20)
  | (n, some d) => decide (n < 10 ^ 20) && decide (d < 10 ^ 20)

/-- Range check for a node-cap token. -/
def capTokInRange (p : (ℕ × Option ℕ) × (ℕ × Option ℕ)) : Bool :=
  qTokInRange p.1 && qTokInRange p.2

private abbrev IsAsciiDigit (c : Char) : Prop :=
  c.isDigit = true ∧ c.utf8Size = 1 ∧ c ≠ '_' ∧ c ≠ '-' ∧ c ≠ ';' ∧ c ≠ ':' ∧ c ≠ '/'

private theorem digitChar_prop (d : ℕ) (hd : d < 10) :
    IsAsciiDigit (digitChar d) ∧ (digitChar d).toNat - '0'.toNat = d := by
  match d with
  | 0 => exact ⟨by decide, by decide⟩
  | 1 => exact ⟨by decide, by decide⟩
  | 2 => exact ⟨by decide, by decide⟩
  | 3 => exact ⟨by decide, by decide⟩
  | 4 => exact ⟨by decide, by decide⟩
  | 5 => exact ⟨by decide, by decide⟩
  | 6 => exact ⟨by decide, by decide⟩
  | 7 => exact ⟨by decide, by decide⟩
  | 8 => exact ⟨by decide, by decide⟩
  | 9 => exact ⟨by decide, by decide⟩
  | d + 10 => omega

private theorem natCharsGo_append (k n : ℕ) (acc : List Char) :
    natCharsGo k n acc = natCharsGo k n [] ++ acc := by
  induction k generalizing n acc with
  | zero => rfl
  | succ k ih =>
    simp only [natCharsGo]
    split
    · rfl
    · rw [ih (n / 10) (digitChar (n % 10) :: acc), ih (n / 10) [digitChar (n % 10)]]
      simp [List.append_assoc]

private theorem natCharsGo_ne_nil (k n : ℕ) : natCharsGo (k + 1) n [] ≠ [] := by
  simp only [natCharsGo]
  split
  · simp
  · rw [natCharsGo_append]
    simp

private theorem natCharsGo_digits (k n : ℕ) (acc : List Char)
    (hacc : ∀ c ∈ acc, IsAsciiDigit c) :
    ∀ c ∈ natCharsGo k n acc, IsAsciiDigit c := by
  induction k generalizing n acc with
  | zero => exact hacc
  | succ k ih =>
    simp only [natCharsGo]
    have hd : IsAsciiDigit (digitChar (n % 10)) := (digitChar_prop (n % 10) (Nat.mod_lt _ (by omega))).1
    have hacc' : ∀ c ∈ digitChar (n % 10) :: acc, IsAsciiDigit c := by
      intro c hc
      rcases List.mem_cons.1 hc with rfl | hc
      · exact hd
      · exact hacc c hc
    split
    · exact hacc'
    · exact ih (n / 10) _ hacc'

private theorem natCharsGo_foldl (k : ℕ) :
    ∀ n : ℕ, n < 10 ^ (k + 1) →
      List.foldl (fun acc c => if c = '_' then acc else acc * 10 + (c.toNat - '0'.toNat))
        0 (natCharsGo (k + 1) n []) = n := by
  induction k with
  | zero =>
    intro n hn
    have h10 : n < 10 := by simpa using hn
    simp only [natCharsGo, h10, ↓reduceIte, List.foldl_cons, List.foldl_nil]
    have hp := digitChar_prop (n % 10) (Nat.mod_lt _ (by omega))
    have hne : digitChar (n % 10) ≠ '_' := hp.1.2.2.1
    simp only [hne, ↓reduceIte, Nat.zero_mul, Nat.zero_add, hp.2]
    exact Nat.mod_eq_of_lt h10
  | succ k ih =>
    intro n hn
    unfold natCharsGo
    by_cases h10 : n < 10
    · simp only [h10, ↓reduceIte, List.foldl_cons, List.foldl_nil]
      have hp := digitChar_prop (n % 10) (Nat.mod_lt _ (by omega))
      have hne : digitChar (n % 10) ≠ '_' := hp.1.2.2.1
      simp only [hne, ↓reduceIte, Nat.zero_mul, Nat.zero_add, hp.2]
      exact Nat.mod_eq_of_lt h10
    · simp only [h10, ↓reduceIte]
      rw [natCharsGo_append (k + 1) (n / 10) [digitChar (n % 10)],
        List.foldl_append, List.foldl_cons, List.foldl_nil]
      have hdiv : n / 10 < 10 ^ (k + 1) := by
        have : 10 ^ (k + 1 + 1) = 10 ^ (k + 1) * 10 := by ring
        omega
      rw [ih (n / 10) hdiv]
      have hp := digitChar_prop (n % 10) (Nat.mod_lt _ (by omega))
      have hne : digitChar (n % 10) ≠ '_' := hp.1.2.2.1
      simp only [hne, ↓reduceIte, hp.2]
      omega

private theorem forIn_isNat_list (l : List Char) (hl : ∀ c ∈ l, c.isDigit = true ∧ c ≠ '_') (b : Bool) :
    (forIn (m := Id) l (none, b) fun c __s =>
      have lastWasDigit := __s.2
      if c = '_' then
        if (!lastWasDigit) = true then pure (ForInStep.done (some false, lastWasDigit))
        else
          have lastWasDigit := false
          pure (ForInStep.yield (none, lastWasDigit))
      else
        if c.isDigit = true then
          have lastWasDigit := true
          pure (ForInStep.yield (none, lastWasDigit))
        else pure (ForInStep.done (some false, lastWasDigit))) =
      pure (none, if l.isEmpty then b else true) := by
  induction l generalizing b with
  | nil => rfl
  | cons c cs ih =>
    have ⟨hd, hne⟩ := hl c (List.mem_cons_self ..)
    have hcs : ∀ x ∈ cs, x.isDigit = true ∧ x ≠ '_' := fun x hx => hl x (List.mem_cons_of_mem _ hx)
    simp only [List.forIn_cons, hne, ↓reduceIte, hd, pure_bind]
    have hstep := ih hcs true
    dsimp only at hstep ⊢
    rw [hstep]
    cases cs <;> rfl

private theorem isNat_of_digits (cs : List Char) (hne : cs ≠ [])
    (hd : ∀ c ∈ cs, IsAsciiDigit c) :
    (String.ofList cs).toSlice.isNat = true := by
  unfold String.Slice.isNat
  dsimp only
  rw [String.Slice.forIn_eq_forIn_toList, String.copy_toSlice, String.toList_ofList]
  rw [forIn_isNat_list cs (fun c hc => ⟨(hd c hc).1, (hd c hc).2.2.1⟩) false]
  cases cs with
  | nil => contradiction
  | cons c cs => rfl

private theorem toNat!_natChars (n : ℕ) (hn : n < 10 ^ 20) :
    (String.ofList (natChars n)).toNat! = n := by
  have hne : natChars n ≠ [] := natCharsGo_ne_nil 19 n
  have hd : ∀ c ∈ natChars n, IsAsciiDigit c := natCharsGo_digits 20 n [] (by simp)
  have his : (String.ofList (natChars n)).toSlice.isNat = true := isNat_of_digits _ hne hd
  change (String.ofList (natChars n)).toSlice.toNat! = n
  unfold String.Slice.toNat!
  simp only [his, ↓reduceIte, String.Slice.foldl_eq_foldl_toList, String.copy_toSlice, String.toList_ofList]
  exact natCharsGo_foldl 19 n hn

private theorem toInt!_natChars (n : ℕ) (hn : n < 10 ^ 20) :
    (String.ofList (natChars n)).toInt! = Int.ofNat n := by
  have hne : natChars n ≠ [] := natCharsGo_ne_nil 19 n
  have hd : ∀ c ∈ natChars n, IsAsciiDigit c := natCharsGo_digits 20 n [] (by simp)
  have his : (String.ofList (natChars n)).toSlice.isNat = true := isNat_of_digits _ hne hd
  have hnoMinus : (String.ofList (natChars n)).toSlice.dropPrefix? '-' = none := by
    rw [String.Slice.dropPrefix?_eq_none_iff, String.Slice.startsWith_char_eq_head?,
      String.copy_toSlice, String.toList_ofList]
    cases hcs : natChars n with
    | nil => exact absurd hcs hne
    | cons c cs =>
      have hc : c ≠ '-' := (hd c (hcs ▸ List.mem_cons_self ..)).2.2.2.1
      simp [hc]
  have htoNat : (String.ofList (natChars n)).toSlice.toNat? = some n := by
    unfold String.Slice.toNat?
    simp only [his, ↓reduceIte, String.Slice.foldl_eq_foldl_toList, String.copy_toSlice, String.toList_ofList]
    exact congrArg some (natCharsGo_foldl 19 n hn)
  change (String.ofList (natChars n)).toSlice.toInt! = Int.ofNat n
  unfold String.Slice.toInt! String.Slice.toInt?
  rw [hnoMinus, htoNat]
  rfl

private theorem utf8ByteSize_ofList_ascii (cs : List Char) (h : ∀ c ∈ cs, c.utf8Size = 1) :
    (String.ofList cs).utf8ByteSize = cs.length := by
  induction cs with
  | nil => rfl
  | cons c cs ih =>
    have hc : c.utf8Size = 1 := h c (List.mem_cons_self ..)
    have hcs : ∀ x ∈ cs, x.utf8Size = 1 := fun x hx => h x (List.mem_cons_of_mem _ hx)
    have heq : String.ofList (c :: cs) = String.ofList [c] ++ String.ofList cs := by
      rw [← String.ofList_append]; rfl
    rw [heq, String.utf8ByteSize_append, ih hcs]
    simp [hc, Nat.add_comm]

private theorem utf8GetAux_ascii (l : List Char) (hl : ∀ c ∈ l, c.utf8Size = 1) :
    ∀ (off k : ℕ) (hk : k < l.length),
      String.Pos.Raw.utf8GetAux l ⟨off⟩ ⟨off + k⟩ = l[k] := by
  induction l with
  | nil => intro _ _ hk; simp at hk
  | cons c cs ih =>
    intro off k hk
    have hc : c.utf8Size = 1 := hl c (List.mem_cons_self ..)
    have hcs : ∀ x ∈ cs, x.utf8Size = 1 := fun x hx => hl x (List.mem_cons_of_mem _ hx)
    cases k with
    | zero =>
      simp [String.Pos.Raw.utf8GetAux]
    | succ k' =>
      have hne : (⟨off⟩ : String.Pos.Raw) ≠ ⟨off + (k' + 1)⟩ := by
        intro h; have h' := congrArg String.Pos.Raw.byteIdx h; dsimp only at h'; omega
      simp only [String.Pos.Raw.utf8GetAux, hne, ↓reduceIte]
      have hstep : (⟨off⟩ : String.Pos.Raw) + c = ⟨off + 1⟩ := by
        ext; simp [hc]
      have htgt : (⟨off + (k' + 1)⟩ : String.Pos.Raw) = ⟨(off + 1) + k'⟩ := by
        ext; dsimp only; omega
      rw [hstep, htgt]
      exact ih hcs (off + 1) k' (by simpa using hk)

private theorem posRaw_get_ascii (s : String) (hs : ∀ c ∈ s.toList, c.utf8Size = 1)
    (i : ℕ) (hi : i < s.toList.length) :
    String.Pos.Raw.get s ⟨i⟩ = s.toList[i] := by
  unfold String.Pos.Raw.get
  simpa using utf8GetAux_ascii s.toList hs 0 i hi

private theorem posRaw_next_ascii (s : String) (hs : ∀ c ∈ s.toList, c.utf8Size = 1)
    (i : ℕ) (hi : i < s.toList.length) :
    String.Pos.Raw.next s ⟨i⟩ = ⟨i + 1⟩ := by
  unfold String.Pos.Raw.next
  rw [posRaw_get_ascii s hs i hi]
  ext
  simp [hs _ (List.getElem_mem hi)]

private theorem extract_go2_ascii (l : List Char) (hl : ∀ c ∈ l, c.utf8Size = 1) :
    ∀ (off len : ℕ), len ≤ l.length →
      String.Pos.Raw.extract.go₂ l ⟨off⟩ ⟨off + len⟩ = l.take len := by
  induction l with
  | nil => intro _ len _; simp [String.Pos.Raw.extract.go₂]
  | cons c cs ih =>
    intro off len hlen
    have hc : c.utf8Size = 1 := hl c (List.mem_cons_self ..)
    have hcs : ∀ x ∈ cs, x.utf8Size = 1 := fun x hx => hl x (List.mem_cons_of_mem _ hx)
    cases len with
    | zero => simp [String.Pos.Raw.extract.go₂]
    | succ len' =>
      have hne : (⟨off⟩ : String.Pos.Raw) ≠ ⟨off + (len' + 1)⟩ := by
        intro h; have h' := congrArg String.Pos.Raw.byteIdx h; dsimp only at h'; omega
      simp only [String.Pos.Raw.extract.go₂, hne, ↓reduceIte, List.take_succ_cons]
      have hstep : (⟨off⟩ : String.Pos.Raw) + c = ⟨off + 1⟩ := by ext; simp [hc]
      have htgt : (⟨off + (len' + 1)⟩ : String.Pos.Raw) = ⟨(off + 1) + len'⟩ := by
        ext; dsimp only; omega
      rw [hstep, htgt, ih hcs (off + 1) len' (by simpa using hlen)]

private theorem extract_go1_ascii (l : List Char) (hl : ∀ c ∈ l, c.utf8Size = 1) :
    ∀ (off b e : ℕ), b ≤ e → e ≤ l.length →
      String.Pos.Raw.extract.go₁ l ⟨off⟩ ⟨off + b⟩ ⟨off + e⟩ = (l.drop b).take (e - b) := by
  induction l with
  | nil =>
    intro _ b e _ _
    simp [String.Pos.Raw.extract.go₁]
  | cons c cs ih =>
    intro off b e hbe he
    have hc : c.utf8Size = 1 := hl c (List.mem_cons_self ..)
    have hcs : ∀ x ∈ cs, x.utf8Size = 1 := fun x hx => hl x (List.mem_cons_of_mem _ hx)
    cases b with
    | zero =>
      simp only [Nat.add_zero, Nat.sub_zero, List.drop_zero, String.Pos.Raw.extract.go₁, ↓reduceIte]
      exact extract_go2_ascii (c :: cs) hl off e he
    | succ b' =>
      have hne : (⟨off⟩ : String.Pos.Raw) ≠ ⟨off + (b' + 1)⟩ := by
        intro h; have h' := congrArg String.Pos.Raw.byteIdx h; dsimp only at h'; omega
      simp only [String.Pos.Raw.extract.go₁, hne, ↓reduceIte, List.drop_succ_cons]
      have hstep : (⟨off⟩ : String.Pos.Raw) + c = ⟨off + 1⟩ := by ext; simp [hc]
      have hb' : (⟨off + (b' + 1)⟩ : String.Pos.Raw) = ⟨(off + 1) + b'⟩ := by
        ext; dsimp only; omega
      have he_pos : 1 ≤ e := by omega
      obtain ⟨e', rfl⟩ : ∃ e', e = e' + 1 := ⟨e - 1, by omega⟩
      have he' : (⟨off + (e' + 1)⟩ : String.Pos.Raw) = ⟨(off + 1) + e'⟩ := by
        ext; dsimp only; omega
      rw [hstep, hb', he', ih hcs (off + 1) b' e' (by omega) (by simpa using he)]
      congr 1; omega

private theorem posRaw_extract_ascii (s : String) (hs : ∀ c ∈ s.toList, c.utf8Size = 1)
    (b e : ℕ) (hbe : b ≤ e) (he : e ≤ s.toList.length) :
    String.Pos.Raw.extract s ⟨b⟩ ⟨e⟩ = String.ofList ((s.toList.drop b).take (e - b)) := by
  unfold String.Pos.Raw.extract
  dsimp only
  by_cases h : b ≥ e
  · have hbeq : b = e := by omega
    subst hbeq
    simp
  · simp only [h, ↓reduceIte]
    simpa using congrArg String.ofList (extract_go1_ascii s.toList hs 0 b e hbe he)

/-- Simple structural char-list splitter used to characterize `String.splitOn` on ASCII strings. -/
private def splitCharAux (d : Char) (cur : List Char) : List Char → List (List Char)
  | [] => [cur.reverse]
  | c :: cs =>
    if c == d then cur.reverse :: splitCharAux d [] cs
    else splitCharAux d (c :: cur) cs

private theorem splitOnAux_ascii (s : String) (d : Char)
    (hs : ∀ c ∈ s.toList, c.utf8Size = 1) (hd : d.utf8Size = 1) :
    ∀ (rem b i : ℕ) (r : List String),
      b ≤ i → i ≤ s.toList.length → rem = s.toList.length - i →
      s.splitOnAux (String.ofList [d]) ⟨b⟩ ⟨i⟩ 0 r =
        r.reverse ++ (splitCharAux d ((s.toList.drop b).take (i - b)).reverse (s.toList.drop i)).map String.ofList := by
  have hlen : s.utf8ByteSize = s.toList.length := by
    have := utf8ByteSize_ofList_ascii s.toList hs
    rwa [String.ofList_toList] at this
  have hsep_get : String.Pos.Raw.get (String.ofList [d]) 0 = d := by
    simpa using posRaw_get_ascii (String.ofList [d]) (by simpa using hd) 0 (by simp)
  have hsep_next : String.Pos.Raw.next (String.ofList [d]) 0 = ⟨1⟩ := by
    simpa using posRaw_next_ascii (String.ofList [d]) (by simpa using hd) 0 (by simp)
  have hsep_atEnd : String.Pos.Raw.atEnd (String.ofList [d]) ⟨1⟩ = true := by
    simp [String.Pos.Raw.atEnd, hd]
  intro rem
  induction rem with
  | zero =>
    intro b i r hbi hi hrem
    have hieq : i = s.toList.length := by omega
    subst hieq
    rw [String.splitOnAux.eq_def]
    have hat : String.Pos.Raw.atEnd s ⟨s.toList.length⟩ = true := by
      simp [String.Pos.Raw.atEnd, hlen]
    simp only [hat, ↓reduceIte]
    rw [posRaw_extract_ascii s hs b s.toList.length hbi le_rfl]
    simp [splitCharAux]
  | succ rem' ih =>
    intro b i r hbi hi hrem
    have hilt : i < s.toList.length := by omega
    rw [String.splitOnAux.eq_def]
    have hat : String.Pos.Raw.atEnd s ⟨i⟩ = false := by
      simp [String.Pos.Raw.atEnd, hlen]; omega
    simp only [hat, Bool.false_eq_true, ↓reduceIte]
    rw [posRaw_get_ascii s hs i hilt, hsep_get]
    rw [List.drop_eq_getElem_cons hilt]
    by_cases hcd : (s.toList[i] == d) = true
    · simp only [hcd, ↓reduceIte]
      rw [posRaw_next_ascii s hs i hilt, hsep_next, hsep_atEnd]
      simp only [↓reduceIte]
      have hunoff : String.Pos.Raw.unoffsetBy ⟨i + 1⟩ ⟨1⟩ = ⟨i⟩ := by
        ext; simp [String.Pos.Raw.unoffsetBy]
      rw [hunoff, posRaw_extract_ascii s hs b i hbi hilt.le]
      rw [ih (i + 1) (i + 1) _ le_rfl hilt (by omega)]
      simp [splitCharAux, hcd, List.append_assoc]
    · simp only [hcd]
      have hunoff : String.Pos.Raw.unoffsetBy ⟨i⟩ 0 = ⟨i⟩ := by
        ext; simp [String.Pos.Raw.unoffsetBy]
      rw [hunoff, posRaw_next_ascii s hs i hilt]
      rw [ih b (i + 1) r (by omega) hilt (by omega)]
      have htake : (s.toList.drop b).take (i + 1 - b) =
          (s.toList.drop b).take (i - b) ++ [s.toList[i]] := by
        have hlen_drop : i - b < (s.toList.drop b).length := by simp; omega
        have heq_sub : i + 1 - b = (i - b) + 1 := by omega
        rw [heq_sub, List.take_add_one, List.getElem?_eq_getElem hlen_drop]
        simp [List.getElem_drop, Nat.add_sub_cancel' hbi]
      simp [splitCharAux, hcd, htake]

private theorem splitOn_ascii (cs : List Char) (d : Char)
    (hcs : ∀ c ∈ cs, c.utf8Size = 1) (hd : d.utf8Size = 1) :
    (String.ofList cs).splitOn (String.ofList [d]) =
      (splitCharAux d [] cs).map String.ofList := by
  rw [String.splitOn.eq_def]
  have hne : (String.ofList [d] == "") = false := by
    rw [beq_eq_false_iff_ne]
    intro h
    have := congrArg String.toList h
    simp at this
  simp only [hne, Bool.false_eq_true, ↓reduceIte]
  have h := splitOnAux_ascii (String.ofList cs) d (by simpa using hcs) hd cs.length 0 0 []
    le_rfl (by simp) (by simp)
  simpa using h

private theorem splitCharAux_no_sep (d : Char) (a : List Char) (ha : ∀ c ∈ a, c ≠ d) :
    ∀ cur : List Char, splitCharAux d cur a = [cur.reverse ++ a] := by
  induction a with
  | nil => intro cur; simp [splitCharAux]
  | cons c cs ih =>
    intro cur
    have hne : (c == d) = false := beq_false_of_ne (ha c (List.mem_cons_self ..))
    simp only [splitCharAux, hne, Bool.false_eq_true, ↓reduceIte]
    rw [ih (fun x hx => ha x (List.mem_cons_of_mem _ hx))]
    simp [List.append_assoc]

private theorem splitCharAux_sep (d : Char) (a rest : List Char) (ha : ∀ c ∈ a, c ≠ d) :
    ∀ cur : List Char, splitCharAux d cur (a ++ d :: rest) = (cur.reverse ++ a) :: splitCharAux d [] rest := by
  induction a with
  | nil => intro cur; simp [splitCharAux]
  | cons c cs ih =>
    intro cur
    have hne : (c == d) = false := beq_false_of_ne (ha c (List.mem_cons_self ..))
    simp only [List.cons_append, splitCharAux, hne, Bool.false_eq_true, ↓reduceIte]
    rw [ih (fun x hx => ha x (List.mem_cons_of_mem _ hx))]
    simp [List.append_assoc]

private theorem qChars_eq (q : ℕ × Option ℕ) (acc : List Char) :
    qChars q acc = qChars q [] ++ acc := by
  cases q with
  | mk n od =>
    cases od with
    | none => exact natCharsGo_append 20 n acc
    | some d =>
      simp only [qChars]
      rw [natCharsGo_append 20 n ('/' :: natCharsGo 20 d acc),
        natCharsGo_append 20 d acc,
        natCharsGo_append 20 n ('/' :: natCharsGo 20 d [])]
      simp [List.append_assoc]

private theorem capChars_eq (p : (ℕ × Option ℕ) × (ℕ × Option ℕ)) (acc : List Char) :
    capChars p acc = capChars p [] ++ acc := by
  cases p with
  | mk x y =>
    simp only [capChars]
    rw [qChars_eq x (':' :: qChars y acc), qChars_eq y acc, qChars_eq x (':' :: qChars y [])]
    simp [List.append_assoc]

private theorem qChars_ascii (q : ℕ × Option ℕ) :
    ∀ c ∈ qChars q [], c.utf8Size = 1 ∧ c ≠ ':' ∧ c ≠ ';' := by
  cases q with
  | mk n od =>
    cases od with
    | none =>
      intro c hc
      have h := natCharsGo_digits 20 n [] (by simp) c hc
      exact ⟨h.2.1, h.2.2.2.2.2.1, h.2.2.2.2.1⟩
    | some d =>
      intro c hc
      simp only [qChars] at hc
      rw [natCharsGo_append] at hc
      rcases List.mem_append.1 hc with h1 | h2
      · have h := natCharsGo_digits 20 n [] (by simp) c h1
        exact ⟨h.2.1, h.2.2.2.2.2.1, h.2.2.2.2.1⟩
      · rcases List.mem_cons.1 h2 with rfl | h3
        · decide
        · have h := natCharsGo_digits 20 d [] (by simp) c h3
          exact ⟨h.2.1, h.2.2.2.2.2.1, h.2.2.2.2.1⟩

private theorem capChars_ascii (p : (ℕ × Option ℕ) × (ℕ × Option ℕ)) :
    ∀ c ∈ capChars p [], c.utf8Size = 1 ∧ c ≠ ';' := by
  cases p with
  | mk x y =>
    intro c hc
    simp only [capChars] at hc
    rw [qChars_eq] at hc
    rcases List.mem_append.1 hc with h1 | h2
    · exact ⟨(qChars_ascii x c h1).1, (qChars_ascii x c h1).2.2⟩
    · rcases List.mem_cons.1 h2 with rfl | h3
      · decide
      · exact ⟨(qChars_ascii y c h3).1, (qChars_ascii y c h3).2.2⟩

private theorem capsChars_ascii (toks : List ((ℕ × Option ℕ) × (ℕ × Option ℕ))) :
    ∀ c ∈ capsChars toks, c.utf8Size = 1 := by
  induction toks with
  | nil => simp [capsChars]
  | cons p ps ih =>
    cases ps with
    | nil =>
      intro c hc
      exact (capChars_ascii p c hc).1
    | cons p2 ps' =>
      intro c hc
      simp only [capsChars] at hc
      rw [capChars_eq] at hc
      rcases List.mem_append.1 hc with h1 | h2
      · exact (capChars_ascii p c h1).1
      · rcases List.mem_cons.1 h2 with rfl | h3
        · decide
        · exact ih c h3

private theorem parseQ_qChars (q : ℕ × Option ℕ) (hq : qTokInRange q = true) :
    parseQ (String.ofList (qChars q [])) = evalQTok q := by
  have hslash : String.ofList ['/'] = "/" := rfl
  cases q with
  | mk n od =>
    cases od with
    | none =>
      simp only [qTokInRange, decide_eq_true_eq] at hq
      unfold parseQ
      have hd : ∀ c ∈ natChars n, IsAsciiDigit c := natCharsGo_digits 20 n [] (by simp)
      have hsp : (String.ofList (natChars n)).splitOn "/" = [String.ofList (natChars n)] := by
        have h := splitOn_ascii (natChars n) '/' (fun c hc => (hd c hc).2.1) (by decide)
        rw [hslash, splitCharAux_no_sep '/' _ (fun c hc => (hd c hc).2.2.2.2.2.2) []] at h
        simpa using h
      change (match (String.ofList (natChars n)).splitOn "/" with
        | [a] => (a.toInt! : ℚ)
        | [a, b] => (a.toInt! : ℚ) / (b.toNat! : ℚ)
        | _ => 0) = evalQTok (n, none)
      rw [hsp]
      dsimp only
      rw [toInt!_natChars n hq]
      rfl
    | some d =>
      simp only [qTokInRange, Bool.and_eq_true, decide_eq_true_eq] at hq
      unfold parseQ
      have hdn : ∀ c ∈ natChars n, IsAsciiDigit c := natCharsGo_digits 20 n [] (by simp)
      have hdd : ∀ c ∈ natChars d, IsAsciiDigit c := natCharsGo_digits 20 d [] (by simp)
      have hqeq : qChars (n, some d) [] = natChars n ++ '/' :: natChars d := by
        simp only [qChars, natChars]; exact natCharsGo_append 20 n _
      rw [hqeq]
      have hascii : ∀ c ∈ natChars n ++ '/' :: natChars d, c.utf8Size = 1 := by
        intro c hc
        rcases List.mem_append.1 hc with h1 | h2
        · exact (hdn c h1).2.1
        · rcases List.mem_cons.1 h2 with rfl | h3
          · decide
          · exact (hdd c h3).2.1
      have hsp : (String.ofList (natChars n ++ '/' :: natChars d)).splitOn "/" =
          [String.ofList (natChars n), String.ofList (natChars d)] := by
        have h := splitOn_ascii _ '/' hascii (by decide)
        rw [hslash, splitCharAux_sep '/' (natChars n) (natChars d)
          (fun c hc => (hdn c hc).2.2.2.2.2.2) [],
          splitCharAux_no_sep '/' (natChars d) (fun c hc => (hdd c hc).2.2.2.2.2.2) []] at h
        simpa using h
      rw [hsp]
      dsimp only
      rw [toInt!_natChars n hq.1, toNat!_natChars d hq.2]
      rfl

private theorem parseCap_capChars (p : (ℕ × Option ℕ) × (ℕ × Option ℕ)) (hp : capTokInRange p = true) :
    parseCap (String.ofList (capChars p [])) = evalCapTok p := by
  have hcolon : String.ofList [':'] = ":" := rfl
  cases p with
  | mk x y =>
    simp only [capTokInRange, Bool.and_eq_true] at hp
    have hceq : capChars (x, y) [] = qChars x [] ++ ':' :: qChars y [] := by
      simp only [capChars]; exact qChars_eq x _
    unfold parseCap
    rw [hceq]
    have hascii : ∀ c ∈ qChars x [] ++ ':' :: qChars y [], c.utf8Size = 1 := by
      intro c hc
      rcases List.mem_append.1 hc with h1 | h2
      · exact (qChars_ascii x c h1).1
      · rcases List.mem_cons.1 h2 with rfl | h3
        · decide
        · exact (qChars_ascii y c h3).1
    have hsp : (String.ofList (qChars x [] ++ ':' :: qChars y [])).splitOn ":" =
        [String.ofList (qChars x []), String.ofList (qChars y [])] := by
      have h := splitOn_ascii _ ':' hascii (by decide)
      rw [hcolon, splitCharAux_sep ':' (qChars x []) (qChars y [])
        (fun c hc => (qChars_ascii x c hc).2.1) [],
        splitCharAux_no_sep ':' (qChars y []) (fun c hc => (qChars_ascii y c hc).2.1) []] at h
      simpa using h
    rw [hsp]
    dsimp only
    rw [parseQ_qChars x hp.1, parseQ_qChars y hp.2]
    rfl

private theorem splitCharAux_capsChars (toks : List ((ℕ × Option ℕ) × (ℕ × Option ℕ))) (hne : toks ≠ []) :
    splitCharAux ';' [] (capsChars toks) = toks.map (fun p => capChars p []) := by
  induction toks with
  | nil => contradiction
  | cons p ps ih =>
    cases ps with
    | nil =>
      simp only [capsChars, List.map_cons, List.map_nil]
      simpa using splitCharAux_no_sep ';' (capChars p []) (fun c hc => (capChars_ascii p c hc).2) []
    | cons p2 ps' =>
      simp only [capsChars, List.map_cons]
      rw [capChars_eq]
      rw [splitCharAux_sep ';' (capChars p []) (capsChars (p2 :: ps'))
        (fun c hc => (capChars_ascii p c hc).2) []]
      simpa using ih (by simp)

/-- **Pure-kernel evaluation of `Row.nodeList`**: if `r.nodes = String.ofList (capsChars toks)`
for a nonempty token list `toks` whose numerals are all `< 10^20`, then `r.nodeList = toks.map evalCapTok`. -/
theorem nodeList_eq_of_capsChars (r : Row) (toks : List ((ℕ × Option ℕ) × (ℕ × Option ℕ)))
    (hne : toks ≠ [])
    (hrange : toks.all capTokInRange = true)
    (hstr : String.ofList (capsChars toks) = r.nodes) :
    r.nodeList = toks.map evalCapTok := by
  have hsemi : String.ofList [';'] = ";" := rfl
  have hnonempty_chars : capsChars toks ≠ [] := by
    cases toks with
    | nil => contradiction
    | cons p ps =>
      cases p with
      | mk x y =>
        cases ps with
        | nil =>
          simp only [capsChars, capChars]
          rw [qChars_eq]; simp
        | cons _ _ =>
          simp only [capsChars]
          rw [capChars_eq]; simp
  have hne_str : r.nodes ≠ "" := by
    rw [← hstr]
    intro h
    have := congrArg String.toList h
    simp [hnonempty_chars] at this
  unfold Row.nodeList splitL
  simp only [hne_str, ↓reduceIte]
  rw [← hstr]
  have hsp : (String.ofList (capsChars toks)).splitOn ";" =
      (toks.map (fun p => capChars p [])).map String.ofList := by
    have h := splitOn_ascii (capsChars toks) ';' (capsChars_ascii toks) (by decide)
    rw [hsemi, splitCharAux_capsChars toks hne] at h
    exact h
  rw [hsp, List.map_map, List.map_map]
  refine List.map_congr_left fun p hp => ?_
  exact parseCap_capChars p (List.all_eq_true.1 hrange p hp)

end Grothe.LowerAnalytic
