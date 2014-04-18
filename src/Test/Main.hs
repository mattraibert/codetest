{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Main where

import qualified Data.Text as T
import Data.Text (Text)
import Test.Tasty
import Test.Tasty.HUnit

import Person
import Person.Format

main :: IO ()
main = defaultMain $ testGroup "tests" [ formatTest, genderThenLastNameTests ]

formatTest :: TestTree
formatTest =
  testGroup "formatting for output" [
    testCase "can layout the three outputs"
    ("Output 1:\n[o1]\nOutput 2:\n[o2]\nOutput 3:\n[o3]\n" @=? format "[o1]" "[o2]" "[o3]")
    , testCase "Person" ("Doodle Ralph Male 2/16/2012 Pink" @=? formatPerson (Person "Ralph" "Doodle" Male (Date 2012 2 16) "Pink"))
    , testCase "Date" ("2/16/2012" @=? formatDate (Date 2012 2 16))
    , testGroup "Gender" [testCase "male" ("Male" @=? formatGender Male)
                         , testCase "female" ("Female" @=? formatGender Female)]]


genderThenLastNameTests :: TestTree
genderThenLastNameTests =
  testGroup "output 1" [
    testCase "displays two people"
    ("Jay James Female 4/2/1979 Green\nWatertown Winston Male 12/18/1925 Orange" @=?
     genderThenLastName [Person "James" "Jay" Female (Date 1979 4 2) "Green"
                        , Person "Winston" "Watertown" Male (Date 1925 12 18) "Orange"])]
