import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure DeductionClosurePackage {F : FormalSystemPackage} (F : FormalSystemPackage) where
  theorems : Set (List F.alphabet)
  derivationLengthBound : ℕ
  closureProperty : Prop
  soundness : Prop
  completeness : Prop

structure DeductionClosureEvidence {F : FormalSystemPackage} (D : DeductionClosurePackage F) where
  closurePropertyClosed : D.closureProperty
  soundnessClosed : D.soundness
  completenessClosed : D.completeness

def DeductionClosureClosed {F : FormalSystemPackage} (D : DeductionClosurePackage F) : Prop :=
  D.closureProperty ∧ D.soundness ∧ D.completeness

theorem deduction_closure_closed_from_evidence {F : FormalSystemPackage} (D : DeductionClosurePackage F) (E : DeductionClosureEvidence D) :
    DeductionClosureClosed D := by
  exact And.intro E.closurePropertyClosed (And.intro E.soundnessClosed E.completenessClosed)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse