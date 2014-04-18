{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Main where

import qualified Data.Text as T
import Data.Text (Text)
import Data.List
import Test.Tasty
import Test.Tasty.HUnit

import Person
import Person.Format

main :: IO ()
main = defaultMain $ testGroup "" [
  "Output 1:\n[o1]\nOutput 2:\n[o2]\nOutput 3:\n[o3]\n" .==. format "[o1]" "[o2]" "[o3]",

  testGroup "formatting for output" [
    "Doodle Ralph Male 2/16/2012 Pink" .==. formatPerson (Person "Ralph" "Doodle" Male (Date 2012 2 16) "Pink"),
    "2/16/2012" .==. formatDate (Date 2012 2 16),
    "Male" .==. formatGender Male,
    "Female" .==. formatGender Female],

  testGroup "gender order" [
    [Female, Male] .==. sort [Male, Female],
    [Female, Female] .==. sort [Female, Female]],

  testGroup "output 1" [
    "Jay Jane Female 4/2/1979 Green\nWatertown Winston Male 12/18/1925 Orange" .==.
    genderThenLastName [jane, winston]]]

jane = Person "Jane" "Jay" Female (Date 1979 4 2) "Green"
winston = Person "Winston" "Watertown" Male (Date 1925 12 18) "Orange"

(.==.) :: (Show a, Eq a) => a -> a -> TestTree
expected .==. actual = testCase ("expect " ++ show expected) (expected @=? actual)