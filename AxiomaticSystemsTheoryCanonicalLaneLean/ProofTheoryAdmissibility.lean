import HautevilleHouse.AxiomaticSystemsTheoryCanonicalLaneLean.ModelTheoryBridges

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure AdmissibilityRule {S : AxiomScheme} {D : DeductionSystem S} where
  premises : List (S.language → Prop)
  conclusion : S.language → Prop
  admissibilityCondition : Prop

structure AdmissibilityRuleEvidence {S : AxiomScheme} {D : DeductionSystem S}
  (R : AdmissibilityRule S D) where
  premisesDerivable : ∀ p ∈ R.premises, D.deductionRelation (fun _ => True) p
  conclusionDerivable : D.deductionRelation (fun _ => True) R.conclusion
  conditionSatisfied : R.admissibilityCondition

def AdmissibilityRuleClosed {S : AxiomScheme} {D : DeductionSystem S}
  (R : AdmissibilityRule S D) : Prop :=
  (∀ p ∈ R.premises, D.deductionRelation (fun _ => True) p) ∧
  D.deductionRelation (fun _ => True) R.conclusion ∧
  R.admissibilityCondition

theorem admissibility_rule_closed_from_evidence {S : AxiomScheme} {D : DeductionSystem S}
  (R : AdmissibilityRule S D) (E : AdmissibilityRuleEvidence R) :
  AdmissibilityRuleClosed R := by
  exact And.intro E.premisesDerivable
    (And.intro E.conclusionDerivable E.conditionSatisfied)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse