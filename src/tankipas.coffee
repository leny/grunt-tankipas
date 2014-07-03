###
 * grunt-tankipas
 * https://github.com/Leny/grunt-tankipas
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
###

"use strict"

module.exports = ( grunt ) ->

    grunt.registerMultiTask "tankipas", "Compute approximate development time spent on a project, using logs from version control system.", ->
        oOptions = @options()

        # TODO
