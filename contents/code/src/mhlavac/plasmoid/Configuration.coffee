goog.provide 'mhlavac.plasmoid.Configuration'

class mhlavac.plasmoid.Configuration

    ###*
        @type {plasmoid}
        @protected
    ###
    plasmoid: null

    ###*
        @param {plasmoid} plasmoid
        @constructor
    ###
    constructor: (@plasmoid) ->
        print "pomodoro test"
        return {
            "load": => @load()
        }

    ###*
        @return Array
    ###
    load: () ->
