import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/models/timeline_experience.dart';
import '../../core/utils/ScreenUiHelper.dart';

class ExperienceTree extends StatelessWidget {
  const ExperienceTree({Key? key, required this.experienceData})
      : super(key: key);
  final List<ExperienceTimeline> experienceData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(60),
      itemCount: experienceData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ExperienceItem(
            experienceTimeline: experienceData[index],
          ),
        );
      },
    );
  }
}

class ExperienceItem extends HookWidget {
  const ExperienceItem({Key? key, required this.experienceTimeline})
      : super(key: key);
  final ExperienceTimeline experienceTimeline;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uiHelper = ScreenUiHelper.fromContext(context);
    const duration = Duration(seconds: 1);
    final controller = useAnimationController(
      duration: duration,
    );
    late Animation<double> tween =
        Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
    return AnimatedBuilder(
        animation: tween,
        builder: (context, child) {
          return AnimatedContainer(
            duration: duration,
            margin: tween.isCompleted
                ? const EdgeInsets.only(top: 0)
                : const EdgeInsets.only(top: 50),
            child: Opacity(
              opacity: tween.value,
              child: Card(
                color: theme.colorScheme.background.withOpacity(0.2),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    experienceTimeline.title,
                                    style: theme.textTheme.subtitle1!.copyWith(
                                        fontSize: 18,
                                        color: uiHelper.textPrimaryColor),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '@${experienceTimeline.position}',
                                    style: theme.textTheme.subtitle2!.copyWith(
                                        fontStyle: FontStyle.italic,
                                        color: uiHelper.primaryColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 17,
                                    color: uiHelper.textPrimaryColor,
                                  ),
                                  Text(
                                    '@${experienceTimeline.timePeriod}',
                                    style: theme.textTheme.labelMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.normal,
                                            color: uiHelper.textPrimaryColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Accomplishments',
                                style: theme.textTheme.headlineSmall!.copyWith(
                                    fontSize: 18,
                                    color: uiHelper.textPrimaryColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ..._buildRoles(
                                  context: context,
                                  roles: experienceTimeline.description),
                            ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tools Used',
                              style: theme.textTheme.subtitle1!.copyWith(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  color: uiHelper.textPrimaryColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: experienceTimeline.tools
                                  .map<Widget>((e) => Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TranslateOnHoverChangeColor(text: e)
                                        ],
                                      ))
                                  .toList(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  List<Widget> _buildRoles({
    required List<String> roles,
    required BuildContext context,
  }) {
    final ThemeData theme = Theme.of(context);
    final ScreenUiHelper uiHelper = ScreenUiHelper.fromContext(context);
    final List<Widget> roleWidgets = [];
    for (var index = 0; index < roles.length; index++) {
      roleWidgets.add(
        Role(
          role: roles[index],
          roleTextStyle: theme.textTheme.labelLarge!
              .copyWith(color: uiHelper.textSecondaryColor),
          iconSize: 25,
        ),
      );
      roleWidgets.add(const SizedBox(height: 8));
    }

    return roleWidgets;
  }
}

class TranslateOnHoverChangeColor extends HookWidget {
  final String text;

  const TranslateOnHoverChangeColor({Key? key, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Matrix4 nonHoverTransform = Matrix4.identity();
    final Matrix4 hoverTransform = Matrix4(
      1.02,
      0,
      0,
      0,
      0,
      1.02,
      0,
      0,
      0,
      0,
      1.02,
      0,
      0,
      0,
      0,
      1,
    );
    final uiHelper = ScreenUiHelper.fromContext(context);
    final theme = Theme.of(context);
    final ValueNotifier<bool> isHovered = useState(false);
    const duration = Duration(seconds: 1);
    final controller = useAnimationController(
      duration: duration,
    );
    late Animation<Color?> colorAnimation = ColorTween(
      begin: uiHelper.textPrimaryColor,
      end: uiHelper.primaryColor,
    ).animate(controller);

    isHovered.addListener(() {
      if (isHovered.value) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });

    return MouseRegion(
      onEnter: (PointerEnterEvent e) => isHovered.value = true,
      onExit: (PointerExitEvent e) => isHovered.value = false,
      child: AnimatedContainer(
        duration: duration,
        transform: isHovered.value ? hoverTransform : nonHoverTransform,
        padding: const EdgeInsets.only(top: 5, bottom: 5, right: 7, left: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isHovered.value
                ? uiHelper.primaryColor!.withOpacity(0.2)
                : null,
            border: Border.all(
                width: isHovered.value ? 3 : 1,
                color: isHovered.value
                    ? uiHelper.primaryColor!
                    : uiHelper.textPrimaryColor!)),
        child: Center(
          child: AnimatedBuilder(
              animation: colorAnimation,
              builder: (context, child) {
                return Text(
                  text,
                  style: theme.textTheme.bodyLarge!.copyWith(
                      fontStyle: FontStyle.italic, color: colorAnimation.value),
                );
              }),
        ),
      ),
    );
  }
}

class Role extends StatelessWidget {
  const Role({
    Key? key,
    required this.role,
    this.roleTextStyle,
    this.icon = Icons.arrow_right,
    this.iconSize = 18,
  }) : super(key: key);

  final String role;
  final TextStyle? roleTextStyle;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final ScreenUiHelper uiHelper = ScreenUiHelper.fromContext(context);
    final ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: uiHelper.primaryColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            role,
            style: roleTextStyle ??
                theme.textTheme.bodyText1!.copyWith(
                  color: uiHelper.textPrimaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
