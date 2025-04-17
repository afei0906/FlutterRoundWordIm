library store;

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store/services/index.dart';
import 'package:store/utils/index.dart';

import '../apis/index.dart';
import '../common/azlistview/index.dart';
import '../generated/locales.g.dart';
import '../models/index.dart';
import '../pages/home/index.dart';
import '../routes/index.dart';

part 'config.dart';
part 'language.dart';
part 'user.dart';
part 'contact.dart';