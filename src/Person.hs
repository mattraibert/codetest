{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person where

import qualified Data.Text as T
import Data.Text (Text)

crunch :: Text -> Text
crunch _ = ""

format :: Text -> Text -> Text -> Text
format one two three = T.concat ["Output 1:\n", one, "\nOutput 2:\n", two, "\nOutput 3:\n", three, "\n"]

readFileText :: FilePath -> IO Text
readFileText = (fmap T.pack) . readFile

