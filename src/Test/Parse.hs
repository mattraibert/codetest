{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Parse where

import Test.Tasty
import Test.Helper

import Person
import Person.Parse

tests :: TestTree
tests = testGroup "parsing" [
  (Nothing :: Maybe Date)   .==: "abc",
  Just (Date 1943 2 13)     .==: "2/13/1943",
  Just (Date 1943 2 13)     .==: "2-13-1943",
  Just Male                 .==: "Male",
  Just Female               .==: "Female",
  Just Male                 .==: "M",
  Just Female               .==: "F",
  (Nothing :: Maybe Gender) .==: "abc",
  Just neil                 .==: "Abercrombie, Neil, Male, Tan, 2/13/1943",
  (Nothing :: Maybe Person) .==: "Abercrombie, Neil, abc, Tan, 2/13/1943",
  (Nothing :: Maybe Person) .==: "Abercrombie, Neil, Male, Tan, abc",
  Just steve                .==: "Smith | Steve | D | M | Red | 3-3-1985",
  Just anna                 .==: "Hingis Martina M F 4-2-1979 Green",
  (Nothing :: Maybe Person) .==: "abc",
  [steve, neil]             .==. parsePeople ["Smith | Steve | D | M | Red | 3-3-1985","Abercrombie | Neil | S | M | Tan | 2-13-1943"]
  ]
  where neil = Person "Neil" "Abercrombie" Male (Date 1943 2 13) "Tan"
        anna = Person "Martina" "Hingis" Female (Date 1979 4 2) "Green"
        steve = Person "Steve" "Smith" Male (Date 1985 3 3) "Red"

(.==:) :: (Eq p, Show p, Parse p) => Maybe p -> String -> TestTree
expected .==: string = (expected .==. parse string)