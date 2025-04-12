part of 'index.dart';

class EncryptUtil {
  static String aesEncode(String key, String content) {
    var encodeKey = base64UrlEncode(utf8.encode(key));
    var aesEncrypter = AesCrypt(padding: PaddingAES.pkcs7, key: encodeKey);
    return aesEncrypter.ecb.encrypt(inp: content);
  }
}
