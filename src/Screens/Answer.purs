module Nav.Answer where

import Prelude

import Nav (Nav, getParam, popToTop)
import Nav.Types (AppRoutes)
import React.Basic (Component, ReactComponent, createComponent, toReactComponent)
import React.Basic.Events (handler_)
import React.Basic.Native as RN

component :: Component { navigation :: Nav AppRoutes }
component = createComponent "Answer"

answer :: ReactComponent { navigation :: Nav AppRoutes }
answer = toReactComponent identity component { render }
  where
    render self =
      RN.view_
      [ RN.text_ [ RN.string "Answer" ]
      , RN.text_ [ RN.string (getParam self.props.navigation "answer") ]
      , RN.button
        { title: "Back to top"
        , onPress: handler_ $ popToTop self.props.navigation
        }
      ]
