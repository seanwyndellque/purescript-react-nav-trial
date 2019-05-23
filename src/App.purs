module Nav.App where

import Nav (Nav, createAppContainer, createStackNavigator)
import Nav.Answer (answer)
import Nav.Inputs (inputs)
import Nav.Operation (operation)
import Nav.Types (AppRoutes)
import React.Basic (ReactComponent)

appNavigator :: ReactComponent { navigation :: Nav AppRoutes }
appNavigator = createStackNavigator
  { operation
  , inputs
  , answer
  }

app :: ReactComponent {}
app = createAppContainer appNavigator
