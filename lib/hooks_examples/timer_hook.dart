import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_api/hooks.dart';

int useInfiniteTimer(BuildContext context) {
  return use(_InfiniteTimerHook());
}

class _InfiniteTimerHook extends Hook<int> {
  @override
  _InfiniteTimerHookState createState() => _InfiniteTimerHookState();
}

class _InfiniteTimerHookState extends HookState<int, _InfiniteTimerHook> {
  late Timer _timer;
  int _number = 0;

  @override
  void initHook() {
    // TODO: implement initHook
    super.initHook();

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          _number = _timer.tick;
        });
      },
    );
    const [];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  int build(BuildContext context) {
    return _number;
  }
}

