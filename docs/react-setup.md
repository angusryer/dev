# React Setup

## NPM Init

Decide where you want to save the app and use `mkdir` to make a new directory with the app name. `cd` into the new directory and type this command into the terminal:

```
$ npm init
```

This automaticlly creates a new file named `package.json` that keeps track of the modules you've installed.

## NPM Save Locations

`--save` or `-S` saves package to dependencies.

`--save-dev` of `-D` saves package to devDependencies.

`-g` saves package globally.

## Install React

To install the `react` module, run:

```
$ npm i -S react
```

## Install ReactDOM

To install the `react-dom` module, run:

```
$ npm i -S react-dom
```

## Install Babel

Babel is a JavaScript compiler that includes the ability to compile JSX into regular JavaScript. You will only be using Babel in *development mode*.

To install all three necessary Babel packages, run:

```
$ npm i -D babel-core babel-loader babel-preset-react
```

## Configure Babel

In order to make Babel work, you need to write a babel configuration file in your root directory named **.babelrc.**

Save the following code inside of **.babelrc.**

```
{ presets: ['react'] }
```

## Install Webpack

To install all three necessary Webpack packages, run:

```
npm i -D webpack webpack-dev-server html-webpack-plugin
```

## Configure Webpack

In your root directory, create a new file named **webpack.config.js**.

Webpack is going to take your JavaScript, run it through some transformations, and create a new, transformed JavaScript file. In order to do this, Webpack needs to know three things:

1. What JavaScript file it should transform.
2. Which transformations it should use on that file.
3. Where the new, transformed file should go.

First, in **webpack.config.js**, write:

```js
// All of webpack’s configuration will go inside of this object literal.
module.exports = {
  // `entry` is the file Webpack will transform
  entry: __dirname + '/app/index.js',
  module: {
    loaders [
      {
        test: /\.js$/, // loader will search for all files ending in “.js”
        exclude: /node_modules/, // excluding files in the node_modules folder
        loader: 'babel-loader'
      }
    ]
  },

  // Save transformed JS into a new file named build/transformed.js.
  output: {
    filename: 'transformed.js',
    path: __dirname + '/build'
  }
};
```


## Resources

- [codecademy.com/articles/react-setup-i](https://www.codecademy.com/articles/react-setup-i)
- [codecademy.com/articles/react-setup-ii](https://www.codecademy.com/articles/react-setup-ii)
- [codecademy.com/articles/react-setup-iii](https://www.codecademy.com/articles/react-setup-iii)