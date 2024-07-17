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
        required this.projectStops,
        required this.projectExtensions,
        required this.projectResum,
    });

    String msg;
    List<ProjectStatus> projectStatus;
    List<Project> projects;
    bool success;
    List<CatList> catList;
    List<Owner> owners;
    List<ProjectStop> projectStops;
    List<ProjectExtension> projectExtensions;
    List<ProjectResum> projectResum;

    factory Projects.fromJson(Map<dynamic, dynamic> json) => Projects(
        msg: json["msg"],
        projectStatus: json["projectStatus"] != null
            ? List<ProjectStatus>.from(json["projectStatus"].map((x) => ProjectStatus.fromJson(x)))
            : [],
        projects: json["projects"] != null
            ? List<Project>.from(json["projects"].map((x) => Project.fromJson(x)))
            : [],
        success: json["success"],
        catList: json["CatList"] != null
            ? List<CatList>.from(json["CatList"].map((x) => CatList.fromJson(x)))
            : [],
        owners: json["owners"] != null
            ? List<Owner>.from(json["owners"].map((x) => Owner.fromJson(x)))
            : [],
        projectStops: json["projectStops"] != null
            ? List<ProjectStop>.from(json["projectStops"].map((x) => ProjectStop.fromJson(x)))
            : [],
        projectExtensions: json["projectExtensions"] != null
            ? List<ProjectExtension>.from(json["projectExtensions"].map((x) => ProjectExtension.fromJson(x)))
            : [],
        projectResum: json["projectResum"] != null
            ? List<ProjectResum>.from(json["projectResum"].map((x) => ProjectResum.fromJson(x)))
            : [],
    );

    Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "projectStatus": List<dynamic>.from(projectStatus.map((x) => x.toJson())),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "success": success,
        "CatList": List<dynamic>.from(catList.map((x) => x.toJson())),
        "owners": List<dynamic>.from(owners.map((x) => x.toJson())),
        "projectStops": List<dynamic>.from(projectStops.map((x) => x.toJson())),
        "projectExtensions": List<dynamic>.from(projectExtensions.map((x) => x.toJson())),
        "projectResum": List<dynamic>.from(projectResum.map((x) => x.toJson())),
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
    int? contractDate;
    double? budgetedCosts;
    int? awardingDate;
    int? contractorId;
    String? contractNumber;
    double? totalDisbursementEtimad;
    String? mainProjectId;
    String? longLat;
    int? itemNo;
    int deptNo;
    String? financialYear;
    double? contractValue;
    int openingEnvelopesDate;
    int? awardingPartyId;
    int catNo;
    String? etimadPlatformRefNo;
    String? contractName;
    int? finishDate;
    int? projectId;
    int impPeriod;
    int? startDate;
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
        "descAr": descAr,
        "descEn": descEn,
    };
}

class ProjectStop {
    ProjectStop({
        required this.stopId,
        required this.projectId,
        required this.reason,
        required this.stopDate,
    });

    int stopId;
    int projectId;
    String reason;
    String stopDate;

    factory ProjectStop.fromJson(Map<dynamic, dynamic> json) => ProjectStop(
        stopId: json["stopId"],
        projectId: json["projectId"],
        reason: json["reason"],
        stopDate: json["stopDate"],
    );

    Map<dynamic, dynamic> toJson() => {
        "stopId": stopId,
        "projectId": projectId,
        "reason": reason,
        "stopDate": stopDate,
    };
}

class ProjectExtension {
    ProjectExtension({
        required this.extensionId,
        required this.projectId,
        required this.extensionReason,
        required this.extensionPeriod,
    });

    int extensionId;
    int projectId;
    String extensionReason;
    int extensionPeriod;

    factory ProjectExtension.fromJson(Map<dynamic, dynamic> json) => ProjectExtension(
        extensionId: json["extensionId"],
        projectId: json["projectId"],
        extensionReason: json["extensionReason"],
        extensionPeriod: json["extensionPeriod"],
    );

    Map<dynamic, dynamic> toJson() => {
        "extensionId": extensionId,
        "projectId": projectId,
        "extensionReason": extensionReason,
        "extensionPeriod": extensionPeriod,
    };
}

class ProjectResum {
    ProjectResum({
        required this.resumId,
        required this.projectId,
        required this.resumDate,
    });

    int resumId;
    int projectId;
    String resumDate;

    factory ProjectResum.fromJson(Map<dynamic, dynamic> json) => ProjectResum(
        resumId: json["resumId"],
        projectId: json["projectId"],
        resumDate: json["resumDate"],
    );

    Map<dynamic, dynamic> toJson() => {
        "resumId": resumId,
        "projectId": projectId,
        "resumDate": resumDate,
    };
}

// Helper class to manage enum values
class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
