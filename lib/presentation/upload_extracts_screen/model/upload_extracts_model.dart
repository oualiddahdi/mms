import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
@JsonSerializable()
class UploadExtractsModel {
  final String name;
  final int age;

  UploadExtractsModel({required this.name, required this.age});
}
