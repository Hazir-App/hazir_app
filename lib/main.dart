import 'package:hazir_app/config/bootstrap.dart';

import 'presentation/app.dart';

void main() async {
  await Bootstrap.wrap(() => const App());
}
