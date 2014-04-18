{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person where

import qualified Data.Text as T
import Data.Text (Text)

genderThenLastName :: [Person] -> Text
genderThenLastName people = T.intercalate "\n" (map showPerson people) 

data Gender = Female | Male

data Date = Date { year :: Integer, month :: Integer, day :: Integer }
data Person = Person { firstName :: Text, lastName :: Text, gender :: Gender, birthDate :: Date, color :: Text }

showGender :: Gender -> Text
showGender Female = "Female"
showGender Male = "Male"

showText :: Show r => r -> Text
showText = T.pack . show

showDate :: Date -> Text
showDate (Date year' month' day') = T.intercalate "/" (map showText [month', day', year'])

showPerson :: Person -> Text
showPerson (Person firstName' lastName' gender' birthDate' color') = T.intercalate " " [lastName', firstName', showGender gender', showDate birthDate', color']

crunch :: Text -> Text
crunch _ = ""

format :: Text -> Text -> Text -> Text
format one two three = T.concat ["Output 1:\n", one, "\nOutput 2:\n", two, "\nOutput 3:\n", three, "\n"]

readFileText :: FilePath -> IO Text
readFileText = (fmap T.pack) . readFile

