import canonicalLaneMathlib.AdmissibleClass
import AxiomaticSystem

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure ConsistencyModel {S : AxiomaticSystem} where
  universe : Type u
  interpretation : S.language → universe → Prop
  satisfiesAxioms : ∀ (ax : Formula S.language), ax ∈ S.axioms → interpretation ax
  noContradiction : ¬ (∃ (φ : Formula S.language), interpretation φ ∧ interpretation (¬ φ))

structure ConsistencyModelEvidence {S : AxiomaticSystem} (M : ConsistencyModel S) where
  satisfiesAxiomsClosed : M.satisfiesAxioms
  noContradictionClosed : M.noContradiction

def ConsistencyModelClosed {S : AxiomaticSystem} (M : ConsistencyModel S) : Prop :=
  M.satisfiesAxioms ∧ M.noContradiction

theorem consistency_model_closed_from_evidence {S : AxiomaticSystem} (M : ConsistencyModel S) (E : ConsistencyModelEvidence M) : ConsistencyModelClosed M := by
  exact And.intro E.satisfiesAxiomsClosed E.noContradictionClosed

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse