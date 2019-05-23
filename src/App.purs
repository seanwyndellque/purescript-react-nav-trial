module Nav.App where

import Prelude

import Nav (Nav, createAppContainer, createStackNavigator, getParamData)
import Nav.Answer (answer)
import Nav.Inputs (inputs)
import Nav.Operation (operation)
import Nav.Types (AppRoutes)
import React.Basic (Component, JSX, ReactComponent, createComponent, toReactComponent)

appNavigator :: ReactComponent { navigation :: Nav AppRoutes }
appNavigator = createStackNavigator
  { operation: createRc operation
  , inputs: createRc inputs
  , answer: createRc answer
  }

app :: ReactComponent {}
app = createAppContainer appNavigator

component :: forall routes. Component { navigation :: Nav routes }
component = createComponent "RC"

createRc :: forall routes param. (Nav routes -> param -> JSX) -> ReactComponent { navigation :: Nav routes }
createRc c = toReactComponent identity component { render }
  where
    render self = c self.props.navigation (getParamData self.props.navigation)
