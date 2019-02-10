const webpack = require('webpack');
const path = require('path');
const CopyWebpackPlugin = require('copy-webpack-plugin')

module.exports = {
    devtool: 'eval',
    entry: './src/index.cjsx',
    mode: 'development',

    module: {
      rules: [
        { test: /\.coffee$/,use: [ 'coffee-loader' ] },
        { test: /\.cjsx$/,use: [ 'cjsx-loader', 'coffee-loader' ] },
        { test: /\.scss$/, use: [ "style-loader", {loader: "css-loader", options: { modules: 'global' }}, "sass-loader" ] }
      ]
    },

    plugins: [
        new CopyWebpackPlugin([{ from: './src/index.html' }], {}),
        new webpack.ProvidePlugin({
          _: 'lodash',
          $: 'jquery',
          AppHelper: 'core/apphelper',
          AppState: 'model/appstate',
          React: 'react'
        })
    ],

    resolve: {
      extensions: ['.coffee', '.js', '.jsx', '.cjsx', '.scss'],
      alias: {
        core: path.resolve(__dirname, './src/core/'),
        model: path.resolve(__dirname, './src/model/'),
        view: path.resolve(__dirname, './src/view/')
      }
    },

    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'mypeople.js'
    }
  }