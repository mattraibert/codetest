{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Main where

import qualified Data.Text as T
import Data.Text (Text)
import Test.Tasty
import Test.Tasty.HUnit

import Person

main :: IO ()
main = defaultMain $ testGroup "tests" [ testCase "can format three outputs nicely" formatTest,
                                         testGroup "output 1" genderThenLastNameTests ]

formatTest :: Assertion
formatTest = "Output 1:\n#{output1}\nOutput 2:\n#{output2}\nOutput 3:\n#{output3}\n" @=?
             format "#{output1}" "#{output2}" "#{output3}"

genderThenLastNameTests :: [TestTree]
genderThenLastNameTests = [testCase "shows one person"
                           ("Jay James Female 4/2/1979 Green" @=?
                            genderThenLastName [Person "James" "Jay" Female (Date 1979 4 2) "Green"])
                          , testCase "shows two people"
                            ("Jay James Female 4/2/1979 Green\nWatertown Winston Male 12/18/1925 Orange" @=?
                             genderThenLastName [Person "James" "Jay" Female (Date 1979 4 2) "Green"
                                                , Person "Winston" "Watertown" Male (Date 1925 12 18) "Orange"])]
