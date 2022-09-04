module ThreeMonths
  ( app,
  )
where

import qualified Data.Function as Function
import qualified Data.Text as Text
import qualified Okapi
import qualified Text.InterpolatedString.Perl6 as Perl6

(|>) = (Function.&)

respond response = do
  Okapi.methodEnd
  Okapi.pathEnd
  pure response

app :: IO ()
app = Okapi.run id $ do
  Okapi.methodGET
  Okapi.pathParam @Text.Text `Okapi.equals` "home"
  Okapi.ok
    |> Okapi.setHTML
      [Perl6.qq|
                <h1>Hello, world</h1>
            |]
    |> respond
