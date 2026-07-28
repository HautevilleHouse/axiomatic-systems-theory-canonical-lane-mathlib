import HautevilleHouse.AxiomaticSystemsTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure AxiomScheme where
  language : Type u
  signature : List (String × Nat)
  axioms : List (String × Prop)
  axiomSchemes : List (String × Prop)
  derivationRules : List (String × (List Prop → Prop))

structure AxiomSchemeEvidence (S : AxiomScheme) where
  languageDefined : Nonempty (S.language)
  signatureFinite : S.signature.length < ∞
  axiomsConsistent : ∀ (a : S.axioms), a.2
  schemesConsistent : ∀ (s : S.axiomSchemes), s.2
  rulesSound : ∀ (r : S.derivationRules), ∀ (prems : List Prop), (∀ p ∈ prems, p) → r.2 prems

def AxiomSchemeClosed (S : AxiomScheme) : Prop :=
  Nonempty S.language ∧
  S.signature.length < ∞ ∧
  (∀ a ∈ S.axioms, a.2) ∧
  (∀ s ∈ S.axiomSchemes, s.2) ∧
  (∀ r ∈ S.derivationRules, ∀ prems, (∀ p ∈ prems, p) → r.2 prems)

theorem axiom_scheme_closed_from_evidence (S : AxiomScheme) (E : AxiomSchemeEvidence S) :
  AxiomSchemeClosed S := by
  exact And.intro E.languageDefined
    (And.intro E.signatureFinite
      (And.intro E.axiomsConsistent
        (And.intro E.schemesConsistent E.rulesSound)))

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse