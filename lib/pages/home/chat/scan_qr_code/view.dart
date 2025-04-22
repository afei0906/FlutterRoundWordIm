part of '../../index.dart';

class ScanQrCodePage extends StatefulWidget {
  @override
  State<ScanQrCodePage> createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {
  final logic = Get.put(ScanQrCodeLogic());
  ScanController scanController = ScanController();
  String qrcode = 'Unknown';
  bool torchOn = false;

  void changedTorchMode() {
    scanController.toggleTorchMode();
    if (torchOn == true) {
      torchOn = false;
    } else {
      torchOn = true;
    }
    setState(() {});
  }

  void refreshScan() {
    scanController.resume();
  }

  // controller.resume();
  // controller.pause();
  // String result = await Scan.parse(imagePath);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          buildQrScanView(context),
          // Positioned(
          //   child: buildAppBar(context),
          // ),
        ],
      ),
    );
  }

  Widget buildQrScanView(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double scanW = width * 0.75;
    double scanMY = (height - scanW) / 2.0 + scanW + 15.0;

    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () {
              scanController.resume();
            },
            child: ScanView(
              controller: scanController,
              // custom scan area, if set to 1.0, will scan full area
              scanAreaScale: 0.75,
              scanLineColor: Colors.green.shade400,
              onCapture: (data) {
                logic.openQrCode(data);
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 40.h,
                height: 40.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 24, top: 44.h, bottom: 8.h),
                decoration: BoxDecoration(
                    color: const Color(0xFF797979),
                    borderRadius: BorderRadius.circular(35)),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.w,
                  color: AppTheme.colorTextDarkPrimary,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: logic.callGallery,
              child: Container(
                width: 40.h,
                height: 40.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 24, top: 44.h, bottom: 8.h),
                child: ThemeImageWidget(
                  path: Resource.assetsSvgDefaultCameraPhotoSvg,
                ),
              ),
            ),
          ),
          // Positioned(
          //     bottom: 0,
          //     left: (width - scanW) / 2,
          //     child: Container(
          //         width: scanW,
          //         margin: EdgeInsets.only(bottom: 90.h),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             GestureDetector(
          //               onTap: () {
          //                 changedTorchMode();
          //               },
          //               child: Container(
          //                 width: 50.h,
          //                 height: 50.h,
          //                 alignment: Alignment.center,
          //                 decoration: BoxDecoration(
          //                     color: const Color(0xff0D161B),
          //                     borderRadius: BorderRadius.circular(35)),
          //                 child: Image.asset(
          //                   torchOn
          //                       ? ImgConstant.imgMap['ic_sgd_gb']!
          //                       : ImgConstant.imgMap['ic_sgd']!,
          //                   alignment: Alignment.center,
          //                   width: 24.h,
          //                   height: 24.h,
          //                 ),
          //               ),
          //             ),
          //             GestureDetector(
          //               onTap: () {
          //                 logic.openImg();
          //               },
          //               child: Container(
          //                 width: 50.h,
          //                 height: 50.h,
          //                 alignment: Alignment.center,
          //                 decoration: BoxDecoration(
          //                     color: const Color(0xff0D161B),
          //                     borderRadius: BorderRadius.circular(35)),
          //                 child: Image.asset(
          //                   ImgConstant.imgMap['ic_xiangce']!,
          //                   alignment: Alignment.center,
          //                   width: 24.h,
          //                   height: 24.h,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         )))
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ScanQrCodeLogic>();
    scanController.pause();
    super.dispose();
  }
}
