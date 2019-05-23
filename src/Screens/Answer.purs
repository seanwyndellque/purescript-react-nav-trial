module Nav.Answer where

import Prelude

import Nav (Nav, popToTop)
import Nav.Types (AppRoutes)
import React.Basic (JSX)
import React.Basic.Events (handler_)
import React.Basic.Native as RN

answer :: Nav AppRoutes -> Int -> JSX
answer nav ans =
  RN.view_
  [ RN.text_ [ RN.string "Answer" ]
  , RN.text_ [ RN.string $ show ans ]
  , RN.button
    { title: "Back to top"
    , onPress: handler_ $ popToTop nav
    }
  ]
