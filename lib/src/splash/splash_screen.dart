import 'package:class_manager/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  final Duration duration;

  const SplashScreen({super.key, this.duration = const Duration(seconds: 10)});

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: widget.duration, vsync: this)
          ..forward()
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Modular.to.pushReplacementNamed(AppRoutes.home.route);
            }
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return Center(
          child: Text(
            animationController.lastElapsedDuration?.inSeconds.toString() ??
                "0",
          ),
        );
      },
    );
  }
}
