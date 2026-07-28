import AxiomaticSystemsTheoryCanonicalLaneLean.FormalLanguage

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure DeductionSystemPackage (L : FormalLanguagePackage) where
  axioms : L.formulas → Prop
  rules : Type
  derivability : L.formulas → L.formulas → Prop
  soundness : Prop
  completeness : Prop

def DeductionSystemClosed {L : FormalLanguagePackage} (D : DeductionSystemPackage L) : Prop :=
  D.soundness ∧ D.completeness

structure DeductionSystemEvidence {L : FormalLanguagePackage} (D : DeductionSystemPackage L) where
  soundnessClosed : D.soundness
  completenessClosed : D.completeness

theorem deduction_system_closed_from_evidence {L : FormalLanguagePackage} (D : DeductionSystemPackage L) (E : DeductionSystemEvidence D) :
    DeductionSystemClosed D := by
  exact And.intro E.soundnessClosed E.completenessClosed

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse