{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Parse where

import Test.Tasty
import Test.Helper

import Person
import Person.Parse

tests :: TestTree
tests = testGroup "parsing" [
  Just Male .==. parse "Male",
  Just Female .==. parse "Female",
  Nothing .==. (parse "abc" :: Maybe Gender)]
