
import 'package:brand_assignment/widgets/appIcon.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key, required this.appIcon, required this.bigText});
 final AppIcon appIcon;
 final AppIcon bigText;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 1),
        ]),
        child: Row(
          children: [
            appIcon,
            SizedBox(
              width: 20,
            ),
            bigText
          ],
        ));
  }
}
