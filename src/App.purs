module App where

import Prelude hiding (not)

import Color (rgb)
import Data.Tuple.Nested ((/\))
import Halogen (ClassName(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Tecton (CSS, active, alignItems, appearance, backgroundColor, borderColor, borderRadius, borderStyle, borderWidth, boxShadow, center, color, currentColor, display, em, flex, focus, fontSize, gap, height, hover, inherit, justifyContent, margin, minWidth, nil, none, outlineStyle, padding, px, solid, textAlign, transparent, universal, vh, vw, width, (&:), (:=), (?), (~))
import Tecton.Halogen ((&.))
import Tecton.Rule as Rule

viewport = ClassName "app__viewport" :: ClassName
control = ClassName "app__control" :: ClassName
valueDisplay = ClassName "app__value-display" :: ClassName
button = ClassName "app__button" :: ClassName

css :: CSS
css = do
  universal &. viewport ? Rule.do
    width := vw 100
    height := vh 100
    display := flex
    alignItems := center
    justifyContent := center
  universal &. control ? Rule.do
    display := flex
    alignItems := center
    gap := em 1
  universal &. valueDisplay ? Rule.do
    fontSize := em 2
    color := rgb 51 51 51
    minWidth := px 50
    textAlign := center
  universal &. button ? Rule.do
    appearance := none
    outlineStyle := none
    margin := nil
    padding := nil
    fontSize := inherit
    width := em 1.25
    height := em 1.25
    display := flex
    alignItems := center
    justifyContent := center
    borderStyle := solid
    borderWidth := px 1
    borderColor := currentColor
    borderRadius := px 9999
    backgroundColor := transparent
    color := rgb 128 128 128
  universal &. button &: hover /\ universal &. button &: focus ? Rule.do
    color := rgb 0 131 255
  universal &. button &: active ? Rule.do
    color := rgb 255 131 0
  universal &. button &: focus ? Rule.do
    boxShadow := currentColor ~ nil ~ nil ~ px 4

data Action = Increment | Decrement

component :: forall q i o m. H.Component q i o m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval H.defaultEval { handleAction = handleAction }
    }
  where

  initialState = const 0

  render state =
    HH.div
      [ HP.class_ viewport ]
      [ HH.div
          [ HP.class_ control ]
          [ HH.button
              [ HP.class_ button
              , HE.onClick \_ -> Decrement
              ]
              [ HH.text "－" ]
          , HH.div [ HP.class_ valueDisplay ] [ HH.text $ show state ]
          , HH.button
              [ HP.class_ button
              , HE.onClick \_ -> Increment
              ]
              [ HH.text "＋" ]
          ]
      ]

  handleAction =
    case _ of
      Increment -> H.modify_ \s -> s + 1
      Decrement -> H.modify_ \s -> s - 1
