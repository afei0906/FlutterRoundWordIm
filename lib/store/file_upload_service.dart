part of 'index.dart';

class FileUploadService extends GetxController {
  static FileUploadService get to => Get.find();

  final MinioUploadService minioService = MinioUploadService(
    endpoint: 'https://minio.opghdm.cn',
    accessKey: 'M8sCeMV18WMMcT2XT5ff',
    secretKey: 'CoK4KqUsXfJvHC6RFRGz4uXBUxZGIeY6IhrKK9vH',
    bucketName: 'tio-test-2',
    publicBucketName: 'tio-domain',
  );
}
