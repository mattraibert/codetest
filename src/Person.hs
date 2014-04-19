{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person where

import qualified Data.Text as T
import Data.Text (Text)
import Data.Ord
import Data.Monoid
import Common

data Person = Person { firstName :: Text, lastName :: Text, gender :: Gender, birthDate :: Date, color :: Text } deriving (Eq)
data Gender = Female | Male deriving (Show, Eq, Ord, Read)
data Date = Date { year :: Integer, month :: Integer, day :: Integer } deriving (Eq, Ord, Show)

instance Show Person where
  show (Person (firstName') lastName' _ (Date year' _ _) _) = T.unpack $ T.intercalate " " [firstName', lastName', showText year'] 

genderOrder :: Person -> Person -> Ordering
genderOrder = comparing gender

lastNameOrder :: Person -> Person -> Ordering
lastNameOrder = comparing lastName

birthDateOrder :: Person -> Person -> Ordering
birthDateOrder = comparing birthDate

genderThenLastNameOrder :: Person -> Person -> Ordering
genderThenLastNameOrder = mappend (comparing gender) (comparing lastName)
