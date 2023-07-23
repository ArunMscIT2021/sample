// import 'dart:io';
// import 'dart:ui';
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/subjects.dart';
//
// import 'download_util.dart';
//
//
// class NotificationService {
//   NotificationService();
//
//   final BehaviorSubject<String> behaviorSubject = BehaviorSubject();
//
//   final _localNotifications = FlutterLocalNotificationsPlugin();
//
//   Future<NotificationDetails> _notificationDetails() async {
//     final bigPicture = await DownloadUtil.downloadAndSaveFile(
//       "https://cdn.pixabay.com/photo/2014/10/08/09/01/businessman-479573_960_720.jpg",
//       Platform.isIOS ? "JobSeeker.jpg" : "JobFinder",
//     );
//
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'channel id',
//       'channel name',
//       channelDescription: 'channel description',
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//       ticker: 'ticker',
//       largeIcon: FilePathAndroidBitmap(bigPicture),
//       styleInformation: BigPictureStyleInformation(
//         FilePathAndroidBitmap(bigPicture),
//         hideExpandedLargeIcon: false,
//       ),
//       color: const Color(0xff2196f3),
//     );
//
//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//     );
//
//     return platformChannelSpecifics;
//   }
//
//   Future<void> showLocalNotification({
//     required int id,
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     final platformChannelSpecifics = await _notificationDetails();
//     await _localNotifications.show(
//       id,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: payload,
//     );
//   }
// }
