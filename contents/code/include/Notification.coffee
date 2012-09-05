goog.provide 'mhlavac.pomodoro.Notification'

###
@param string summary
@param string body
###
sendNotification = (summary, body) ->
  print "Sending notification."
  engine = dataEngine("notifications")
  service = engine.serviceForSource("notification")
  op = service.operationDescription("createNotification")
  op["appName"] = "mhlavac-pomodoro"
  op["appIcon"] = plasmoid.file("images", "image.png")
  op["summary"] = summary
  op["body"] = body
  op["timeout"] = 3000
  service.startOperationCall op