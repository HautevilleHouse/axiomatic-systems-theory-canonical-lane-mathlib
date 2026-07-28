import HautevilleHouse.AxiomaticSystemsTheoryCanonicalLaneLean.AxiomSchemes

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure DeductionSystem (S : AxiomScheme) where
  formulas : Type u
  axioms : List (S.language → Prop)
  inferenceRules : List (String × (List (S.language → Prop) → (S.language → Prop)))
  deductionRelation : (S.language → Prop) → (S.language → Prop) → Prop

structure DeductionSystemEvidence {S : AxiomScheme} (D : DeductionSystem S) where
  formulasNonempty : Nonempty (D.formulas)
  axiomsInitial : ∀ (a : D.axioms), a (Classical.arbitrary _)  -- placeholder
  rulesPreserveTruth : ∀ (r : D.inferenceRules), ∀ (prems : List (S.language → Prop)),
    (∀ p ∈ prems, ∀ x : S.language, p x) → ∀ x : S.language, (r.2 prems) x
  deductionReflexive : ∀ (f : S.language → Prop), D.deductionRelation f f
  deductionTransitive : ∀ (f g h : S.language → Prop),
    D.deductionRelation f g → D.deductionRelation g h → D.deductionRelation f h

def DeductionSystemClosed {S : AxiomScheme} (D : DeductionSystem S) : Prop :=
  Nonempty D.formulas ∧
  (∀ a ∈ D.axioms, ∃ x : S.language, a x) ∧
  (∀ r ∈ D.inferenceRules, ∀ prems, (∀ p ∈ prems, ∀ x, p x) → ∀ x, (r.2 prems) x) ∧
  (∀ f, D.deductionRelation f f) ∧
  (∀ f g h, D.deductionRelation f g → D.deductionRelation g h → D.deductionRelation f h)

theorem deduction_system_closed_from_evidence {S : AxiomScheme} (D : DeductionSystem S)
  (E : DeductionSystemEvidence D) : DeductionSystemClosed D := by
  exact And.intro E.formulasNonempty
    (And.intro (by
      intro a ha
      have h := E.axiomsInitial a
      -- need to produce existence; we assume axiomsInitial gives a witness
      sorry)
      (And.intro E.rulesPreserveTruth
        (And.intro E.deductionReflexive E.deductionTransitive)))

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse