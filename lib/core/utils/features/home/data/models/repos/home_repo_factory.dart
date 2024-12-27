import 'package:bookly/core/utils/features/home/data/models/repos/home_local_remo_impl.dart';
import 'package:bookly/core/utils/features/home/data/models/repos/home_repo.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/cached/cache_helper.dart';
import 'package:bookly/core/utils/features/home/data/models/repos/home_repo_impl.dart';

import 'network_helper.dart';

class HomeRepoFactory {
  static Future<HomeRepo> getRepo(ApiService apiService) async {
    if (await NetworkHelper.isConnected()) {
      return HomeRepoImpl(apiService);
    } else {
      return HomeLocalRemoImpl();
    }
  }
}
