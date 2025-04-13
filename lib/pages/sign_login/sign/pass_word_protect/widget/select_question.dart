part of '../../index.dart';

class SelectQuestion extends StatelessWidget {
  FixedExtentScrollController controller =
      FixedExtentScrollController(initialItem: 0);
  Function callBack;
  DictItem? selectDictItem;
  List<DictItem> dictItemList = [];

  SelectQuestion(this.dictItemList, this.selectDictItem, this.callBack) {
    selectDictItem ??= dictItemList.first;
    controller = FixedExtentScrollController(
        initialItem: dictItemList.indexOf(selectDictItem!));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 248.h,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 48.h,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xffE7E7E7), width: 1))),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: SmartDialog.dismiss,
                      child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            LocaleKeys.text_0088.tr,
                            style: AppTheme().appTextStyle.textStyleTitleText,
                          ))),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      callBack.call(selectDictItem);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        LocaleKeys.text_0094.tr,
                        style: AppTheme().appTextStyle.textStylePrimary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListWheelScrollView.useDelegate(
                    controller: controller,
                    itemExtent: 50.h,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        if (index < 0 || index >= dictItemList.length) {
                          return null;
                        }
                        return Center(
                            child: Text(
                          dictItemList[index].dictLabel.toString(),
                          style: AppTheme().appTextStyle.textStyleTernary,
                        ));
                      },
                      childCount: dictItemList.length,
                    ),
                    onSelectedItemChanged: (index) {
                      selectDictItem = dictItemList[index];
                    },
                  ),
                  Container(
                    height: 50.h,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Color(0xffE7E7E7), width: 1),
                            bottom: BorderSide(
                                color: Color(0xffE7E7E7), width: 1))),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
