# grunt-codo-codo

![NPM version](http://img.shields.io/npm/v/grunt-codo-codo.svg) ![Dependency Status](https://david-dm.org/leny/grunt-codo-codo.svg) ![Downloads counter](http://img.shields.io/npm/dm/grunt-codo-codo.svg)

> Grunt task for generating codo documentation.

* * *

**Note:** I know, the plugin **grunt-codo** already exists. But it doesn't support multi-tasking (which I *need* for a project), and don't really fit with the usual practices for Grunt plugin.  
As I need a grunt task to generate *codo* documentation urgently, I prefer to recode my version of *grunt-codo*, renamed *grunt-codo-codo*. When the task will be ready, I'll push it on npm *and* should propose my work to the *grunt-codo* maintainers, to merge projects.  
As for now, I really need reactivity and solutions, so I made it myself.

* * *

## Getting Started

This plugin requires Grunt `~0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-codo-codo --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-codo-codo');
```

## The "codo" task

### Overview

In your project's Gruntfile, add a section named `codo` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  codo: {
    options: {
      // Task-specific options go here.
    },
    your_target: {
      // Target-specific file lists and/or options go here.
    },
  },
});
```

### Target

**Codo** expect to lookup for `coffee` files into given folder, and a destination path to generate the documentation.

So, in your target, don't forget to add `src` and `dest` properties. The `dest` property is optional, and is defaulting to `"./doc"`.

**Note:** as **Codo** seems to expect folders path instead of files list, if files are given, the task will use their dirname as source.

### Options

#### options.stats

Type: `Boolean`  
Default value: `true`

Show stats about the documentation generation.

#### options.extension

Type: `String`  
Default value: `"coffee"`

Coffee files extension.

#### options.output

Type: `String` (path)  
Default value: `target.dest`, or `"./doc"`

The documentation destination directory. If this option is given, it will overwrite the target's `dest` parameter.

#### options.theme

Type: `String`  
Default value: `theme`

The theme to be used.

#### options.name

Type: `String`  
Default value: `"Codo"`

The project name.

#### options.title

Type: `String`  
Default value: `"Documentation"`

Documentation HTML Title.

#### options.readme

Type: `String` (path)  
Default value: `"README.md"`

The README file used in documentation.

#### options.quiet

Type: `Boolean`  
Default value: `false`

Supress warnings

#### options.verbose

Type: `Boolean`  
Default value: `false`

Show parsing errors.

#### options.undocumented

Type: `Boolean`  
Default value: `false`

List undocumented objects.

#### options.closure

Type: `Boolean`  
Default value: `false`

Try to parse closure-like block comments.

#### options.private

Type: `Boolean`  
Default value: `false`

Show privates.

#### options.analytics

Type: `String`  
Default value: `false`

The Google Analytics ID.

#### options.extras

Type: `Array` of `String` (path)  
Default value: `[]`

Extra files to add to the documentation. **Markdown** files will be parsed.

### Usage Examples

#### Default Options

In this example, the default options are used to generate the documentation for the coffee files from the `src` directory into the default `./doc` folder.

```js
grunt.initConfig({
  codo: {
    src: [
      'src'
    ]
  },
});
```

#### Custom Options

In this example, custom options are used to generate the documentation from api controllers and models into the `website/doc/api` folder. We also set names and title, include a *license* file, and ask the task to show us the undocumented objects, but not the stats of the generation.

```js
grunt.initConfig({
  codo: {
    options:
      name: "AwesomeProject"
      title: "AwesomeProject API Documentation"
      extra: [ "LICENSE-MIT" ]
      undocumented: yes
      stats: no
    src: [
      "src/controllers/api"
      "src/models"
    ]
    dest: "website/doc/api"
  },
});
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History

* **2014/06/23** : v0.1.0

### TODO

* [ ] Add basic unit tests

## License
Copyright (c) 2014 Leny  
Licensed under the MIT license.
