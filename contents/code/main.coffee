goog.provide 'mhlavac.pomodoro'

goog.require 'mhlavac.pomodoro.PomodoroView'
goog.require 'mhlavac.pomodoro.Notification'

layout = new LinearLayout plasmoid
label = new Label
label.text = "test"
layout.addItem label

#configChanged = () ->
#    
#
#workLength = plasmoid.readConfig('work_length')
#
#plasmoid.readConfig('short_break')
#plasmoid.readConfig('long_break')
#plasmoid.configChanged = configChanged

#stopTimer();
#button.clicked.connect(Pomodoro.start());

###
@return Array
###
#getConfig = ->
#  config = new Array()
#  config["work_length"] = 1
#  config["break_length"] = 5
#  config["longbreak_length"] = 25
#  for index of config
#    config[index] = config[index] * minute
#  config
#startTimerFor = (minutes) ->
#  button.text = "Stop"
#  button.clicked.connect stopTimer
#  start = (new Date()).getTime() + config["work_length"]
#  timer.timeout.connect ->
#    nowTime = new Date(start - (new Date()).getTime())
#    if nowTime.getTime() <= 0
#      timer.stop()
#      pomodoroTimer.text = "00"
#    pomodoroTimer.text = nowTime.getMinutes() + 1
#    pomodoroBar.value = nowTime.getTime()
#
#  timer.start()
#stopTimer = ->
#  button.text = "Start"
#  pomodoroBar.value = 0
#  pomodoroTimer.text = "00"
#  timer.stop()
#
####
#@param string file
####
#playSound = (file) ->
#    
#
#succesfulPomodoros = 0
#minute = 60 * 1000
#config = getConfig()
#
#
#pomodoroTimer.text = "Not started"
#timer = new QTimer()
#timer.interval = 300
#
#plasmoid.resize 250, 24
#Pomodoro =
#  workLength: 1
#  breakLength: 1
#  longBreakLength: 1
#  timeTable: null
#  start: ->
#    startTimerFor @workLength
#
#  startBreak: ->
#    startTimerFor @breakLength
#
#  startLongBreak: ->
#    startTimerFor @longBreakLength
#
#Pomodoro.start()