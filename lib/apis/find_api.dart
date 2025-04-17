part of 'index.dart';

abstract class FindApi {
  static Future<List<FindInfo>> discoveryPage() async {
    final res = await HttpService.to.post(
      Urls.discoveryPage,
    );

    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      final List? list = res.data as List?;
      final List<FindInfo> clientList = list
              ?.map((e) => FindInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      return clientList;
    }
    return [];
  }
}
