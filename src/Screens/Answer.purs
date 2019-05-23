module Nav.Answer where

import Prelude

import Effect.Class.Console (log)
import Effect.Uncurried (mkEffectFn1)
import React.Basic (Component, ReactComponent, createComponent, toReactComponent)
import React.Basic.Events (handler_)
import React.Basic.Native as RN
import Web.DOM.Document (createComment)

foreign import data Nav :: Type

component :: Component { navigation :: Nav }
component = createComponent "Answer"

answer :: ReactComponent { navigation :: Nav }
answer = toReactComponent identity component { render }
  where
    render self =
      RN.view_
      [ RN.text_ [ RN.string "Answer" ]
      ]
