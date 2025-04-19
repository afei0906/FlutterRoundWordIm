library pages_chat;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:store/extension/index.dart';
import 'package:store/resource.dart';
import 'package:store/routes/index.dart';
import 'package:store/store/index.dart';
import 'package:store/utils/index.dart';
import 'package:store/widgets/index.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../apis/index.dart';
import '../../common/azlistview/index.dart';
import '../../generated/locales.g.dart';
import '../../models/index.dart';
import '../../theme.dart';
import '../message/index.dart';
import '../sign_login/login/index.dart';

part 'logic.dart';

part 'view.dart';

part 'widget/view.dart';

part 'chat/chat_list/logic.dart';

part 'chat/chat_list/view.dart';

part 'chat/chat_list/state.dart';

part 'chat/chat/logic.dart';

part 'chat/chat/view.dart';

part 'chat/chat/state.dart';

part 'chat/chat_list/widget/create_new_chat.dart';

part 'chat/chat_list/widget/create_group_widget.dart';

part 'chat/chat_list/mixin/create_group_logic.dart';

part 'chat/scan_qr_code/logic.dart';

part 'chat/scan_qr_code/view.dart';

part 'chat/scan_qr_code/state.dart';

part 'contact/contact_list/logic.dart';

part 'contact/contact_list/view.dart';

part 'contact/contact_list/friend_list/logic.dart';

part 'contact/contact_list/friend_list/view.dart';

part 'contact/contact_list/friend_list/state.dart';

part 'contact/group_list/logic.dart';

part 'contact/group_list/view.dart';

part 'contact/group_list/state.dart';

part 'contact/add_new_friend/logic.dart';

part 'contact/add_new_friend/view.dart';

part 'contact/add_new_friend/state.dart';

part 'contact/add_new_friend/widget/add_friend_widget.dart';

part 'contact/add_new_friend/mixin/logic.dart';

part 'shop/shop_home/logic.dart';

part 'shop/shop_home/view.dart';

part 'shop/shop_home/state.dart';

part 'find/find_list/logic.dart';

part 'find/find_list/view.dart';

part 'find/find_list/state.dart';

part 'me/me_center/logic.dart';

part 'me/me_center/view.dart';

part 'me/me_center/state.dart';

part 'me/my_setting/logic.dart';

part 'me/my_setting/view.dart';

part 'me/my_setting/state.dart';
