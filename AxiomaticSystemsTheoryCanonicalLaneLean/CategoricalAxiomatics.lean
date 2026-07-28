import HautevilleHouse.AxiomaticSystemsTheoryCanonicalLaneLean.ProofTheoryAdmissibility

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure CategoricalAxiomatization {S : AxiomScheme} {D : DeductionSystem S} where
  categoryType : Type u
  objects : Type v
  morphisms : objects → objects → Type w
  interpretation : D.formulas → (objects → Prop)
  completenessCategorical : ∀ (A B : objects), (∀ f : D.formulas, interpretation f A → interpretation f B) →
    Nonempty (morphisms A B)
  soundnessCategorical : ∀ (A B : objects), Nonempty (morphisms A B) →
    (∀ f : D.formulas, interpretation f A → interpretation f B)

structure CategoricalAxiomatizationEvidence {S : AxiomScheme} {D : DeductionSystem S}
  (C : CategoricalAxiomatization S D) where
  categoryNonempty : Nonempty C.categoryType
  objectsNonempty : Nonempty C.objects
  interpretationWellDefined : ∀ f g, f = g → C.interpretation f = C.interpretation g
  completenessClosed : C.completenessCategorical
  soundnessClosed : C.soundnessCategorical

def CategoricalAxiomatizationClosed {S : AxiomScheme} {D : DeductionSystem S}
  (C : CategoricalAxiomatization S D) : Prop :=
  Nonempty C.categoryType ∧ Nonempty C.objects ∧
  C.completenessCategorical ∧ C.soundnessCategorical

theorem categorical_axiomatization_closed_from_evidence {S : AxiomScheme} {D : DeductionSystem S}
  (C : CategoricalAxiomatization S D) (E : CategoricalAxiomatizationEvidence C) :
  CategoricalAxiomatizationClosed C := by
  exact And.intro E.categoryNonempty
    (And.intro E.objectsNonempty
      (And.intro E.completenessClosed E.soundnessClosed))

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse