import 'package:e_commerce/core/utils/app_consts.dart';
import 'package:e_commerce/core/utils/cache_utils.dart';
import 'package:e_commerce/data/data_souces/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    return await SharedPreferencesUtils.getString(AppConsts.tokenKey);
  }

  @override
  Future<void> setToken(String token) async {
    await SharedPreferencesUtils.setString(AppConsts.tokenKey, token);
  }
}
