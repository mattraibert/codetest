{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test where

import qualified Data.Text as T
import Test.Tasty
import Test.Tasty.HUnit

import PeopleParsing

main :: IO ()
main = defaultMain $ testGroup "tests" [ testCase "compare to model output" acceptanceTest]

acceptanceTest :: Assertion
acceptanceTest = do
  model <- readFileText "code_test_files/model_output.txt"
  pipe <- readFileText "code_test_files/pipe.txt"
  comma <- readFileText "code_test_files/comma.txt"
  space <- readFileText "code_test_files/space.txt"
  T.unpack model @=? T.unpack (crunch $ T.concat [pipe,comma,space])
