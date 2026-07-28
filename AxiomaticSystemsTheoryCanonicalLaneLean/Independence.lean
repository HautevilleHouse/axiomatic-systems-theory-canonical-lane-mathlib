import canonicalLaneMathlib.AdmissibleClass
import AxiomaticSystemsTheoryCanonicalLaneLean.AxiomSystem

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure IndependencePackage (S : AxiomSystemPackage) where
  independentAxioms : Prop
  nonDerivabilityProof : Prop
  counterexampleModel : Prop
  independenceCriterion : Prop

structure IndependenceEvidence {S : AxiomSystemPackage} (I : IndependencePackage S) where
  independentAxiomsClosed : I.independentAxioms
  nonDerivabilityProofClosed : I.nonDerivabilityProof
  counterexampleModelClosed : I.counterexampleModel
  independenceCriterionClosed : I.independenceCriterion

def IndependenceClosed {S : AxiomSystemPackage} (I : IndependencePackage S) : Prop :=
  I.independentAxioms ∧ I.nonDerivabilityProof ∧ I.counterexampleModel ∧ I.independenceCriterion

theorem independence_closed_from_evidence {S : AxiomSystemPackage} (I : IndependencePackage S) (E : IndependenceEvidence I) : IndependenceClosed I := by
  exact And.intro E.independentAxiomsClosed (And.intro E.nonDerivabilityProofClosed
    (And.intro E.counterexampleModelClosed E.independenceCriterionClosed))

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse