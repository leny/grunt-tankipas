###
 * grunt-tankipas
 * https://github.com/Leny/grunt-tankipas
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
###

"use strict"

tankipas = require "tankipas"
chalk = require "chalk"
error = chalk.bold.red
( spinner = require "simple-spinner" )
    .change_sequence [
        "◓"
        "◑"
        "◒"
        "◐"
    ]

module.exports = ( grunt ) ->

    tankipasTask = ->
        fNext = @async()

        oOptions = @options
            system: null
            gap: 120
            user: null
            commit: null
            raw: no

        spinner.start 50

        tankipas process.cwd(), oOptions, ( oError, iTotal ) ->
            spinner.stop()
            if oError
                grunt.log.error oError
                fNext no
            if oOptions.raw
                grunt.log.writeln iTotal
            else
                iTotal /= 1000
                iMinutes = if ( iMinutes = Math.floor( iTotal / 60 ) ) > 60 then ( iMinutes % 60 ) else iMinutes
                iHours = Math.floor iTotal / 3600
                sUserString = if oOptions.user then " (for #{ chalk.cyan( oOptions.user ) })" else ""
                grunt.log.writeln "Time spent on project#{ sUserString }: ±#{ chalk.yellow( iHours ) } hours & #{ chalk.yellow( iMinutes ) } minutes."
            fNext()

    if grunt.config.data.tankipas
        grunt.registerMultiTask "tankipas", "Compute approximate development time spent on a project, using logs from version control system.", tankipasTask
    else
        grunt.registerTask "tankipas", "Compute approximate development time spent on a project, using logs from version control system.", tankipasTask
