part of 'index.dart';

abstract class FriendApi {
  static Future<List<FriendInfo>> myFriendList(
      {int pageNumber = 1, int pageSize = 500, String? keyword}) async {
    final Map<String, dynamic> param = {
      "pageNumber": pageNumber,
      "pageSize": pageSize,
    };
    if (!Utils.isEmpty(keyword)) {
      param['keyword'] = keyword;
    }
    final res = await HttpService.to.post(Urls.myFriendList,
        params: param, showLoading: !Utils.isEmpty(keyword));

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      if (Utils.isEmpty(keyword)) {
        ContactStore.to.saveFriendData(res.data);
      }
      final List? list = res.data as List?;
      final List<FriendInfo> clientList = list
              ?.map((e) => FriendInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      return clientList;
    }
    return [];
  }

  ///
  //      * 通过
  //      */
  //     int PASS = 1;
  //
  //     /
  //      * 申请中
  //      */
  //     int APPLY = 2;
  //
  //     /**
  //      * 无效：过期/拒绝
  //      */
  //     int REJECT = 3;
  static Future<List<ApplyFriendInfo>> applyList(bool showLoading) async {
    final res =
        await HttpService.to.post(Urls.applyList, showLoading: showLoading);

    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      final List? list = res.data as List?;
      final List<ApplyFriendInfo> clientList = list
              ?.map((e) => ApplyFriendInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      return clientList;
    }
    return [];
  }

  static Future<List<UserInfo>> userSearch(String key) async {
    final Map<String, dynamic> param = {
      "key": key,
    };
    try {
      final res = await HttpService.to
          .post(Urls.userSearch, params: param, showLoading: true);

      if (res.code != 0) {
        // showErrorMsg(res.code.toString(), res.msg ?? '');
      } else {
        final List? list = res.data as List?;
        final List<UserInfo> clientList = list
                ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];
        return clientList;
      }
    } catch (e) {
      e.printError();
    }
    return [];
  }

  static Future<bool> apply(dynamic friendId,
      {String? greet, dynamic groupId}) async {
    final Map<String, dynamic> param = {
      "friendId": friendId,
      "greet": greet ?? LocaleKeys.text_0138.tr,
    };
    if (!Utils.isEmpty(groupId)) {
      param["groupId"] = groupId;
    }
    try {
      final res = await HttpService.to
          .post(Urls.apply, params: param, showLoading: true);

      if (res.code != 0) {
        showErrorMsg(res.code.toString(), res.msg ?? '');
      } else {
        return true;
      }
    } catch (e) {
      e.printError();
    }
    return false;
  }

  static Future<bool> friendSure(dynamic applyId, {String? remarkName}) async {
    final Map<String, dynamic> param = {
      "applyId": applyId,
      "remarkName": remarkName ?? LocaleKeys.text_0196.tr,
    };

    try {
      final res = await HttpService.to
          .post(Urls.friendSure, params: param, showLoading: true);

      if (res.code != 0) {
        showErrorMsg(res.code.toString(), res.msg ?? '');
      } else {
        return true;
      }
    } catch (e) {
      e.printError();
    }
    return false;
  }

  static Future<bool> friendDeleteApply(
    dynamic applyId,
  ) async {
    final Map<String, dynamic> param = {
      "applyId": applyId,
    };

    try {
      final res = await HttpService.to
          .post(Urls.friendDeleteApply, params: param, showLoading: true);

      if (res.code != 0) {
        showErrorMsg(res.code.toString(), res.msg ?? '');
      } else {
        return true;
      }
    } catch (e) {
      e.printError();
    }
    return false;
  }
}
