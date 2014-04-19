{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person.Parse where

import qualified Data.Text as T

import Common
import Person

class Parse p where
  parse :: String -> Maybe p

instance Parse Gender where
  parse "Male" = Just Male
  parse "Female" = Just Female
  parse _ = Nothing

instance Parse Date where
  parse dateString = f (map readText (T.splitOn "/" rdash))
    where rdash = T.replace "-" "/" (T.pack dateString)
          f [month', day', year'] = Just (Date year' month' day')
          f _ = Nothing
