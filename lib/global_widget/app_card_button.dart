import 'package:flutter/material.dart';
import 'package:sowaste/core/themes/app_colors.dart';
import 'package:sowaste/core/themes/app_themes.dart';

import '../core/values/app_constant.dart';

class AppCardButton extends StatelessWidget {
  const AppCardButton(
      {Key? key,
      required this.onTapFunction,
      this.leading,
      this.trailing,
      required this.title})
      : super(key: key);

  final VoidCallback onTapFunction;
  final Widget? leading;
  final Widget? trailing;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
          onTap: onTapFunction,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 7,
            shadowColor: AppConst.shadowColor,
            child: SizedBox(
              height: 72,
              child: Center(
                child: ListTile(
                    leading: leading,
                    trailing: trailing,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        title,
                        style: CustomTextStyle.bodyBold(AppColors.onBg),
                      ),
                    )),
              ),
            ),
          )),
    );
  }
}
