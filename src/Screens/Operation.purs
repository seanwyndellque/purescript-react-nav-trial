module Nav.Operation where

import Prelude

import Nav (Nav, push)
import Nav.Types (AppRoutes, Operation(..), appR)
import React.Basic (JSX)
import React.Basic.Events (handler_)
import React.Basic.Native as RN

operation :: Nav AppRoutes -> Unit -> JSX
operation nav _ =
  RN.view_
  [ RN.text_ [ RN.string "Operation" ]
  , RN.button
    { title: "add"
    , onPress: handler_ $ push nav appR.inputs Add
    }
  , RN.button
    { title: "multiply"
    , onPress: handler_ $ push nav appR.inputs Multiply
    }
  ]
