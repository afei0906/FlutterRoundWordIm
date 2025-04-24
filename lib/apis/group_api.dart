part of 'index.dart';

abstract class GroupApi {
  static Future<List<GroupInfo>> myGroupList(
      {int pageNumber = 1, int pageSize = 500, String? keyword}) async {
    final Map<String, dynamic> param = {
      "pageNumber": pageNumber,
      "pageSize": pageSize,
    };
    if (!Utils.isEmpty(keyword)) {
      param['keyword'] = keyword;
    }
    final res = await HttpService.to.post(Urls.myGroupList, params: param);

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      if (Utils.isEmpty(keyword)) {
        ContactStore.to.saveGroupData(res.data);
      }
      final List? list = res.data as List?;
      final List<GroupInfo> clientList = list
              ?.map((e) => GroupInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      return clientList;
    }
    return [];
  }

  static Future<GroupInfo?> groupCreate(String? name, List members) async {
    final Map<String, dynamic> param = {
      "name": name,
      "members": members,
    };

    final res = await HttpService.to
        .post(Urls.groupCreate, params: param, showLoading: true);

    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return GroupInfo.fromJson(res.data);
    }
    return null;
  }
}
