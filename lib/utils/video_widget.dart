library flutter_common_modules;

import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

// ignore: must_be_immutable
class VideoWidget extends StatefulWidget {
  String? url;
  int? playingIndex;
  int? index;
  VoidCallback onPressed;
  VideoWidget(
      {super.key,
      required this.url,
      required this.index,
      required this.playingIndex,
      required this.onPressed});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController videoPlayerController;

  late ChewieController chewieController;

  bool isPortrait = true;

  bool isLoading = true;

  double? height;

  double? width;

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  videoInitialize() async {
    // ignore: deprecated_member_use
    videoPlayerController = VideoPlayerController.network(widget.url!);
    print(">>>#${widget.url}");
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      showOptions: false,
      allowMuting: false,
      showControlsOnInitialize: false,
    );

    setState(() {});
    isLoading = false;
  }

// Create a thumbnail for a non-playing video
  Future<String>? generateThumbnail(url) async {
    final uint8list = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
    );
    return uint8list!;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return FutureBuilder<String>(
        future: generateThumbnail(widget.url),
        builder: (ctx, snapshot) {
          List<Widget> children;
          // checks thumbnail does available
          if (snapshot.hasData) {
            children = <Widget>[
              // If Index and PlayingIndex is matched it displays video player
              // otherwise it will display thumnail
              widget.playingIndex == widget.index &&
                      isLoading == false &&
                      videoPlayerController != null &&
                      videoPlayerController.value.isInitialized
                  ? Expanded(
                      child: Chewie(
                        controller: chewieController,
                      ),
                    )
                  : Expanded(
                      child: Stack(alignment: Alignment.center, children: [
                        Image.file(File(snapshot.data!)),
                        Center(
                          child:
                              !isLoading && widget.playingIndex == widget.index
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.play_circle_fill),
                                      onPressed: () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        videoInitialize();
                                        widget.onPressed();
                                      },
                                      color: Colors.white,
                                      iconSize: 50.0,
                                    ),
                        ),
                      ]),
                    )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[Text("Error : ${snapshot.error}")];
          } else {
            // if there is no thumbnail it will display shimmer effect
            children = <Widget>[
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}
