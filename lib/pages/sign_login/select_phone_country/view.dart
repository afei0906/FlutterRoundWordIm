part of 'index.dart';

class SelectPhoneCountryPage extends StatelessWidget {
  SelectPhoneCountryPage({Key? key}) : super(key: key);

  final SelectPhoneCountryLogic logic = Get.put(SelectPhoneCountryLogic());
  final SelectPhoneCountryState state =
      Get
          .find<SelectPhoneCountryLogic>()
          .state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectPhoneCountryLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.bgColor,
            appBar: appBar(),
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      8.horizontalSpace,
                      const Icon(
                        Icons.search,
                        color: Color(0xff0A0A0A),
                      ),
                      Expanded(
                        child: InputAccount(
                          decoration: BoxDecoration(),
                          controller: state.searchController,
                          hintText: LocaleKeys.text_0093.tr,
                          onChanged: logic.onChanged,
                        ),
                      ),
                    ],
                  ),
                ).marginSymmetric(horizontal: 16.h),
                12.verticalSpace,
                Container(
                  color: AppTheme.bgColor2,
                  height: 10,
                ),
                Obx(() {
                  return _itemWidget(state.countryCodeModel.value,
                      isSelect: true, isClick: false);
                }),
                Container(
                  color: AppTheme.bgColor2,
                  height: 10,
                ),
                Obx(() {
                  return Expanded(
                      child: ListView.builder(
                        itemCount: state.CountryCodeModelList.length,
                        itemBuilder: (context, index) {
                          return _itemWidget(state.CountryCodeModelList[index]);
                        },
                        padding: EdgeInsets.zero,
                      ));
                })
              ],
            ));
      },
    );
  }

  Widget _itemWidget(CountryCodeModel countryCodeModel,
      {bool isSelect = false, bool isClick = true}) {
    return GestureDetector(
      onTap: () {
        if (isClick) {
          logic.selectCountryCodeModel(countryCodeModel);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppTheme.lineColor, width: 1))),
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.h,
        ),
        child: Row(
          children: [
            ThemeImageWidget(
              url: countryCodeModel.flag,
              width: 32.w,
              height: 21.w,
            ),
            8.horizontalSpace,
            Expanded(
                child: Text(
                  countryCodeModel.name ?? '',
                  style: isSelect
                      ? AppTheme().appTextStyle.textStylePrimary
                      : AppTheme().appTextStyle.textStyleTernary,
                )),
            Text(
              countryCodeModel.code ?? '',
              style: isSelect
                  ? AppTheme().appTextStyle.textStylePrimary
                  : AppTheme().appTextStyle.textStyleTernary,
            )
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(
      appBarColor: AppTheme.bgColor,
      Get.context!,
      title: LocaleKeys.text_0092.tr,
    );
  }
}
