import 'dart:core';

import 'package:flutter/material.dart';

class PurchaserDetails
{
  static final String id = "Id";
  static final String name = "Name";
  static final String rate = "Rate";
  static final String itemType = "Item Type";

  static List<String> getFields() => [id,name,rate,itemType];
}


class User{

  final int? id;
  final String name;
  final String rate;
  final String itemType;

  const User({
    this.id,
    required this.rate,
    required this.itemType,
    required this.name,
});
  //todo define a to json method
  Map<String,dynamic> toJason() => {
    PurchaserDetails.id : id,
    PurchaserDetails.name : name,
    PurchaserDetails.itemType : itemType,
    PurchaserDetails.rate : rate,
  };
}