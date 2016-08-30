{-# LANGUAGE NoImplicitPrelude #-}

module Papa.Prelude.Semigroups.Data.List(
  maximum
, minimum
, (++)
, mappend
) where
  
import Data.List.NonEmpty(NonEmpty((:|)))
import Data.Foldable(foldr)
import Data.Ord(Ord, max, min)
import Data.Semigroup(Semigroup((<>)))

maximum ::
  Ord a =>
  NonEmpty a
  -> a
maximum (h :| t) =
  foldr max h t

minimum ::
  Ord a =>
  NonEmpty a
  -> a
minimum (h :| t) =
  foldr min h t

(++) ::
  Semigroup a =>
  a
  -> a
  -> a
(++) =
  (<>)
  
mappend ::
  Semigroup a =>
  a
  -> a
  -> a
mappend =
  (<>)

