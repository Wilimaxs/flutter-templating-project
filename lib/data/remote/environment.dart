enum AppEnvironment { staging, production }

class Environment {
  Environment._();

  static const _stagingBaseUrl =
      'https://templating-flutter-gjgeh5h0b5f9bwc9.malaysiawest-01.azurewebsites.net/api';

  /// Change this value to select the team's active environment.
  static AppEnvironment current = AppEnvironment.staging;

  static String get baseUrl {
    final value = switch (current) {
      AppEnvironment.staging => _stagingBaseUrl,
      AppEnvironment.production => '',
    };
    return value.isEmpty ? _stagingBaseUrl : value;
  }
}
