import canonicalLaneMathlib.AdmissibleClass
import AxiomaticSystem

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure IndependenceProof {S : AxiomaticSystem} (φ : Formula S.language) where
  modelWhereTrue : ConsistencyModel S
  modelWhereFalse : ConsistencyModel S
  φTrueInModel : modelWhereTrue.interpretation φ
  φFalseInModel : ¬ modelWhereFalse.interpretation φ

structure IndependenceProofEvidence {S : AxiomaticSystem} {φ : Formula S.language} (I : IndependenceProof S φ) where
  φTrueInModelClosed : I.φTrueInModel
  φFalseInModelClosed : I.φFalseInModel

def IndependenceProofClosed {S : AxiomaticSystem} {φ : Formula S.language} (I : IndependenceProof S φ) : Prop :=
  I.φTrueInModel ∧ I.φFalseInModel

theorem independence_proof_closed_from_evidence {S : AxiomaticSystem} {φ : Formula S.language} (I : IndependenceProof S φ) (E : IndependenceProofEvidence I) : IndependenceProofClosed I := by
  exact And.intro E.φTrueInModelClosed E.φFalseInModelClosed

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse