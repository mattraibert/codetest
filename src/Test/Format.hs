{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Format where

import Test.Tasty
import Test.Helper

import Person
import Person.Format

tests :: TestTree
tests = testGroup "formatting for output" [
  "Output 1:\n[o1]\n\nOutput 2:\n[o2]\n\nOutput 3:\n[o3]\n\n" .==. format (Output "[o1]" "[o2]" "[o3]"),
  "Kelly Sue Female 7/12/1959 Pink" .==. format (Person "Sue" "Kelly" Female (Date 1959 7 12) "Pink"),
  "2/16/2012" .==. format (Date 2012 2 16),
  "Male" .==. format Male,
  "Female" .==. format Female,
  "Jay Jane Female 4/2/1979 Green\nWatertown Winston Male 12/18/1925 Orange" .==. format [jane, winston]]
  where jane = Person "Jane" "Jay" Female (Date 1979 4 2) "Green"
        winston = Person "Winston" "Watertown" Male (Date 1925 12 18) "Orange"
