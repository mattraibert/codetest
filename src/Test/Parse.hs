{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Parse where

import Test.Tasty
import Test.Helper

import Person
import Person.Parse

tests :: TestTree
tests = testGroup "parsing" [
  Nothing .==. (parse "abc" :: Maybe Date),
  Just (Date 1943 2 13) .==. parse "2/13/1943",
  Just (Date 1943 2 13) .==. parse "2-13-1943",
  Just Male .==. parse "Male",
  Just Female .==. parse "Female",
  Nothing .==. (parse "abc" :: Maybe Gender)]
