part of 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final HomeLogic controller = HomeLogic.to;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(length: 5, vsync: this)
      ..addListener(() {
        setState(() {
          controller.changeTabCurIndex(_tabController!.index);
        });
      });
    //界面build完成后执行回调函数
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
      id: 'homeId',
      builder: (logic) {
        return Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.bgColor,
                  AppTheme.bgColor,
                ],
                stops: [
                  0.2,
                  5,
                ],
              ),
            ),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: controller.tabWidget,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 68.h + Get.mediaQuery.padding.bottom / 3,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              border: Border(
                top: BorderSide(
                  color: Theme.of(Get.context!).dividerColor,
                  width: 1.w,
                ),
              ),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x0000001A).withOpacity(0.1),
                    blurRadius: 10)
              ],
            ),
            child: Obx(() {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getTabs(),
              );
            }),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: getTabs(controller),
            // ),
          ),
        );
      },
    );
  }

  List<Widget> getTabs() {
    // log('aaaaa');
    final List<Widget> tempList = [];
    for (int i = 0; i < controller.tabItemList.length; i++) {
      final String path = controller.tabItemList[i]['default'] ?? '';

      final Widget iconWidget = Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 24.h,
        height: 24.h,
        child: ThemeImageWidget(
          path: path,
          width: 24.h,
          height: 24.h,
          color: (controller.tabCurIndex == i.obs) ? AppTheme.primary : null,
        ),
      );
      final w = ColoredBox(
        color: Colors.white.withOpacity(0),
        child: Column(
          children: [
            iconWidget,
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              // height: 16.h,
              child: Text(
                '${controller.tabItemList[i]['title']}'.tr,
                maxLines: 1,
                style: controller.tabCurIndex.value == i
                    ? Theme.of(Get.context!)
                        .bottomNavigationBarTheme
                        .selectedLabelStyle
                    : Theme.of(Get.context!)
                        .bottomNavigationBarTheme
                        .unselectedLabelStyle,
              ),
            ),
          ],
        ),
      );
      tempList.add(Expanded(
        child: GestureDetector(
          onTap: () {
            onItemTapped(i);
          },
          child: w,
        ),
      ));
    }

    return tempList;
  }

  //点击item事件
  void onItemTapped(int index, {bool animateTo = true}) {
    itemTapped(index, animateTo: animateTo);
  }

  void itemTapped(int index, {bool animateTo = true}) {
    if (controller.tabCurIndex != index.obs) {
      if (animateTo) {
        _tabController!.animateTo(index);
      }
      setState(() {
        controller.tabCurIndex = index.obs;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Get.delete<HomeLogic>();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        controller.isLife = false;
      // log('>>>>>>0isLife:${controller.isLife}');
      // log("app 进入后台");
      case AppLifecycleState.paused:
      // log("app 不可见状态");
      case AppLifecycleState.resumed:
        // log("app 进入app");
        controller.isLife = true;
      // log('>>>>>>1isLife:${controller.isLife}');

      case AppLifecycleState.detached:
      // log("app 但前页面退出");

      default:
    }
  }
}
