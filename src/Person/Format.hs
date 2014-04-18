{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person.Format where

import qualified Data.Text as T
import Data.Text (Text)
import Data.List
import Person
import Common

formatPeople :: [Person] -> Text
formatPeople = (T.intercalate "\n") . (map showText)

format :: Text -> Text -> Text -> Text
format one two three = T.concat ["Output 1:\n", one, "\nOutput 2:\n", two, "\nOutput 3:\n", three, "\n"]

output1 ppl = formatPeople (sortBy genderThenLastNameOrder ppl)
output2 ppl = formatPeople (sortBy birthDateOrder ppl)
output3 ppl = formatPeople (sortBy (flip lastNameOrder) ppl)

outputPeople ppl = format (output1 ppl) (output2 ppl) (output3 ppl)

output :: Text -> Text
output raw = outputPeople ppl
           where ppl = []