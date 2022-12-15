# Tecton 🔗 Halogen — Starter app

[![CI](https://github.com/nsaunders/purescript-tecton-halogen-starter/workflows/CI/badge.svg?branch=master)](https://github.com/nsaunders/purescript-tecton-halogen-starter/actions?query=workflow%3ACI+branch%3Amaster)

This starter project demonstrates an approach for using [Tecton](https://github.com/nsaunders/purescript-tecton) to style a [Halogen](https://github.com/purescript-halogen/purescript-halogen) application. CSS is authored in PureScript but "extracted" at build time to produce a static style sheet. Generating the style sheet at build time instead of runtime can avoid issues like the [flash of unstyled content (FOUC)](https://en.wikipedia.org/wiki/Flash_of_unstyled_content), [performance overhead](https://pustelto.com/blog/css-vs-css-in-js-perf/#conclusion), and [`Content-Security-Policy` headaches](https://github.com/styled-components/styled-components/issues/887).

## Required tooling

> **Note**
> If you are a Nix user, you can simply run `nix-shell` to obtain all of the required tools.

* [`npm`](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
* [`purs`](https://github.com/purescript/documentation/blob/master/guides/Getting-Started.md#installing-the-compiler)
* [`spago`](https://github.com/purescript/documentation/blob/master/guides/Getting-Started.md#setting-up-the-development-environment)
* [`purs-tidy`](https://github.com/natefaubion/purescript-tidy#install)

## Scripts

> **Note**
> You must run `npm install` first.

* `npm run dev` builds PureScript source code using [Spago](https://github.com/purescript/spago) in watch mode, while concurrently running the [Webpack dev server](https://webpack.js.org/configuration/dev-server/).
* `npm run bundle` creates a production-ready application bundle using [Webpack](https://webpack.js.org).
* `npm run format` formats the `src` and `test` directories using [purs-tidy](https://github.com/natefaubion/purescript-tidy).

## Related

* [purescript-tecton](https://github.com/nsaunders/purescript-tecton)
* [purescript-tecton-halogen](https://github.com/nsaunders/purescript-tecton-halogen)
* [purescript-halogen](https://github.com/purescript-halogen/purescript-halogen)
