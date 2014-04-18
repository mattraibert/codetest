{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Main where

import qualified Data.Text as T

import Person.Format
import Common

main :: IO ()
main = do
  pipe <- readFileText "code_test_files/pipe.txt"
  comma <- readFileText "code_test_files/comma.txt"
  space <- readFileText "code_test_files/space.txt"
  putStrLn $ T.unpack (output $ T.concat [pipe,comma,space])
