import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Replace 'assets/sample_video.mp4' with the path to your video
    _controller = VideoPlayerController.network(
        'https://www.vecteezy.com/video/7387048-camera-moves-along-medical-cannabis-plants-grown-under-controlled-conditions-in-large-greenhouses-production-of-alternative-herbal-medicines-and-cbd-oil')
      ..initialize().then((_) {
        setState(
            () {}); // Ensures the first frame is shown after the video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title text

            SizedBox(height: 16),
            // Video section
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(
                    height: 200,
                    color: Colors.black,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            SizedBox(height: 16),
            // White container with text
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris. Curabitur consectetur nisl ac massa placerat, ac convallis mauris pulvinar. Nulla facilisi. '
                    'Donec in ligula ut urna vulputate scelerisque sit amet et tortor. Vivamus vestibulum tellus vel diam efficitur, sed dignissim nulla dapibus.'
                    'Donec in ligula ut urna vulputate scelerisque sit amet et tortor. Vivamus vestibulum tellus vel diam efficitur, sed dignissim nulla dapibus.'
                    'Donec in ligula ut urna vulputate scelerisque sit amet et tortor. Vivamus vestibulum tellus vel diam efficitur, sed dignissim nulla dapibus.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    textAlign: TextAlign.justify,
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