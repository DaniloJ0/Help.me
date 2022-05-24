import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

void RunPermission() async {
  var permission_msg = await Permission.sms.isGranted;
  var permission = await Permission.location.serviceStatus.isEnabled;
  if (await Permission.location.serviceStatus.isEnabled) {
    print('Esta activo');
  }
  var status = await Permission.location.status;
  if (!status.isGranted) {
    Map<Permission, PermissionStatus> status = await [
      Permission.location,
    ].request();
  } else if (status.isDenied || status.isRestricted || status.isLimited || status.isPermanentlyDenied) {
    await openAppSettings();
  }

  if (!permission_msg) {
    var r = await Permission.sms.request();
  }
// var permission = await Permission.location.isGranted;
// var status = await Permission.location.status;
// if (!permission || !permission_msg) {
//   Map<Permission, PermissionStatus> status = await [
//       Permission.location,
//     ].request();
//   var t = await Permission.locationAlways.request();
//   var r = await Permission.sms.request();
// }

  // var status = await Permission.location.status;
  // if (!status.isGranted || !permission_msg) {
  //   Map<Permission, PermissionStatus> status = await [
  //     Permission.location,
  //   ].request();
  //   var r = await Permission.sms.request();
  // } else if (status.isDenied) {
  //   print('Location permission is not granted');
  // }
}
