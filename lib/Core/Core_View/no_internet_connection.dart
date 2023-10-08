import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  State<NoInternetConnection> createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection>
    with TickerProviderStateMixin {
  AnimationController? animation;
  Animation<double>? _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    HapticFeedback.vibrate();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.9).animate(animation!);

    animation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation?.forward();
      }
    });
    animation?.forward();
  }

  @override
  void dispose() {
    animation?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fadeInFadeOut!,
        child: const Text(
          "No internet connection !",
          style: TextStyle(
            color: Colors.red,
            fontSize: 25,
            fontWeight: FontWeight.w400,
            fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0.0, 0.0),
                blurRadius: 10,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
