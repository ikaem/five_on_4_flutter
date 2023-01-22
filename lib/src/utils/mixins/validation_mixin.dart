// TODO test only
typedef FieldValidator = bool Function(String value);

mixin ValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;
  bool isFieldValid(
    String fieldValue,
    FieldValidator validator,
  ) =>
      validator(fieldValue);
}
