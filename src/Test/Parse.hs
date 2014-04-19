{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Parse where

import Test.Tasty
import Test.Helper

import Person
import Person.Parse

tests :: TestTree
tests = testGroup "parsing the files" [
  --niel .==. parse "Abercrombie, Neil, Male, Tan, 2/13/1943"
                                      ]
  where niel = Person "Jane" "Jay" Female (Date 1979 4 2) "Green"
