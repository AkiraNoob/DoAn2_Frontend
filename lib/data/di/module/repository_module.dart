import 'dart:async';

import 'package:Konet/data/local/datasources/post/post_datasource.dart';
import 'package:Konet/data/network/apis/posts/post_api.dart';
import 'package:Konet/data/repository/post/post_repository_impl.dart';
import 'package:Konet/data/repository/setting/setting_repository_impl.dart';
import 'package:Konet/data/repository/user/user_repository_impl.dart';
import 'package:Konet/data/sharedpref/shared_preference_helper.dart';
import 'package:Konet/domain/repository/post/post_repository.dart';
import 'package:Konet/domain/repository/setting/setting_repository.dart';
import 'package:Konet/domain/repository/user/user_repository.dart';

import '../../../di/service_locator.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------
    getIt.registerSingleton<SettingRepository>(SettingRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
    ));

    getIt.registerSingleton<UserRepository>(UserRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
    ));

    getIt.registerSingleton<PostRepository>(PostRepositoryImpl(
      getIt<PostApi>(),
      getIt<PostDataSource>(),
    ));
  }
}
