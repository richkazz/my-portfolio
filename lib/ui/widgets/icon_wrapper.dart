import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import '../../core/utils/ScreenUiHelper.dart';
import 'translate_on_hover.dart';

class IconWrrapper extends HookWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final Color? color;
  final EdgeInsets margin;

  const IconWrrapper(
      {Key? key,
      this.child,
      this.onTap,
      this.padding,
      this.color,
      this.margin = const EdgeInsets.symmetric(horizontal: 15)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScreenUiHelper uiHelpers = ScreenUiHelper.fromContext(context);
    final isHovered = useState(false);

    return TranslateOnHover(
        child: MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
          margin: margin,
          //padding: padding ?? const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: color ?? uiHelpers.surfaceColor!,
                width: 2,
              )),
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              visualDensity: VisualDensity(),
              backgroundColor: color ?? uiHelpers.backgroundColor,
            ),
            child: Center(child: child),
          )),
    ));
  }
}
