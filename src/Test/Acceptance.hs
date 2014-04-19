{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Acceptance where

import qualified Data.Text as T
import Test.Tasty

import Test.Helper

import Person.Format
import Common

main :: IO ()
main = do
  model <- readFileText "code_test_files/model_output.txt"
  pipe <- readFileText "code_test_files/pipe.txt"
  comma <- readFileText "code_test_files/comma.txt"
  space <- readFileText "code_test_files/space.txt"
  defaultMain $
    model .==. (output $ T.concat [pipe,comma,space])
