{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person.Format where

import qualified Data.Text as T
import Data.Text (Text)
import Data.List
import Person
import Common

class Format p where
  format :: p -> Text

instance Format Person where
  format (Person firstName' lastName' gender' birthDate' color') =
    T.intercalate " " [lastName', firstName', showText gender', format birthDate', color']

instance Format Date where
  format (Date year' month' day') = T.intercalate "/" (map showText [month', day', year'])

instance Format Gender where
  format = showText

instance Format f => Format [f] where
  format = (T.intercalate "\n") . (map format)

data Output = Output Text Text Text

instance Format Output where
  format (Output one two three) = T.intercalate "\n" ["Output 1:", one, "", "Output 2:", two, "", "Output 3:", three, "", ""]

outputPeople :: [Person] -> Text
outputPeople ppl = format (Output output1 output2 output3)
  where output1 = format (sortBy genderThenLastNameOrder ppl)
        output2 = format (sortBy birthDateOrder ppl)
        output3 = format (sortBy (flip lastNameOrder) ppl)
