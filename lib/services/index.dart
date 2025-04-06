library services;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/models/index.dart';
import 'package:store/store/index.dart';
import 'package:store/utils/index.dart';
import 'package:store/widgets/index.dart';

export 'package:dio/dio.dart';

part 'network/http.dart';
part 'local/storage.dart';
part 'network/env.dart';
part 'network/urls.dart';