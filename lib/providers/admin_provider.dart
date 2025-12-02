import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dao/admin_dao.dart';
import '../providers/dao_providers.dart';

final adminDaoProvider = Provider<AdminDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return AdminDao(db);
});