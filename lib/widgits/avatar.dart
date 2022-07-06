import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({required this.radius, required this.url});
  Avatar.small({required this.url}) : radius = 30;
  Avatar.medium({required this.url}) : radius = 60;
  Avatar.large({required this.url}) : radius = 100;

  final double radius;
  final String url;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: CachedNetworkImageProvider(url),
      backgroundColor: Colors.grey,
    );
  }
}
