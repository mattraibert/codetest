{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Main where

import Test.Tasty

import qualified Test.Format as F
import qualified Test.Sorting as S

main :: IO ()
main = defaultMain $ testGroup "" [F.tests, S.tests]
