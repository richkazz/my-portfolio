import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TranslateOnHover extends HookWidget {
  final Widget? child;

  const TranslateOnHover({this.child});
  @override
  Widget build(BuildContext context) {
    final Matrix4 nonHoverTransform = Matrix4.identity();
    final Matrix4 hoverTransform = Matrix4(
      1.1,
      0,
      0,
      0,
      0,
      1.1,
      0,
      0,
      0,
      0,
      1.1,
      0,
      0,
      0,
      0,
      1,
    );
    final ValueNotifier<bool> isHovered = useState(false);
    return MouseRegion(
      onEnter: (PointerEnterEvent e) => isHovered.value = true,
      onExit: (PointerExitEvent e) => isHovered.value = false,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        transform: isHovered.value ? hoverTransform : nonHoverTransform,
        child: child,
      ),
    );
  }
}
