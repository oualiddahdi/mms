/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Projects projectsFromJson(String str) => Projects.fromJson(json.decode(str));

String projectsToJson(Projects data) => json.encode(data.toJson());

class Projects {
    Projects({
        required this.msg,
        required this.projectStatus,
        required this.projects,
        required this.success,
        required this.catList,
        required this.owners,
    });

    String msg;
    List<ProjectStatus> projectStatus;
    List<Project> projects;
    bool success;
    List<CatList> catList;
    List<Owner> owners;

    factory Projects.fromJson(Map<dynamic, dynamic> json) => Projects(
        msg: json["msg"],
        projectStatus: List<ProjectStatus>.from(json["projectStatus"].map((x) => ProjectStatus.fromJson(x))),
        projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
        success: json["success"],
        catList: List<CatList>.from(json["CatList"].map((x) => CatList.fromJson(x))),
        owners: List<Owner>.from(json["owners"].map((x) => Owner.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "projectStatus": List<dynamic>.from(projectStatus.map((x) => x.toJson())),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "success": success,
        "CatList": List<dynamic>.from(catList.map((x) => x.toJson())),
        "owners": List<dynamic>.from(owners.map((x) => x.toJson())),
    };
}

class CatList {
    CatList({
        required this.categoryName,
        required this.categoryId,
    });

    String categoryName;
    int categoryId;

    factory CatList.fromJson(Map<dynamic, dynamic> json) => CatList(
        categoryName: json["categoryName"],
        categoryId: json["categoryId"],
    );

    Map<dynamic, dynamic> toJson() => {
        "categoryName": categoryName,
        "categoryId": categoryId,
    };
}

class Owner {
    Owner({
        required this.mainDeptId,
        required this.deptName,
        required this.nameEng,
        required this.deptId,
        required this.deptCat,
        required this.deptCode,
    });

    int mainDeptId;
    String deptName;
    String nameEng;
    int deptId;
    int deptCat;
    String deptCode;

    factory Owner.fromJson(Map<dynamic, dynamic> json) => Owner(
        mainDeptId: json["mainDeptId"],
        deptName: json["deptName"],
        nameEng: json["nameEng"],
        deptId: json["deptId"],
        deptCat: json["deptCat"],
        deptCode: json["deptCode"],
    );

    Map<dynamic, dynamic> toJson() => {
        "mainDeptId": mainDeptId,
        "deptName": deptName,
        "nameEng": nameEng,
        "deptId": deptId,
        "deptCat": deptCat,
        "deptCode": deptCode,
    };
}

class ProjectStatus {
    ProjectStatus({
        required this.statusId,
        required this.statusName,
    });

    int statusId;
    String statusName;

    factory ProjectStatus.fromJson(Map<dynamic, dynamic> json) => ProjectStatus(
        statusId: json["statusId"],
        statusName: json["statusName"],
    );

    Map<dynamic, dynamic> toJson() => {
        "statusId": statusId,
        "statusName": statusName,
    };
}

class Project {
    Project({
        this.note,
        required this.contractDate,
        required this.budgetedCosts,
        required this.awardingDate,
        required this.contractorId,
        required this.contractNumber,
        required this.totalDisbursementEtimad,
        required this.mainProjectId,
        required this.longLat,
        required this.itemNo,
        required this.deptNo,
        required this.financialYear,
        required this.contractValue,
        required this.openingEnvelopesDate,
        required this.awardingPartyId,
        required this.catNo,
        required this.etimadPlatformRefNo,
        required this.contractName,
        required this.finishDate,
        required this.projectId,
        required this.impPeriod,
        required this.startDate,
        required this.projectStatusId,
        this.descAr,
        this.descEn,
    });

    String? note;
    String contractDate;
    double budgetedCosts;
    String awardingDate;
    int contractorId;
    String contractNumber;
    double totalDisbursementEtimad;
    String mainProjectId;
    String longLat;
    int itemNo;
    int deptNo;
    String financialYear;
    double contractValue;
    String openingEnvelopesDate;
    int awardingPartyId;
    int catNo;
    String etimadPlatformRefNo;
    String contractName;
    String finishDate;
    int projectId;
    int impPeriod;
    String startDate;
    int projectStatusId;
    String? descAr;
    String? descEn;

    factory Project.fromJson(Map<dynamic, dynamic> json) => Project(
        note: json["note"] ?? "", // Provide an empty string as default if note is null
        contractDate: json["contractDate"] ?? "",
        budgetedCosts: json["budgetedCosts"] ?? 0.0, // Provide 0.0 as default if budgetedCosts is null
        awardingDate: json["awardingDate"] ?? "",
        contractorId: json["contractorId"] ?? 0, // Provide 0 as default if contractorId is null
        contractNumber: json["contractNumber"] ?? "",
        totalDisbursementEtimad: json["totalDisbursementEtimad"] ?? 0.0,
        mainProjectId: json["mainProjectId"] ?? "",
        longLat: json["longLat"] ?? "",
        itemNo: json["itemNo"] ?? 0,
        deptNo: json["deptNo"] ?? 0,
        financialYear: json["financialYear"] ?? "",
        contractValue: json["contractValue"] ?? 0.0,
        openingEnvelopesDate: json["openingEnvelopesDate"] ?? "",
        awardingPartyId: json["awardingPartyId"] ?? 0,
        catNo: json["catNo"] ?? 0,
        etimadPlatformRefNo: json["etimadPlatformRefNo"] ?? "",
        contractName: json["contractName"] ?? "",
        finishDate: json["finishDate"] ?? "",
        projectId: json["projectId"] ?? 0,
        impPeriod: json["impPeriod"] ?? 0,
        startDate: json["startDate"] ?? "",
        projectStatusId: json["projectStatusId"] ?? 0,
        descAr: json["descAr"] ?? "", // Provide an empty string as default if descAr is null
        descEn: json["descEn"] ?? "", // Provide an empty string as default if descEn is null
    );


    Map<dynamic, dynamic> toJson() => {
        "note": note,
        "contractDate": contractDate,
        "budgetedCosts": budgetedCosts,
        "awardingDate": awardingDate,
        "contractorId": contractorId,
        "contractNumber": contractNumber,
        "totalDisbursementEtimad": totalDisbursementEtimad,
        "mainProjectId": mainProjectId,
        "longLat": longLat,
        "itemNo": itemNo,
        "deptNo": deptNo,
        "financialYear": financialYear,
        "contractValue": contractValue,
        "openingEnvelopesDate": openingEnvelopesDate,
        "awardingPartyId": awardingPartyId,
        "catNo": catNo,
        "etimadPlatformRefNo": etimadPlatformRefNo,
        "contractName": contractName,
        "finishDate": finishDate,
        "projectId": projectId,
        "impPeriod": impPeriod,
        "startDate": startDate,
        "projectStatusId": projectStatusId,
        "descAr": descArValues.reverse[descAr],
        "descEn": descEnValues.reverse[descEn],
    };
}

enum DescAr { EMPTY }

final descArValues = EnumValues({
    "وصف المشروع عربي": DescAr.EMPTY
});

enum DescEn { EMPTY }

final descEnValues = EnumValues({
    "وصف المشروع انكليزي": DescEn.EMPTY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
