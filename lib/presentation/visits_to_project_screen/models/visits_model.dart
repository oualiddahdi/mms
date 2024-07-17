/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

VisitsModel visitsModelFromJson(String str) => VisitsModel.fromJson(json.decode(str));

String visitsModelToJson(VisitsModel data) => json.encode(data.toJson());

class VisitsModel {
    VisitsModel({
        required this.msg,
        required this.visits,
        required this.success,
    });

    String msg;
    List<Visit> visits;
    bool success;

    factory VisitsModel.fromJson(Map<dynamic, dynamic> json) => VisitsModel(
        msg: json["msg"],
        visits: List<Visit>.from(json["visits"].map((x) => Visit.fromJson(x))),
        success: json["success"],
    );

    Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "visits": List<dynamic>.from(visits.map((x) => x.toJson())),
        "success": success,
    };
}

class Visit {
    Visit({
        required this.visitFrom,
        required this.note,
        required this.visitTo,
        required this.id,
        required this.projId,
        required this.visitDoc,
    });

    DateTime visitFrom;
    String note;
    DateTime visitTo;
    int id;
    int projId;
    List<VisitDoc> visitDoc;

    factory Visit.fromJson(Map<dynamic, dynamic> json) => Visit(
        visitFrom: DateTime.parse(json["visitFrom"]),
        note: json["note"],
        visitTo: DateTime.parse(json["visitTo"]),
        id: json["id"],
        projId: json["proj_id"],
        visitDoc: List<VisitDoc>.from(json["visitDoc"].map((x) => VisitDoc.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "visitFrom": visitFrom.toIso8601String(),
        "note": note,
        "visitTo": visitTo.toIso8601String(),
        "id": id,
        "proj_id": projId,
        "visitDoc": List<dynamic>.from(visitDoc.map((x) => x.toJson())),
    };
}

class VisitDoc {
    VisitDoc({
        required this.fileName,
        required this.visitId,
        required this.id,
    });

    String fileName;
    int visitId;
    int id;

    factory VisitDoc.fromJson(Map<dynamic, dynamic> json) => VisitDoc(
        fileName: json["fileName"],
        visitId: json["visitId"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "fileName": fileName,
        "visitId": visitId,
        "id": id,
    };
}
