import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/login', child: (context) => Container());
  }
}
