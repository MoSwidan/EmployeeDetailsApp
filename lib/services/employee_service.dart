import 'package:dio/dio.dart';
import '../models/employee.dart';

class EmployeeService {
  final Dio _dio = Dio();
  static const String apiUrl = 'https://randomuser.me/api/?results=100';

  Future<List<Employee>> fetchEmployees() async {
  try {
    final response = await _dio.get(apiUrl);

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['results'];
      return data.map((json) => Employee.fromJson({
            'id': json['login']['uuid'],
            'name': '${json['name']['first']} ${json['name']['last']}',
            'email': json['email'],
            'phone': json['phone'],
            'imageUrl': json['picture']['medium'],
          })).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
}