module Test.Helper where

import Test.Tasty
import Test.Tasty.HUnit

(.==.) :: (Show a, Eq a) => a -> a -> TestTree
expected .==. actual = testCase ("expect " ++ show expected) (expected @=? actual)
