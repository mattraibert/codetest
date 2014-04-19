{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Format where

import Test.Tasty
import Test.Helper

import Person
import Person.Format

tests :: TestTree
tests = testGroup "formatting for output" [
  "Output 1:\n[o1]\nOutput 2:\n[o2]\nOutput 3:\n[o3]\n" .==. format "[o1]" "[o2]" "[o3]",
  "Doodle Ralph Male 2/16/2012 Pink" .==. show (Person "Ralph" "Doodle" Male (Date 2012 2 16) "Pink"),
  "2/16/2012" .==. show (Date 2012 2 16),
  "Male" .==. show Male,
  "Female" .==. show Female,
  "Jay Jane Female 4/2/1979 Green\nWatertown Winston Male 12/18/1925 Orange" .==. formatPeople [jane, winston]]
  where jane = Person "Jane" "Jay" Female (Date 1979 4 2) "Green"
        winston = Person "Winston" "Watertown" Male (Date 1925 12 18) "Orange"
