{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module PeopleParsing where

import qualified Data.Text as T
import Data.Text (Text)

crunch :: Text -> Text
crunch _ = ""

readFileText :: FilePath -> IO Text
readFileText = (fmap T.pack) . readFile

