import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Common/Widgets/web_view_screen.dart';
import '../../../utils/colors.dart';

class SingleNoteCard extends StatelessWidget {
  final String title;
  final String url;
  final Function()? onWriteNotePress;
  final Function()? onDounloadPress;
  final Function()? ondeletePress;

  SingleNoteCard({
    super.key,
    required this.title,
    required this.url,
    this.onWriteNotePress,
    this.onDounloadPress,
    this.ondeletePress,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      margin: EdgeInsets.only(bottom: height),
      decoration: BoxDecoration(
        color: MyColors().primaryColor10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: width * 50,
            child: ListTile(
              title: Text(title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                      title: title,
                      url: url,
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            onPressed: onWriteNotePress,
            icon: Icon(
              FontAwesomeIcons.penToSquare,
              size: 20,
              color: MyColors().primaryColor,
            ),
          ),
          IconButton(
            onPressed: ondeletePress,
            icon: Icon(
              Icons.download_outlined,
              color: MyColors().primaryColor,
            ),
          ),
          IconButton(
            onPressed: ondeletePress,
            icon: Icon(
              Icons.delete_outline,
              color: MyColors().primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
