// TODO test only
import 'package:five_on_4_flutter/src/utils/utils.dart' show RegExpConstants;

typedef FieldValidator = bool Function(String value);

mixin ValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;
  bool isFieldEmail(String fieldValue) =>
      RegExpConstants.validEmail.hasMatch(fieldValue);
  bool isFieldValidPassword(String fieldValue) =>
      RegExpConstants.validPassword.hasMatch(fieldValue);
  bool isFieldValid(
    String fieldValue,
    FieldValidator validator,
  ) =>
      validator(fieldValue);
}
