// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewScreen extends StatelessWidget {
//   String url;
//   WebViewScreen({super.key, required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return WebViewWidget(

//       initialUrl: 'https://docs.google.com/gview?embedded=true&url=${url}',
//       javascriptMode: JavascriptMode.unrestricted,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:notes_trove/Common/Widgets/app_bar.dart';
import 'package:notes_trove/Screens/chat_bot_screen/threedots.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  static const routeName = 'web-view-screen';
  final String title;
  final String url;
  WebViewScreen({super.key, required this.url, required this.title});
  // WebViewController controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setBackgroundColor(const Color(0x00000000))
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {},
  //       onWebResourceError: (WebResourceError error) {},
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.startsWith(
  //         '',
  //         )) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(Uri.parse('https://docs.google.com/gview?embedded=true&url=${url}'));
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            CircularProgressIndicator();
          },
          onPageStarted: (String url) {
            Center(
              child: ThreeDots(),
            );
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
              '',
            )) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse('https://docs.google.com/gview?embedded=true&url=${url}'));
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: PreferredSize(
        child: AppBarWidget(title: title),
        preferredSize: Size(
          double.infinity,
          height * 9,
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
