const webpack = require('webpack');
const path = require('path');
const nodeExternals = require('webpack-node-externals');

module.exports = {
    entry: [
        'webpack/hot/poll?100', './src/app.ts'
    ],
    watch: true,
    target: "node",
    externals: [
        nodeExternals({
            whitelist: ['webpack/hot/poll?100'],
            }
        ),
    ],
    module: {
        rules: [
            {
                test: /.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/,
            },
        ],
    },
    node: {
        __dirname: false
    },
    mode: "development",
    devtool: "source-map",
    resolve: {
        extensions: ['.tsx', '.ts', '.js'],
    },
    plugins: [
        new webpack.HotModuleReplacementPlugin()
    ],
    output: {
        path: path.join(__dirname, 'dist'),
        filename: "server.js",
    },
}