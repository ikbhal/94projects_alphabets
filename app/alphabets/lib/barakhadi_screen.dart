import 'package:flutter/material.dart';
import 'barakhadi_data.dart';

class BarakhadiScreen extends StatelessWidget {
  final List<List<String>> barakhadiTable = BarakhadiData.barakhadiTable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barakhadi Table'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // Number of columns
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: barakhadiTable.length * barakhadiTable[0].length,
              itemBuilder: (context, index) {
                final rowIndex = index ~/ barakhadiTable[0].length;
                final columnIndex = index % barakhadiTable[0].length;
                final barakhadi =
                    (rowIndex < barakhadiTable.length &&
                            columnIndex < barakhadiTable[rowIndex].length)
                        ? barakhadiTable[rowIndex][columnIndex]
                        : '';
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(barakhadi),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
