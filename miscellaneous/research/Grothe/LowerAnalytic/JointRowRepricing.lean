import Mathlib.Tactic

/-!+Exact row reparameterization after pricing the selected projection squares.
These are scalar identities, not a global potential or Grothendieck bound.
-/
namespace Grothe.LowerAnalytic.JointRowRepricing

noncomputable section

def invQuad (a b c x y : ℝ) : ℝ :=
  (c*x^2-2*b*x*y+a*y^2)/(a*c-b^2)

def alpha1 (a b c x y : ℝ) : ℝ := (b*y-c*x)/(a*c-b^2)
def alpha2 (a b c x y : ℝ) : ℝ := (b*x-a*y)/(a*c-b^2)

def price (a b c e00 eps e1 e2 a0 a1 a2 : ℝ) : ℝ :=
  e00-eps+2*a0-invQuad a b c (e1+a1) (e2+a2)

/-- Completing the visible square after its linear price is exact. -/
theorem visible_completion (t ell beta eps l0 l1 : ℝ) :
    t^2-2*ell*t+2*beta^2/eps-l0*t+2*beta*l1/eps+l1^2/(2*eps) =
      t^2-2*(ell+l0/2)*t+2*(beta+l1/2)^2/eps := by
  ring

/-- Translation of the inverse gate quadratic retains the cross term. -/
theorem invQuad_shift (a b c x y u v : ℝ) :
    invQuad a b c (x+u/2) (y+v/2) =
      invQuad a b c x y-u*alpha1 a b c x y-v*alpha2 a b c x y
        +invQuad a b c u v/4 := by
  unfold invQuad alpha1 alpha2
  ring

/-- The remote prices simply replace the coupling vector. -/
theorem price_shift (a b c e00 eps e1 e2 a0 a1 a2 u0 u1 u2 : ℝ) :
    price a b c e00 eps e1 e2 (a0+u0/2) (a1+u1/2) (a2+u2/2) =
      price a b c e00 eps e1 e2 a0 a1 a2+u0
        +u1*alpha1 a b c (e1+a1) (e2+a2)
        +u2*alpha2 a b c (e1+a1) (e2+a2)-invQuad a b c u1 u2/4 := by
  unfold price invQuad alpha1 alpha2
  ring

/-- Scale the three remote prices with tau. The complete priced constant
then becomes the ordinary constant of one fixed new row, uniformly in t,tau.
No division by tau, minimax exchange, or contact-neighborhood assumption occurs. -/
theorem dual_constant_is_row (t tau ell beta eps l0 l1
    a b c e00 e1 e2 a0 a1 a2 u0 u1 u2 : ℝ) :
    t^2-2*ell*t+2*beta^2/eps
      -price a b c e00 eps e1 e2 a0 a1 a2*tau^2
      -l0*t+2*beta*l1/eps+l1^2/(2*eps)
      -(u0+u1*alpha1 a b c (e1+a1) (e2+a2)
        +u2*alpha2 a b c (e1+a1) (e2+a2))*tau^2
      +invQuad a b c u1 u2*tau^2/4 =
    t^2-2*(ell+l0/2)*t+2*(beta+l1/2)^2/eps
      -price a b c e00 eps e1 e2 (a0+u0/2) (a1+u1/2) (a2+u2/2)*tau^2 := by
  rw [price_shift]
  have hvis := visible_completion t ell beta eps l0 l1
  nlinarith [hvis]

/-- The priced support shift uses the same new row at every tau. -/
theorem forcing_scale (tau a mu : ℝ) : tau*a+(tau*mu)/2=tau*(a+mu/2) := by
  ring

#print axioms visible_completion
#print axioms invQuad_shift
#print axioms price_shift
#print axioms dual_constant_is_row
#print axioms forcing_scale

end
end Grothe.LowerAnalytic.JointRowRepricing
