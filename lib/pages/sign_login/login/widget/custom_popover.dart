part of '../index.dart';

class CustomPopover extends StatefulWidget {
  /// The global context of the widget.
  final BuildContext context;

  /// The controller that manages the popover's state (open/close).
  /// If not provided, a default controller will be created.
  final PopoverController? controller;

  /// The widget that triggers the popover when tapped.
  final Widget action;

  /// The content to be displayed inside the popover.
  final Widget content;

  /// The width of the content widget inside the popover.
  /// Default is 200.0.
  final double contentWidth;

  /// The background color of the popover.
  /// If not provided, it defaults to the theme's card color.
  final Color? backgroundColor;

  /// The shadow effect applied to the popover.
  /// If not provided, a default shadow will be used.
  final List<BoxShadow>? boxShadow;

  /// The border radius of the popover.
  /// Default is a radius of 8.0 on all corners.
  final BorderRadius borderRadius;

  /// The alignment of the popover relative to the action widget.
  /// Default is [PopoverAlignment.bottomCenter].
  final PopoverAlignment alignment;

  /// Whether to apply the action widget's width to the popover content.
  /// Default is false.
  final bool applyActionWidth;

  /// Whether the popover content is scrollable.
  /// Default is false.
  final bool scrollEnabled;

  /// The size of the arrow pointing to the action widget.
  /// Default is 20.0.
  final double arrowSize;

  /// The radius of the arrow's corners.
  /// Default is 2.0.
  final double arrowRadius;

  /// Whether to hide the arrow pointing to the action widget.
  /// Default is false.
  final bool hideArrow;

  /// The spacing between the popover and the action widget.
  /// Default is 0.0.
  final double spacing;

  /// The color of the overlay behind the popover.
  /// If not provided, it defaults to transparent.
  final Color? overlayColor;

  /// The padding value for the sides of the screen to be used when content
  /// overflows horizontally.
  /// This value must be greater than or equal to zero.
  final double horizontalPadding;
  final VoidCallback? onOpen;

  final VoidCallback? onClose;

  /// Constructs a [Popover] widget.
  const CustomPopover(
    this.context, {
    super.key,
    this.controller,
    required this.action,
    required this.content,
    this.onOpen,
    this.onClose,
    this.contentWidth = 200.0,
    this.backgroundColor,
    this.boxShadow,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.alignment = PopoverAlignment.bottomCenter,
    this.applyActionWidth = false,
    this.scrollEnabled = false,
    this.arrowSize = 30.0,
    this.arrowRadius = 2.0,
    this.hideArrow = false,
    this.spacing = 0.0,
    this.overlayColor,
    this.horizontalPadding = 16.0,
  })  : assert(spacing >= 0.0, 'spacing must be greater than or equal to 0.0'),
        assert(
            arrowSize >= 0.0, 'arrowSize must be greater than or equal to 0.0'),
        assert(horizontalPadding >= 0,
            'Padding value must be greater than or equal to zero.');

  @override
  State<CustomPopover> createState() => _PopoverState();
}

class _PopoverState extends State<CustomPopover>
    with SingleTickerProviderStateMixin {
  late final OverlayState _overlayState;
  final _layerLink = LayerLink();
  PopoverController? _popoverController;
  Size _actionSize = Size.zero;
  late final OverlayEntry _popoverOverlayEntry;
  final _contentSizeListener = ValueNotifier<Size>(Size.zero);
  final _actionKey = LabeledGlobalKey('easy_popover_action_key');
  late final Animation<double> _animation;
  late final AnimationController _animationController;
  PopoverAlignment _popoverAlignment = PopoverAlignment.bottomCenter;

  @override
  void initState() {
    _popoverOverlayEntry = _buildContentOverlayEntry();
    if (widget.controller == null) {
      _popoverController = PopoverController()
        ..onOpen = _openPopover
        ..onClose = _closePopover;
    } else {
      _popoverController = widget.controller!
        ..onOpen = _openPopover
        ..onClose = _closePopover;
    }
    _initializeAnimation();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(Duration _) {
    _overlayState = Overlay.of(widget.context, rootOverlay: true);
  }

  @override
  void dispose() {
    try {
      // if (_overlayState != null) {

       // if(_popoverController?.opened??false){
         _popoverOverlayEntry.remove();
         _popoverOverlayEntry.dispose();
       // }

      // }
    } catch (e) {
      e.printInfo();
    }
    // }
    _contentSizeListener.dispose();
    _popoverController?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 150),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      _animationController,
    );
  }

  PopoverController get _controller => widget.controller ?? _popoverController!;

  double get _contentWidth {
    final size = MediaQuery.sizeOf(widget.context);
    return widget.applyActionWidth
        ? _actionSize.width
        : widget.contentWidth > size.width
            ? size.width - widget.horizontalPadding * 2
            : widget.contentWidth;
  }

  void _configureConstraints() {
    if (_actionKey.currentContext != null) {
      final renderBox =
          _actionKey.currentContext!.findRenderObject()! as RenderBox;
      _actionSize = renderBox.size;
      final actionOffset = renderBox.localToGlobal(Offset.zero);
      final size = MediaQuery.sizeOf(widget.context);
      final leftSpacing = actionOffset.dx;
      final topSpacing = actionOffset.dy;
      final rightSpacing = size.width - leftSpacing - _actionSize.width;
      final bottomSpacing = size.height - topSpacing - _actionSize.height;
      _popoverAlignment = widget.alignment.findBestPopoverPosition(
        contentSize: Size(_contentWidth, _contentSizeListener.value.height),
        leftSpacing: leftSpacing,
        topSpacing: topSpacing,
        rightSpacing: rightSpacing,
        bottomSpacing: bottomSpacing,
      );
    }
  }

  OverlayEntry _buildContentOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            if (!widget.scrollEnabled) ...[
              Positioned.fill(
                child: Opacity(
                  opacity: _animation.value,
                  child: Material(
                    color: widget.overlayColor ?? Colors.transparent,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      overlayColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      onTap: _controller.toggle,
                      child: SizedBox(
                        width: MediaQuery.of(widget.context).size.width,
                        height: MediaQuery.of(widget.context).size.height,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            ListenableBuilder(
              listenable: _contentSizeListener,
              builder: (context, child) {
                return Positioned(
                  width: _contentWidth,
                  child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: false,
                    offset: _popoverAlignment.getContentOffset(
                      actionSize: _actionSize,
                      contentSize: Size(
                        _contentWidth,
                        _contentSizeListener.value.height,
                      ),
                      spacing: widget.spacing,
                    ),
                    child: ScaleTransition(
                      scale: _animation,
                      alignment: _popoverAlignment.scaleAlignment,
                      child: Opacity(
                        opacity: _animation.value,
                        child: child!,
                      ),
                    ),
                  ),
                );
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? Theme.of(context).cardColor,
                  borderRadius: widget.borderRadius,
                  boxShadow: widget.boxShadow ??
                      [
                        BoxShadow(
                          offset: const Offset(-8, 8),
                          blurRadius: 32,
                          spreadRadius: 16,
                          color:
                              Theme.of(context).shadowColor.withOpacity(0.24),
                        ),
                      ],
                ),
                child: ClipRRect(
                  borderRadius: widget.borderRadius,
                  child: widget.content,
                ),
              ),
            ),
            if (!widget.hideArrow && widget.arrowSize > 0.0) ...[
              Positioned(
                width: widget.arrowSize,
                child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: false,
                    offset: _popoverAlignment.getArrowOffset(
                      actionSize: _actionSize,
                      arrowSize: widget.arrowSize,
                      spacing: widget.spacing,
                    ),
                    child: CustomPaint(
                      size: Size(widget.arrowSize, widget.arrowSize),
                      painter: TrianglePainter(
                        color: widget.backgroundColor ??
                            Theme.of(context).cardColor,
                      ), // 使用 TrianglePainter 绘制
                    )),
              ),
            ],
          ],
        );
      },
    );
  }

  void _openPopover() {
    _configureConstraints();
    _animationController.addListener(() {
      _overlayState.setState(() {});
    });
    _overlayState.insert(_popoverOverlayEntry);
    _animationController.forward();
    widget.onOpen?.call();
  }

  void _closePopover() {
    _animationController.reverse().whenComplete(_popoverOverlayEntry.remove);
    widget.onClose?.call();
  }

  @override
  void didUpdateWidget(covariant CustomPopover oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget != oldWidget) {
      if (_controller.opened) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (!_overlayState.mounted) return;
            _overlayState.setState(() {});
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) {
        if (_controller.opened) {
          _controller.close();
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          key: _actionKey,
          onTap: _controller.toggle,
          child: CompositedTransformTarget(
            link: _layerLink,
            child: widget.action,
          ),
        ),
      ),
    );
  }
}
