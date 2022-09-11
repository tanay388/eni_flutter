import 'dart:convert';
import 'dart:developer';
import 'package:employee_management/Models/DashboardResponse.dart';
import 'package:http/http.dart' as http;
import 'package:employee_management/Constants.dart';

class ApiService {
  static Future<String> postCheckIn(String id) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.checkin + id);
      var response = await http.post(url);
      if (response.statusCode == 200) {
        return "You are checkedIn Successfully";
      } else {
        if (response.statusCode == 401) {
          return "You are already checkedIn";
        }
        if (response.statusCode == 402) {
          return "Invalid QR code";
        }
      }
    } catch (e) {
      log(e.toString());
      return (e.toString());
    }

    return "Failed due to unknown error.";
  }

  static Future<String> postCheckOut(String ID) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.checkout + ID);
      var response = await http.put(url);
      // print(response);
      if (response.statusCode == 200) {
        return "You are checkedOut Successfully";
      } else {
        if (response.statusCode == 401) {
          return "You are not checkedIn";
        } else if (response.statusCode == 402) {
          return "Invalid QR code";
        }
      }
      final parsedJson = jsonDecode(response.body);
      return parsedJson['message'];
    } catch (e) {
      log(e.toString());
      return (e.toString());
    }
  }

  static Future<DashboardResponse> getDashboardData(String id) async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.dashboardData + id);
      final response = await http.get(url);
      var data = jsonDecode(response.body.toString());
      // print(response);
      if (response.statusCode == 200) {
        return DashboardResponse.fromJson(data);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
