part of 'index.dart';

class LoadingViewPage extends StatefulWidget {
  @override
  State<LoadingViewPage> createState() => _LoadingViewPageState();

  double progressTweenEnd;
  final Function callBack;
  String formType = "";

  LoadingViewPage(
    this.callBack, {
    this.progressTweenEnd = 1,
    this.formType = "",
  });
}

class _LoadingViewPageState extends State<LoadingViewPage>
    with TickerProviderStateMixin {
  final logic = Get.put(LoadingViewLogic());
  AnimationController? progressController;
  late Tween<double> progressTween;
  double progressTweenBegin = 0.0;
  double progressTweenEnd = 1;
  int durationMilliseconds = 6000;
  VoidCallback? listener;
  bool isReSetProgressTime = false;

  @override
  initState() {
    progressTweenBegin = 0.0;
    if (widget.formType == "login") {
      durationMilliseconds = 10000;
    } else if (ConfigStore.to.isLoad()) {
      durationMilliseconds = 10000;
    } else {
      durationMilliseconds = 4000;
    }
    progressTweenEnd = widget.progressTweenEnd;
    initProgressController(this);
    super.initState();
  }

  void setProgressTime() {
    if (LoadingViewLogic.isSyncEnd && !isReSetProgressTime) {
      // widget.callBack.call();
      progressController?.stop();
      progressTween.end = 1;
      progressTween.begin = progressController?.value;
      progressController?.removeListener(listener!);
      progressController?.duration = const Duration(milliseconds: 800);
      progressController?.forward(from: progressController?.value);
      progressController?.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
      isReSetProgressTime = true;
    }
  }

  void initFistCompleted() {
    if (!LoadingViewLogic.isSyncEnd) {
      durationMilliseconds = LoadingViewLogic.syncTimeout - 6000;
      progressTweenBegin = 0.5;
      progressTweenEnd = 1;
      progressTween.end = progressTweenEnd;
      progressTween.begin = progressTweenBegin;
      progressController?.stop();
      progressController?.removeListener(listener!);
      progressController?.duration =
          Duration(milliseconds: durationMilliseconds);
      progressController?.value = progressTweenBegin;
      progressController?.forward(from: 0.40);
      progressController?.addListener(
        listener = () {
          setProgressTime();
          if (mounted) {
            setState(() {});
          }
        },
      );
    } else {
      if (!isReSetProgressTime) {
        setProgressTime();
      } else {
        widget.callBack.call();
      }
    }
  }

  void initProgressController(TickerProvider vsync) {
    progressTween = Tween<double>(
      begin: progressTweenBegin,
      end: progressTweenEnd,
    );

    progressController = AnimationController(
      // 这个动画应该持续的时间长短。
      duration: Duration(milliseconds: durationMilliseconds),
      vsync: vsync,
      // void addListener(
      //   VoidCallback listener
      // )
      // 每次动画值更改时调用监听器
      // 可以使用removeListener删除监听器
    )..addListener(
        listener = () {
          setProgressTime();
          if (mounted) {
            setState(() {});
          }
        },
      );

    progressController?.forward();
    progressController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        final int progress =
            (progressTween.animate(progressController!).value * 100).toInt();
        if (progress == 50) {
          initFistCompleted();
        } else {
          widget.callBack.call();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int progress =
        (progressTween.animate(progressController!).value * 100).toInt();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            width: 246,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: const [
                  Color(0xFFB19BF0),
                  Color(0xFFffffff),
                  Color(0xFF4928A5),
                ],
                stops: [
                  progressTween.animate(progressController!).value / 2,
                  progressTween.animate(progressController!).value,
                  progressTween.animate(progressController!).value,
                ],
              ),
            ),
            child: const SizedBox(height: 4),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              // Data synchronization in progress
              text: '',
              style: AppTheme()
                  .appTextStyle
                  .textStyleTitleText
                  .copyWith(color: const Color(0xFFFFFFFF).withOpacity(0.6)),
              children: <InlineSpan>[
                WidgetSpan(
                  child: Text(
                    '${progress < 10 ? "0$progress" : progress}%',
                    style: AppTheme().appTextStyle.textStyleTitleText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<LoadingViewLogic>();
    progressController?.dispose();
    super.dispose();
  }
}
