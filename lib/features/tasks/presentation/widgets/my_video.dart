import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideo extends StatefulWidget {
  const MyVideo({Key? key}) : super(key: key);

  @override
  State<MyVideo> createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://media.istockphoto.com/id/1212037183/video/american-robin-chirping-and-making-call-sound-up-a-branch.mp4?s=mp4-640x640-is&k=20&c=AsycmkaXyDEeSKLPBbeGnOaS2Ke944aqF_p1yBBSSVM='
      // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
      // 'https://media.istockphoto.com/id/1455772765/video/waterfall-with-fresh-water-in-the-romantic-and-idyllic-tropical-jungle-rainforest-blue.mp4?s=mp4-640x640-is&k=20&c=-ufHs0M4TG0HCyntsf3RwpHP08EEtAlSv8APcZe6Ciw='
    ));
    initializeVideoPlayerFuture = controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                    child: Text("Qandaydir muammo yuzaga keldi"),
                  );
                }
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  controller.seekTo(
                    controller.value.position - const Duration(seconds: 2),
                  );
                },
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () {
                  controller.setLooping(false);
                  controller.seekTo(
                    const Duration(seconds: 0),
                  );
                },
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {
                  controller.seekTo(
                    controller.value.position + const Duration(seconds: 2),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      controller.value.isPlaying
                          ? controller.pause()
                          : controller.play();
                    });
                  },
                  icon: Icon(
                    controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    controller.setVolume(
                      controller.value.volume + 5,
                    );
                  });

                },
                icon: const Icon(Icons.add),
              ),
              Text("${controller.value.volume * 100}",style: const TextStyle(fontSize: 20),),
              IconButton(
                onPressed: () {
                  setState(() {
                    controller.setVolume(
                      controller.value.volume - 5,
                    );
                  });
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}