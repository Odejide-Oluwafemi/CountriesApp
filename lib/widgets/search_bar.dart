import 'package:countries_app/misc/global.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Widget? prefixIcon;
  final String? hintText;
  final int maxLines;
  const SearchBar({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.maxLines = 1,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentTheme.isDark
          ? Theme.of(context).canvasColor.withOpacity(0.7)
          : Color.fromARGB(255, 3, 67, 244).withOpacity(0.4),
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: TextField(
          // TODO: implement autofill
          controller: _controller,
          maxLines: widget.maxLines,
          cursorColor: Colors.white,
          cursorWidth: 3,
          cursorHeight: 12,
          cursorRadius: Radius.circular(3),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            border: InputBorder.none,
            hintStyle: Theme.of(context).textTheme.overline!.copyWith(
                  fontSize: 14,
                ),
          ),
        ),
      ),
    );
  }
}
