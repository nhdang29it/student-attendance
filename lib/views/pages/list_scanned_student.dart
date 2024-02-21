import 'package:flutter/material.dart';
import 'package:flutter_student_attendance/views/components/count_scanned_tile.dart';

class ListScannedStudent extends StatelessWidget {
  const ListScannedStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListView(
        children: const [
          CountScannedTile(scanned: 12, unScanned: 68),
          ListTile(
            leading: Text(
              "1.",
              style: TextStyle(fontSize: 16),
            ),
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            leading: Text(
              "2.",
              style: TextStyle(fontSize: 16),
            ),
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            leading: Text(
              "3.",
              style: TextStyle(fontSize: 16),
            ),
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
          ListTile(
            title: Text("Nugyen van c"),
            trailing: Icon(Icons.check),
            iconColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
