import HautevilleHouse.AxiomaticSystemsTheoryCanonicalLaneLean.DeductionSystems

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure ModelBridge {S : AxiomScheme} (D : DeductionSystem S) where
  structureType : Type u
  interpretation : D.formulas → (structureType → Prop)
  satisfaction : (structureType → Prop) → structureType → Prop
  soundness : ∀ (f : D.formulas), (D.deductionRelation (fun _ => True) f) → ∀ (M : structureType), satisfaction (interpretation f) M
  completeness : ∀ (f : D.formulas), (∀ (M : structureType), satisfaction (interpretation f) M) → D.deductionRelation (fun _ => True) f

structure ModelBridgeEvidence {S : AxiomScheme} {D : DeductionSystem S} (B : ModelBridge D) where
  structureTypeNonempty : Nonempty B.structureType
  interpretationWellDefined : ∀ f g, f = g → B.interpretation f = B.interpretation g
  satisfactionConsistent : ∀ p q : D.formulas → Prop, (∀ x, p x = q x) → B.satisfaction p = B.satisfaction q
  soundnessClosed : B.soundness
  completenessClosed : B.completeness

def ModelBridgeClosed {S : AxiomScheme} {D : DeductionSystem S} (B : ModelBridge D) : Prop :=
  Nonempty B.structureType ∧
  B.soundness ∧ B.completeness

theorem model_bridge_closed_from_evidence {S : AxiomScheme} {D : DeductionSystem S}
  (B : ModelBridge D) (E : ModelBridgeEvidence B) : ModelBridgeClosed B := by
  exact And.intro E.structureTypeNonempty
    (And.intro E.soundnessClosed E.completenessClosed)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse