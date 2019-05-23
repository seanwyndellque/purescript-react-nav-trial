module Nav where

import Prelude

import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Effect (Effect)
import Foreign.Object (Object)
import Foreign.Object as Object
import Nav.Types (Route)
import Prim.Row as Row
import Prim.RowList (class RowToList, kind RowList, Nil, Cons)
import React.Basic (Component, JSX, ReactComponent, createComponent, toReactComponent)
import Record as Record
import Type.Row (RLProxy(..))

foreign import data Nav :: #Type -> Type

foreign import _push :: forall paramR routes. Nav routes -> String -> Record paramR -> Effect Unit

push :: forall param routes sym typ r2. IsSymbol sym => Row.Cons sym typ r2 routes => Nav routes -> Route sym param -> param -> Effect Unit
push nav route param = _push nav (reflectSymbol (SProxy :: SProxy sym)) { value: param }

foreign import popToTop :: forall routes. Nav routes -> Effect Unit

foreign import _getParam :: forall a routes. Nav routes -> String -> a

getParamData :: forall a routes. Nav routes -> a
getParamData nav = (_getParam nav "value")

foreign import _createStackNavigator :: forall routes. Object (ReactComponent { navigation :: Nav routes }) -> ReactComponent { navigation :: Nav routes }

createStackNavigator :: forall routes uis. MkRouteUis routes uis => Record routes -> Record uis -> ReactComponent { navigation :: Nav routes }
createStackNavigator routes uis = _createStackNavigator $ mkRouteUis routes uis

class MkRouteUis (routes :: # Type) (uis :: # Type) | routes -> uis where
  mkRouteUis :: Record routes -> Record uis -> Object (ReactComponent { navigation :: Nav routes })

class MkRouteUisRl (routes :: # Type) (rl :: RowList) (uis :: # Type) | rl -> routes uis where
  mkRouteUisRl :: RLProxy rl -> Record uis -> Object (ReactComponent { navigation :: Nav routes })

instance mkRouteUisA :: (RowToList routes rl, MkRouteUisRl routes rl uis) => MkRouteUis routes uis where
  mkRouteUis routes uis = mkRouteUisRl (RLProxy :: RLProxy rl) uis

instance mkRouteUIsRlNil :: MkRouteUisRl routes Nil uis where
  mkRouteUisRl _ _ = Object.empty

instance mkRouteUisRlCons ::
  ( MkRouteUisRl routes tail uis
  , IsSymbol sym
  , Row.Cons sym (Nav routes -> param -> JSX) t uis
  ) => MkRouteUisRl routes (Cons sym (Route sym param) tail) uis where
  mkRouteUisRl routes uis = Object.insert (reflectSymbol sp) (createRc $ Record.get sp uis) rest
    where
      sp = SProxy :: SProxy sym

      rest = mkRouteUisRl (RLProxy :: RLProxy tail) uis
-- createStackNavigator ::
--   Record
--   ( operation :: Route "operation" Unit
--   , inputs :: Route "inputs" Operation
--   , answer :: Route "answer" Int
--   ) -> Record
--   ( operation :: Nav AppRoutes -> Unit -> JSX
--   , inputs :: Nav AppRoutes -> Operation -> JSX
--   , answer :: Nav AppRoutes -> Int -> JSX
--   ) -> ReactComponent { navigation :: Nav AppRoutes }
-- createStackNavigator routes uis = _createStackNavigator
--   { operation: createRc uis.operation
--   , inputs: createRc uis.inputs
--   , answer: createRc uis.answer
--   }

foreign import createAppContainer :: forall routes. ReactComponent { navigation :: Nav routes } -> ReactComponent {}

component :: forall routes. Component { navigation :: Nav routes }
component = createComponent "RC"

createRc :: forall routes param. (Nav routes -> param -> JSX) -> ReactComponent { navigation :: Nav routes }
createRc c = toReactComponent identity component { render }
  where
    render self = c self.props.navigation (getParamData self.props.navigation)
