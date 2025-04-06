part of 'index.dart';


// class Account {
//   late int ?id;
//   late String ?userCode;   //用户id
//   late String ?languageCode;      //用户语言
//   late String ?currencyCode;            // 用户货币
//   late int ?hasSetCurrency;            // 用户设置货币 0未设置 1 设置了
//   late String ?email;            // 用户Email
//   late String ?countryCode;            // 用户国家代码
//   late String ?phone;            // 用户手机号码
//   late String ?nickname;            //用户昵称
//   late int ?gender;            //用户性别
//   late String ?avatarUrl;            //用户头像
//   late String ?appleID;            //用户苹果id
//   late String ?facebookID;            //用户facebook id
//   late String ?googleID;            //用户谷歌id
//   late String ?createDatetime;     //创建时间
//   late int ?isSync;
//   Account({
//     this.id,
//     this.userCode,
//     this.currencyCode,
//     this.languageCode,
//     this.hasSetCurrency,
//     this.countryCode,
//     this.email,
//     this.phone,
//     this.nickname,
//     this.avatarUrl,
//     this.gender,
//     this.googleID,
//     this.appleID,
//     this.facebookID,
//     this.createDatetime,
//     this.isSync
//   });
//
//   // static Future<Database> ?database;
//   // static late Database db;
//   //
//   // static inits(Database database){
//   //   db = database;
//   //   //初始化创建数据库
//   //   // database = openDatabase(
//   //   //   join(await getDatabasesPath(), 'account_database.db'),
//   //   //   onCreate: (db, version) {
//   //        db.execute('CREATE TABLE account(${
//   //         "Id INTEGER PRIMARY KEY AUTOINCREMENT,"
//   //         "UserCode TEXT,"
//   //         "LanguageCode TEXT,"
//   //         "CurrencyCode TEXT,"
//   //         "HasSetCurrency INT,"
//   //         "CountryCode TEXT,"
//   //         "Email TEXT,"
//   //         "Phone TEXT,"
//   //         "Nickname TEXT,"
//   //         "AvatarUrl TEXT,"
//   //         "GoogleID TEXT,"
//   //         "AppleID TEXT,"
//   //         "FacebookID TEXT,"
//   //         "CreateDatetime TEXT,"
//   //         "Gender INT,"
//   //         "IsSync INT"
//   //       })',);
//   //   //   },
//   //   //   version: 1,
//   //   // );
//   //
//   // }
//   //
//   // static initsDb(Database database){
//   //   db = database;
//   // }
//
//   //插入表数据
//   static Future<void> insertAccount(Account account) async {
//     // final db = await database;
//     // final List<Map<String, dynamic>> maps = await db.query('account');
//     clear();
//     await db.insert(
//         'account',
//         account.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     // if(maps.isEmpty){
//     //     await db.insert(
//     //       'account',
//     //       account.toMap(),
//     //       conflictAlgorithm: ConflictAlgorithm.replace,
//     //     );
//     // }else{
//     //   log("account---444------${account.toMap()}");
//     //   log("account---444----userCode--${account.userCode}");
//     //   await db.update(
//     //     'account',
//     //     account.toMap(),
//     //     where: 'UserCode = ${account.userCode}',
//     //   );
//
//
//     // }
//
//   }
//
//   //查找表数据
//   static  Future<Account> findAccount() async {
//     // final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('account');
//     // log("messagefindAccount-----${maps[0]['Id']}");
//     // return List.generate(maps.length, (i) {
//       // log("message--------$maps");
//       if(maps.isNotEmpty){
//       return Account(
//         id: maps[0]['Id'] as int?,
//         userCode: maps[0]['UserCode'] as String?,
//         currencyCode: maps[0]['CurrencyCode'] as String?,
//         languageCode: maps[0]['LanguageCode'] as String?,
//         hasSetCurrency: maps[0]['HasSetCurrency'] as int?,
//         countryCode: maps[0]['CountryCode'] as String?,
//         email: maps[0]['Email'] as String?,
//         phone: maps[0]['Phone'] as String?,
//         nickname: maps[0]['Nickname'] as String?,
//         avatarUrl: maps[0]['AvatarUrl'] as String?,
//         gender: maps[0]['Gender'] as int?,
//         googleID: maps[0]['GoogleID'] as String?,
//         appleID: maps[0]['AppleID'] as String?,
//         facebookID: maps[0]['FacebookID'] as String?,
//         createDatetime: maps[0]['CreateDatetime'] as String?,
//       );
//     }else{
//        return Account();
//     }
//     // });
//   }
//
//
//
//
//
//   static Account dataCheck(Map userinfo,Map usersetting){
//       return Account(
//             userCode: userinfo['UserCode'] as String?,
//             email: userinfo['Email'] as String?,
//             countryCode: userinfo['CountryCode'] as String?,
//             phone: userinfo['Phone'] as String?,
//             nickname: userinfo['Nickname'] as String?,
//             gender: userinfo['Gender'] as int?,
//             avatarUrl: userinfo['AvatarUrl'] as String?,
//             googleID: userinfo['GoogleID'] as String?,
//             appleID: userinfo['AppleID'] as String?,
//             facebookID: userinfo['FacebookID'] as String?,
//             createDatetime: userinfo['CreateDatetime'] as String?,
//             hasSetCurrency: usersetting['HasSetCurrency'] as int? ?? 0,
//             currencyCode: usersetting['CurrencyCode'] as String? ?? '',
//             languageCode: usersetting['LanguageCode'] as String? ?? '',
//       );
//   }
//
//   //清空数据
//   static Future<void> clear() async {
//     // final db = await database;
//     await db.delete("account");
//   }
//
//   // Convert a Dog into a Map. The keys must correspond to the names of the
//   // columns in the database.
//   Map<String, dynamic> toMap() {
//     return {
//       'UserCode': userCode,
//       'LanguageCode': languageCode,
//       'HasSetCurrency': hasSetCurrency,
//       'CurrencyCode': currencyCode,
//       'CountryCode': countryCode,
//       'Email': email,
//       'Phone': phone,
//       'Nickname': nickname,
//       'AvatarUrl': avatarUrl,
//       'Gender': gender,
//       'GoogleID': googleID,
//       'AppleID': appleID,
//       'FacebookID': facebookID,
//       "CreateDatetime":createDatetime,
//       "IsSync":isSync,
//     };
//   }
//
//   // Implement toString to make it easier to see information about
//   // each dog when using the print statement.
//   @override
//   String toString() {
//     String text ="Account{${
//       "UserCode:$userCode,"
//       "LanguageCode:$languageCode,"
//       "HasSetCurrency:$hasSetCurrency,"
//       "CurrencyCode:$currencyCode,"
//       "Email:$email,"
//       "Phone:$phone,"
//       "Nickname:$nickname,"
//       "AvatarUrl:$avatarUrl,"
//       "Gender:$gender,"
//       "GoogleID:$googleID,"
//       "AppleID:$appleID,"
//       "FacebookID:$facebookID,"
//       "CountryCode:$countryCode,"
//       "CreateDatetime:$createDatetime,"
//     }";
//     return text;
//
//   }
// }