import 'package:hiretop_mobile_app/data/models/auth/login_dto.dart';
import 'package:velocity_x/velocity_x.dart';

import 'fake_data.dart';

Future<LoginResponseDto?> fakeLogin(LoginDto payload) async {
  const fakeToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiIiwiaWF0IjoxNzA5MDIyMjM1LCJleHAiOjM0NzEyODkyMDB9.cJPaxEOA_z7Xg8tu_hpU7zmuI0Xwu331OdfEOitxhjE";
  await Future.delayed(2.seconds);
  var index =
      FakeData.users.indexWhere((element) => element.email == payload.email);
  if (index == -1) {
    return Future.value(null);
  }
  return Future.value(
      LoginResponseDto(token: fakeToken, user: FakeData.users[index]));
}
