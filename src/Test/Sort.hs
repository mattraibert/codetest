{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Sort where

import Data.List
import Test.Tasty
import Test.Helper

import Person

tests :: TestTree
tests = testGroup "sorting" [
  [Female, Male] *==* sort [Male, Female],
  [Female, Female] *==* sort [Female, Female],
  [jane, winston] *==* sortBy genderOrder [winston, jane],
  [jane, winston] *==* sortBy lastNameOrder [winston, jane],
  [winston, jane] *==* sortBy (flip lastNameOrder) [winston, jane],
  [winston, wendy] *==* sortBy birthDateOrder [wendy, winston],
  [jane, wendy, antonin] *==* sortBy genderThenLastNameOrder [antonin, jane, wendy],
  [jane, wendy, antonin] *==* sortBy genderThenLastNameOrder [wendy, antonin, jane]]
  where jane = Person "Jane" "Jay" Female (Date 1979 4 2) "Green"
        winston = Person "Winston" "Watertown" Male (Date 1925 12 18) "Orange"
        wendy = Person "Wendy" "Watertown" Female (Date 1925 12 19) "Dark Orange"
        antonin = Person "Antonin" "Applebaum" Male (Date 1925 12 19) "Dark Gray"
