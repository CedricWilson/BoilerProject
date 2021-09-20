enum Environment { DEVELOPMENT, UAT, PRODUCTION }

class BaseUrl {
  static var environment = Environment.DEVELOPMENT;

  static String getBaseUrl() {
    switch (environment) {
      case Environment.DEVELOPMENT:
        return '';
      case Environment.UAT:
        return '';
      case Environment.PRODUCTION:
        return '';
    }
  }
}
