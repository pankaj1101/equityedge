import 'package:flutter/material.dart';

class VideoListView extends StatelessWidget {
  final List<String> videoUrls;

  const VideoListView({super.key, required this.videoUrls});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: videoUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          width: 200.0, // Adjust width as needed
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Here you can display the video, for example using a network image or video player
                Image.network(
                  videoUrls[index], // Assuming videoUrls contain the URLs of video thumbnails
                  fit: BoxFit.cover,
                  height: 120.0, // Adjust height as needed
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Video Title ${index + 1}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // You can add more details about the video here
              ],
            ),
          ),
        );
      },
    );
  }
}
