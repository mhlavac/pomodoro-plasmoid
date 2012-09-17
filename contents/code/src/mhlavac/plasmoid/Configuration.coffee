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

    load: () ->
        minute = 60000;

        config = Array()
        config['work_length'] = @plasmoid.readConfig('work_length') * minute
        config['short_break_length'] = @plasmoid.readConfig('short_break') * minute
        config['long_break_length'] = @plasmoid.readConfig('long_break') * minute
        config['timetable'] = @plasmoid.readConfig('timetable')
        config
