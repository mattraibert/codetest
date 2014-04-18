module Common where

import qualified Data.Text as T
import Data.Text (Text)

showText :: Show s => s -> Text
showText = T.pack . show

readFileText :: FilePath -> IO Text
readFileText = (fmap T.pack) . readFile
