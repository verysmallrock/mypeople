
const path = require('path');
const CopyWebpackPlugin = require('copy-webpack-plugin')

module.exports = {
    entry: './src/index.coffee',
    mode: 'development',

    module: {
      rules: [
        {
          test: /\.coffee$/,
          use: [ 'coffee-loader' ]
        }
      ]
    },

    plugins: [
        new CopyWebpackPlugin([{ from: './src/index.html' }], {})
    ],

    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'mypeople.js'
    }
  }