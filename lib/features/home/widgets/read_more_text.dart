
import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;

  const ReadMoreText({required this.text});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);
    final span = TextSpan(text: widget.text, style: textStyle);

    final tp = TextPainter(
      text: span,
      maxLines: _isExpanded ? null : 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    final isOverflowing = tp.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: textStyle,
          maxLines: _isExpanded ? null : 3,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
        ),
        if (isOverflowing)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              children: [
                Text(
                  _isExpanded ? 'Show less' : 'Read more',
                  style: const TextStyle(color: Colors.blue),
                ),
                const SizedBox(
                  width: 5,
                ),
                Transform.rotate(
                  angle: 90 * 3.1415926535 / 180, // 90 degrees rotation to point downwards
                  child: const Icon(Icons.arrow_forward_ios, size: 15,color: Colors.blue,),
                ),
              ],
            ),
          ),
      ],
    );
  }
}