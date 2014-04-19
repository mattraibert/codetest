{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Main where

import Test.Tasty

import qualified Test.Format as Format
import qualified Test.Sort as Sort
import qualified Test.Parse as Parse

main :: IO ()
main = defaultMain $ testGroup "" [Format.tests, Sort.tests, Parse.tests]
