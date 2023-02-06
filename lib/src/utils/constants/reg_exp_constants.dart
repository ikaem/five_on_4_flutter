abstract class RegExpConstants {
  static RegExp get decimalNumbers => RegExp(r'[0-9]+[,.]{0,1}[0-9]*');
  static final RegExp validEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  static final RegExp validPassword = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
}
