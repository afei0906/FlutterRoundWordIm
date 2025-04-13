part of 'index.dart';

class RichTextWidget extends StatelessWidget {
  final RichTextModel model;
  TextAlign? textAlign;

  RichTextWidget({super.key, required this.model, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        children: items.map((e) {
          if (e.onTap != null) {
            return WidgetSpan(
              child: InkWell(
                onTap: e.onTap,
                child: Text(
                  e.text,
                  textAlign: textAlign,
                  style: e.style,
                ),
              ),
            );
          }
          return TextSpan(
            text: e.text,
            style: e.style,
          );
        }).toList(),
      ),
    );
  }

  List<RichTextItemModel> get items {
    final List<RichTextItemModel> list = <RichTextItemModel>[];
    String full = model.text ?? '';
    if (model.items.isEmpty) {
      list.add(
        RichTextItemModel(
          text: full,
          style: model.style,
        ),
      );
    } else {
      for (RichTextItemModel e in model.items) {
        if (!Utils.isEmpty(e.text)) {
          final int index = full.indexOf(e.text);
          e.start = index;
          e.end = index + e.text.length;
        }
      }
      model.items.sort((a, b) => a.start.compareTo(b.start));
      int current = 0;
      for (RichTextItemModel e in model.items) {
        if (current < e.start) {
          list.add(
            RichTextItemModel(
              text: full.substring(current, e.start),
              style: model.style,
            ),
          );
          list.add(e);
          current = e.end;
        } else {
          list.add(e);
          current = e.end;
        }
      }
      if (current < full.length) {
        list.add(
          RichTextItemModel(
            text: full.substring(current, full.length),
            style: model.style,
          ),
        );
        current = full.length;
      }
    }
    return list;
  }
}

class RichTextModel {
  String? text;
  TextStyle? style;
  List<RichTextItemModel> items;

  RichTextModel(
      {this.text, this.style, this.items = const <RichTextItemModel>[]});
}

class RichTextItemModel {
  String? marker;
  String text;
  TextStyle? style;
  int start;
  int end;
  Function()? onTap;

  RichTextItemModel({
    this.marker,
    required this.text,
    this.style,
    this.onTap,
    this.start = 0,
    this.end = 0,
  });
}
