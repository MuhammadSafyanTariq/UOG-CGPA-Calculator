import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:notes_trove/Common/Widgets/app_bar.dart';
import 'package:notes_trove/Common/global_variables.dart';
import 'package:notes_trove/utils/colors.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:file_picker/file_picker.dart';

class TimeTableScreen extends StatefulWidget {
  static const routeName = 'time-table-screen';
  final String pdfUrl;

  const TimeTableScreen({Key? key, required this.pdfUrl}) : super(key: key);

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

  Future<void> selectAndUploadPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        setState(() {
          isLoading = true;
          localFilePath = filePath;
        });

        try {
          // Perform upload operation using the filePath
          // ...
          // Once upload is complete, set isLoading to false
          setState(() {
            isLoading = false;
          });
        } catch (error) {
          setState(() {
            isLoading = false;
          });
          print('Error uploading PDF: $error');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 9),
        child: AppBarWidget(title: 'My Timetable'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
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
                : const Text('PDF file not found.'),
      ),
      floatingActionButton: isItAdminMode
          ? FloatingActionButton(
              onPressed: selectAndUploadPDF,
              child: Icon(Icons.upload_file),
              backgroundColor: MyColors().primaryColor,
            )
          : null,
    );
  }
}
