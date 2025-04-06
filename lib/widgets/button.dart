part of 'index.dart';

enum CustomButtonType { filled, ghost, borderless }

enum CustomButtonSize { large, medium, small }

enum CustomButtonShape { radius, stadium }

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final CustomButtonType type;
  final CustomButtonSize size;
  final CustomButtonShape shape;
  final double? width;
  final double? height;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final bool isIcon;
  final double borderWidth;

  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.type = CustomButtonType.filled,
    this.size = CustomButtonSize.medium,
    this.shape = CustomButtonShape.stadium,
    this.width,
    this.height,
    this.padding,
    this.isIcon = false,
    this.fontSize,
    this.borderWidth = 1.0,
  });

  factory CustomButton.icon({
    Key? key,
    required Icon icon,
    void Function()? onPressed,
    Color? foregroundColor,
    Color? backgroundColor,
    CustomButtonShape shape,
    CustomButtonSize size,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
  }) = _ButtonWithIcon;

  const CustomButton.text({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.onPressed,
    this.foregroundColor,
    this.size = CustomButtonSize.medium,
    this.padding,
    this.fontSize,
    this.borderWidth = 1.0,
  })  : isIcon = false,
        backgroundColor = null,
        type = CustomButtonType.borderless,
        shape = CustomButtonShape.radius;

  OutlinedBorder? get _shape {
    switch (shape) {
      case CustomButtonShape.stadium:
        return const StadiumBorder();
      case CustomButtonShape.radius:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        );
    }
  }

  EdgeInsetsGeometry? get _padding {
    switch (size) {
      case CustomButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.w);
      case CustomButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w);
      case CustomButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w);
    }
  }

  double? get _fontSize {
    switch (size) {
      case CustomButtonSize.large:
        return 18.w;
      case CustomButtonSize.medium:
        return 16.w;
      case CustomButtonSize.small:
        return 14.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            Theme.of(context)
                .textTheme.labelMedium?.copyWith(fontSize: fontSize ?? _fontSize),
          ),
          padding: WidgetStateProperty.all(padding ?? _padding),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
                return foregroundColor ??
                    (isIcon ? colorScheme.primary : colorScheme.onPrimary);
              case CustomButtonType.ghost:
              case CustomButtonType.borderless:
                final color = foregroundColor ?? colorScheme.primary;
                final opacity = color.opacity / 2;
                if (states.contains(WidgetState.pressed)) {
                  return color.withOpacity(opacity);
                }
                if (states.contains(WidgetState.disabled)) {
                  return color.withOpacity(opacity);
                }
                return color;
            }
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
                final color = backgroundColor ??
                    colorScheme.primary.withOpacity(isIcon ? 0.1 : 1);
                final opacity = color.opacity / 2;
                if (states.contains(WidgetState.pressed)) {
                  return color.withOpacity(opacity);
                }
                if (states.contains(WidgetState.disabled)) {
                  return color.withOpacity(opacity);
                }
                return color;
              case CustomButtonType.ghost:
              case CustomButtonType.borderless:
                return Colors.transparent;
            }
          }),
          side: WidgetStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
              case CustomButtonType.borderless:
                return BorderSide.none;
              case CustomButtonType.ghost:
                final color = foregroundColor ?? colorScheme.primary;
                final opacity = color.opacity / 2;
                if (states.contains(WidgetState.pressed)) {
                  return BorderSide(
                    color: color.withOpacity(opacity),
                    width: borderWidth,
                  );
                }
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide(
                    color: color.withOpacity(opacity),
                    width: borderWidth,
                  );
                }
                return BorderSide(
                  color: color,
                  width: borderWidth,
                );
            }
          }),
          shape: WidgetStateProperty.all(_shape),
        ),
        child: child,
      ),
    );
  }
}

class _ButtonWithIcon extends CustomButton {
  final Icon icon;

  _ButtonWithIcon({
    super.key,
    required this.icon,
    super.onPressed,
    super.foregroundColor,
    Color? backgroundColor,
    super.type,
    super.size,
    super.shape = CustomButtonShape.radius,
    super.width,
    super.height,
    EdgeInsetsGeometry? padding,
  }) : super(
    child: _ButtonWithIconChild(
      icon: icon,
      size: size,
      padding: padding,
    ),
    backgroundColor: backgroundColor ?? foregroundColor?.withOpacity(0.1),
    isIcon: true,
    padding: padding ?? EdgeInsets.zero,
  );
}

class _ButtonWithIconChild extends StatelessWidget {
  final Icon icon;
  final CustomButtonSize size;
  final EdgeInsetsGeometry? padding;

  const _ButtonWithIconChild({
    required this.icon,
    required this.size,
    this.padding,
  });

  double? get _iconSize {
    switch (size) {
      case CustomButtonSize.large:
        return 30.w;
      case CustomButtonSize.medium:
        return 24.w;
      case CustomButtonSize.small:
        return 18.w;
    }
  }

  double get _padding {
    switch (size) {
      case CustomButtonSize.large:
        return 12.w;
      case CustomButtonSize.medium:
        return 10.w;
      case CustomButtonSize.small:
        return 8.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null ? EdgeInsets.all(_padding) : EdgeInsets.zero,
      child: IconTheme.merge(
        data: IconThemeData(size: _iconSize),
        child: icon,
      ),
    );
  }
}
