class PomodoroView
    constructor: (@plasmoid) ->

    render: () ->
        @layout = new LinearLayout(plasmoid)
        pomodoroTimer = new Label()
        button = new PushButton()
        
        pomodoroBar = new Meter()
        pomodoroBar.minimum = 0
        pomodoroBar.maximum = config["work_length"]
        pomodoroBar.value = 0
        pomodoroBar.meterType = "BarMeterHorizontal"
        
        layout.addItem button
        layout.addItem pomodoroBar
        layout.addItem pomodoroTimer
        layout.size = new QSizeF(100, 100)

test = "test"
