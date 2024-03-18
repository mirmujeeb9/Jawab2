import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslatorController extends GetxController {
  static TranslatorController get to => Get.find();
  Rx<bool> isEmpty = true.obs;
  Rx<bool> ismicOpen = false.obs;
  void updatetext(bool value) {
    isEmpty.value = value;
  }

  void updatemic(bool value) {
    ismicOpen.value = value;
  }
}

/// Calls `builder` on keyboard close/open.
/// https://stackoverflow.com/a/63241409/1321917
class KeyboardVisibilityBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    Widget child,
    bool isKeyboardVisible,
  ) builder;

  const KeyboardVisibilityBuilder({
    super.key,
    required this.builder,
  });

  @override
  _KeyboardVisibilityBuilderState createState() =>
      _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder>
    with WidgetsBindingObserver {
  var _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        const SizedBox(),
        _isKeyboardVisible,
      );
}
