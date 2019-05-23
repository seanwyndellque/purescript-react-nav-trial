module Nav.Types where

import Prelude

type AppRoutes =
  ( operation :: Unit
  , inputs :: Unit
  , answer :: Unit
  )

appR :: Record AppRoutes
appR =
  { operation: unit
  , inputs: unit
  , answer: unit
  }
