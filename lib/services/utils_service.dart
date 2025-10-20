import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:overlay_support/overlay_support.dart';

import '../ui/components/loading.dart';

class UtilsService {
  // function to initialize busy ui parameters
  void configLoading() {
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorSize = 30.0
      ..radius = 10.0
      ..backgroundColor = const Color(0xFF20252B).withOpacity(0.8)
      ..indicatorColor = Colors.white
      ..textColor = Colors.yellow
      ..maskColor = const Color(0xFF20252B).withOpacity(0.4)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  void errorMsgNotification({required String text}) {
    showSimpleNotification(
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      trailing: Builder(builder: (context) {
        return TextButton(
          onPressed: () {
            OverlaySupportEntry.of(context)?.dismiss();
          },
          child: const Text(
            'Dismiss',
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
      background: Colors.red,
      autoDismiss: true,
      slideDismissDirection: DismissDirection.up,
      duration: const Duration(hours: 0, minutes: 0, seconds: 10),
    );
  }

  void infoMsgNotification({required String text}) {
    showSimpleNotification(
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      trailing: Builder(builder: (context) {
        return TextButton(
          onPressed: () {
            OverlaySupportEntry.of(context)?.dismiss();
          },
          child: const Text(
            'Dismiss',
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
      background: const Color(0xff5887E9),
      autoDismiss: true,
      slideDismissDirection: DismissDirection.up,
      duration: const Duration(hours: 0, minutes: 0, seconds: 10),
    );
  }

  void successMsgNotification({required String text}) {
    showSimpleNotification(
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      trailing: Builder(builder: (context) {
        return TextButton(
          onPressed: () {
            OverlaySupportEntry.of(context)?.dismiss();
          },
          child: const Text(
            'Dismiss',
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
      background: Colors.green,
      autoDismiss: true,
      slideDismissDirection: DismissDirection.up,
      duration: const Duration(hours: 0, minutes: 0, seconds: 5),
    );
  }

  //Notification when no internet is detected
  void invalidNetworkNotification() {
    showSimpleNotification(
      const Center(
        child: Text(
          'You have no internet connection',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      background: Colors.red,
      autoDismiss: true,
      slideDismissDirection: DismissDirection.down,
      position: NotificationPosition.bottom,
      duration: const Duration(hours: 0, minutes: 0, seconds: 5),
    );
  }

  //Notification when internet is detected
  void validNetworkNotification() {
    showSimpleNotification(
      const Center(
        child: Text(
          'You are back online',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      background: Colors.green,
      autoDismiss: true,
      position: NotificationPosition.bottom,
      slideDismissDirection: DismissDirection.down,
      duration: const Duration(hours: 0, minutes: 0, seconds: 5),
    );
  }

  void initiateLoading(bool value) {
    if (value) {
      EasyLoading.show(
        maskType: EasyLoadingMaskType.custom,
        indicator: const Loading(),
      );
    } else {
      EasyLoading.dismiss();
    }
  }
}
