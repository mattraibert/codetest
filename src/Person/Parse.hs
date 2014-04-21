{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person.Parse where

import Data.Text (Text)
import qualified Data.Text as T

import Common
import Person

class Parse p where
  parse :: String -> Maybe p

parseText :: Parse p => Text -> Maybe p
parseText = parse . T.unpack

instance Parse Gender where
  parse ('M':_) = Just Male
  parse ('F':_) = Just Female
  parse _ = Nothing

instance Parse Date where
  parse = toDate . extractMdy
    where extractMdy = (map readText) . (T.splitOn "/") . (T.replace "-" "/") . T.pack
          toDate [month', day', year'] = Just (Date year' month' day')
          toDate _ = Nothing

instance Parse p => Parse [p] where
  parse = sequence . (map parse) . lines

parsePeople :: [Text] -> [Person]
parsePeople raw = case parseText (T.intercalate "\n" raw) of
  Just people -> people
  Nothing -> []

person :: [Text] -> Maybe Person
person [firstName', lastName', gender', birthDate', color'] = do
  gender'' <- parseText gender'
  birthDate'' <- parseText birthDate'
  Just (Person firstName' lastName' gender'' birthDate'' color')

split delim = (T.splitOn delim) . T.pack

instance Parse Person where
  parse raw
    | elem ',' raw = commaM (split ", " raw)
    | elem '|' raw = pipeM (split " | " raw)
    | otherwise = spaceM (split " " raw)

commaM [lastName', firstName', gender', color', birthDate'] =
  person [firstName', lastName', gender', birthDate', color']
commaM _ = Nothing

pipeM [lastName', firstName', _, gender', color', birthDate'] =
  person [firstName', lastName', gender', birthDate', color']
pipeM _ = Nothing

spaceM [lastName', firstName', _, gender', birthDate', color'] =
  person [firstName', lastName', gender', birthDate', color']
spaceM _ = Nothing
