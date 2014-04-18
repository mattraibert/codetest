{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Main where

import qualified Data.Text as T
import Data.Text (Text)
import Test.Tasty
import Test.Tasty.HUnit

import Person

main :: IO ()
main = defaultMain $ testGroup "tests" [ testCase "can format three outputs nicely" formatTest,
                                         testGroup "output 1" genderThenLastNameTests ]

formatTest :: Assertion
formatTest = "Output 1:\n#{output1}\nOutput 2:\n#{output2}\nOutput 3:\n#{output3}\n" @=?
             format "#{output1}" "#{output2}" "#{output3}"

genderThenLastName :: [Person] -> Text
genderThenLastName people = T.intercalate "\n" (map showPerson people) 

data Gender = Female | Male

data Date = Date { year :: Integer, month :: Integer, day :: Integer }
data Person = Person { firstName :: Text, lastName :: Text, gender :: Gender, birthDate :: Date, color :: Text }

showGender :: Gender -> Text
showGender Female = "Female"
showGender Male = "Male"

showText :: Show r => r -> Text
showText = T.pack . show

showDate :: Date -> Text
showDate (Date year' month' day') = T.intercalate "/" (map showText [month', day', year'])

showPerson :: Person -> Text
showPerson (Person firstName' lastName' gender' birthDate' color') = T.intercalate " " [lastName', firstName', showGender gender', showDate birthDate', color']

genderThenLastNameTests :: [TestTree]
genderThenLastNameTests = [testCase "shows one person"
                           ("Jay James Female 4/2/1979 Green" @=?
                            genderThenLastName [Person "James" "Jay" Female (Date 1979 4 2) "Green"])
                          , testCase "shows two people"
                            ("Jay James Female 4/2/1979 Green\nWatertown Winston Male 12/18/1925 Orange" @=?
                             genderThenLastName [Person "James" "Jay" Female (Date 1979 4 2) "Green"
                                                , Person "Winston" "Watertown" Male (Date 1925 12 18) "Orange"])]
