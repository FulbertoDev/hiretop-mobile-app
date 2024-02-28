import 'package:velocity_x/velocity_x.dart';

String? emailValidator(String? s) {
  if (s.isEmptyOrNull) return 'Champ obligatoire';

  if (!(s!.validateEmail())) {
    return 'Adresse email invalide';
  }

  return null;
}

String? simplePasswordValidator(String? s) {
  if (s.isEmptyOrNull) return 'Champ obligatoire';

  if (s!.length < 8) {
    return '8 caractères au minimum';
  }

  return null;
}
