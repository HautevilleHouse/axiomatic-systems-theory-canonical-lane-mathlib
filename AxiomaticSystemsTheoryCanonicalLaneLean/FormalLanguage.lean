import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticSystemsTheoryCanonicalLaneLean

inductive Connective : Type where
  | and | or | not | implies | iff

deriving Repr, DecidableEq

structure FormalLanguage where
  variableSymbols : Type u
  constantSymbols : Type v
  functionSymbols : Type w
  relationSymbols : Type x
  arity : functionSymbols → Nat × Nat
  relationArity : relationSymbols → Nat
  wellFounded : Prop

def Formula (L : FormalLanguage) : Type := String

def Rule (L : FormalLanguage) : Type := String

end AxiomaticSystemsTheoryCanonicalLaneLean
end HautevilleHouse