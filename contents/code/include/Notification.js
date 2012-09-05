// Generated by CoffeeScript 1.3.3
var sendNotification;

goog.provide('mhlavac.pomodoro.Notification');

/*
@param string summary
@param string body
*/


sendNotification = function(summary, body) {
  var engine, op, service;
  print("Sending notification.");
  engine = dataEngine("notifications");
  service = engine.serviceForSource("notification");
  op = service.operationDescription("createNotification");
  op["appName"] = "mhlavac-pomodoro";
  op["appIcon"] = plasmoid.file("images", "image.png");
  op["summary"] = summary;
  op["body"] = body;
  op["timeout"] = 3000;
  return service.startOperationCall(op);
};
