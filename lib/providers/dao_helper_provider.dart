import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/utils/dao_helper.dart';
import '../providers/dao_providers.dart';

final daoHelperProvider = Provider<DaoHelper>((ref) {
  final db = ref.read(appDatabaseProvider);
  return DaoHelper(db);
});