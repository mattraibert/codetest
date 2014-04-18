module Test.Helper where

import Test.Tasty
import Test.Tasty.HUnit

(.==.) :: (Show a, Eq a) => a -> a -> TestTree
expected .==. actual = testCase ("expect " ++ (abbrev $ expected)) (expected @=? actual)

(*==*) :: (Show a, Eq a) => [a] -> [a] -> TestTree
expected *==* actual = testCase ("expect " ++ abbrevList expected) (expected @=? actual)

abbrevList :: Show a => [a] -> String
abbrevList = show . map (abbrev)

abbrev :: (Show s) => s -> String
abbrev t = take 10 (show t) ++ "..."
