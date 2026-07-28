import AxiomaticSystemsTheoryCanonicalLaneLean.DeductionSystem

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure ModelTheoryPackage {L : FormalLanguagePackage} {D : DeductionSystemPackage L} where
  models : Type
  interpretation : L.formulas → models → Prop
  satisfaction : Prop
  compactness : Prop
  lowenheimSkolem : Prop

def ModelTheoryClosed {L : FormalLanguagePackage} {D : DeductionSystemPackage L} (M : ModelTheoryPackage L D) : Prop :=
  M.satisfaction ∧ M.compactness ∧ M.lowenheimSkolem

structure ModelTheoryEvidence {L : FormalLanguagePackage} {D : DeductionSystemPackage L} (M : ModelTheoryPackage L D) where
  satisfactionClosed : M.satisfaction
  compactnessClosed : M.compactness
  lowenheimSkolemClosed : M.lowenheimSkolem

theorem model_theory_closed_from_evidence {L : FormalLanguagePackage} {D : DeductionSystemPackage L} (M : ModelTheoryPackage L D) (E : ModelTheoryEvidence M) :
    ModelTheoryClosed M := by
  exact And.intro E.satisfactionClosed (And.intro E.compactnessClosed E.lowenheimSkolemClosed)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse