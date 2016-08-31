{-# LANGUAGE NoImplicitPrelude #-}

module Papa.Prelude.Semigroups.Data.List(
  maximum
, minimum
, (++)
, mappend
, foldr1
, foldl1
, foldl1'
, scanr
, scanl
) where
  
import Data.List.NonEmpty(NonEmpty((:|)), scanr, scanl)
import Data.Foldable(foldr, foldl, foldl')
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

foldr1 ::
  (a -> a -> a)
  -> NonEmpty a
  -> a
foldr1 f (h :| t) =
  foldr f h t

foldl1 ::
  (a -> a -> a)
  -> NonEmpty a
  -> a
foldl1 f (h :| t) =
  foldl f h t

foldl1' ::
  (a -> a -> a)
  -> NonEmpty a
  -> a
foldl1' f (h :| t) =
  foldl' f h t

{-
scanr ::
  (a -> b -> b)
  -> b
  -> [a]
  -> NonEmpty b  
scanr _ z [] =
  z :| []
scanr f z (h:t) =
  let x@(i:|_) = scanr f z t
  in  f h i :| toList x
-}

{-
scanl f q ls = q : case ls of
<lambdabot>     []   -> []
<lambdabot>     x:xs -> scanl f (f q x) xs
-}
