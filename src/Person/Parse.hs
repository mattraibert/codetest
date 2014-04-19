{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person.Parse where

import Person

class Parse p where
  parse :: String -> p

instance Parse Person where
  parse _raw = Person "" "" Female (Date 1 1 1) ""
