module Nav.Types where

data Route (name :: Symbol) param = Route

data Operation = Add | Multiply

type AppRoutes =
  ( operation :: Route "operation" {}
  , inputs :: Route "inputs" { operation :: Operation }
  , answer :: Route "answer" { answer :: Int }
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
