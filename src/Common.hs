module Common where

import qualified Data.Text as T
import Data.Text (Text)

readFileText :: FilePath -> IO Text
readFileText = (fmap T.pack) . readFile
