import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:notes_trove/Common/Widgets/app_bar.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:http/http.dart' as http;

class TimeTableScreen extends StatefulWidget {
  static const routeName = 'time-table-screen';
  final String pdfUrl;

  TimeTableScreen({required this.pdfUrl});

  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  String? localFilePath;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    downloadPDF();
  }

  Future<void> downloadPDF() async {
    setState(() {
      isLoading = true;
    });

    String url = widget.pdfUrl;
    String fileName = path.basename(url);
    String dir = (await path_provider.getTemporaryDirectory()).path;
    String filePath = '$dir/$fileName';

    try {
      var response = await http.get(Uri.parse(url));
      var file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      setState(() {
        localFilePath = filePath;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error downloading PDF: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(title: 'My Timetable'),
        preferredSize: Size(double.infinity, height * 9),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : localFilePath != null
                ? PDFView(
                    filePath: localFilePath!,
                    enableSwipe: true,
                    autoSpacing: false,
                    pageFling: false,
                    onRender: (pages) {
                      setState(() {});
                    },
                    onError: (error) {
                      print('Error opening PDF: $error');
                    },
                    onPageError: (page, error) {
                      print('Error loading page $page: $error');
                    },
                    onViewCreated: (PDFViewController controller) {},
                  )
                : Text('PDF file not found.'),
      ),
    );
  }
}
