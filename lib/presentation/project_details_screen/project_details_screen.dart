import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/color_constant.dart';
import 'package:project/core/utils/size_utils.dart';
import 'package:project/theme/custom_text_style.dart';
import 'package:project/widgets/custom_app_bar.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: const CustomAppBar(title: 'projectDetails',),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'establishmentText',
                style: CustomTextStyles.labelMediumOnPrimaryContainer
                    .copyWith(fontSize: 12.0.v),
              ).tr(),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 18,top: 18),
              margin:EdgeInsets.all(8.v) ,
              decoration: ShapeDecoration(
                color: ColorConstant.secondaryColor14368E27,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildInfoColumn("status", "Regular 3.76%"),
                  ),
                  Expanded(
                    child: _buildInfoColumn("actualDuration", "365 days"),
                  ),
                  Expanded(
                    child: _buildInfoColumn("value", "4,000,000 SAR"),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 18, top: 18),
              margin: EdgeInsets.all(8.v),
              decoration: ShapeDecoration(
                color: ColorConstant.primarySilverB3B3B3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoText('code',''),
                            _buildInfoText('startDate',''),
                            _buildInfoText('owner',''),

                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoText('type',''),
                            _buildInfoText('endDate',''),
                            _buildInfoText('contractor',''),
                          ],
                        ),
                      ),
                    ],
                  ),

                  _buildInfoText('executiveConsultant',''),

                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 18, top: 18),
              margin: EdgeInsets.all(8.v),
              decoration: ShapeDecoration(
                color: ColorConstant.primarySilverB3B3B3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: _buildInfoText('dueForPayment',''),
            )


          ],
        ),


      ),
    );
  }

  // Helper function to create each info column
  Widget _buildInfoColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style:  TextStyle(color: ColorConstant.secondaryColor368E27,fontSize: 12.v),
          overflow: TextOverflow.ellipsis, // or TextOverflow.clip
          maxLines: 1,
        ).tr(),
        SizedBox(height: 10.v,),
        Text(
          "value",
          style:  TextStyle(color: ColorConstant.secondaryColor368E27,fontSize: 12.v),
          overflow: TextOverflow.ellipsis, // or TextOverflow.clip
          maxLines: 1,
        ).tr(),
      ],
    );
  }

  Widget _buildInfoText(String label,String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.primaryColor,
              fontSize: 12.v,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ).tr(),
          SizedBox(width: 10.v,),
          Text(
            " : ",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.primaryColor,
              fontSize: 12.v,
            )
          ),
          Text(
            "value",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: ColorConstant.textColor,
              fontSize: 12.v,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }


}
