module Main where

import Network.Wai (Application, Request, Response, rawPathInfo, responseLBS, responseFile)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200, status404)
import Network.HTTP.Types.Header (hContentType)
import Data.ByteString.Char8 as C
import Data.ByteString.Lazy.Char8 as LC

app :: Application
app request respond = respond $ case rawPathInfo request of
    path
      | path == C.pack "/" -> Main.index
      | path == C.pack "/raw" -> plainIndex
    _ -> notFound

index :: Response
index = responseFile
  status200 [(hContentType, C.pack "text/html")] "public/index.html" Nothing

plainIndex :: Response
plainIndex = responseFile
  status200 [(hContentType, C.pack "text/plain")] "public/index.html" Nothing

notFound :: Response
notFound = responseLBS
  status404 [(hContentType, C.pack "text/plain")] (LC.pack "404: Not found")

main :: IO ()
main = do
  print "starting server..."
  run 8080 app
