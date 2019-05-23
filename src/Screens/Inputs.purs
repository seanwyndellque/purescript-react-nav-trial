module Nav.Inputs where

import Prelude

import Data.Int (fromString)
import Data.Maybe (fromMaybe)
import Nav (Nav, getParam, push)
import Nav.Types (AppRoutes, appR, Operation(..))
import React.Basic (Component, ReactComponent, createComponent, toReactComponent)
import React.Basic.Events (handler_)
import React.Basic.Native as RN

component :: Component { navigation :: Nav AppRoutes }
component = createComponent "Inputs"

inputs :: ReactComponent { navigation :: Nav AppRoutes }
inputs = toReactComponent identity component { initialState, render }
  where
    initialState =
      { a: "2"
      , b: "3"
      }

    render self =
      RN.view_
      [ RN.text_ [ RN.string "Inputs" ]
      , RN.textInput
        { value: self.state.a
        }
      , RN.textInput
        { value: self.state.b
        }
      , RN.button
        { title: "submit"
        , onPress: handler_ $ push self.props.navigation appR.answer
            { answer: solve (getParam self.props.navigation "operation") self.state.a self.state.b}
        }
      ]

    solve op a b = case op of
      Add -> (fromMaybe 0 (fromString a)) + (fromMaybe 0 (fromString b))
      Multiply -> (fromMaybe 0 (fromString a)) * (fromMaybe 0 (fromString b))
