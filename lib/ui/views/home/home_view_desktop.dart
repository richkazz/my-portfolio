import 'package:flutter/material.dart';
import '../../../app/configs.dart';
import '../../../app/icons.dart';
import '../../../core/utils/ScreenUiHelper.dart';
import '../../widgets/icon_wrapper.dart';
import '../../widgets/translate_on_hover.dart';

import 'home_view_model.dart';

class HomeDesktopView extends StatelessWidget {
  final ScreenUiHelper? uiHelpers;
  final HomeViewModel? model;

  const HomeDesktopView({Key? key, this.uiHelpers, this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: uiHelpers!.backgroundColor,
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(60),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: uiHelpers!.surfaceColor,
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          PersonalDetails.myLogo,
                          width: 50,
                          height: 50,
                          color: uiHelpers!.textPrimaryColor,
                        ),
                        Text(
                          PersonalDetails.myName,
                          style: uiHelpers!.title,
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TranslateOnHover(
                          child: TextButton(
                              onPressed: () => model!
                                  .navigateToUrl(PersonalDetails.resumeLink),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Resume',
                                  style: uiHelpers!.title,
                                ),
                              )),
                        ),
                        TranslateOnHover(
                          child: TextButton(
                              onPressed: () => model!
                                  .navigateToUrl(PersonalDetails.whatsappLink),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Contact',
                                  style: uiHelpers!.title,
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: uiHelpers!.width! * 0.05,
                ),
                LayoutBuilder(builder: (context, constraint) {
                  if (constraint.maxWidth < 550) {
                    return Column(
                      children: [
                        SectionTwoRight(uiHelpers: uiHelpers, model: model),
                        SkillListContent(model: model, uiHelpers: uiHelpers),
                      ],
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SkillListContent(model: model, uiHelpers: uiHelpers),
                      SectionTwoRight(uiHelpers: uiHelpers, model: model)
                    ],
                  );
                }),
              ],
            ),
          ),
        ));
  }
}

class SectionTwoRight extends StatelessWidget {
  const SectionTwoRight({
    Key? key,
    required this.uiHelpers,
    required this.model,
  }) : super(key: key);

  final ScreenUiHelper? uiHelpers;
  final HomeViewModel? model;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: constraint.maxWidth < 550 ? null : uiHelpers!.width! * 0.3,
            child: Text(
              PersonalDetails.shortIntro,
              style: uiHelpers!.body!.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 2,
                  color: uiHelpers!.textPrimaryColor),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          IconWrrapper(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            onTap: () => model!.navigateToUrl(SocialLinks.githubLink),
            child: Row(
              children: [
                Icon(
                  ContactIcons.githubIcon,
                  color: uiHelpers!.textPrimaryColor,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Github',
                  style: uiHelpers!.buttonStyle,
                )
              ],
            ),
          )
        ],
      );
    });
  }
}

class SkillListContent extends StatelessWidget {
  const SkillListContent({
    Key? key,
    required this.model,
    required this.uiHelpers,
  }) : super(key: key);

  final HomeViewModel? model;
  final ScreenUiHelper? uiHelpers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: model!.skills.keys
          .map((e) => Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: uiHelpers!.width! * 0.28,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: uiHelpers!.surfaceColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            model!.skills[e]!,
                            width: 40,
                            height: 40,
                          )),
                      const SizedBox(width: 10),
                      Text(
                        e,
                        style: uiHelpers!.title,
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
