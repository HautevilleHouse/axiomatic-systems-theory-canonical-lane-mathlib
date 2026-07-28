import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure AxiomSchemaPackage {F : FormalSystemPackage} (F : FormalSystemPackage) where
  schemaVariable : Type v
  schemaInstances : Set (List F.alphabet)
  schemaWellFormed : Prop
  instancesGenerated : Prop
  closedUnderSubstitution : Prop

structure AxiomSchemaEvidence {F : FormalSystemPackage} (S : AxiomSchemaPackage F) where
  schemaWellFormedClosed : S.schemaWellFormed
  instancesGeneratedClosed : S.instancesGenerated
  closedUnderSubstitutionClosed : S.closedUnderSubstitution

def AxiomSchemaClosed {F : FormalSystemPackage} (S : AxiomSchemaPackage F) : Prop :=
  S.schemaWellFormed ∧ S.instancesGenerated ∧ S.closedUnderSubstitution

theorem axiom_schema_closed_from_evidence {F : FormalSystemPackage} (S : AxiomSchemaPackage F) (E : AxiomSchemaEvidence S) :
    AxiomSchemaClosed S := by
  exact And.intro E.schemaWellFormedClosed (And.intro E.instancesGeneratedClosed E.closedUnderSubstitutionClosed)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse