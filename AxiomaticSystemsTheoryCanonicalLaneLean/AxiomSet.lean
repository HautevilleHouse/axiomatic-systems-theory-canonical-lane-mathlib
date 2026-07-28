import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure AxiomSet (F : FormalSystem) where
  axioms : Set F.formula
  independence : Prop
  consistency : Prop
  independenceProof : independence
  consistencyProof : consistency

structure AxiomSetEvidence {F : FormalSystem} (A : AxiomSet F) where
  independenceClosed : A.independence
  consistencyClosed : A.consistency

def AxiomSetClosed {F : FormalSystem} (A : AxiomSet F) : Prop :=
  A.independence ∧ A.consistency

theorem axiom_set_closed_from_evidence {F : FormalSystem} (A : AxiomSet F) (E : AxiomSetEvidence A) : AxiomSetClosed A :=
  And.intro E.independenceClosed E.consistencyClosed

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse