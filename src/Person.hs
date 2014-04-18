{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person where

import qualified Data.Text as T
import Data.Text (Text)

data Person = Person { firstName :: Text, lastName :: Text, gender :: Gender, birthDate :: Date, color :: Text }
data Gender = Female | Male
data Date = Date { year :: Integer, month :: Integer, day :: Integer }

crunch :: Text -> Text
crunch _ = ""

readFileText :: FilePath -> IO Text
readFileText = (fmap T.pack) . readFile

