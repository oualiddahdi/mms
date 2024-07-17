/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

VisitTypeModel visitTypeModelFromJson(String str) => VisitTypeModel.fromJson(json.decode(str));

String visitTypeModelToJson(VisitTypeModel data) => json.encode(data.toJson());

class VisitTypeModel {
    VisitTypeModel({
        required this.msg,
        required this.success,
        required this.visitType,
    });

    String msg;
    bool success;
    List<VisitType> visitType;

    factory VisitTypeModel.fromJson(Map<dynamic, dynamic> json) => VisitTypeModel(
        msg: json["msg"],
        success: json["success"],
        visitType: List<VisitType>.from(json["visitType"].map((x) => VisitType.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "success": success,
        "visitType": List<dynamic>.from(visitType.map((x) => x.toJson())),
    };
}

class VisitType {
    VisitType({
        required this.nameAr,
        required this.id,
        required this.nameEn,
    });

    String nameAr;
    int id;
    String nameEn;

    factory VisitType.fromJson(Map<dynamic, dynamic> json) => VisitType(
        nameAr: json["nameAr"],
        id: json["id"],
        nameEn: json["nameEn"],
    );

    Map<dynamic, dynamic> toJson() => {
        "nameAr": nameAr,
        "id": id,
        "nameEn": nameEn,
    };
}
