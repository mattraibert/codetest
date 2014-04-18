{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person where

import qualified Data.Text as T
import Data.Text (Text)
import Data.List

data Person = Person { firstName :: Text, lastName :: Text, gender :: Gender, birthDate :: Date, color :: Text } deriving (Eq)
data Gender = Female | Male deriving (Show, Eq, Ord)
data Date = Date { year :: Integer, month :: Integer, day :: Integer } deriving (Eq, Ord)

instance Show Person where
  show (Person firstName' lastName' _ (Date year' _ _) _) = T.unpack $ T.intercalate " " [firstName', lastName', (T.pack.show) year']
instance Show Date where
  show (Date year' month' day') = intercalate "/" (map show [month', day', year'])

genderOrder :: Person -> Person -> Ordering
genderOrder (Person _ _ g1 _ _) (Person _ _ g2 _ _) = compare g1 g2

lastNameOrder :: Person -> Person -> Ordering
lastNameOrder (Person _ ln1 _ _ _) (Person _ ln2 _ _ _) = compare ln1 ln2

birthDateOrder :: Person -> Person -> Ordering
birthDateOrder  (Person _ _ _ bd1 _) (Person _ _ _ bd2 _) = compare bd1 bd2
