import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class AppNetWorkIamge extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const AppNetWorkIamge({Key key, this.imageUrl, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl != null
          ? imageUrl
          : "https://target.scene7.com/is/image/Target//GUEST_6bdfe36e-d26d-4cee-918e-39cb9c377d44",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius != null ? radius : 4),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => AppPlaceholder(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

class AppPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Icon(
          EvaIcons.headphones,
          color: Colors.grey,
          size: 65,
        ),
      ),
    );
  }
}

class CoverArt extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const CoverArt({Key key, @required this.imageUrl, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height != null ? height : 220,
        width: width != null ? width : 160.00,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 10.00),
              color: Color(0xff60989f).withOpacity(0.20),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(8.00),
        ),
      ),
      placeholder: (context, url) =>
          Container(height: 220, width: 160.00, child: AppPlaceholder()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
