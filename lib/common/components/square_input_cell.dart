import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/theme.dart';

class SquareInputCell extends StatefulWidget {
  final bool?isFocused;
  final String?text;

  const SquareInputCell({super.key, this.isFocused = false, this.text});
  @override
  State<StatefulWidget> createState() => _SquareInputCellState();
}
//自定义方格  配合CodeInputRow 使用
class _SquareInputCellState extends State<SquareInputCell> {
  //未聚焦的边框
  final unfocusedDecoration = BoxDecoration(
      border: Border.all(color: const Color(0xffF2F2F2)),
      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      color: const Color(0xffF2F2F2),
    );
  //聚焦的边框
  final focusedDecoration = BoxDecoration(
    color: const Color(0xffF2F2F2),
    border: Border.all(color: const Color(0x335D38C4),width: 2.5),
    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
    // boxShadow: [
    //     BoxShadow(color: Colors.blue,offset: Offset(1, 1),blurRadius: 0.5,),
    //     BoxShadow(color: Colors.blue, offset: Offset(-1, -1), blurRadius:0.5),
    //     BoxShadow(color: Colors.blueAccent, offset: Offset(1, -1), blurRadius: 0.5),
    //     BoxShadow(color: Colors.blueAccent, offset: Offset(-1, 1), blurRadius: 0.5)
    //   ]
    );
  //聚焦的格子
  Widget ?focusedCell;
  //未聚焦的格子
  Widget ?unFocusedCell;
  //聚焦时的光标颜色，实现光标闪烁
  Color cursorColor = const Color(0xff5D38C4);
  Timer?timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      cursorColor = Colors.transparent;
      if(mounted){
        setState(() {});
      }
      Future.delayed(const Duration(milliseconds: 500), () {
        cursorColor =const Color(0xff5D38C4);
        if(mounted){
          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    unFocusedCell = Center(
      child: Text(
        widget.text ?? '',
        style: TextStyle(fontSize: 26.sp,letterSpacing: AppTheme.letter, color: AppTheme.primary),
      ),
    );
    focusedCell = Container(margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 12), color: cursorColor,);

    return Container(
      width: 40.w,
      height: 40.w,
      decoration: widget.isFocused == true ? focusedDecoration : unfocusedDecoration,
      child: widget.isFocused  == true ? focusedCell : unFocusedCell,
    );
  }
}
