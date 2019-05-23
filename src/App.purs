module Nav.App where

import Prelude

import Nav (Nav, createAppContainer, createStackNavigator, getParamData)
import Nav.Answer (answer)
import Nav.Inputs (inputs)
import Nav.Operation (operation)
import Nav.Types (AppRoutes, appR)
import React.Basic (Component, JSX, ReactComponent, createComponent, toReactComponent)

appNavigator :: ReactComponent { navigation :: Nav AppRoutes }
appNavigator = createStackNavigator appR
  { operation
  , inputs
  , answer
  }

app :: ReactComponent {}
app = createAppContainer appNavigator
