{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Acceptance where

import Test.Tasty
import Test.Helper
import Common

import Codetest.Main hiding (main)

main :: IO ()
main = do
  model <- readFileText "code_test_files/model_output.txt"
  files <- readFiles
  defaultMain $
    model $==$ doMain files
