import 'package:flutter/material.dart';

class BookmarkIcon extends StatefulWidget {
  final void Function() onPressed;

  const BookmarkIcon({required this.onPressed});

  @override
  _BookmarkIconState createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: _isBookmarked ? Colors.blue : null,
      ),
      onPressed: () {
        setState(() {
          _isBookmarked = !_isBookmarked; // Cambiar el estado de marcado/no marcado
          widget.onPressed(); // Llamar a la función proporcionada por el padre
        });
      },
    );
  }
}
