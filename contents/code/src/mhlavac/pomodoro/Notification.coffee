goog.provide 'mhlavac.pomodoro.Notification'

###
@param string summary
@param string body
###
mhlavac.pomodoro.Notification = (summary, body) ->
    print "Sending notification: #{summary}\n#{body}"
    engine = dataEngine("notifications")
    service = engine.serviceForSource("notification")
    operation = service.operationDescription("createNotification")
    operation.appName = "mhlavac-pomodoro"
    operation.appIcon = plasmoid.file("images", "pomodoro.png")
    operation.summary = summary
    operation.body = body
    operation.timeout = 3000
    service.startOperationCall operation
