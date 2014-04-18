{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person.Format where

import qualified Data.Text as T
import Data.Text (Text)
import Person

showText :: Show s => s -> Text
showText = T.pack . show

formatGender :: Gender -> Text
formatGender Female = "Female"
formatGender Male = "Male"

formatDate :: Date -> Text
formatDate (Date year' month' day') = T.intercalate "/" (map showText [month', day', year'])

formatPerson :: Person -> Text
formatPerson (Person firstName' lastName' gender' birthDate' color') = T.intercalate " " [lastName', firstName', formatGender gender', formatDate birthDate', color']

genderThenLastName :: [Person] -> Text
genderThenLastName people = T.intercalate "\n" (map formatPerson people) 

format :: Text -> Text -> Text -> Text
format one two three = T.concat ["Output 1:\n", one, "\nOutput 2:\n", two, "\nOutput 3:\n", three, "\n"]
