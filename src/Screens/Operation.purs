module Nav.Operation where

import Prelude

import Nav (Nav, push)
import React.Basic (Component, ReactComponent, createComponent, toReactComponent)
import React.Basic.Events (handler_)
import React.Basic.Native as RN

component :: Component { navigation :: Nav }
component = createComponent "Operation"

operation :: ReactComponent { navigation :: Nav }
operation = toReactComponent identity component { render }
  where
    render self =
      RN.view_
      [ RN.text_ [ RN.string "Operation" ]
      , RN.button
        { title: "add"
        , onPress: handler_ $ push self.props.navigation "inputs"
          { operation: Add }
        }
      , RN.button
        { title: "multiply"
        , onPress: handler_ $ push self.props.navigation "inputs"
            { operation: Multiply }
        }
      ]

data Operation = Add | Multiply
