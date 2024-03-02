import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoList extends StatefulWidget {
  final TextStyle textStyle;

  const VideoList({Key? key, required this.textStyle}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final _videoIds = [
    {
      "key": 'rMbATaj7Il8',
      "title": 'ZET Basics',
    },
    {
      "key": 'DPL_SV3n7IU',
      "title": 'Learn How to Sell',
    },
    {
      "key": 'jhdFe3evXpk',
      "title": 'Grow Your Customer Base',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _videoIds.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              YoutubePlayer(
                aspectRatio: 16 / 8, // Change the aspect ratio here
                controller: YoutubePlayerController(
                  initialVideoId: _videoIds[index]['key']!,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                ),
                actionsPadding: const EdgeInsets.only(left: 16.0),
                bottomActions: [
                  CurrentPosition(),
                  const SizedBox(width: 10.0),
                  ProgressBar(isExpanded: true),
                  const SizedBox(width: 10.0),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              ),
              SizedBox(height: 20),
              Text(
                _videoIds[index]['title']!,
                style: widget.textStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}
