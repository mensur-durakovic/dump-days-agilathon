import 'package:dump_days_agilathon/theme/colors.dart';
import 'package:dump_days_agilathon/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: MColors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(color: MColors.darkGray),
          title: Image.asset(
            kAgilathonLogoPath,
            height: 25,
          ),
        ),
        Container(
          height: 2,
          color: MColors.accentColor,
        ),
      ],
    );
  }
}
