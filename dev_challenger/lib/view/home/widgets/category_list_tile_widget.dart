import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;
  final Icon icon;
  final Widget title;


  const CategoryListTile(
      {this.width,
      this.height,
      this.backgroundColor,
      this.margin = const EdgeInsets.fromLTRB(0, 15, 15, 15),
      this.onTap,
      required this.icon,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            title,
          ],
        ),
      ),
    );
  }
}

