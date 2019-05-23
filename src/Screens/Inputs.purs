module Nav.Inputs where

import Prelude

import Effect.Class.Console (log)
import Effect.Uncurried (mkEffectFn1)
import React.Basic (Component, ReactComponent, createComponent, toReactComponent)
import React.Basic.Events (handler_)
import React.Basic.Native as RN
import Web.DOM.Document (createComment)

foreign import data Nav :: Type

component :: Component { navigation :: Nav }
component = createComponent "Inputs"

inputs :: ReactComponent { navigation :: Nav }
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
        , onPress: handler_ $ log (self.state.a <> self.state.b)
        }
      ]
