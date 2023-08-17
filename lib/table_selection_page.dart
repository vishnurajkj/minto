import 'package:flutter/material.dart';

class TableSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your actual logic to fetch table statuses
    List<bool> tableStatuses = [true, false, true, true, false,true,true,false,true,
    true]; // Example statuses

    return Scaffold(
      appBar: AppBar(
        title: Text('Table Selection'),
      ),
      body: ListView.builder(
        itemCount: tableStatuses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Table ${index + 1}'),
            subtitle: tableStatuses[index]
                ? Text('Open')
                : Text('Occupied'),
            onTap: tableStatuses[index]
                ? () {
              // Navigate to the order taking screen for the selected table
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderTakingScreen(tableNumber: index + 1),
                ),
              );
            }
                : null,
          );
        },
      ),
    );
  }
}

class OrderTakingScreen extends StatelessWidget {
  final int tableNumber;

  OrderTakingScreen({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table $tableNumber - Order'),
      ),
      body: Center(
        child: Text('Take orders for Table $tableNumber here.'),
      ),
    );
  }
}
