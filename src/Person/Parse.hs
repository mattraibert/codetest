{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person.Parse where

import Person

class Parse p where
  parse :: String -> Maybe p

instance Parse Gender where
  parse "Male" = Just Male
  parse "Female" = Just Female
  parse _ = Nothing
