part of 'index.dart';

class DbStore {
  final Database db;

  DbStore(this.db);

  Future<int> getMaxFid() async {
    final result = await db.rawQuery(
        'SELECT MAX(fid) AS maxFid FROM ${DatabaseService.tableName}');
    if (result.isNotEmpty) {
      return result.first['maxFid'] as int? ?? 0;
    }
    return 0;
  }

  Future<int> getMaxMid(dynamic channelType, dynamic channelId) async {
    final result = await db.rawQuery(
        'SELECT MAX(mid) AS maxMid FROM ${DatabaseService.tableName} where channelType=$channelType AND channelId=$channelId');

    if (result.isNotEmpty) {
      return result.first['maxMid'] as int? ?? 0;
    }
    return 0;
  }

  Future<int> insertMessage(Message message) async {
    return db.insert(
      DatabaseService.tableName,
      message.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Message?> getMessageByFid(int fid) async {
    final List<Map<String, dynamic>> maps = await db.query(
      DatabaseService.tableName,
      where: 'fid = ?',
      whereArgs: [fid],
    );

    if (maps.isEmpty) return null;
    return Message.fromJson(maps.first);
  }

  Future<int> updateMessageByFid(Message message,
      {bool isReplace = true}) async {
    final existingMessage =
        await getMessageByFid(int.parse(Utils.toEmpty(message.fid) ?? '0'));
    if (existingMessage != null) {
      if (isReplace) {
        return db.update(
          DatabaseService.tableName,
          message.toJson(),
          where: 'fid = ?',
          whereArgs: [message.fid],
        );
      } else {
        return 1;
      }
    } else {
      // log(">>>>>>${ message.toJson()}");
      return db.insert(
        DatabaseService.tableName,
        message.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<Message?> findMessageByChannelAndMid(
    int channelType,
    int channelId,
    int? mid,
  ) async {
    if (mid == null) return null;

    final List<Map<String, dynamic>> maps = await db.query(
      DatabaseService.tableName,
      where: 'channelType = ? AND channelId = ? AND mid = ?',
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
      DatabaseService.tableName,
      where: 'channelId = ?',
      whereArgs: [channelId],
      orderBy: 'time DESC',
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => Message.fromJson(map)).toList();
  }

  // 插入消息时检查是否存在
  Future<void> featMessageByChannelAndMid(Message message) async {
    // 先检查是否存在相同的消息（基于联合索引）
    final existingMessage = await findMessageByChannelAndMid(
      int.parse(Utils.toEmpty(message.channelType) ?? "0"),
      int.parse(Utils.toEmpty(message.channelId) ?? "0"),
      Utils.isEmpty(message.mid)
          ? null
          : int.parse(Utils.toEmpty(message.mid) ?? "0"),
    );
    if (existingMessage == null) {
      db.insert(
        DatabaseService.tableName,
        message.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // 插入消息时检查是否存在
  Future<int> insertMessageByChannelAndMid(Message message) async {
    // 先检查是否存在相同的消息（基于联合索引）
    final existingMessage = await findMessageByChannelAndMid(
      int.parse(Utils.toEmpty(message.channelType) ?? "0"),
      int.parse(Utils.toEmpty(message.channelId) ?? "0"),
      Utils.isEmpty(message.mid)
          ? null
          : int.parse(Utils.toEmpty(message.mid) ?? "0"),
    );

    if (existingMessage != null) {
      // 如果存在，则更新
      await db.update(
        DatabaseService.tableName,
        message.toJson(),
        where: 'channelType = ? AND channelId = ?',
        whereArgs: [message.channelType, message.channelId, message.mid],
      );
      return int.parse(Utils.toEmpty(existingMessage.fid) ?? "0");
    } else {
      // 如果不存在，则插入新记录
      return db.insert(
        DatabaseService.tableName,
        message.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Message>> getMessages(
    int channelType,
    int channelId, {
    int? lastMid,
    int limit = 50,
  }) async {
    String where;
    List<dynamic> whereArgs;

    if (lastMid != null) {
      // 加载更早的消息
      where = 'channelType = ? AND channelId = ? AND mid < ?';
      whereArgs = [channelType, channelId, lastMid];
    } else {
      // 加载最新消息
      where = 'channelType = ? AND channelId = ?';
      whereArgs = [channelType, channelId];
    }
    final List<Map<String, dynamic>> maps = await db.query(
      DatabaseService.tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: 'mid DESC',
      limit: limit,
    );
    log(">>>local>>${jsonEncode(maps)}");
    final list = maps.map((map) => Message.fromJson(map)).toList();
    return list;
  }

// 使用示例：将JSON转换为Message对象并存储到数据库
  Future<void> saveMessageFromJson(Map<String, dynamic> json) async {
    final message = Message.fromJson(json);
    await insertMessage(message);
  }
}
