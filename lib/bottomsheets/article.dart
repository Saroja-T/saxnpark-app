import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../pages/landing_page.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../utils/video_widget.dart';

showArticleBottomSheet(context,title,isWebView) {
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  UniqueKey _key = UniqueKey();
  var controller1 = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://skeintech.com/'));
  controller = scaffoldKey.currentState!.showBottomSheet((_) => Container(
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: isWebView?MediaQuery.of(context).size.height * 0.8:MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                    child: Text(Strings.buttonCloseText,
                                        style: TextStyle(
                                            color: AppColors.black5,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    })),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: AppColors.black2,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.grey4,
                    ),
                    isWebView?
                    Expanded(
                      child: WebViewWidget(
                        key: _key,
                        gestureRecognizers: gestureRecognizers,
                        controller: controller1,
                      ),
                    ):
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        width: 300,
                        child: VideoWidget(
                          url:
                              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                          index: 0,
                          playingIndex: 0,
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ));
}
