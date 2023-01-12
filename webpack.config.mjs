import path from "path";
import { fileURLToPath } from "url";
import CssMinimizerPlugin from "css-minimizer-webpack-plugin";
import HtmlPlugin from "html-webpack-plugin";
import MiniCssExtractPlugin from "mini-css-extract-plugin";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default ({ production }) => ({
  mode: production ? "production" : "development",
  entry: {
    app: [
      path.resolve(__dirname, "output", "Main"),
      path.resolve(__dirname, "output", "CSS"),
    ],
  },
  output: {
    publicPath: "",
    path: path.resolve(__dirname, "public"),
    filename: `[name]${production ? ".[contenthash]" : ""}.js`,
  },
  plugins: [
    new HtmlPlugin({ title: "Tecton + Halogen Starter App" }),
    new MiniCssExtractPlugin({
      filename: `[name]${production ? ".[contenthash]" : ""}.css`,
    }),
  ],
  resolve: {
    extensions: [".js", ".css"],
  },
  module: {
    rules: [
      {
        test: /output\/Main\/index.js$/,
        use: {
          loader: "string-replace-loader",
          options: {
            search: /export\s+{[^]+}/m,
            replace: "main()",
          },
        },
      },
      {
        test: /output\/CSS\/index.js$/,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          "postcss-loader",
          {
            loader: "execute-module-loader",
            options: {
              getResult: x => x.sheet,
            },
          },
        ],
      },
      {
        test: /\.woff2?$/,
        type: "asset/resource",
      },
    ],
  },
  watchOptions: {
    aggregateTimeout: 500,
  },
  optimization: {
    minimizer: [
      "...",
      new CssMinimizerPlugin(),
    ],
  },
});
