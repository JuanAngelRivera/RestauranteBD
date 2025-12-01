import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dao/login_dao.dart';
import '../providers/dao_providers.dart';

final loginDaoProvider = Provider<LoginDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return LoginDao(db);
});