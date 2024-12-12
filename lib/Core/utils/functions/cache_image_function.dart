import 'package:book_store/Core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImage cachedImage({
  required String imageUrl,
  double? width,
}) {
  return CachedNetworkImage(
    width: width,
    fit: BoxFit.fill,
    imageUrl: imageUrl,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        Image.asset(Assets.book),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
