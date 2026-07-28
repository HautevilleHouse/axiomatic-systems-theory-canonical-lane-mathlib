import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure AxiomaticSystem where
  language : Type u
  axioms : List (Formula language)
  inferenceRules : List (Rule language)
  wellFormed : Prop
  axiomsFinite : Prop
  rulesSound : Prop

structure AxiomaticSystemEvidence (S : AxiomaticSystem) where
  wellFormedClosed : S.wellFormed
  axiomsFiniteClosed : S.axiomsFinite
  rulesSoundClosed : S.rulesSound

def AxiomaticSystemClosed (S : AxiomaticSystem) : Prop :=
  S.wellFormed ∧ S.axiomsFinite ∧ S.rulesSound

theorem axiomatic_system_closed_from_evidence (S : AxiomaticSystem) (E : AxiomaticSystemEvidence S) : AxiomaticSystemClosed S := by
  exact And.intro E.wellFormedClosed (And.intro E.axiomsFiniteClosed E.rulesSoundClosed)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse