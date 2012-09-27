goog.provide 'mhlavac.pomodoro'
goog.require 'mhlavac.pomodoro.Notification'
goog.require 'mhlavac.plasmoid.Configuration'

configuration = new mhlavac.plasmoid.Configuration(plasmoid)
config = configuration.load()

layout = new LinearLayout(plasmoid)
pomodoroTimer = new Label()

button = new PushButton()

pomodoroBar = new Meter()
pomodoroBar.meterType = "BarMeterHorizontal"

layout.addItem(button)
layout.addItem pomodoroBar
layout.addItem pomodoroTimer

timer = new QTimer()
timer.interval = 300

pause = false
totalPomodoros = 0

startPomodoro = () ->
    startTimerFor @config.work_length

startShortBreak = () ->
    startTimerFor @config.short_break_length

startLongBreak = () ->
    startTimerFor @config.long_break_length

startTimerFor = (minutes) ->
    button.text = "Stop"
    button.image = plasmoid.file("images", "stop.png")
    button.clicked.connect stopTimer
    pomodoroBar.maximum = minutes
    start = (new Date()).getTime() + pomodoroBar.maximum
    timer.timeout.connect =>
        nowTime = new Date(start - (new Date()).getTime())
        if nowTime.getTime() <= 0
            if (pause == true)
                button.text = "Start"
                pause = false
                stopTimer () ->
                    startTimerFor config.work_length
            else
                pause = true
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
    button.clicked.connect startPomodoro
    pomodoroBar.value = 0
    pomodoroTimer.text = ""
    timer.stop()
    totalPomodoros++

stopTimer => startTimerFor 1
