module CSS where

import Prelude

import App as App
import Color (white)
import Tecton (backgroundColor, body, fontFamily, margin, nil, pretty, renderSheet, sansSerif, (:=), (?))
import Tecton.Rule as Rule

sheet :: String
sheet =
  renderSheet pretty do
    global
    App.css
  where
  global = do
    body ? Rule.do
      fontFamily := sansSerif
      backgroundColor := white
      margin := nil
