part of '../index.dart';

class EmotionState {
//用户自定表情

  RxList<String> emotionList = RxList();

  // RxList<FuncItem> inputList=RxList();

  void init() {
    featLocalData();
  }

  Future<void> featLocalData() async {
    final String listStr = StorageService.to
        .getString("${kLocalUserEmotion}_${UserStore.to.userInfo.value.id}");
    if (!Utils.isEmpty(listStr)) {
      final List? list = json.decode(listStr) as List?;
      emotionList.value = list?.map((e) => e.toString()).toList() ?? [];
    }
  }

  Future<void> featServerData() async {
    emotionList.value = await EmotionApi.emotionList();
  }

  Future<void> saveServerData(dynamic data) async {
    StorageService.to.setString(
        "${kLocalUserEmotion}_${UserStore.to.userInfo.value.id}",
        jsonEncode(data));
  }

  Future<void> addServerData(String url) async {
    emotionList.add(url);
    StorageService.to.setString(
        "${kLocalUserEmotion}_${UserStore.to.userInfo.value.id}",
        jsonEncode(emotionList));
  }

  Future<void> deleteServerData(String url) async {
    emotionList.remove(url);
    StorageService.to.setString(
        "${kLocalUserEmotion}_${UserStore.to.userInfo.value.id}",
        jsonEncode(emotionList));
  }

  ///channelType  @Schema(description = "1：私聊；2：群聊")
  RxList<FuncItem> getInputList(dynamic channelType) {
    return [
      ////相册
      FuncItem(Resource.assetsSvgDefaultChatPhotoSvg, LocaleKeys.text_0227.tr,
          UserStore.to.toPhoto),
      //拍摄
      FuncItem(Resource.assetsSvgDefaultChatCameraAltSvg,
          LocaleKeys.text_0233.tr, UserStore.to.toCameraAlt),

      //视频通话
      FuncItem(Resource.assetsSvgDefaultChatVideocamSvg,
          LocaleKeys.text_0228.tr, UserStore.to.toVideocam),
      //语音通话
      FuncItem(Resource.assetsSvgDefaultChatCallSvg, LocaleKeys.text_0153.tr,
          UserStore.to.toCall),
      //文件
      FuncItem(Resource.assetsSvgDefaultChatInsertDriveFileSvg,
          LocaleKeys.text_0191.tr, UserStore.to.toInsertDriveFil),
      //红包
      FuncItem(Resource.assetsSvgDefaultChatCardGiftcardSvg,
          LocaleKeys.text_0229.tr, UserStore.to.toCardGiftcard),
      //专属红包
      FuncItem(Resource.assetsSvgDefaultChatMoneySvg, LocaleKeys.text_0230.tr,
          UserStore.to.toMoney),
      //转账
      FuncItem(Resource.assetsSvgDefaultChatSwapHorizSvg,
          LocaleKeys.text_0231.tr, UserStore.to.toSwapHoriz),
      //名片
      FuncItem(Resource.assetsSvgDefaultChatCreditCardSvg,
          LocaleKeys.text_0194.tr, UserStore.to.toCreditCard),
      //群名片
      FuncItem(Resource.assetsSvgDefaultChatGroupSvg, LocaleKeys.text_0232.tr,
          UserStore.to.toGroup),
      //收藏
      FuncItem(Resource.assetsSvgDefaultChatArchiveSvg, LocaleKeys.text_0211.tr,
          UserStore.to.toChatArchive),
    ].obs;
  }
}

class FuncItem {
  final String icon;
  final String label;
  Function call;

  FuncItem(this.icon, this.label, this.call);
}
