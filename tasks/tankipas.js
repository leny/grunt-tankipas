
/*
 * grunt-tankipas
 * https://github.com/Leny/grunt-tankipas
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
 */
"use strict";
var chalk, error, spinner, tankipas;

tankipas = require("tankipas");

chalk = require("chalk");

error = chalk.bold.red;

(spinner = require("simple-spinner")).change_sequence(["◓", "◑", "◒", "◐"]);

module.exports = function(grunt) {
  var tankipasTask;
  tankipasTask = function() {
    var fNext, oOptions;
    fNext = this.async();
    oOptions = this.options({
      system: null,
      gap: 120,
      user: null,
      branch: null,
      commit: null,
      raw: false
    });
    spinner.start(50);
    return tankipas(process.cwd(), oOptions, function(oError, iTotal) {
      var iHours, iMinutes, sUserString;
      spinner.stop();
      if (oError) {
        grunt.log.error(oError);
        fNext(false);
      }
      if (oOptions.raw) {
        grunt.log.writeln(iTotal);
      } else {
        iTotal /= 1000;
        iMinutes = (iMinutes = Math.floor(iTotal / 60)) > 60 ? iMinutes % 60 : iMinutes;
        iHours = Math.floor(iTotal / 3600);
        sUserString = oOptions.user ? " (for " + (chalk.cyan(oOptions.user)) + ")" : "";
        grunt.log.writeln("Time spent on project" + sUserString + ": ±" + (chalk.yellow(iHours)) + " hours & " + (chalk.yellow(iMinutes)) + " minutes.");
      }
      return fNext();
    });
  };
  if (grunt.config.data.tankipas) {
    return grunt.registerMultiTask("tankipas", "Compute approximate development time spent on a project, using logs from version control system.", tankipasTask);
  } else {
    return grunt.registerTask("tankipas", "Compute approximate development time spent on a project, using logs from version control system.", tankipasTask);
  }
};
