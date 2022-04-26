class Global {
  static final Global _instance = Global.internal();

  factory Global() {
    return _instance;
  }
  Global.internal();

  static String? userId;
}
