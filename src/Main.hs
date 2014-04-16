{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Main where

import qualified Data.Text as T

import PeopleParsing

main :: IO ()
main = do
  pipe <- readFile "code_test_files/pipe.txt"
  comma <- readFile "code_test_files/comma.txt"
  space <- readFile "code_test_files/space.txt"
  putStrLn $ T.unpack $ crunch (T.pack $ pipe ++ comma ++ space)
