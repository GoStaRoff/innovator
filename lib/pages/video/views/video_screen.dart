import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  const VideoScreen({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  var _chewieController;

  initPlayer() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    VideoPlayerController videoPlayerController =
        new VideoPlayerController.network(widget.videoUrl);
    await videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      showControls: true,
      autoInitialize: true,
      customControls: const CupertinoControls(
        iconColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      placeholder: Container(
        color: Colors.black,
      ),
      looping: false,
      allowFullScreen: false,
      fullScreenByDefault: false,
      showControlsOnInitialize: false,
      allowPlaybackSpeedChanging: false,
    );
    setState(() {});
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    if (_chewieController.videoPlayerController != null) {
      try {
        _chewieController.videoPlayerController.dispose();
      } catch (e) {}
    }
    if (_chewieController != null) {
      try {
        _chewieController.dispose();
      } catch (e) {}
    }

    super.dispose();
  }

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Container(
            color: Colors.black,
            height: Get.height,
            width: Get.width,
            child: Center(
              child: _chewieController != null
                  ? Chewie(
                      controller: _chewieController,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: VIOLET_COLOR,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
