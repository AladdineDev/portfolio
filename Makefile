localization:
	dart run easy_localization:generate -S assets/translations -f json -O lib/src/localization/generated -o locale_json.g.dart
	dart run easy_localization:generate -S assets/translations -f keys -O lib/src/localization/generated -o locale_keys.g.dart

launcher_icons:
	dart run flutter_launcher_icons

native_splash:
	dart run flutter_native_splash:create
