{-# Language OverloadedStrings, FlexibleInstances, TypeFamilies, NoMonomorphismRestriction, ScopedTypeVariables, FlexibleContexts #-}
module Test.Helper where

import Data.Text (Text)
import qualified Data.Text as T
import Test.Tasty
import Test.Tasty.HUnit
import Test.HUnit.Diff

(.==.) :: (Show a, Eq a) => a -> a -> TestTree
expected .==. actual = testCase ("expect " ++ show expected) (expected @==? actual)

($==$) :: Text -> Text -> TestTree
expected $==$ actual = testCase "" (T.lines expected @==? T.lines actual)
