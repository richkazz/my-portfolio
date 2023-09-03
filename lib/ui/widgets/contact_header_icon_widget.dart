import 'package:flutter/material.dart';
import '../../core/utils/ScreenUiHelper.dart';

class ContactIconHeader extends StatelessWidget {
  final bool isActive;
  final String name;
  final Function onTap;
  final IconData icon;

  const ContactIconHeader(
      {Key? key,
      this.isActive = false,
      required this.onTap,
      required this.name,
      required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScreenUiHelper uiHelpers = ScreenUiHelper.fromContext(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: Material(
        color: Colors.transparent,
        elevation: isActive ? 10 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: isActive
              ? BoxDecoration(
                  boxShadow: [
                      BoxShadow(
                        color: uiHelpers.primaryColor!,
                        blurRadius: 5.0,
                      ),
                    ],
                  color: uiHelpers.primaryColor,
                  borderRadius: BorderRadius.circular(8))
              : BoxDecoration(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
          child: Column(
            children: [
              Icon(icon,
                  size: 30,
                  color: isActive ? Colors.white : uiHelpers.textPrimaryColor),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: uiHelpers.titleTextStyle.copyWith(
                    fontWeight: FontWeight.w300,
                    color: isActive
                        ? Colors.white54
                        : uiHelpers.textSecondaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
