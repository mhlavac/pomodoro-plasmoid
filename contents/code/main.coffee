goog.provide 'mhlavac.pomodoro'
goog.require 'mhlavac.pomodoro.Notification'
goog.require 'mhlavac.plasmoid.Configuration'

configuration = new mhlavac.plasmoid.Configuration(plasmoid)
config = configuration.load()

layout = new LinearLayout(plasmoid)
pomodoroTimer = new Label()

button = new PushButton()

pomodoroBar = new Meter()
pomodoroBar.minimum = 0
pomodoroBar.value = 0
pomodoroBar.meterType = "BarMeterHorizontal"

layout.addItem(button)
layout.addItem pomodoroBar
layout.addItem pomodoroTimer

timer = new QTimer()
timer.interval = 300

totalPomodoros = 0

startTimerFor = (minutes) ->
    button.text = "Stop"
    button.image = plasmoid.file("images", "stop.png")
    button.clicked.connect stopTimer
    pomodoroBar.maximum = minutes
    start = (new Date()).getTime() + pomodoroBar.maximum
    timer.timeout.connect =>
        nowTime = new Date(start - (new Date()).getTime())
        if nowTime.getTime() <= 0
            if ((totalPomodoros + 1) % 4 == 0)
                button.text = "Take long break"
                stopTimer () ->
                    startTimerFor config.long_break_length
            else
                button.text = "Take break"
                stopTimer () ->
                    startTimerFor config.short_break_length
        pomodoroTimer.text = nowTime.getMinutes() + 1
        pomodoroBar.value = nowTime.getTime()
        print pomodoroBar.value
    timer.start()

button.text = "Start"
stopTimer = (callback) ->
    button.image = plasmoid.file("images", "pomodoro.png")
    button.clicked.connect => callback()
    pomodoroBar.value = 0
    pomodoroTimer.text = "00"
    timer.stop()
    totalPomodoros++

stopTimer => startTimerFor 1
