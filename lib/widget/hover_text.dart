import 'package:benji_frontend/widget/clickable.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class HoverColorText extends StatefulWidget {
  final bool active;
  final bool isDrop;
  final String text;
  final TextStyle style;
  final Color defaultColor;
  final Color hoverColor;
  final Function()? onTap;
  final Widget? navigate;

  const HoverColorText({
    super.key,
    required this.text,
    required this.style,
    this.defaultColor = Colors.white,
    this.hoverColor = kGreenColor,
    this.active = false,
    this.onTap,
    this.isDrop = false,
    this.navigate,
  });

  @override
  State<HoverColorText> createState() => _HoverColorTextState();
}

class _HoverColorTextState extends State<HoverColorText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            MyClickable(
              navigate: widget.navigate,
              child: Text(
                widget.text,
                style: widget.style.copyWith(
                  color: _isHovered | widget.active
                      ? widget.hoverColor
                      : widget.defaultColor,
                ),
              ),
            ),
            widget.isDrop
                ? Icon(
                    Icons.arrow_drop_down,
                    color: _isHovered | widget.active
                        ? widget.hoverColor
                        : widget.defaultColor,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
