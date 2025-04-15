library pages_chat;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:store/resource.dart';
import 'package:store/routes/index.dart';
import 'package:store/utils/index.dart';
import 'package:store/widgets/index.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../generated/locales.g.dart';
import '../../models/index.dart';
import '../../theme.dart';
import '../message/index.dart';
import '../sign_login/login/index.dart';

part 'logic.dart';

part 'view.dart';

part 'chat/chat_list/logic.dart';

part 'chat/chat_list/view.dart';

part 'chat/chat_list/state.dart';
