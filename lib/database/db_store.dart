part of 'index.dart';

class DbStore {
  final Database db;
  static const String tableName = 'messages';

  DbStore(this.db);

  Future<int> insertMessage(Message message) async {
    return db.insert(
      tableName,
      message.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Message?> getMessageByFid(int fid) async {
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'fid = ?',
      whereArgs: [fid],
    );

    if (maps.isEmpty) return null;
    return Message.fromJson(maps.first);
  }

  Future<Message?> findMessageByChannelAndMid(
      int channelType,
      int channelId,
      int? mid,
      ) async {
    if (mid == null) return null;

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'channel_type = ? AND channel_id = ? AND mid = ?',
      whereArgs: [channelType, channelId, mid],
    );

    if (maps.isEmpty) return null;
    return Message.fromJson(maps.first);
  }

  Future<List<Message>> getMessagesByChannelId(
    int channelId, {
    int limit = 20,
    int offset = 0,
  }) async {
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'channel_id = ?',
      whereArgs: [channelId],
      orderBy: 'time DESC',
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => Message.fromJson(map)).toList();
  }

  // 插入消息时检查是否存在
  Future<int> insertMessageByFid(Message message) async {
    // 先检查是否存在相同的消息（基于联合索引）
    final existingMessage = await findMessageByChannelAndMid(
      int.parse(Utils.toEmpty(message.channelType) ?? "0"),
      int.parse(Utils.toEmpty(message.channelId) ?? "0"),
      int.parse(Utils.toEmpty(message.mid) ?? "0"),
    );

    if (existingMessage != null) {
      // 如果存在，则更新
      await db.update(
        tableName,
        message.toJson(),
        where: 'channel_type = ? AND channel_id = ?',
        whereArgs: [message.channelType, message.channelId, message.mid],
      );
      return int.parse(Utils.toEmpty(existingMessage.fid) ?? "0");
    } else {
      // 如果不存在，则插入新记录
      return await db.insert(
        tableName,
        message.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Message>> getMessages(
    int channelType,
    int channelId, {
    int? lastMid,
    int limit = 20,
  }) async {
    String where;
    List<dynamic> whereArgs;

    if (lastMid != null) {
      // 加载更早的消息
      where = 'channel_type = ? AND channel_id = ? AND mid < ?';
      whereArgs = [channelType, channelId, lastMid];
    } else {
      // 加载最新消息
      where = 'channel_type = ? AND channel_id = ?';
      whereArgs = [channelType, channelId];
    }
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: 'mid DESC',
      limit: limit,
    );

    return maps.map((map) => Message.fromJson(map)).toList();
  }

// 使用示例：将JSON转换为Message对象并存储到数据库
  Future<void> saveMessageFromJson(Map<String, dynamic> json) async {
    final message = Message.fromJson(json);
    await insertMessage(message);
  }
}
