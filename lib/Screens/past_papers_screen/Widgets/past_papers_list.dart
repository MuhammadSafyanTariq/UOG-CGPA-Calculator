import 'package:flutter/material.dart';
import 'package:notes_trove/Common/Widgets/app_bar.dart';
import 'package:notes_trove/Common/Widgets/web_view_screen.dart';
import 'package:notes_trove/utils/colors.dart';

class PastPapers extends StatefulWidget {
  final String appbarTitle;
  final List<Papers> notes;

  const PastPapers({key, required this.notes, required this.appbarTitle})
      : super(key: key);

  @override
  _PastPapersState createState() => _PastPapersState();
}

class _PastPapersState extends State<PastPapers> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 9),
        child: AppBarWidget(
          title: widget.appbarTitle,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
        itemCount: widget.notes.length,
        itemBuilder: (context, index) {
          final notes = widget.notes[index];
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            margin: EdgeInsets.only(bottom: height),
            decoration: BoxDecoration(
                color: MyColors().primaryColor10,
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(notes.name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                      url: notes.url,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Papers {
  String url;
  String name;
  Papers({
    required this.url,
    required this.name,
  });
}