{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Codetest.Main where

import Data.Text (Text)
import qualified Data.Text.IO as T

import Person.Parse
import Person.Format
import Common

readFiles :: IO [Text]
readFiles = do
  pipe <- readFileText "code_test_files/pipe.txt"
  comma <- readFileText "code_test_files/comma.txt"
  space <- readFileText "code_test_files/space.txt"
  return [pipe, comma, space]

doMain :: [Text] -> Text
doMain = outputPeople . parsePeople

main :: IO ()
main = do
  files <- readFiles
  T.putStr $ doMain files
