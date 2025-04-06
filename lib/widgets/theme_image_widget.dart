part of 'index.dart';

class ThemeImageWidget extends StatelessWidget {
  final String? url;
  final String? path;
  final String? placeholder;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit fit;
  final Color? color;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final bool ignore;
  final String? error;

  const ThemeImageWidget({
    super.key,
    this.url,
    this.path,
    this.placeholder = Resource.assetsImagesNoDataPng,
    this.width,
    this.height,
    this.size,
    this.fit = BoxFit.fill,
    this.color,
    this.borderRadius,
    this.radius = 0.0,
    this.ignore = false,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
      ),
      constraints: constraints,
      clipBehavior: Clip.hardEdge,
      child: _buildImageWidget(),
    );
  }

  BoxConstraints? get constraints {
    if (size != null) {
      return BoxConstraints.expand(
        width: size,
        height: size,
      );
    } else if (width != null && height != null) {
      return BoxConstraints.expand(
        width: width,
        height: height,
      );
    }
    return null;
  }

  Widget _buildImageWidget() {
    if (url.isNotNullOrBlank) {
      if ((url ?? "").toLowerCase().contains("http")) {
        return CachedNetworkImage(
          imageUrl: url!,
          fit: fit,
          placeholder: ignore
              ? null
              : (_, __) => Image(
                    image: AssetImage(
                      placeholder ?? Resource.assetsImagesNoDataPng,
                    ),
                    fit: fit,
                  ),
          errorWidget: (_, __, ___) => Image(
            image: AssetImage(
              error ?? placeholder ?? Resource.assetsImagesNoDataPng,
            ),
            fit: fit,
          ),
        );
      } else {
        if (path!.endsWith('svg')) {
          return SvgPicture.asset(
            path!,
            fit: fit,
            colorFilter: color != null
                ? ColorFilter.mode(
                    color!,
                    BlendMode.srcIn,
                  )
                : null,
          );
        } else {
          return Image(
            image: AssetImage(path!),
            fit: fit,
            color: color,
          );
        }
      }
    } else if (path.isNotNullOrBlank) {
      if (path!.endsWith('svg')) {
        return SvgPicture.asset(
          path!,
          fit: fit,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                )
              : null,
        );
      } else {
        return Image(
          image: AssetImage(path!),
          fit: fit,
          color: color,
        );
      }
    }
    return Image(
      image: AssetImage(
        placeholder ?? Resource.assetsImagesNoDataPng,
      ),
      fit: fit,
      color: color,
    );
  }
}
