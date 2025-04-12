library pages_login;

import 'dart:async';
import 'dart:math';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:store/apis/index.dart';
import 'package:store/pages/sign_login/sign/index.dart';
import 'package:store/store/index.dart';
import 'package:store/theme.dart';
import 'package:store/utils/index.dart';

import '../../../generated/locales.g.dart';
import '../../../models/index.dart';
import '../../../resource.dart';
import '../../../routes/index.dart';
import '../../../widgets/index.dart';
import '../../splash/index.dart';
import '../config/index.dart';

part 'common/code_utils.dart';

part 'login_email/logic.dart';

part 'login_email/view.dart';

part 'login_email/state.dart';

part 'login_phone/logic.dart';

part 'login_phone/view.dart';

part 'login_phone/state.dart';

part 'widget/custom_popover.dart';

part 'widget/login_botton.dart';

part 'widget/login_input.dart';

part 'widget/popover_alignment.dart';

part 'widget/popover_controller.dart';

part 'widget/triangle_painter.dart';
part 'widget/common_email.dart';

