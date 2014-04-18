{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person where

import qualified Data.Text as T
import Data.Text (Text)
import Data.List
import Data.Ord
import Data.Monoid
import Common

data Person = Person { firstName :: Text, lastName :: Text, gender :: Gender, birthDate :: Date, color :: Text } deriving (Eq)
data Gender = Female | Male deriving (Show, Eq, Ord)
data Date = Date { year :: Integer, month :: Integer, day :: Integer } deriving (Eq, Ord)

instance Show Person where
  show (Person firstName' lastName' gender' birthDate' color') =
    T.unpack $ T.intercalate " " [lastName', firstName', showText gender', showText birthDate', color']
instance Show Date where
  show (Date year' month' day') = intercalate "/" (map show [month', day', year'])

genderOrder :: Person -> Person -> Ordering
genderOrder = comparing gender

lastNameOrder :: Person -> Person -> Ordering
lastNameOrder = comparing lastName

birthDateOrder :: Person -> Person -> Ordering
birthDateOrder = comparing birthDate

genderThenLastNameOrder :: Person -> Person -> Ordering
genderThenLastNameOrder = mappend (comparing gender) (comparing lastName)
