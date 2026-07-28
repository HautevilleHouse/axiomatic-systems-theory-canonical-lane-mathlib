import canonicalLaneMathlib.AdmissibleClass
import AxiomaticSystemsTheoryCanonicalLaneLean.AxiomSystem

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure ConsistencyPackage (S : AxiomSystemPackage) where
  syntacticConsistency : Prop
  semanticConsistency : Prop
  consistencyProofExists : Prop
  consistencyCriterion : Prop

structure ConsistencyEvidence {S : AxiomSystemPackage} (C : ConsistencyPackage S) where
  syntacticConsistencyClosed : C.syntacticConsistency
  semanticConsistencyClosed : C.semanticConsistency
  consistencyProofExistsClosed : C.consistencyProofExists
  consistencyCriterionClosed : C.consistencyCriterion

def ConsistencyClosed {S : AxiomSystemPackage} (C : ConsistencyPackage S) : Prop :=
  C.syntacticConsistency ∧ C.semanticConsistency ∧ C.consistencyProofExists ∧ C.consistencyCriterion

theorem consistency_closed_from_evidence {S : AxiomSystemPackage} (C : ConsistencyPackage S) (E : ConsistencyEvidence C) : ConsistencyClosed C := by
  exact And.intro E.syntacticConsistencyClosed (And.intro E.semanticConsistencyClosed
    (And.intro E.consistencyProofExistsClosed E.consistencyCriterionClosed))

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse