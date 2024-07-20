import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/presentation/visit_detail_screen/image_view_screen.dart';
import 'package:project/presentation/visit_detail_screen/video_player_screen.dart';
import 'package:project/presentation/visits_to_project_screen/models/visits_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:project/widgets/custom_app_bar.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart'; // Import for InAppWebView
import 'package:project/core/utils/api_constants.dart';

class VisitDetailScreen extends StatefulWidget {
  final Visit visit;

  const VisitDetailScreen({Key? key, required this.visit}) : super(key: key);

  @override
  _VisitDetailScreenState createState() => _VisitDetailScreenState();
}

class _VisitDetailScreenState extends State<VisitDetailScreen> {


  @override
  Widget build(BuildContext context) {
    List<VisitDoc> docs = widget.visit.visitDoc;
    bool hasImages = docs.any((doc) => doc.fileName.endsWith('.jpeg') || doc.fileName.endsWith('.png'));
    bool hasVideos = docs.any((doc) => doc.fileName.endsWith('.mp4'));

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          title: 'visitDetail'.tr(),
          showMoreIcon: false, controller: null, project: null,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                margin: EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: ColorConstant.primarySilverB3B3B3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoText('visit_from'.tr(), widget.visit.visitFrom.toString()),
                    _buildInfoText('visit_to'.tr(), widget.visit.visitTo.toString()),
                    _buildInfoText('note'.tr(), widget.visit.note),
                    // Add more details as needed
                  ],
                ),
              ),
              if (hasImages || hasVideos)
                Container(
                padding: const EdgeInsets.all(14),
                margin: EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: ColorConstant.primarySilverB3B3B3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Documents',
                      style: TextStyle(
                        color: ColorConstant.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ).tr(),
                    const SizedBox(height: 10),
                    _buildDocumentsList(widget.visit.visitDoc),
                    // Add more details as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.primaryColor,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).tr(),
          SizedBox(
            width: 10,
          ),
          Text(" : ",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 12,
              )),
          Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.textColor,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentsList(List<VisitDoc> docs) {
    List<Widget> imageWidgets = [];
    List<Widget> videoWidgets = [];

    // Iterate through the documents list
    for (VisitDoc doc in docs) {
      if (doc.fileName.endsWith('.jpeg') || doc.fileName.endsWith('.png')) {
        imageWidgets.add(_buildDocumentWidget(doc));
      } else if (doc.fileName.endsWith('.mp4')) {
        videoWidgets.add(_buildDocumentWidget(doc));
      }
    }

    // Function to build rows of 2 columns
    List<Widget> _buildRows(List<Widget> widgets) {
      List<Widget> rows = [];
      for (int i = 0; i < widgets.length; i += 2) {
        Widget firstItem = widgets[i];
        Widget secondItem = i + 1 < widgets.length ? widgets[i + 1] : SizedBox.shrink();
        rows.add(
          Row(
            children: [
              Expanded(child: firstItem),
              Expanded(child: secondItem),
            ],
          ),
        );
      }
      return rows;
    }

    // Create the list of widgets to display
    List<Widget> documentWidgets = [];

    if (imageWidgets.isNotEmpty) {
      documentWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Images',
              style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
            const SizedBox(height: 10),
            ..._buildRows(imageWidgets),
          ],
        ),
      );
    }

    if (videoWidgets.isNotEmpty) {
      documentWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Videos',
              style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
            const SizedBox(height: 10),
            ..._buildRows(videoWidgets),
          ],
        ),
      );
    }

    // Return a column of document widgets
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: documentWidgets,
    );
  }

  Widget _buildDocumentWidget(VisitDoc doc) {
    String fullUrl = ApiConstants.apiUrlDoc + doc.fileName;

    if (doc.fileName.endsWith('.jpeg') || doc.fileName.endsWith('.png')) {
      return GestureDetector(
        onTap: () {
          _launchImage(fullUrl); // Launch image in a new screen
        },
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            fullUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(child: Icon(Icons.error));
            },
          ),
        ),
      );
    } else if (doc.fileName.endsWith('.mp4')) {
      return GestureDetector(
        onTap: () {
          _launchVideo(fullUrl); // Launch video in webview
        },
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(Icons.play_arrow, size: 50, color: Colors.blue),
        ),
      );
    } else {
      return SizedBox.shrink(); // Return an empty SizedBox if file type is not supported
    }
  }

  void _launchVideo(String url) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VideoPlayerScreen(videoUrl: url),
    ));
  }

  void _launchImage(String url) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ImageViewScreen(imageUrl: url),
    ));
  }
}

