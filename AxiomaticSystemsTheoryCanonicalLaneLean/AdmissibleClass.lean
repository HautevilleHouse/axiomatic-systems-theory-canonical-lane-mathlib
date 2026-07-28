import AxiomaticSystemsTheoryCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure AdmissibleClass where
  object : AxiomaticAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  AxiomaticWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse