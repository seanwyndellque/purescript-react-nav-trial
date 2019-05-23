module Nav.Inputs where

import Prelude

import Data.Int (fromString)
import Data.Maybe (fromMaybe)
import Nav (Nav, push)
import Nav.Types (AppRoutes, appR, Operation(..))
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.Events (handler_)
import React.Basic.Native as RN

component :: Component {}
component = createComponent "Inputs"

inputs :: Nav AppRoutes -> Operation -> JSX
inputs nav op = make component { initialState, render } {}
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
        , onPress: handler_ $ push nav appR.answer $
            solve self.state.a self.state.b
        }
      ]

    solve a b = case op of
      Add -> (fromMaybe 0 (fromString a)) + (fromMaybe 0 (fromString b))
      Multiply -> (fromMaybe 0 (fromString a)) * (fromMaybe 0 (fromString b))
