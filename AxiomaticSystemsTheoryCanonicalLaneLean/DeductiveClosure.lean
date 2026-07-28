import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure DeductiveClosure (F : FormalSystem) where
  closure : Set F.formula → Set F.formula
  monotone : ∀ S T, S ⊆ T → closure S ⊆ closure T
  idempotent : ∀ S, closure (closure S) = closure S
  axiomInclusion : ∀ A ∈ F.axioms, A ∈ closure F.axioms
  ruleClosure : ∀ r ∈ F.inferenceRules, ∀ S, r S ∈ closure S

structure DeductiveClosureEvidence {F : FormalSystem} (D : DeductiveClosure F) where
  monotoneClosed : D.monotone
  idempotentClosed : D.idempotent
  axiomInclusionClosed : D.axiomInclusion
  ruleClosureClosed : D.ruleClosure

def DeductiveClosureClosed {F : FormalSystem} (D : DeductiveClosure F) : Prop :=
  D.monotone ∧ D.idempotent ∧ D.axiomInclusion ∧ D.ruleClosure

theorem deductive_closure_closed_from_evidence {F : FormalSystem} (D : DeductiveClosure F) (E : DeductiveClosureEvidence D) : DeductiveClosureClosed D :=
  And.intro E.monotoneClosed (And.intro E.idempotentClosed (And.intro E.axiomInclusionClosed E.ruleClosureClosed))

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse