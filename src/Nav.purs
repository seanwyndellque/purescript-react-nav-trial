module Nav where

import Prelude

import Effect (Effect)

foreign import data Nav :: Type

foreign import push :: forall param. Nav -> String -> param -> Effect Unit

foreign import popToTop :: Nav -> Effect Unit

foreign import getParam :: forall a. Nav -> String -> a
