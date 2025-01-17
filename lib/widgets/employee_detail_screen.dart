import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(employee.imageUrl),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            Text('Name: ${employee.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Email: ${employee.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Phone: ${employee.phone}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}