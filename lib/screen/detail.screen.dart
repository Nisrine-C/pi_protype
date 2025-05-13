import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Detail extends StatelessWidget {
  final int gearId;

  const Detail({Key? key, required this.gearId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gear #$gearId Details")),
      body: Center(
        child: Text('This is the details page for Gear #$gearId'),
      ),
    );
  }
}