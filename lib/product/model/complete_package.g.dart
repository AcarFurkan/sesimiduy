// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletePackage _$CompletePackageFromJson(Map<String, dynamic> json) =>
    CompletePackage(
      fullName: json['fullName'] as String,
      deliveredFullName: json['deliveredFullName'] as String,
      deliveredPhone: json['deliveredPhone'] as String,
      deliveredAddress: json['deliveredAddress'] as String,
      deliveredCarPlate: json['deliveredCarPlate'] as String,
    )
      ..createdAt = json['createdAt'] == null
          ? DateTime.now()
          : FirebaseTimeParser.datetimeFromTimestamp(
              json['createdAt'] as Timestamp?)
      ..updatedAt = json['updatedAt'] == null
          ? DateTime.now()
          : FirebaseTimeParser.datetimeFromTimestamp(
              json['updatedAt'] as Timestamp?);

Map<String, dynamic> _$CompletePackageToJson(CompletePackage instance) =>
    <String, dynamic>{
      'createdAt': FirebaseTimeParser.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParser.dateTimeToTimestamp(instance.updatedAt),
      'fullName': instance.fullName,
      'deliveredFullName': instance.deliveredFullName,
      'deliveredPhone': instance.deliveredPhone,
      'deliveredAddress': instance.deliveredAddress,
      'deliveredCarPlate': instance.deliveredCarPlate,
    };
