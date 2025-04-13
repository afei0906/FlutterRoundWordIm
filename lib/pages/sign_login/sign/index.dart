library sign;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:store/extension/index.dart';

import '../../../apis/index.dart';
import '../../../generated/locales.g.dart';
import '../../../models/index.dart';
import '../../../resource.dart';
import '../../../routes/index.dart';
import '../../../store/index.dart';
import '../../../theme.dart';
import '../../../utils/index.dart';
import '../../../widgets/index.dart';
import '../../splash/index.dart';
import '../config/index.dart';
import '../login/index.dart';

part 'sign_phone/logic.dart';

part 'sign_phone/view.dart';

part 'sign_phone/state.dart';

part 'sign_email/logic.dart';

part 'sign_email/view.dart';

part 'sign_email/state.dart';

part 'sign_suss/logic.dart';

part 'sign_suss/view.dart';

part 'sign_suss/state.dart';

part 'pass_word_protect/logic.dart';

part 'pass_word_protect/view.dart';

part 'pass_word_protect/state.dart';

part 'pass_word_protect/widget/select_question.dart';
