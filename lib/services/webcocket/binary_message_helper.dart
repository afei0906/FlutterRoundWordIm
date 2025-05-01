part of '../index.dart';


////创建二进制消息处理工具类
class BinaryMessageHelper {
  static Uint8List buildMessage(ImCommand command, [Uint8List? content]) {
    final length = (content?.length ?? 0) + 1;
    final buffer = ByteData(length);

    // 写入命令
    buffer.setUint8(0, command.value);

    // 写入内容
    if (content != null) {
      for (var i = 0; i < content.length; i++) {
        buffer.setUint8(i + 1, content[i]);
      }
    }

    return buffer.buffer.asUint8List();
  }

  static (ImCommand command, Uint8List? content) parseMessage(Uint8List data) {
    final buffer = ByteData.view(data.buffer);

    // 读取命令
    final commandValue = buffer.getUint8(0);
    final command = ImCommand.fromValue(commandValue);

    // 读取内容
    Uint8List? content;
    if (data.length > 1) {
      content = data.sublist(1);
    }

    return (command!, content);
  }
}