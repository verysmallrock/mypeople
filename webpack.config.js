const webpack = require('webpack');
const path = require('path');
const CopyWebpackPlugin = require('copy-webpack-plugin')

module.exports = {
    entry: './src/index.cjsx',
    mode: 'development',

    module: {
      rules: [
        { test: /\.coffee$/,use: [ 'coffee-loader' ] },
        { test: /\.cjsx$/,use: [ 'cjsx-loader', 'coffee-loader' ] },
      ]
    },

    plugins: [
        new CopyWebpackPlugin([{ from: './src/index.html' }], {}),
        new webpack.ProvidePlugin({
          _: 'lodash',
          $: 'jquery',
          AppHelper: 'core/apphelper',
          React: 'react'
        })
    ],

    resolve: {
      extensions: ['.coffee', '.js', '.jsx', '.cjsx'],
      alias: {
        core: path.resolve(__dirname, './src/core/')
      }
    },

    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'mypeople.js'
    }
  }