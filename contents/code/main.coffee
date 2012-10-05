goog.provide 'mhlavac.pomodoro'
goog.require 'mhlavac.pomodoro.Notification'
goog.require 'mhlavac.pomodoro.Configuration'

configuration = new mhlavac.pomodoro.Configuration(plasmoid)
config = configuration.load()
config.work_length = 1000
config.short_break_length = 2000
config.long_break_length = 3000

layout = new LinearLayout(plasmoid)
pomodoroTimer = new Label()

button = new PushButton()
button.styleSheet = "background-color: transparent"

pomodoroBar = new Meter()
pomodoroBar.meterType = "BarMeterHorizontal"

layout.addItem(button)
layout.addItem pomodoroBar
layout.addItem pomodoroTimer

timer = null
started = true
pomodoro = true
stoppedPomodoros = 0
totalPomodoros = 0

pomodoroTimer.text = ""
button.clicked.connect =>
    pomodoroBar.value = 0
    if @timer
        @timer.stop()
    if @started
        @started = false
        stoppedPomodoros++
        image = if @pomodoro then "pomodoro.png" else "wait.png"
        button.image = plasmoid.file("images", image)
    else
        @started = true
        @timer = new QTimer()
        button.image = plasmoid.file("images", "stop.png")
        if @pomodoro
            print "pomodoro started"
            length = @config.work_length
        else
            if (@totalPomodoros) % 4 == 0
                length = @config.long_break_length
                print "long break started"
            else
                length = @config.short_break_length
                print "short break started"

        @pomodoroBar.maximum = length;
        endTime = (new Date()).getTime() + length
        @timer.timeout.connect =>
            nowTime = (new Date())
            if nowTime.getTime() >= endTime
                if @pomodoro
                    @totalPomodoros++
                @pomodoro = !@pomodoro
                @button.clicked()
                mhlavac.pomodoro.Notification "pomodoro ended", "Pomodoro has ended"
            timeLeft = endTime - nowTime.getTime()
            pomodoroBar.value = timeLeft
            pomodoroTimer.text = parseInt(timeLeft / 60000) + 1
            print "time left: " + timeLeft / 1000 + "s"
        @timer.start 300
button.clicked()
