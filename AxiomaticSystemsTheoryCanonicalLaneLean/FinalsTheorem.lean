import AxiomaticSystemsTheoryCanonicalLaneLean.BridgeLemmas
import AxiomaticSystemsTheoryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

def ConstrainedAxiomaticSystemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_axiomatic_systems_endgame (A : AdmissibleClass) :
    ConstrainedAxiomaticSystemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse