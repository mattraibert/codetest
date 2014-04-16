{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test where

import Test.Tasty
import Test.Tasty.HUnit

main :: IO ()
main = defaultMain $ testGroup "tests" [ testCase "compare to model output" fooTest]

fooTest = 1 @=? 1