import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../services/employee_service.dart';
import '../services/cache_service.dart';
import 'employee_detail_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final EmployeeService _employeeService = EmployeeService();
  final CacheService _cacheService = CacheService();
  List<Employee> employees = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cacheService.clearCache(); // Clear cache (call this only once)
    _loadEmployees();
  }

  Future<void> _loadEmployees() async {
    try {
      // Try loading cached data first
      final cachedEmployees = await _cacheService.getCachedEmployees();
      if (cachedEmployees.isNotEmpty) {
        setState(() {
          employees = cachedEmployees;
          isLoading = false;
        });
      }

      // Fetch fresh data from the API
      final freshEmployees = await _employeeService.fetchEmployees();
      await _cacheService.cacheEmployees(freshEmployees);

      setState(() {
        employees = freshEmployees;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(employee.imageUrl),
                  ),
                  title: Text(employee.name),
                  subtitle: Text(employee.email),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeDetailScreen(employee: employee),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}