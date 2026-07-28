import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure FormalSystemPackage where
  alphabet : Type u
  wellFormedFormulas : Set (List alphabet)
  axioms : Set (List alphabet)
  inferenceRules : Set (List alphabet → List alphabet)
  languageSpecified : Prop
  axiomsDefined : Prop
  rulesDefined : Prop

structure FormalSystemEvidence (F : FormalSystemPackage) where
  languageSpecifiedClosed : F.languageSpecified
  axiomsDefinedClosed : F.axiomsDefined
  rulesDefinedClosed : F.rulesDefined

def FormalSystemClosed (F : FormalSystemPackage) : Prop :=
  F.languageSpecified ∧ F.axiomsDefined ∧ F.rulesDefined

theorem formal_system_closed_from_evidence (F : FormalSystemPackage) (E : FormalSystemEvidence F) :
    FormalSystemClosed F := by
  exact And.intro E.languageSpecifiedClosed (And.intro E.axiomsDefinedClosed E.rulesDefinedClosed)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse