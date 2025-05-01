part of 'index.dart';

class DatabaseService extends GetxController {
  static const String tableName = 'messages';
  Database? db;

  Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        fid INTEGER ,
        channel_type INTEGER,
        channel_id INTEGER,
        mid INTEGER,
        content TEXT,
        time BIGINT,
        content_type INTEGER,
        sys_flag INTEGER,
        sys_msg_key TEXT,
        oper_nick TEXT,
        to_nicks TEXT,
        trace_id TEXT,
        single_flag INTEGER,
        single_uid INTEGER,
        from_msg_id INTEGER,
        reply_mid INTEGER,
        reply_msg_resume TEXT,
        reply_uid INTEGER,
        reply_nick TEXT,
        nick TEXT,
        avatar TEXT,
        from_uid INTEGER,
        uid INTEGER,
        at TEXT,
        biz_data TEXT,
        remark TEXT
      )
    ''');
  }

  @override
  Future<void> onInit() async {
    db = await openDatabase(
      'chat.db',
      version: 1,
      onCreate: (db, version) async {
        await DatabaseService().createTable(db);
        // 创建联合索引
        await db.execute('''
      CREATE INDEX idx_channel_message 
      ON $tableName(channel_type, channel_id)
    ''');

        await db.execute('''
      CREATE INDEX midx_channel_message 
      ON $tableName(channel_type, channel_id, mid)
    ''');
      },
    );

    super.onInit();
  }
}
