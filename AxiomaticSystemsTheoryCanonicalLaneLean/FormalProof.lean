import canonicalLaneMathlib.AdmissibleClass
import AxiomaticSystem
import FormalLanguage

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure FormalProof {S : AxiomaticSystem} (φ : Formula S.language) where
  steps : List (Formula S.language)
  lastStepIsφ : steps ≠ [] ∧ steps.getLast = φ
  eachStepIsAxiomOrInference : ∀ (step : Formula S.language), step ∈ steps → (step ∈ S.axioms) ∨ (∃ (rule : Rule S.language), rule ∈ S.inferenceRules ∧ ruleApplies rule step steps)
ruleApplies : Rule S.language → Formula S.language → List (Formula S.language) → Prop := sorry

structure FormalProofEvidence {S : AxiomaticSystem} {φ : Formula S.language} (P : FormalProof S φ) where
  lastStepIsφClosed : P.lastStepIsφ
  eachStepIsAxiomOrInferenceClosed : P.eachStepIsAxiomOrInference

def FormalProofClosed {S : AxiomaticSystem} {φ : Formula S.language} (P : FormalProof S φ) : Prop :=
  P.lastStepIsφ ∧ P.eachStepIsAxiomOrInference

theorem formal_proof_closed_from_evidence {S : AxiomaticSystem} {φ : Formula S.language} (P : FormalProof S φ) (E : FormalProofEvidence P) : FormalProofClosed P := by
  exact And.intro E.lastStepIsφClosed E.eachStepIsAxiomOrInferenceClosed

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse