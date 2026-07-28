import canonicalLaneMathlib.AdmissibleClass
import AxiomaticSystemsTheoryCanonicalLaneLean.AxiomSystem

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure CompletenessPackage (S : AxiomSystemPackage) where
  semanticCompleteness : Prop
  syntacticCompleteness : Prop
  completenessProof : Prop
  completenessCriterion : Prop

structure CompletenessEvidence {S : AxiomSystemPackage} (C : CompletenessPackage S) where
  semanticCompletenessClosed : C.semanticCompleteness
  syntacticCompletenessClosed : C.syntacticCompleteness
  completenessProofClosed : C.completenessProof
  completenessCriterionClosed : C.completenessCriterion

def CompletenessClosed {S : AxiomSystemPackage} (C : CompletenessPackage S) : Prop :=
  C.semanticCompleteness ∧ C.syntacticCompleteness ∧ C.completenessProof ∧ C.completenessCriterion

theorem completeness_closed_from_evidence {S : AxiomSystemPackage} (C : CompletenessPackage S) (E : CompletenessEvidence C) : CompletenessClosed C := by
  exact And.intro E.semanticCompletenessClosed (And.intro E.syntacticCompletenessClosed
    (And.intro E.completenessProofClosed E.completenessCriterionClosed))

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse