import 'package:drift/native.dart';
import 'package:get_it/get_it.dart';

import '../index.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<TaskDatabase>(TaskDatabase(NativeDatabase.memory()));
  getIt.registerSingleton<PotatoTimerStore>(
      PotatoTimerStore(getIt<TaskDatabase>()));
}
