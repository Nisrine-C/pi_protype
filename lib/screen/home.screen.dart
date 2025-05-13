
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:pi_prototype/constants/colors.dart';
import 'package:pi_prototype/widget/gear_item.widget.dart';
import '../model/Fault.model.dart';
import '../model/Gear.model.dart';
import '../model/Prediction.model.dart';
import '../widget/status_indicator.widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key:key);

  final gears = [
    Gear(gearId: 101, faultId: 1, installationDate: DateTime.parse("2023-01-15"), expectedLifetimeHours: 15000),
    Gear(gearId: 102, faultId: 2, installationDate: DateTime.parse("2022-11-03"), expectedLifetimeHours: 12000),
    Gear(gearId: 103, faultId: 3, installationDate: DateTime.parse("2023-06-10"), expectedLifetimeHours: 13000),
  ];

  final faults = [
    Fault(faultId: 1, faultCode: 0, faultDesc: "No fault"),
    Fault(faultId: 2, faultCode: 1, faultDesc: "Missing tooth"),
    Fault(faultId: 3, faultCode: 2, faultDesc: "Chipped tooth"),
  ];

  final predictions = [
    Prediction(gearId: 101, predictedFaultCode: 0, predictedRulHours: 9000.0, confidence: 0.99),
    Prediction(gearId: 102, predictedFaultCode: 1, predictedRulHours: 800.0, confidence: 0.85),
    Prediction(gearId: 103, predictedFaultCode: 2, predictedRulHours: 500.0, confidence: 0.78),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body:
        Container(
            padding : EdgeInsets.symmetric(horizontal:15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    //Ok Status
                    StatusIndicator(
                      label: 'OK',
                      icon: Icons.check_circle,
                      backgroundColor: tdGreen,
                      iconColor: textGreen,
                      textColor: textGreen,
                    ),
                    //Warning Status
                    StatusIndicator(
                      label: 'Warning',
                      icon: Icons.error,
                      backgroundColor: tdYellow,
                      iconColor: textYellow,
                      textColor: textYellow,
                    ),
                    //Failure Status
                    StatusIndicator(
                      label: 'Failure',
                      icon: Icons.cancel,
                      backgroundColor: tdRed,
                      iconColor: textRed,
                      textColor: textRed,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    children: gears.map((gear) {
                      final fault = faults.firstWhere((f) => f.faultId == gear.faultId);
                      final prediction = predictions.firstWhere((p) => p.gearId == gear.gearId);
                      return GearItem(gear: gear, fault: fault, prediction: prediction);
                    }).toList(),
                  ),
                )
              ],
            )
        )
      );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgIcon(
                size:25,
                icon: SvgIconData('assets/svg/menu_icon.svg')
            ),
            Text('Gears'),
            Container(
              height:40,
              width:40,
              child:ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/img/avatar.png')
              ),
            )
          ]
      )
    );
  }
}
