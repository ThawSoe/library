import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImageWidget {
  //widget delegation
  static imageWidgetDelegation(
      {@required String? imgurl,
      EdgeInsetsGeometry padding = const EdgeInsets.all(0.0),
      double? height,
      double? width,
      void Function()? onTap}) {
    if (imgurl == "" || imgurl == null) {
      return const CircularProgressIndicator();
    }
    try {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: CachedNetworkImage(
            height: height,
            width: width,
            fit: BoxFit.cover,
            imageUrl: imgurl.toString(),
            filterQuality: FilterQuality.high,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Center(
                child: Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
            )),
          ),
        ),
      );
    } catch (e) {
      debugPrint("Image Exception \n$e");
      throw Exception('Image file does not exist');
    }
  }
}
