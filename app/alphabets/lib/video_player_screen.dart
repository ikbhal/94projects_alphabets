

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
class VideoPlayerScreen extends StatelessWidget {
  final String youtubeEmbedCode = '''
    <html>
      <body>
        <iframe 
          width="100%" 
          height="100%" 
          src="https://www.youtube.com/embed/PEiR6_7kdVY" 
          frameborder="0" 
          allowfullscreen>
        </iframe>
      </body>
    </html>
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Container(
        child: InAppWebView(
          initialData: InAppWebViewInitialData(data: youtubeEmbedCode),
        ),
      ),
    );
  }
}
