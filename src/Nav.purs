module Nav where

import Prelude

import Data.Symbol (class IsSymbol, SProxy, reflectSymbol)
import Effect (Effect)
import Prim.Row as Row
import React.Basic (ReactComponent)

foreign import data Nav :: #Type -> Type

foreign import _push :: forall param routes. Nav routes -> String -> param -> Effect Unit

push :: forall param routes sym typ r2. IsSymbol sym => Row.Cons sym typ r2 routes => Nav routes -> SProxy sym -> param -> Effect Unit
push nav sym param = _push nav (reflectSymbol sym) param

foreign import popToTop :: forall routes. Nav routes -> Effect Unit

foreign import getParam :: forall a routes. Nav routes -> String -> a

foreign import createStackNavigator :: forall routes a. a -> ReactComponent { navigation :: Nav routes }

foreign import createAppContainer :: forall routes. ReactComponent { navigation :: Nav routes } -> ReactComponent {}
