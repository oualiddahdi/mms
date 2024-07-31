/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        required this.success,
        required this.profile,
    });

    bool success;
    Profile profile;

    factory ProfileModel.fromJson(Map<dynamic, dynamic> json) => ProfileModel(
        success: json["success"],
        profile: Profile.fromJson(json["profile"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "success": success,
        "profile": profile.toJson(),
    };
}

class Profile {
    Profile({
        required this.lastName,
        required this.employeeEname,
        required this.mobileNumber,
        required this.titleId,
        required this.birthDate,
        required this.wrkSectionId,
        required this.isActive,
        required this.idNumber,
        required this.wrkRoleId,
        required this.password,
        required this.passwordChanged,
        required this.profileImageName,
        required this.loginName,
        required this.familyName,
        required this.email,
        required this.employeeName,
        required this.mgrId,
        required this.userDept,
        required this.hasMobile,
        required this.deptId,
        required this.userLastUpdate,
        required this.relatedParty,
        required this.userId,
        required this.isMngr,
        required this.firstName,
        required this.jobId,
        required this.birthDatee,
        required this.wrkSection,
        required this.relatedPartyId,
        required this.userRoleId,
    });

    String lastName;
    String employeeEname;
    String mobileNumber;
    int titleId;
    int birthDate;
    int wrkSectionId;
    bool isActive;
    String idNumber;
    int wrkRoleId;
    String password;
    bool passwordChanged;
    String profileImageName;
    String loginName;
    String familyName;
    String email;
    String employeeName;
    int mgrId;
    UserDept userDept;
    int hasMobile;
    int deptId;
    int userLastUpdate;
    int relatedParty;
    int userId;
    bool isMngr;
    String firstName;
    int jobId;
    String birthDatee;
    WrkSection wrkSection;
    int relatedPartyId;
    int userRoleId;

    factory Profile.fromJson(Map<dynamic, dynamic> json) => Profile(
        lastName: json["lastName"],
        employeeEname: json["employeeEname"],
        mobileNumber: json["mobileNumber"],
        titleId: json["titleId"],
        birthDate: json["birth_date"],
        wrkSectionId: json["wrkSectionId"],
        isActive: json["isActive"],
        idNumber: json["idNumber"],
        wrkRoleId: json["wrkRoleId"],
        password: json["password"],
        passwordChanged: json["passwordChanged"],
        profileImageName: json["profileImageName"],
        loginName: json["loginName"],
        familyName: json["familyName"],
        email: json["email"],
        employeeName: json["employeeName"],
        mgrId: json["mgrId"],
        userDept: UserDept.fromJson(json["userDept"]),
        hasMobile: json["hasMobile"],
        deptId: json["deptId"],
        userLastUpdate: json["userLastUpdate"],
        relatedParty: json["relatedParty"],
        userId: json["userId"],
        isMngr: json["isMngr"],
        firstName: json["firstName"],
        jobId: json["jobId"],
        birthDatee: json["birth_datee"],
        wrkSection: WrkSection.fromJson(json["wrkSection"]),
        relatedPartyId: json["relatedPartyId"],
        userRoleId: json["userRoleId"],
    );

    Map<dynamic, dynamic> toJson() => {
        "lastName": lastName,
        "employeeEname": employeeEname,
        "mobileNumber": mobileNumber,
        "titleId": titleId,
        "birth_date": birthDate,
        "wrkSectionId": wrkSectionId,
        "isActive": isActive,
        "idNumber": idNumber,
        "wrkRoleId": wrkRoleId,
        "password": password,
        "passwordChanged": passwordChanged,
        "profileImageName": profileImageName,
        "loginName": loginName,
        "familyName": familyName,
        "email": email,
        "employeeName": employeeName,
        "mgrId": mgrId,
        "userDept": userDept.toJson(),
        "hasMobile": hasMobile,
        "deptId": deptId,
        "userLastUpdate": userLastUpdate,
        "relatedParty": relatedParty,
        "userId": userId,
        "isMngr": isMngr,
        "firstName": firstName,
        "jobId": jobId,
        "birth_datee": birthDatee,
        "wrkSection": wrkSection.toJson(),
        "relatedPartyId": relatedPartyId,
        "userRoleId": userRoleId,
    };
}

class UserDept {
    UserDept({
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

    factory UserDept.fromJson(Map<dynamic, dynamic> json) => UserDept(
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

class WrkSection {
    WrkSection({
        required this.sectionName,
        required this.deptId,
        required this.id,
    });

    String sectionName;
    int deptId;
    int id;

    factory WrkSection.fromJson(Map<dynamic, dynamic> json) => WrkSection(
        sectionName: json["sectionName"],
        deptId: json["deptId"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "sectionName": sectionName,
        "deptId": deptId,
        "id": id,
    };
}
