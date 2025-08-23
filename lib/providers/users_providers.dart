import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/model/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final bottomNavIndexProvider = StateProvider<int>(
  (ref) => 1,
); // الافتراضي المواعيد
