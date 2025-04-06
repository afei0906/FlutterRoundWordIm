import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'square_input_cell.dart';

//验证码输入框
class CodeInput extends StatefulWidget {
  ///[code]已经输入验证码 [length]需要几个框，即规定的验证码的长度
  final String? code;
  final int length;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CodeInput({
    super.key,
    this.code,
    this.length = 4,
    this.onChanged,
    this.controller,
  });

  @override
  CodeInputState createState() => CodeInputState();
}

class CodeInputState extends State<CodeInput> {
  List<Widget> _cells = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> newCells = List.empty(growable: true);
    for (int i = 1; i <= widget.length; i++) {
      newCells.add(
        SquareInputCell(
          isFocused: widget.code?.length == i - 1,
          text:
              widget.code!.length >= i ? widget.code?.substring(i - 1, i) : '',
        ),
      );
    }
    _cells = newCells;

    // TextEditingController?_controller;

    // void initState() {
    //   super.initState();
    //   _controller = TextEditingController();
    // }
    return Stack(
      children: [
        Row(
          mainAxisAlignment: widget.length == 4
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceBetween,
          children: _cells,
        ),
        Opacity(
          opacity: 0.0,
          child: TextField(
            autofocus: true,
            //只能输入字母与数字
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              LengthLimitingTextInputFormatter(6),
            ],
            //只允许输入数字,
            keyboardType: TextInputType.number,
            controller: widget.controller,
            onChanged: widget.onChanged,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 40,
              decoration: TextDecoration.none,
              color: const Color(0xFF000000),
              fontSize: 18.sp,
            ),
          ),
        ),
      ],
    );
  }
}
