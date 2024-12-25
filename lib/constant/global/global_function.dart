import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class GlobalFunction {
  static void checkResponse(Response response) {
    if (response.statusCode != null) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        alertMessage('Sucess', '');
      } else {
        try {
          response.data['messae'] != null
              ? alertMessage(response.data['messae'], 'warning')
              : alertMessage('Something wrong,Try again!', 'warning');
        } catch (e) {
          alertMessage('Something wrong,Try again!', 'warning');
        }
      }
    } else {
      alertMessage('Something wrong,Try again!', 'warning');
    }
  }

  static void alertMessage(String message, String type) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: type == 'warning' ? Colors.amber : Colors.blue,
      textColor: type == 'warning' ? Colors.black : Colors.white,
      fontSize: 16.0,
    );
  }

  static String convertToVND(int number) {
    final formatter = NumberFormat("#,###");
    return formatter.format(number);
  }

  static String convertToDate(String number) {
    DateTime datetime = DateTime.parse(number);
    String date = DateFormat('dd/MM/yyyy').format(datetime);
    return date;
  }

  static String encodeToUrl(String input) {
    return Uri.encodeComponent(input);
  }
}
