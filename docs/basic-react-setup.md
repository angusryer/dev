# Basic React Environment Setup

This guide walks through the most basic manual configuration of a React environment. Consider it one small step beyond the incredibly useful [create-react-app](https://reactjs.org/docs/create-a-new-react-app.html). I promise it's not that scary.

## NPM Init

From the terminal, decide where you want to save the app and use `mkdir` to create a new directory with the desired app name. `cd` into the new directory and initialize npm with:

```
npm init -y
```

This automaticlly creates a new file named `package.json` that keeps track of the modules you've installed.

### NPM Save Locations

When `npm install` is run, the default option is `--save`

`--save` or `-S` saves package to dependencies.

`--save-dev` or `-D` saves package to devDependencies.

`-g` saves package globally.

## Install React and ReactDOM

To install the `react` and `react-dom` modules, run:

```
npm install react react-dom
```

## Install Webpack

To install all three necessary Webpack packages, run:

```
npm install --save-dev webpack webpack-dev-server webpack-cli
```

Add the following script to `package.json`

```
"scripts": {
  "start": "webpack-dev-server --open --mode development"
}
```

## Install Babel

Babel is a JavaScript compiler that includes the ability to compile JSX into regular JavaScript. You will only be using Babel in *development mode*.

To install all four necessary Babel packages, run:

```
npm install --save-dev @babel/core @babel/preset-env @babel/preset-react babel-loader
```

## Configure Webpack

In your root directory, create a new file named **webpack.config.js**.

Webpack is going to take your JavaScript, run it through some transformations, and create a new, transformed JavaScript file. In order to do this, Webpack needs to know three things:

1. What JavaScript file it should transform `entry`.
2. Where the new, transformed file should go `output`.
3. Which transformations it should use on that file `rules`.

First, in **webpack.config.js**, write:

```js
module.exports ={
  entry: './src/index.js',
  output: {
    path: __dirname + '/dist',
    publicPath: '/',
    filename: 'bundle.js'
  },
  devServer: {
    contentBase: './',
    publicPath: '/dist/'
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: ['babel-loader']
      }
    ]
  }
};
```

## Configure Babel

In order to make Babel work, you need to write a babel configuration file in your root directory named **.babelrc**.

Save the following code inside of **.babelrc**.

```
{
  "presets": [
    "@babel/preset-env",
    "@babel/preset-react"
  ]
}
```

## Develop

Test our development configuration by creating `index.html` in the root folder and adding the following content:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My React Configuration</title>
  </head>
  <body>
    <div id="root"></div>
  </body>
</html>
```

Create a new directory named `src` and inside, a file named `index.js`. This is the file that `entry` in `webpack.config.js` is referring to. Add the following content:

```js
import React from "react";
import ReactDOM from "react-dom";

ReactDOM.render(
  <React.StrictMode>
    <h1>Hello World from My React Configuration</h1>
  </React.StrictMode>,
  document.getElementById('root')
);
```

In the terminal run `npm start`.

## Conclusion

*Note that this configuration thus far lacks build and test commands. Until updated, make use of the resources below.*

## Resources

- [Step by step React configuration from setup to deployment](https://dev.to/nsebhastian/step-by-step-react-configuration-2nma)
