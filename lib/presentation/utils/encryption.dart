import 'package:encrypt/encrypt.dart';

class Encryptor {
  static final key = Key.fromUtf8('PKEHU6ixtUY683Jb62ZdbcAFgNmIJfZx');
  static final iv = IV.fromLength(16);

  static String? encrypt(String? str) {
    if (str == null) {
      return null;
    } else {
      final encrypter = Encrypter(AES(key));
      return encrypter.encrypt(str, iv: iv).base64;
    }
  }

  static String? decrypt(String? str) {
    if (str == null) {
      return null;
    } else {
      Encrypted e = Encrypted.fromBase64(str);
      final encrypter = Encrypter(AES(key));
      return encrypter.decrypt(e, iv: iv);
    }
  }
}
