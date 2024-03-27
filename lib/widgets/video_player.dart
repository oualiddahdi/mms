import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart'; // Import 'dart:io' for File class

// Other imports...

class VideoWidget extends StatefulWidget {
  final XFile video; // Change the type to XFile

  const VideoWidget({Key? key, required this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.video.path)) // Convert XFile to File
      ..initialize().then((_) {
        setState(() {}); // Update the state once video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey, // Placeholder color
      child: _controller.value.isInitialized
          ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )
          : Center(
        child: CircularProgressIndicator(), // Show loading indicator until video is initialized
      ),
    );
  }
}
