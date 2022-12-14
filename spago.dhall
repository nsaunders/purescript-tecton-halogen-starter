{ name = "tecton-halogen-starter"
, dependencies =
  [ "colors"
  , "effect"
  , "halogen"
  , "prelude"
  , "tecton"
  , "tecton-halogen"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
