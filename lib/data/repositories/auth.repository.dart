import 'package:hiretop_mobile_app/api/api_client.dart';
import 'package:hiretop_mobile_app/app/app.locator.dart';
import 'package:hiretop_mobile_app/data/models/auth/login_dto.dart';

class AuthRepository {
  final _client = locator<ApiClient>().appService();

  Future<LoginResponseDto> login(LoginDto payload) => _client.login(payload);
}
