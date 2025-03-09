// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icraft_project/models/news_feed/stories_model.dart';
import 'package:icraft_project/models/news_feed/user_story.dart';

class Stories extends StatefulWidget {
  final List<Story> stories;
  final String userId;
  final String userImg;
  final userStory user_story;

  const Stories({
    Key? key,
    required this.user_story,
    required this.userImg,
    required this.userId,
    required this.stories,
  }) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> with SingleTickerProviderStateMixin {
  PageController? _pageController;
  AnimationController? _animationController;
  //VideoPlayerController? _videoPlayerController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
    );
    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animatedToPage: false);
    // _videoPlayerController =
    //     VideoPlayerController.network(widget.stories[2].url)
    //       ..initialize().then((value) => setState(() {}));
    // _videoPlayerController!.play();
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController!.stop();
        //  _animationController!.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            Navigator.of(context).pop();
            // _currentIndex = 0;
            // _loadStory(story: widget.stories[_currentIndex]);
          }
        });
      }
    });
  }

  // @override
  // void dispose() {
  // ignore: todo
  //   // TODO: implement dispose
  //   super.dispose();
  //   _pageController?.dispose();
  //   if (_animationController!.isAnimating) {
  //     _animationController?.stop();
  //     _animationController?.dispose();
  //   }
  //   _videoPlayerController?.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: widget.stories.length,
              itemBuilder: (context, i) {
                final Story story = widget.stories[i];
                switch (story.media) {
                  case MediaType.image:
                    return CachedNetworkImage(
                      imageUrl: story.url,
                      fit: BoxFit.cover,
                    );

                  // case MediaType.video:
                  //   if (_videoPlayerController != null &&
                  //       _videoPlayerController!.value.isInitialized) {
                  //     return FittedBox(
                  //       fit: BoxFit.cover,
                  //       child: SizedBox(
                  //         width: _videoPlayerController!.value.size.width,
                  //         height: _videoPlayerController!.value.size.height,
                  //         child: VideoPlayer(_videoPlayerController!),
                  //       ),
                  //     );
                  //   }
                  case MediaType.video:
                    // ignore: todo
                    // TODO: Handle this case.
                    break;
                }
                return const SizedBox.shrink();
              },
            ),
            Positioned(
                top: 40.0,
                left: 10.0,
                right: 10.0,
                child: Column(
                  children: [
                    Row(
                      children: widget.stories
                          .asMap()
                          .map((i, e) {
                            return MapEntry(
                              i,
                              AnimatedBar(
                                animController: _animationController!,
                                currentIndex: _currentIndex,
                                position: i,
                              ),
                            );
                          })
                          .values
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1.5,
                        vertical: 10.0,
                      ),
                      child: UserInfo(
                        animationController: _animationController!,
                        user: widget.user_story,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          // out of bounds -loop story
//you also use Navigator.of(context).pop() here
          // _currentIndex = 0;
          // _loadStory(story: widget.stories[_currentIndex]);
          _animationController!.stop();
          Navigator.of(context).pop();
        }
      });
    } else {
      // if (story.media == MediaType.video) {
      //   if (_videoPlayerController!.value.isPlaying) {
      //     _videoPlayerController!.pause();
      //     _animationController!.stop();
      //   } else {
      //     _videoPlayerController!.play();
      //     _animationController!.forward();
      //   }
      // }
    }
  }

  void _loadStory({required Story story, bool animatedToPage = true}) {
    _animationController!.stop();
    _animationController!.reset();
    switch (story.media) {
      case MediaType.image:
        _animationController!.duration = story.duration;
        _animationController!.forward();
        break;
      // case MediaType.video:
      //   _videoPlayerController = null;
      //   _videoPlayerController?.dispose();
      //   _videoPlayerController = VideoPlayerController.network(story.url)
      //     ..initialize().then((_) {
      //       setState(() {});
      //       if (_videoPlayerController!.value.isInitialized) {
      //         _animationController!.duration =
      //             _videoPlayerController!.value.duration;
      //         _videoPlayerController!.play();
      //         _animationController!.forward();
      //       }
      //     });
      //   break;
      case MediaType.video:
        // ignore: todo
        // TODO: Handle this case.
        break;
    }
    if (animatedToPage) {
      _pageController!.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    required this.animController,
    required this.position,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  //final User user;
  final AnimationController animationController;
  final userStory user;

  const UserInfo({
    required this.user,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.grey[300],
            backgroundImage: AssetImage(
              user.imgUrl,
            )),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            user.userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {
            animationController.stop();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
