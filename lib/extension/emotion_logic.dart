part of 'index.dart';

extension EmotionLogic on GetxController {
    ///相册
   void toPhoto(){
      PermissionUtil().setCallBack((e) async {
         if (e) {
            final pickedFile = await ImagePicker()
                .pickImage(source: ImageSource.gallery, imageQuality: 50);
            if (pickedFile != null) {
               String? result = await Scan.parse(pickedFile!.path);
            }
         }
      }).checkPermission(PermissionUtil.camera);
   }
   ///拍摄
   void toCameraAlt(){
      PermissionUtil().setCallBack((e) async {
         if (e) {
            final pickedFile = await ImagePicker()
                .pickImage(source: ImageSource.camera, imageQuality: 50);
            if (pickedFile != null) {
               String? result = await Scan.parse(pickedFile!.path);
            }
         }
      }).checkPermission(PermissionUtil.camera);
   }
   ///视频通话
   void toVideocam(){

   }
   ///语音通话
   void toCall(){

   }
   ///文件
   void toInsertDriveFil(){

   }
   ///红包
   void toCardGiftcard(){

   }

   ///专属红包
   void toMoney(){

   }

   ///转账
   void toSwapHoriz(){

   }

   ///名片
   void toCreditCard(){

   }

   ///群名片
   void toGroup(){

   }
   ///收藏
   void toChatArchive(){

   }
}
