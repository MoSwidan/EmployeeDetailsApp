import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee.dart';
import 'dart:convert';

class CacheService {
  static const String employeeKey = 'cached_employees';

  // Cache the list of employees
  Future<void> cacheEmployees(List<Employee> employees) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = employees.map((e) => e.toJson()).toList();
    await prefs.setString(employeeKey, jsonEncode(jsonList));
  }

  // Retrieve the cached list of employees

  Future<List<Employee>> getCachedEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(employeeKey);

    if (jsonString != null) {
      print('Cached JSON String: $jsonString');
      try {
        List<dynamic> jsonList = jsonDecode(jsonString);
        return jsonList.map((json) => Employee.fromJson(json)).toList();
      } catch (e) {
        print('Error decoding cached data: $e');
        return [];
      }
    } else {
      print('No cached data found');
      return [];
    }
  }

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(employeeKey);
  }
}
