import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure AxiomSystemPackage where
  language : Type u
  sentence : language → Prop
  axiom : language → Prop
  theorem : language → Prop
  axiomSystemClosed : Prop
  deductiveClosure : Prop
  consistent : Prop

structure AxiomSystemEvidence (S : AxiomSystemPackage) where
  axiomSystemClosed : S.axiomSystemClosed
  deductiveClosure : S.deductiveClosure
  consistent : S.consistent

def AxiomSystemClosed (S : AxiomSystemPackage) : Prop :=
  S.axiomSystemClosed ∧ S.deductiveClosure ∧ S.consistent

theorem axiom_system_closed_from_evidence (S : AxiomSystemPackage) (E : AxiomSystemEvidence S) : AxiomSystemClosed S := by
  exact And.intro E.axiomSystemClosed (And.intro E.deductiveClosure E.consistent)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse