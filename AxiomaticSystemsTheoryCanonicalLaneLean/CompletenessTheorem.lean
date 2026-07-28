import canonicalLaneMathlib.AdmissibleClass
import AxiomaticSystem
import ConsistencyModel

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure CompletenessTheorem {S : AxiomaticSystem} where
  syntacticConsistency : Prop
  semanticConsistency : Prop
  impliesModelsEveryConsistent : Prop
  syntacticConsistencyTerm : syntacticConsistency
  semanticConsistencyTerm : semanticConsistency

structure CompletenessTheoremEvidence {S : AxiomaticSystem} (C : CompletenessTheorem S) where
  syntacticConsistencyClosed : C.syntacticConsistency
  semanticConsistencyClosed : C.semanticConsistency
  impliesModelsEveryConsistentClosed : C.impliesModelsEveryConsistent

def CompletenessTheoremClosed {S : AxiomaticSystem} (C : CompletenessTheorem S) : Prop :=
  C.syntacticConsistency ∧ C.semanticConsistency ∧ C.impliesModelsEveryConsistent

theorem completeness_theorem_closed_from_evidence {S : AxiomaticSystem} (C : CompletenessTheorem S) (E : CompletenessTheoremEvidence C) : CompletenessTheoremClosed C := by
  exact And.intro E.syntacticConsistencyClosed (And.intro E.semanticConsistencyClosed E.impliesModelsEveryConsistentClosed)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse