import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;
  final double fontsize;

  const ReadMoreText(
      {required this.text, Key? key, this.maxLines = 3, this.fontsize = 12})
      : super(key: key);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final textPainter = TextPainter(
              text: TextSpan(
                text: widget.text,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF7F8081),
                ),
              ),
              textDirection: TextDirection.ltr,
              maxLines: isExpanded ? null : widget.maxLines,
            );
            textPainter.layout(maxWidth: constraints.maxWidth);

            if (textPainter.didExceedMaxLines) {
              final textSpan = TextSpan(
                text: isExpanded
                    ? widget.text
                    : widget.text.substring(
                        0,
                        textPainter
                            .getPositionForOffset(Offset(
                                constraints.maxWidth, constraints.maxHeight))
                            .offset),
                style: TextStyle(
                  fontSize: widget.fontsize,
                  color: Color(0xFF7F8081),
                ),
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: textSpan,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        isExpanded ? 'Read less' : 'Read more',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Text(
                widget.text,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: widget.fontsize,
                  color: const Color(0xFF7F8081),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
