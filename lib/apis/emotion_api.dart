part of 'index.dart';

abstract class EmotionApi {
  static Future<List<String>> emotionList() async {
    final res = await HttpService.to.post(
      Urls.emotionList,
    );

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      final List? list = res.data as List?;
      UserStore.to.emotionState.saveServerData(res.data);
      final List<String> clientList =
          list?.map((e) => e.toString()).toList() ?? [];
      return clientList;
    }
    return [];
  }

  static Future<bool> emotionAdd(String url) async {
    final res =
        await HttpService.to.post(Urls.emotionAdd, params: {"url": url});

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      UserStore.to.emotionState.addServerData(url);

      return true;
    }
    return false;
  }

  static Future<bool> emotionDelete(String url) async {
    final res =
        await HttpService.to.post(Urls.emotionDelete, params: {"url": url});

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      UserStore.to.emotionState.deleteServerData(url);
      return true;
    }
    return false;
  }
}
