/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

WorkItems workItemsFromJson(String str) => WorkItems.fromJson(json.decode(str));

String workItemsToJson(WorkItems data) => json.encode(data.toJson());

class WorkItems {
    WorkItems({
        required this.msg,
        required this.success,
        required this.workItems,
    });

    String msg;
    bool success;
    List<WorkItem> workItems;

    factory WorkItems.fromJson(Map<dynamic, dynamic> json) => WorkItems(
        msg: json["msg"],
        success: json["success"],
        workItems: List<WorkItem>.from(json["workItems"].map((x) => WorkItem.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "success": success,
        "workItems": List<dynamic>.from(workItems.map((x) => x.toJson())),
    };
}

class WorkItem {
    WorkItem({
        required this.unitPrice,
        required this.projId,
        required this.updateDate,
        required this.itemEn,
        required this.quantity,
        required this.notes,
        required this.unitOfMeasure,
        required this.addedBy,
        required this.addDate,
        required this.remaining,
        required this.isDelivered,
        required this.total,
        required this.workType,
        required this.paid,
        required this.id,
        required this.itemAr,
    });

    int unitPrice;
    int projId;
    String updateDate;
    String itemEn;
    int quantity;
    String notes;
    UnitOfMeasure unitOfMeasure;
    String addedBy;
    String addDate;
    int remaining;
    bool isDelivered;
    int total;
    UnitOfMeasure workType;
    int paid;
    int id;
    String itemAr;

    factory WorkItem.fromJson(Map<dynamic, dynamic> json) => WorkItem(
        unitPrice: json["unitPrice"],
        projId: json["projId"],
        updateDate: json["updateDate"],
        itemEn: json["itemEn"],
        quantity: json["quantity"],
        notes: json["notes"],
        unitOfMeasure: UnitOfMeasure.fromJson(json["unitOfMeasure"]),
        addedBy: json["addedBy"],
        addDate: json["addDate"],
        remaining: json["remaining"],
        isDelivered: json["isDelivered"],
        total: json["total"],
        workType: UnitOfMeasure.fromJson(json["workType"]),
        paid: json["paid"],
        id: json["id"],
        itemAr: json["itemAr"],
    );

    Map<dynamic, dynamic> toJson() => {
        "unitPrice": unitPrice,
        "projId": projId,
        "updateDate": updateDate,
        "itemEn": itemEn,
        "quantity": quantity,
        "notes": notes,
        "unitOfMeasure": unitOfMeasure.toJson(),
        "addedBy": addedBy,
        "addDate": addDate,
        "remaining": remaining,
        "isDelivered": isDelivered,
        "total": total,
        "workType": workType.toJson(),
        "paid": paid,
        "id": id,
        "itemAr": itemAr,
    };
}

class UnitOfMeasure {
    UnitOfMeasure({
        required this.name,
        required this.id,
    });

    String name;
    String id;

    factory UnitOfMeasure.fromJson(Map<dynamic, dynamic> json) => UnitOfMeasure(
        name: json["name"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
