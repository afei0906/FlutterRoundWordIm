library services;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' show basename;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/models/index.dart';
import 'package:store/store/index.dart';
import 'package:store/utils/index.dart';

import 'package:uuid/uuid.dart';

import '../generated/locales.g.dart';

export 'package:dio/dio.dart';

part 'network/http.dart';

part 'local/storage.dart';

part 'network/env.dart';

part 'network/urls.dart';

part 'webcocket/websocket_service.dart';

part 'webcocket/binary_message_helper.dart';

part 'webcocket/im_command.dart';

part 'upload/minio_service.dart';
part 'upload/minio_logic.dart';