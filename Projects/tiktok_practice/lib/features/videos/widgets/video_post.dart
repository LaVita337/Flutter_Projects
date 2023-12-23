import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:TikTok/constants/gaps.dart';
import 'package:TikTok/constants/sizes.dart';
import 'package:TikTok/features/videos/widgets/video_comments.dart';
import 'package:TikTok/features/videos/widgets/video_sideButton.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;
  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video1.mp4");

  late final AnimationController _animationController;

  bool _showFullText = false;

  bool _isPaused = false;

  final Duration _animationDuration = const Duration(milliseconds: 100);

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const VideoComments(),
    );
    _onTogglePause();
  }

  void _onTextTap() {
    setState(() {
      _showFullText = !_showFullText;
    });
  }

  void _onVideoChanged() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChanged);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    const String originalText =
        "#Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: VisibilityDetector(
        key: Key("${widget.index}"),
        onVisibilityChanged: _onVisibilityChanged,
        child: Stack(
          children: [
            Positioned.fill(
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Container(
                      color: Colors.black54,
                    ),
            ),
            Positioned.fill(
              child: GestureDetector(
                onTap: _onTogglePause,
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animationController.value,
                        child: child,
                      );
                    },
                    child: AnimatedOpacity(
                        opacity: _isPaused ? 1 : 0,
                        duration: _animationDuration,
                        child: _isPaused
                            ? const FaIcon(
                                FontAwesomeIcons.play,
                                color: Colors.white,
                                size: Sizes.size56,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.pause,
                                color: Colors.white,
                                size: Sizes.size56,
                              )),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              right: 100,
              bottom: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "@Username",
                    style: TextStyle(
                        fontSize: Sizes.size20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Gaps.v14,
                  const Text(
                    "Where users leave their comment",
                    style:
                        TextStyle(fontSize: Sizes.size16, color: Colors.white),
                  ),
                  Gaps.v10,
                  Wrap(
                    children: [
                      Text(
                        _showFullText
                            ? originalText
                            : (originalText.length > 25
                                ? "${originalText.substring(0, 25)}..."
                                : originalText),
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (originalText.length > 25)
                        GestureDetector(
                          onTap: _onTextTap,
                          child: Text(
                            _showFullText ? "See less" : "See more",
                            style: const TextStyle(
                              fontSize: Sizes.size14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Gaps.v14,
                  const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.music,
                          size: Sizes.size20, color: Colors.white),
                      Gaps.h10,
                      Text(
                        "Text Moving",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 30,
              child: Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circlePlus,
                    color: Theme.of(context).primaryColor,
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/107906605?v=4"),
                    child: Text("Edit"),
                  ),
                  const VideoButton(
                      icon: FontAwesomeIcons.solidHeart, text: "2.9M"),
                  GestureDetector(
                    onTap: () => _onCommentsTap(context),
                    child: const VideoButton(
                        icon: FontAwesomeIcons.solidMessage, text: "Message"),
                  ),
                  const VideoButton(
                      icon: FontAwesomeIcons.share, text: "Share"),
                  const VideoButton(
                    icon: FontAwesomeIcons.music,
                    text: "Music",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
