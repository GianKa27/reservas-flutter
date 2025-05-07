import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations_flutter/core/errors/network_exception.dart';
import 'package:reservations_flutter/core/errors/no_network_exception.dart';

import '../../ui/theme/app_theme.dart';

Map<String, Icon> iconStatus = {
  'CustomSnackbarStatus.success': Icon(
    Icons.check_circle_rounded,
    color: AppTheme.successColor,
    size: 40,
  ),
  'CustomSnackbarStatus.warning': Icon(
    Icons.warning_rounded,
    color: AppTheme.warningColor,
    size: 40,
  ),
  'CustomSnackbarStatus.danger': Icon(
    Icons.cancel,
    color: AppTheme.dangerColor,
    size: 40,
  ),
  'CustomSnackbarStatus.info': Icon(
    Icons.info,
    color: AppTheme.infoColor,
    size: 40,
  ),
};

enum CustomSnackbarStatus { warning, success, danger, info, notification }

class Utils {
  static void showSnackbar(
      {required CustomSnackbarStatus status,
      String? title,
      required dynamic message}) {
    final messageString = message is String
        ? message
        : "!Ups! Por favor vuelve a intentarlo más tarde";

    Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.TOP,
      shouldIconPulse: false,
      duration: const Duration(seconds: 5),
      borderRadius: 30,
      backgroundColor: Colors.white,
      boxShadows: const [
        BoxShadow(color: Colors.black45, blurRadius: 3, offset: Offset(2, 3))
      ],
      titleText: title != null
          ? Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ))
          : null,
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: iconStatus[status.toString()],
      ),
      messageText: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Text(
          messageString,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    ));
  }

  static errorCatch(DioException error) {
    if (error.type == DioExceptionType.badResponse) {
      throw NetworkException(error.response?.data['message']);
    }

    throw NoNetworkException();
  }
}
