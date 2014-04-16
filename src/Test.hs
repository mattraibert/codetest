{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test where

import Data.Text (Text)
import Test.Tasty
import Test.Tasty.HUnit

import PeopleParsing

main :: IO ()
main = defaultMain $ testGroup "tests" [ testCase "can format three outputs nicely" formatTest]

formatTest :: Assertion
formatTest = "Output 1:\n#{output1}\nOutput 2:\n#{output2}\nOutput 3:\n#{output3}\n" @=? format "#{output1}" "#{output2}" "#{output3}" 