part of 'index.dart';

class StringUtils {
  static String format(String str, List<String> strList) {
    String curStr = str;
    
    for (int i = 0; i < strList.length; i++) {
      curStr = curStr.replaceAll("%${i + 1}s", strList[i]);
    }
    if (strList.isNotEmpty) {
      curStr = curStr.replaceAll("%s", strList[0]);
    }
    return curStr;
  }

  static Widget formatWidget(String str, TextStyle textStyle,
      List<String> strList, List<TextStyle> textStyleList,) {
    final List<TextSpan> textSpanList = [];
    String curStr = str;
    for (int i = 0; i < strList.length; i++) {
      final List<String> surStrList = curStr.split("%${i + 1}s");
      if (surStrList.isNotEmpty) {
        textSpanList.add(TextSpan(
          text: surStrList[0],
          style: textStyle,
        ),);
        textSpanList.add(TextSpan(
          text: strList[i],
          style: textStyleList[i],
        ),);
      }
      if (surStrList.length > 1) {
        curStr = surStrList[1];
      }
    }
    return RichText(
      text: TextSpan(text: '', children: textSpanList),
    );
  }


  TextSpan buildHighlightedTextMultipleKeywords(String text, List<String> keywords,List<TextStyle> textStyles) {
    final List<TextSpan> spans = [];
    int start = 0;

    // 逐个查找关键字
    while (start < text.length) {
      int minIndex = text.length;
      String? nextKeyword;

      // 查找下一个出现的关键字
      for (final keyword in keywords) {
        int index = text.indexOf(keyword, start);
        if (index != -1 && index < minIndex) {
          minIndex = index;
          nextKeyword = keyword;
        }
      }

      if (nextKeyword != null) {
        // 添加匹配之前的部分
        if (minIndex > start) {
          spans.add(TextSpan(text: text.substring(start, minIndex)));
        }

        // 添加高亮部分
        spans.add(TextSpan(
          text: text.substring(minIndex, minIndex + nextKeyword.length),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ));

        start = minIndex + nextKeyword.length;
      } else {
        // 如果没有找到任何关键字，添加剩余的文本
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
    }

    return TextSpan(children: spans);
  }

}
