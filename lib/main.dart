import 'package:flutter/material.dart';

import 'app.dart';
import 'domain/di/di_container.dart';
import 'presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  RouterHelper.instance;

  await setupDI();

  runApp(const App());
}
