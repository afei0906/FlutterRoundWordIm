library splash_page;

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:steel_crypt/steel_crypt.dart';
import '../../apis/index.dart';
import '../../generated/locales.g.dart';
import '../../resource.dart';
import '../../routes/index.dart';
import '../../store/index.dart';
import '../../theme.dart';
import '../../utils/index.dart';
import '../../widgets/index.dart';
import '../sign_login/config/index.dart';
import '../sign_login/sign/index.dart';

part 'logic.dart';

part 'view.dart';

part 'state.dart';

part 'widget/invite_code.dart';
part 'widget/verify_code.dart';
part 'widget/block_puzzle_captcha.dart';

