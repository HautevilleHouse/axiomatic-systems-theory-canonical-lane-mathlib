import AxiomaticSystemsTheoryCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

structure AxiomaticSpace where
  language : Type
  signature : Type

structure AxiomaticAdmittedObject where
  space : AxiomaticSpace
  consistent : Prop
  complete : Prop
  model : Type
  interpretation : Type
  satisfaction : Prop
  conclusion : satisfaction

structure AxiomaticEndgameState where
  object : AxiomaticAdmittedObject

def AxiomaticWitnessClosed (O : AxiomaticAdmittedObject) : Prop :=
  O.satisfaction

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse