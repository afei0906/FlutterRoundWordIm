part of '../index.dart';

class CommonEmail extends StatelessWidget {
  FixedExtentScrollController controller =
      FixedExtentScrollController(initialItem: 0);
  Function callBack;
  String? title = emailList.first;

  CommonEmail(this.callBack);

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
                      callBack.call(title);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        LocaleKeys.text_0094.tr,
                        style: AppTheme().appTextStyle.styleBrandPrimary,
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
                        if (index < 0 || index >= emailList.length) {
                          return null;
                        }
                        return Center(
                            child: Text(
                          emailList[index],
                          style: AppTheme().appTextStyle.textStyleTernary,
                        ));
                      },
                      childCount: emailList.length,
                    ),
                    onSelectedItemChanged: (index) {
                      title = emailList[index];
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
