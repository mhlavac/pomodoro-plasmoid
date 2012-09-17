goog.provide 'mhlavac.pomodoro.Notification'

###
@param string summary
@param string body
###
mhlavac.pomodoro.Notification = (summary, body) ->
    print "Sending notification: #{summary} #{body}"
    engine = dataEngine("notifications")
    service = engine.serviceForSource("notification")
    op = service.operationDescription("createNotification")
    op["appName"] = "mhlavac-pomodoro"
    op["appIcon"] = plasmoid.file("images", "image.png")
    op["summary"] = summary
    op["body"] = body
    op["timeout"] = 3000
    service.startOperationCall op
