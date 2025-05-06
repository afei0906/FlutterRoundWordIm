part of 'index.dart';

class DatabaseService extends GetxController {
  static DatabaseService get to => Get.find();
  static const String tableName = 'messages';
  late Database db;
  late DbStore dbStore;

  Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName(
        channelType INTEGER,
        channelId INTEGER,
        fid INTEGER,
        msgType INTEGER,
        oper TEXT,
        bizData TEXT,
        mid INTEGER,
        content TEXT,
        time INTEGER,
        contentType INTEGER,
        sysFlag INTEGER,
        sysMsgKey TEXT,
        operNick TEXT,
        toNicks TEXT,
        serverIp TEXT,
        traceId TEXT,
        remark TEXT,
        singleFlag INTEGER,
        singleUid INTEGER,
        fromMsgId INTEGER,
        replyMid INTEGER,
        replyMsgResume TEXT,
        replyUid INTEGER,
        replyNick TEXT,
        nick TEXT,
        avatar TEXT,
        `from` TEXT,
        uid INTEGER,
        at TEXT,
        localIpUtil TEXT,
        readFlag TEXT,
        readTime TEXT )
    ''');
  }

  @override
  Future<void> onInit() async {
    db = await openDatabase(
      'chat.db',
      version: 1,
      onCreate: (db, version) async {
        await createTable(db);
        // 创建联合索引
        await db.execute('''
      CREATE INDEX idx_channel_message 
      ON $tableName(channelType, channelId)
    ''');

        await db.execute('''
      CREATE INDEX midx_channel_message 
      ON $tableName(channelType, channelId, mid)
    ''');
      },
    );
    dbStore = DbStore(db);
    super.onInit();
  }

  Future<bool> insertLocalMsg(Message m) async {
    return await dbStore.insertMessage(m) > 0;
  }

  Future<bool> updateLocalMsg(Message m,{bool isReplace=true}) async {
    return await dbStore.updateMessageByFid(m,isReplace: isReplace) > 0;
  }

  Future<void> updateMsgList(List<Message> list) async{
    list.forEach((action) async {
      await DatabaseService.to.dbStore.featMessageByChannelAndMid(action);
    });
  }

}
