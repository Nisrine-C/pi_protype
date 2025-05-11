
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:pi_prototype/constants/colors.dart';
import 'package:pi_prototype/widget/gear_item.widget.dart';
import '../widget/status_indicator.widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key:key);
  
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
                    children: [
                      GearItem(),
                    ],
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
