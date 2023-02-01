abstract class ValueFromEnv {
  // weather
  static const _envVarWeatherApiKey = 'weather-api-key';

  // firebase
  static const _firebaseAndroidApiKey = 'firebase-android-api-key';
  static const _firebaseAndroidAppId = 'firebase-android-app-id';
  static const _firebaseAndroidMessagingSenderId =
      'firebase-android-messaging-sender-id';
  static const _firebaseAndroidProjectId = 'firebase-android-project-id';
  static const _firebaseAndroidStorageBucket =
      'firebase-android-storage-bucket';

  static const _firebaseIOSApiKey = 'firebase-ios-api-key';
  static const _firebaseIOSAppId = 'firebase-ios-app-id';
  static const _firebaseIOSMessagingSenderId =
      'firebase-ios-messaging-sender-id';
  static const _firebaseIOSProjectId = 'firebase-ios-project-id';
  static const _firebaseIOSStorageBucket = 'firebase-ios-storage-bucket';
  static const _firebaseIOSClientId = 'firebase-ios-client-id';
  static const _firebaseIOSBundleId = 'firebase-ios-bundle-id';

  // weather
  static String get weatherApiKey =>
      const String.fromEnvironment(_envVarWeatherApiKey);

  // firebase
  static String get firebaseAndroidApiKey =>
      const String.fromEnvironment(_firebaseAndroidApiKey);
  static String get firebaseAndroidAppId =>
      const String.fromEnvironment(_firebaseAndroidAppId);
  static String get firebaseAndroidMessagingSenderId =>
      const String.fromEnvironment(_firebaseAndroidMessagingSenderId);
  static String get firebaseAndroidProjectId =>
      const String.fromEnvironment(_firebaseAndroidProjectId);
  static String get firebaseAndroidStorageBucket =>
      const String.fromEnvironment(_firebaseAndroidStorageBucket);

  static String get firebaseIOSApiKey =>
      const String.fromEnvironment(_firebaseIOSApiKey);
  static String get firebaseIOSAppId =>
      const String.fromEnvironment(_firebaseIOSAppId);
  static String get firebaseIOSMessagingSenderId =>
      const String.fromEnvironment(_firebaseIOSMessagingSenderId);
  static String get firebaseIOSProjectId =>
      const String.fromEnvironment(_firebaseIOSProjectId);
  static String get firebaseIOSStorageBucket =>
      const String.fromEnvironment(_firebaseIOSStorageBucket);
  static String get firebaseIOSClientId =>
      const String.fromEnvironment(_firebaseIOSClientId);
  static String get firebaseIOSBundleId =>
      const String.fromEnvironment(_firebaseIOSBundleId);
}
