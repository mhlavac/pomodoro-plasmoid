goog.provide 'mhlavac.pomodoro.Configuration'

goog.require 'mhlavac.plasmoid.Configuration'

class mhlavac.pomodoro.Configuration extends mhlavac.plasmoid.Configuration
    load: () ->
        minute = 60000;

        config = Array()
        config['work_length'] = @plasmoid.readConfig('work_length') * minute
        config['short_break_length'] = @plasmoid.readConfig('short_break') * minute
        config['long_break_length'] = @plasmoid.readConfig('long_break') * minute
        config['timetable'] = @plasmoid.readConfig('timetable')
        config
