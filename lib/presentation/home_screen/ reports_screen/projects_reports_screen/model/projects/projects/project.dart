import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class Project {
  final int? projectId;
  final String? contractNumber;
  final String? contractName;
  final double? contractValue;
  final double? budgetedCosts;
  final int? itemNo;
  final String? contractDate;
  final String? mainProjectId;
  final int? contractorId;
  final int? impPeriod;
  final String? startDate;
  final String? finishDate;
  final int? catNo;
  final int? deptNo;
  final String? financialYear;
  final String? openingEnvelopesDate;
  final int? awardingPartyId;
  final String? awardingDate;
  final String? etimadPlatformRefNo;
  final double? totalDisbursementEtimad;
  final String? longLat;
  final String? note;
  final int? projectStatusId;

  const Project({
    this.projectId,
    this.contractNumber,
    this.contractName,
    this.contractValue,
    this.budgetedCosts,
    this.itemNo,
    this.contractDate,
    this.mainProjectId,
    this.contractorId,
    this.impPeriod,
    this.startDate,
    this.finishDate,
    this.catNo,
    this.deptNo,
    this.financialYear,
    this.openingEnvelopesDate,
    this.awardingPartyId,
    this.awardingDate,
    this.etimadPlatformRefNo,
    this.totalDisbursementEtimad,
    this.longLat,
    this.note,
    this.projectStatusId,
  });

  // تحويل كائن Project إلى خريطة Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'contractNumber': contractNumber,
      'contractName': contractName,
      // أضف الخصائص الأخرى هنا
    };
  }

  @override
  String toString() {
    return 'Project(projectId: $projectId, contractNumber: $contractNumber, contractName: $contractName, contractValue: $contractValue, budgetedCosts: $budgetedCosts, itemNo: $itemNo, contractDate: $contractDate, mainProjectId: $mainProjectId, contractorId: $contractorId, impPeriod: $impPeriod, startDate: $startDate, finishDate: $finishDate, catNo: $catNo, deptNo: $deptNo, financialYear: $financialYear, openingEnvelopesDate: $openingEnvelopesDate, awardingPartyId: $awardingPartyId, awardingDate: $awardingDate, etimadPlatformRefNo: $etimadPlatformRefNo, totalDisbursementEtimad: $totalDisbursementEtimad, longLat: $longLat, note: $note, projectStatusId: $projectStatusId)';
  }

  factory Project.fromProjectStatusStatusId1StatusNameStatusId2StatusNameStatusId3StatusNameStatusId4StatusNameStatusId5StatusNameStatusId6StatusNameProjectsProjectId241ContractNumber23244311ContractNameT1122ContractValue122220BudgetedCosts12220ItemNo1ContractDateJan32024MainProjectId1ContractorId2ImpPeriod27StartDateJan42024FinishDateJan312024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan12024AwardingPartyId1AwardingDateJan22024EtimadPlatformRefNo221111111111TotalDisbursementEtimad11110LongLat43534543NoteRwerwerewProjectStatusId2ProjectId246ContractNumber433402ContractNameContractValue1493BudgetedCosts15E7ItemNo1ContractDateNov12023MainProjectId1ContractorId1ImpPeriod1110StartDateJan12024FinishDateJan312027CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateMay12023AwardingPartyId1AwardingDateAug102023EtimadPlatformRefNo240139000472TotalDisbursementEtimad00LongLatNoteProjectStatusId2ProjectId172ContractNumber1233220ContractName11contractNameContractValue3344440BudgetedCosts11110ItemNo2ContractDateJan132024MainProjectId1ContractorId1ImpPeriod23StartDateJan122024FinishDateJan192024CatNo2DeptNo1FinancialYear1444OpeningEnvelopesDateJan132024AwardingPartyId1AwardingDateJan132024EtimadPlatformRefNo444333222111TotalDisbursementEtimad11110LongLat343411NoteFfffProjectStatusId2ProjectId171ContractNumber10011ContractNameT1111ContractValue12121212E7BudgetedCosts12220ItemNo3ContractDateJan132024MainProjectId3ContractorId1ImpPeriod23StartDateJan122024FinishDateJan182024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan122024AwardingPartyId1AwardingDateJan122024EtimadPlatformRefNo122222222222TotalDisbursementEtimad11110LongLat22333NoteFffProjectStatusId2ProjectId189ContractNumber1111111222ContractNameCeeeerContractValue10000000BudgetedCosts122220ItemNo5ContractDateJan262024MainProjectId1ContractorId1ImpPeriod1222StartDateJan262024FinishDateJan312024CatNo1DeptNo2FinancialYear1444OpeningEnvelopesDateJan312024AwardingPartyId1AwardingDateJan302024EtimadPlatformRefNo144444444444TotalDisbursementEtimad10000LongLat23232NoteFdfdsfdProjectStatusId1ProjectId200ContractNumber3443333ContractNameContractValue233440BudgetedCosts3440ItemNo4ContractDateJan112024MainProjectId1ContractorId1ImpPeriod333StartDateJan112024FinishDateJan12024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan112024AwardingPartyId1AwardingDateJan112024EtimadPlatformRefNo223333333333TotalDisbursementEtimad12220LongLat34NoteDfdsfdProjectStatusId2(
      Map<String, dynamic> data) {
    return Project(
      projectId: data['projectId'] as int?,
      contractNumber: data['contractNumber'] as String?,
      contractName: data['contractName'] as String?,
      contractValue: (data['contractValue'] as num?)?.toDouble(),
      budgetedCosts: data['budgetedCosts'] as double?,
      itemNo: data['itemNo'] as int?,
      contractDate: data['contractDate'] as String?,
      mainProjectId: data['mainProjectId'] as String?,
      contractorId: data['contractorId'] as int?,
      impPeriod: data['impPeriod'] as int?,
      startDate: data['startDate'] as String?,
      finishDate: data['finishDate'] as String?,
      catNo: data['catNo'] as int?,
      deptNo: data['deptNo'] as int?,
      financialYear: data['financialYear'] as String?,
      openingEnvelopesDate: data['openingEnvelopesDate'] as String?,
      awardingPartyId: data['awardingPartyId'] as int?,
      awardingDate: data['awardingDate'] as String?,
      etimadPlatformRefNo: data['etimadPlatformRefNo'] as String?,
      totalDisbursementEtimad: data['totalDisbursementEtimad'] as double?,
      longLat: data['longLat'] as String?,
      note: data['note'] as String?,
      projectStatusId: data['projectStatusId'] as int?,
    );
  }

  Map<String, dynamic>
      toProjectStatusStatusId1StatusNameStatusId2StatusNameStatusId3StatusNameStatusId4StatusNameStatusId5StatusNameStatusId6StatusNameProjectsProjectId241ContractNumber23244311ContractNameT1122ContractValue122220BudgetedCosts12220ItemNo1ContractDateJan32024MainProjectId1ContractorId2ImpPeriod27StartDateJan42024FinishDateJan312024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan12024AwardingPartyId1AwardingDateJan22024EtimadPlatformRefNo221111111111TotalDisbursementEtimad11110LongLat43534543NoteRwerwerewProjectStatusId2ProjectId246ContractNumber433402ContractNameContractValue1493BudgetedCosts15E7ItemNo1ContractDateNov12023MainProjectId1ContractorId1ImpPeriod1110StartDateJan12024FinishDateJan312027CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateMay12023AwardingPartyId1AwardingDateAug102023EtimadPlatformRefNo240139000472TotalDisbursementEtimad00LongLatNoteProjectStatusId2ProjectId172ContractNumber1233220ContractName11contractNameContractValue3344440BudgetedCosts11110ItemNo2ContractDateJan132024MainProjectId1ContractorId1ImpPeriod23StartDateJan122024FinishDateJan192024CatNo2DeptNo1FinancialYear1444OpeningEnvelopesDateJan132024AwardingPartyId1AwardingDateJan132024EtimadPlatformRefNo444333222111TotalDisbursementEtimad11110LongLat343411NoteFfffProjectStatusId2ProjectId171ContractNumber10011ContractNameT1111ContractValue12121212E7BudgetedCosts12220ItemNo3ContractDateJan132024MainProjectId3ContractorId1ImpPeriod23StartDateJan122024FinishDateJan182024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan122024AwardingPartyId1AwardingDateJan122024EtimadPlatformRefNo122222222222TotalDisbursementEtimad11110LongLat22333NoteFffProjectStatusId2ProjectId189ContractNumber1111111222ContractNameCeeeerContractValue10000000BudgetedCosts122220ItemNo5ContractDateJan262024MainProjectId1ContractorId1ImpPeriod1222StartDateJan262024FinishDateJan312024CatNo1DeptNo2FinancialYear1444OpeningEnvelopesDateJan312024AwardingPartyId1AwardingDateJan302024EtimadPlatformRefNo144444444444TotalDisbursementEtimad10000LongLat23232NoteFdfdsfdProjectStatusId1ProjectId200ContractNumber3443333ContractNameContractValue233440BudgetedCosts3440ItemNo4ContractDateJan112024MainProjectId1ContractorId1ImpPeriod333StartDateJan112024FinishDateJan12024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan112024AwardingPartyId1AwardingDateJan112024EtimadPlatformRefNo223333333333TotalDisbursementEtimad12220LongLat34NoteDfdsfdProjectStatusId2() {
    return {
      'projectId': projectId,
      'contractNumber': contractNumber,
      'contractName': contractName,
      'contractValue': contractValue,
      'budgetedCosts': budgetedCosts,
      'itemNo': itemNo,
      'contractDate': contractDate,
      'mainProjectId': mainProjectId,
      'contractorId': contractorId,
      'impPeriod': impPeriod,
      'startDate': startDate,
      'finishDate': finishDate,
      'catNo': catNo,
      'deptNo': deptNo,
      'financialYear': financialYear,
      'openingEnvelopesDate': openingEnvelopesDate,
      'awardingPartyId': awardingPartyId,
      'awardingDate': awardingDate,
      'etimadPlatformRefNo': etimadPlatformRefNo,
      'totalDisbursementEtimad': totalDisbursementEtimad,
      'longLat': longLat,
      'note': note,
      'projectStatusId': projectStatusId,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Project].
  factory Project.fromJson(String data) {
    return Project
        .fromProjectStatusStatusId1StatusNameStatusId2StatusNameStatusId3StatusNameStatusId4StatusNameStatusId5StatusNameStatusId6StatusNameProjectsProjectId241ContractNumber23244311ContractNameT1122ContractValue122220BudgetedCosts12220ItemNo1ContractDateJan32024MainProjectId1ContractorId2ImpPeriod27StartDateJan42024FinishDateJan312024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan12024AwardingPartyId1AwardingDateJan22024EtimadPlatformRefNo221111111111TotalDisbursementEtimad11110LongLat43534543NoteRwerwerewProjectStatusId2ProjectId246ContractNumber433402ContractNameContractValue1493BudgetedCosts15E7ItemNo1ContractDateNov12023MainProjectId1ContractorId1ImpPeriod1110StartDateJan12024FinishDateJan312027CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateMay12023AwardingPartyId1AwardingDateAug102023EtimadPlatformRefNo240139000472TotalDisbursementEtimad00LongLatNoteProjectStatusId2ProjectId172ContractNumber1233220ContractName11contractNameContractValue3344440BudgetedCosts11110ItemNo2ContractDateJan132024MainProjectId1ContractorId1ImpPeriod23StartDateJan122024FinishDateJan192024CatNo2DeptNo1FinancialYear1444OpeningEnvelopesDateJan132024AwardingPartyId1AwardingDateJan132024EtimadPlatformRefNo444333222111TotalDisbursementEtimad11110LongLat343411NoteFfffProjectStatusId2ProjectId171ContractNumber10011ContractNameT1111ContractValue12121212E7BudgetedCosts12220ItemNo3ContractDateJan132024MainProjectId3ContractorId1ImpPeriod23StartDateJan122024FinishDateJan182024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan122024AwardingPartyId1AwardingDateJan122024EtimadPlatformRefNo122222222222TotalDisbursementEtimad11110LongLat22333NoteFffProjectStatusId2ProjectId189ContractNumber1111111222ContractNameCeeeerContractValue10000000BudgetedCosts122220ItemNo5ContractDateJan262024MainProjectId1ContractorId1ImpPeriod1222StartDateJan262024FinishDateJan312024CatNo1DeptNo2FinancialYear1444OpeningEnvelopesDateJan312024AwardingPartyId1AwardingDateJan302024EtimadPlatformRefNo144444444444TotalDisbursementEtimad10000LongLat23232NoteFdfdsfdProjectStatusId1ProjectId200ContractNumber3443333ContractNameContractValue233440BudgetedCosts3440ItemNo4ContractDateJan112024MainProjectId1ContractorId1ImpPeriod333StartDateJan112024FinishDateJan12024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan112024AwardingPartyId1AwardingDateJan112024EtimadPlatformRefNo223333333333TotalDisbursementEtimad12220LongLat34NoteDfdsfdProjectStatusId2(
            json.decode(data) as Map<String, dynamic>);
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      projectId: map['projectId'],
      contractNumber: map['contractNumber'],
      contractName: map['contractName'],
      contractValue: map['contractValue']?.toDouble(),
      budgetedCosts: map['budgetedCosts'],
      itemNo: map['itemNo'],
      contractDate: map['contractDate'],
      mainProjectId: map['mainProjectId'],
      contractorId: map['contractorId'],
      impPeriod: map['impPeriod'],
      startDate: map['startDate'],
      finishDate: map['finishDate'],
      catNo: map['catNo'],
      deptNo: map['deptNo'],
      financialYear: map['financialYear'],
      openingEnvelopesDate: map['openingEnvelopesDate'],
      awardingPartyId: map['awardingPartyId'],
      awardingDate: map['awardingDate'],
      etimadPlatformRefNo: map['etimadPlatformRefNo'],
      totalDisbursementEtimad: map['totalDisbursementEtimad']?.toDouble(),
      longLat: map['longLat'],
      note: map['note'],
      projectStatusId: map['projectStatusId'],
    );
  }



  /// `dart:convert`
  ///
  /// Converts [Project] to a JSON string.
  String toJson() => json.encode(
      toProjectStatusStatusId1StatusNameStatusId2StatusNameStatusId3StatusNameStatusId4StatusNameStatusId5StatusNameStatusId6StatusNameProjectsProjectId241ContractNumber23244311ContractNameT1122ContractValue122220BudgetedCosts12220ItemNo1ContractDateJan32024MainProjectId1ContractorId2ImpPeriod27StartDateJan42024FinishDateJan312024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan12024AwardingPartyId1AwardingDateJan22024EtimadPlatformRefNo221111111111TotalDisbursementEtimad11110LongLat43534543NoteRwerwerewProjectStatusId2ProjectId246ContractNumber433402ContractNameContractValue1493BudgetedCosts15E7ItemNo1ContractDateNov12023MainProjectId1ContractorId1ImpPeriod1110StartDateJan12024FinishDateJan312027CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateMay12023AwardingPartyId1AwardingDateAug102023EtimadPlatformRefNo240139000472TotalDisbursementEtimad00LongLatNoteProjectStatusId2ProjectId172ContractNumber1233220ContractName11contractNameContractValue3344440BudgetedCosts11110ItemNo2ContractDateJan132024MainProjectId1ContractorId1ImpPeriod23StartDateJan122024FinishDateJan192024CatNo2DeptNo1FinancialYear1444OpeningEnvelopesDateJan132024AwardingPartyId1AwardingDateJan132024EtimadPlatformRefNo444333222111TotalDisbursementEtimad11110LongLat343411NoteFfffProjectStatusId2ProjectId171ContractNumber10011ContractNameT1111ContractValue12121212E7BudgetedCosts12220ItemNo3ContractDateJan132024MainProjectId3ContractorId1ImpPeriod23StartDateJan122024FinishDateJan182024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan122024AwardingPartyId1AwardingDateJan122024EtimadPlatformRefNo122222222222TotalDisbursementEtimad11110LongLat22333NoteFffProjectStatusId2ProjectId189ContractNumber1111111222ContractNameCeeeerContractValue10000000BudgetedCosts122220ItemNo5ContractDateJan262024MainProjectId1ContractorId1ImpPeriod1222StartDateJan262024FinishDateJan312024CatNo1DeptNo2FinancialYear1444OpeningEnvelopesDateJan312024AwardingPartyId1AwardingDateJan302024EtimadPlatformRefNo144444444444TotalDisbursementEtimad10000LongLat23232NoteFdfdsfdProjectStatusId1ProjectId200ContractNumber3443333ContractNameContractValue233440BudgetedCosts3440ItemNo4ContractDateJan112024MainProjectId1ContractorId1ImpPeriod333StartDateJan112024FinishDateJan12024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan112024AwardingPartyId1AwardingDateJan112024EtimadPlatformRefNo223333333333TotalDisbursementEtimad12220LongLat34NoteDfdsfdProjectStatusId2());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Project) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(
        other
            .toProjectStatusStatusId1StatusNameStatusId2StatusNameStatusId3StatusNameStatusId4StatusNameStatusId5StatusNameStatusId6StatusNameProjectsProjectId241ContractNumber23244311ContractNameT1122ContractValue122220BudgetedCosts12220ItemNo1ContractDateJan32024MainProjectId1ContractorId2ImpPeriod27StartDateJan42024FinishDateJan312024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan12024AwardingPartyId1AwardingDateJan22024EtimadPlatformRefNo221111111111TotalDisbursementEtimad11110LongLat43534543NoteRwerwerewProjectStatusId2ProjectId246ContractNumber433402ContractNameContractValue1493BudgetedCosts15E7ItemNo1ContractDateNov12023MainProjectId1ContractorId1ImpPeriod1110StartDateJan12024FinishDateJan312027CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateMay12023AwardingPartyId1AwardingDateAug102023EtimadPlatformRefNo240139000472TotalDisbursementEtimad00LongLatNoteProjectStatusId2ProjectId172ContractNumber1233220ContractName11contractNameContractValue3344440BudgetedCosts11110ItemNo2ContractDateJan132024MainProjectId1ContractorId1ImpPeriod23StartDateJan122024FinishDateJan192024CatNo2DeptNo1FinancialYear1444OpeningEnvelopesDateJan132024AwardingPartyId1AwardingDateJan132024EtimadPlatformRefNo444333222111TotalDisbursementEtimad11110LongLat343411NoteFfffProjectStatusId2ProjectId171ContractNumber10011ContractNameT1111ContractValue12121212E7BudgetedCosts12220ItemNo3ContractDateJan132024MainProjectId3ContractorId1ImpPeriod23StartDateJan122024FinishDateJan182024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan122024AwardingPartyId1AwardingDateJan122024EtimadPlatformRefNo122222222222TotalDisbursementEtimad11110LongLat22333NoteFffProjectStatusId2ProjectId189ContractNumber1111111222ContractNameCeeeerContractValue10000000BudgetedCosts122220ItemNo5ContractDateJan262024MainProjectId1ContractorId1ImpPeriod1222StartDateJan262024FinishDateJan312024CatNo1DeptNo2FinancialYear1444OpeningEnvelopesDateJan312024AwardingPartyId1AwardingDateJan302024EtimadPlatformRefNo144444444444TotalDisbursementEtimad10000LongLat23232NoteFdfdsfdProjectStatusId1ProjectId200ContractNumber3443333ContractNameContractValue233440BudgetedCosts3440ItemNo4ContractDateJan112024MainProjectId1ContractorId1ImpPeriod333StartDateJan112024FinishDateJan12024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan112024AwardingPartyId1AwardingDateJan112024EtimadPlatformRefNo223333333333TotalDisbursementEtimad12220LongLat34NoteDfdsfdProjectStatusId2(),
        toProjectStatusStatusId1StatusNameStatusId2StatusNameStatusId3StatusNameStatusId4StatusNameStatusId5StatusNameStatusId6StatusNameProjectsProjectId241ContractNumber23244311ContractNameT1122ContractValue122220BudgetedCosts12220ItemNo1ContractDateJan32024MainProjectId1ContractorId2ImpPeriod27StartDateJan42024FinishDateJan312024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan12024AwardingPartyId1AwardingDateJan22024EtimadPlatformRefNo221111111111TotalDisbursementEtimad11110LongLat43534543NoteRwerwerewProjectStatusId2ProjectId246ContractNumber433402ContractNameContractValue1493BudgetedCosts15E7ItemNo1ContractDateNov12023MainProjectId1ContractorId1ImpPeriod1110StartDateJan12024FinishDateJan312027CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateMay12023AwardingPartyId1AwardingDateAug102023EtimadPlatformRefNo240139000472TotalDisbursementEtimad00LongLatNoteProjectStatusId2ProjectId172ContractNumber1233220ContractName11contractNameContractValue3344440BudgetedCosts11110ItemNo2ContractDateJan132024MainProjectId1ContractorId1ImpPeriod23StartDateJan122024FinishDateJan192024CatNo2DeptNo1FinancialYear1444OpeningEnvelopesDateJan132024AwardingPartyId1AwardingDateJan132024EtimadPlatformRefNo444333222111TotalDisbursementEtimad11110LongLat343411NoteFfffProjectStatusId2ProjectId171ContractNumber10011ContractNameT1111ContractValue12121212E7BudgetedCosts12220ItemNo3ContractDateJan132024MainProjectId3ContractorId1ImpPeriod23StartDateJan122024FinishDateJan182024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan122024AwardingPartyId1AwardingDateJan122024EtimadPlatformRefNo122222222222TotalDisbursementEtimad11110LongLat22333NoteFffProjectStatusId2ProjectId189ContractNumber1111111222ContractNameCeeeerContractValue10000000BudgetedCosts122220ItemNo5ContractDateJan262024MainProjectId1ContractorId1ImpPeriod1222StartDateJan262024FinishDateJan312024CatNo1DeptNo2FinancialYear1444OpeningEnvelopesDateJan312024AwardingPartyId1AwardingDateJan302024EtimadPlatformRefNo144444444444TotalDisbursementEtimad10000LongLat23232NoteFdfdsfdProjectStatusId1ProjectId200ContractNumber3443333ContractNameContractValue233440BudgetedCosts3440ItemNo4ContractDateJan112024MainProjectId1ContractorId1ImpPeriod333StartDateJan112024FinishDateJan12024CatNo1DeptNo1FinancialYear1444OpeningEnvelopesDateJan112024AwardingPartyId1AwardingDateJan112024EtimadPlatformRefNo223333333333TotalDisbursementEtimad12220LongLat34NoteDfdsfdProjectStatusId2());
  }

  @override
  int get hashCode =>
      projectId.hashCode ^
      contractNumber.hashCode ^
      contractName.hashCode ^
      contractValue.hashCode ^
      budgetedCosts.hashCode ^
      itemNo.hashCode ^
      contractDate.hashCode ^
      mainProjectId.hashCode ^
      contractorId.hashCode ^
      impPeriod.hashCode ^
      startDate.hashCode ^
      finishDate.hashCode ^
      catNo.hashCode ^
      deptNo.hashCode ^
      financialYear.hashCode ^
      openingEnvelopesDate.hashCode ^
      awardingPartyId.hashCode ^
      awardingDate.hashCode ^
      etimadPlatformRefNo.hashCode ^
      totalDisbursementEtimad.hashCode ^
      longLat.hashCode ^
      note.hashCode ^
      projectStatusId.hashCode;
}