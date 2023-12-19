import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/const/data.dart';
import '../../../core/secure_storage/secure_storage.dart';
import '../model/user_model.dart';

final userProvider =
    AsyncNotifierProvider<UserNotifier, UserModel?>(UserNotifier.new);

class UserNotifier extends AsyncNotifier<UserModel?> {
  late final FlutterSecureStorage _storage = ref.read(secureStorageProvider);

  @override
  Future<UserModel?> build() async{
    final accessToken = await _storage.read(key: ACCESS_TOKEN_KEY);
    if (accessToken == null) {
      return null;
    }

    return UserModel();
  }

  Future<void> login({
    required String id,
    required String password,
}) async {
    state = const AsyncValue.loading();

    await Future.delayed(const Duration(seconds: 2));
    await _storage.write(key: ACCESS_TOKEN_KEY, value: 'accessToken');
    await _storage.write(key: REFRESH_TOKEN_KEY, value: 'refreshToken');

    state = AsyncValue.data(UserModel());
  }

  Future<void> logout() async {
    state = const AsyncValue.data(null);


    await Future.wait(
      [
        _storage.delete(key: REFRESH_TOKEN_KEY),
        _storage.delete(key: ACCESS_TOKEN_KEY),
      ],
    );
  }
}
