import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

void RunPermission() async {
var permission = await Permission.locationAlways.isGranted;
var permission_msg = await Permission.sms.isGranted;
if (!permission || !permission_msg) {
  var t = await Permission.locationAlways.request();
  var r = await Permission.sms.request();
}
}