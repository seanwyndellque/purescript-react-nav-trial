module Nav.Types where

import Prelude

data Route (name :: Symbol) param = Route

data Operation = Add | Multiply

type AppRoutes =
  ( operation :: Route "operation" Unit
  , inputs :: Route "inputs" Operation
  , answer :: Route "answer" Int
  )

appR :: Record AppRoutes
appR =
  { operation: Route
  , inputs: Route
  , answer: Route
  }

-- todo: create instances
class MakeRoutes (rs :: # Type) where
  mkRoutes :: Record rs
