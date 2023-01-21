cl:
	flutter clean

gt:
	flutter pub get

br: 
	flutter pub run build_runner build --delete-conflicting-outputs

devs: 
	flutter run --flavor dozuki lib/main.dart -d all