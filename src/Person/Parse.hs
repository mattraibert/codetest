{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Person.Parse where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Maybe

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

parsePeople :: Parse p => Text -> [p]
parsePeople raw = catMaybes $ map parseText (T.lines raw)

instance Parse Person where
  parse raw
    | elem ',' raw = comma (split ", " raw)
    | elem '|' raw = pipe (split " | " raw)
    | otherwise = space (split " " raw)
    where split delim = (T.splitOn delim) . T.pack
          comma [lastName', firstName', gender', color', birthDate'] = do
            gender'' <- parseText gender'
            birthDate'' <- parseText birthDate'
            Just (Person firstName' lastName' gender'' birthDate'' color')
          comma _ = Nothing
          pipe [lastName', firstName', _, gender', color', birthDate'] = do
            gender'' <- parseText gender'
            birthDate'' <- parseText birthDate'
            Just (Person firstName' lastName' gender'' birthDate'' color')
          pipe _ = Nothing
          space [lastName', firstName', _, gender', birthDate', color'] = do
            gender'' <- parseText gender'
            birthDate'' <- parseText birthDate'
            Just (Person firstName' lastName' gender'' birthDate'' color')
          space _ = Nothing
