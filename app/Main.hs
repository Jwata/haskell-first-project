module Main where

import Network.Wai (Application, responseLBS, responseFile)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)
import Data.ByteString.Char8 as C
import Data.ByteString.Lazy.Char8 as LC

app :: Application
app request respond = respond
  $ responseFile status200 [(hContentType, C.pack "text/html")] "public/index.html" Nothing
--   $ responseLBS status200 [(hContentType, C.pack "text/text")] (LC.pack "Hello World!")

main :: IO ()
main = do
  print "starting server..."
  run 8080 app
