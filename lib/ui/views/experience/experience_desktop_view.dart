import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../app/configs.dart';
import '../../../core/utils/ScreenUiHelper.dart';
import '../../../core/utils/adaptive.dart';
import '../../../core/utils/datetimeUtils.dart';
import '../../widgets/custom_scroller.dart';
import '../../widgets/experience_widget.dart';
import '../../widgets/trailing_widget.dart';
import 'experience_view_model.dart';

class ExperienceDesktopView extends HookWidget {
  final ScreenUiHelper? uiHelpers;
  final ExperienceViewModel? model;

  const ExperienceDesktopView({Key? key, this.uiHelpers, this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExperienceTree(experienceData: PersonalDetails.experienceList);
  }

  _scroll(double offset, ScrollController _scrollController) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
