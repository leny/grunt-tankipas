# grunt-tankipas

![NPM version](http://img.shields.io/npm/v/grunt-tankipas.svg) ![Dependency Status](https://david-dm.org/leny/grunt-tankipas.svg) ![Downloads counter](http://img.shields.io/npm/dm/grunt-tankipas.svg)

> Compute approximate development time spent on a project, using logs from version control system.

* * *

**grunt-tankipas** is the new version of **grunt-elapsed**, which will be deleted soon.

* * *

## How it works ?

**grunt-tankipas**, according to the options used, read the logs of the current working directory's version control system and computes the difference between each commit timestamp.   
As the resulting time **can't** reflect the reality, **grunt-tankipas** use a `gap` option, a number of minutes above wich the time between two commits is ignored.

## Getting Started

This plugin requires Grunt `~0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-tankipas --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-tankipas');
```

## The "tankipas" task

### Overview

In your project's Gruntfile, add a section named `tankipas` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  tankipas: {
    options: {
      // Task-specific options go here.
    },
    your_target: {
      // Target-specific options go here.
    },
  },
});
```

The "tankipas" task is coded to be used as MultiTask **or** as a simple task : if you don't define it in your grunt config, calling `grunt tankipas` will use the default options.

### Target

**Tankipas** don't expect path for source, as it will look the logs for the current project's version control system logs to work.

### Options

#### options.system

Type: `String`  
Default value: if no value is given, **grunt-tankipas** will try to guess the current version control system

Force the version control system to use for the current directory's analysis.  

For now, **grunt-tankipas** supports `git` and `mercurial` systems.

#### options.gap

Type: `Number`  
Default value: `120`

**grunt-tankipas** compute his result by sum all the time between commits. As you can't pretend working 24h/day (*I tried, it's hard, after 3 days*), **grunt-tankipas** ignore the time between commits separed by more than the given `gap` option. By default, the gap is `120` (minutes).

#### options.user

Type: `String`
Default value: `null`

If you work as a team, you can be interested to filters the commits and compute the time of only one user, which you can precise with the `user` option.

#### options.branch

Type: `String`
Default value: `null`

You can filters the commits and compute the time of only one branch, which you can precise with the `branch` option.

#### options.commit

Type: `String`
Default value: `null`

The result will be computed since the given commit reference, instead of the beginning of the project.

#### options.raw

Type: `Boolean`  
Default value: `false`

By default, **grunt-tankipas** outputs his result in a *human-readable* format. If you want to use the result with another tool, the `raw` option will output results as an amount of `seconds`.

### Usage Examples

#### Default Options

In this example, the default options are used to show in the console the amount of time spent on the project.

```js
grunt.initConfig({
  tankipas: {}
});
```

#### Custom Options

In this example, custom options are used to show in the console the amount of time spent on the project by the user "Leny", as a raw number of seconds. The commit spaced in time by more than 10 minutes are ignored. The project is known to used mercurial version control system, so we indicate it in the options.

```js
grunt.initConfig({
  tankipas: {
    options:
      gap: 10,
      user: "Leny",
      system: "mercurial",
      raw: true
    }
  }
});
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History

* **2014/07/03** : v0.1.0

## License
Copyright (c) 2014 Leny  
Licensed under the MIT license.
