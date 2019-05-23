module Nav.Types where

import Data.Symbol (SProxy(..))

type AppRoutes =
  ( operation :: SProxy "operation"
  , inputs :: SProxy "inputs"
  , answer :: SProxy "answer"
  )

appR :: Record AppRoutes
appR =
  { operation: SProxy
  , inputs: SProxy
  , answer: SProxy
  }
