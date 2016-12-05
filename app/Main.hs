{-# OPTIONS_GHC -fno-warn-deprecations #-}

module Main where

import Network.Wai (Application, responseLBS)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)
import Data.ByteString.Char8 as C
import Data.ByteString.Lazy.Char8 as LC

app :: Application
app req respond = respond
  $ responseLBS status200 [(hContentType, C.pack "text/plain")] (LC.pack "Hello World!")

main :: IO ()
main = run 8080 app

