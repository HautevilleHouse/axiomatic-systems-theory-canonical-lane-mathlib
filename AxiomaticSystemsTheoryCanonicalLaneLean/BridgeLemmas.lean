import AxiomaticSystemsTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AxiomaticWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse