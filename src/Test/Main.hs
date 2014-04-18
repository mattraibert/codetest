{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Main where

import Data.Text (Text)
import qualified Data.Text as T
import Data.List
import Test.Tasty
import Test.Tasty.HUnit

import Common

import Person
import Person.Format

main :: IO ()
main = defaultMain $ testGroup "" [
  "Output 1:\n[o1]\nOutput 2:\n[o2]\nOutput 3:\n[o3]\n" .==. format "[o1]" "[o2]" "[o3]",

  testGroup "formatting for output" [
    "Doodle Ralph Male 2/16/2012 Pink" .==. show (Person "Ralph" "Doodle" Male (Date 2012 2 16) "Pink"),
    "2/16/2012" .==. show (Date 2012 2 16),
    "Male" .==. show Male,
    "Female" .==. show Female,
    "Jay Jane Female 4/2/1979 Green\nWatertown Winston Male 12/18/1925 Orange" .==. formatPeople [jane, winston]],

  testGroup "sorting" [
    [Female, Male] *==* sort [Male, Female],
    [Female, Female] *==* sort [Female, Female],
    [jane, winston] *==* sortBy genderOrder [winston, jane],
    [jane, winston] *==* sortBy lastNameOrder [winston, jane],
    [winston, jane] *==* sortBy (flip lastNameOrder) [winston, jane],
    [winston, wendy] *==* sortBy birthDateOrder [wendy, winston],
    [jane, wendy, antonin] *==* sortBy genderThenLastNameOrder [antonin, jane, wendy],
    [jane, wendy, antonin] *==* sortBy genderThenLastNameOrder [wendy, antonin, jane]]]

jane = Person "Jane" "Jay" Female (Date 1979 4 2) "Green"
winston = Person "Winston" "Watertown" Male (Date 1925 12 18) "Orange"
wendy = Person "Wendy" "Watertown" Female (Date 1925 12 19) "Dark Orange"
antonin = Person "Antonin" "Applebaum" Male (Date 1925 12 19) "Dark Gray"

(.==.) :: (Show a, Eq a) => a -> a -> TestTree
expected .==. actual = testCase ("expect " ++ (abbrev $ expected)) (expected @=? actual)

(*==*) :: (Show a, Eq a) => [a] -> [a] -> TestTree
expected *==* actual = testCase ("expect " ++ abbrevList expected) (expected @=? actual)

abbrevList :: Show a => [a] -> String
abbrevList = show . map (abbrev)

abbrev :: (Show s) => s -> String
abbrev t = take 10 (show t) ++ "..."