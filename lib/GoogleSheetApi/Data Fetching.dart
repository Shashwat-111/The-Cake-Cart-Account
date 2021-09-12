import 'dart:convert';
import 'dart:core';

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
  Map<String,dynamic> toJson() => {
    PurchaserDetails.id : id,
    PurchaserDetails.name : name,
    PurchaserDetails.itemType : itemType,
    PurchaserDetails.rate : rate,
  };

  copy({
    int? id,
    String? name,
    String? rate,
    String? itemType,
  }) => 
      User(
          rate: rate ?? this.rate,
          id: id ?? this.id,
          itemType: itemType ?? this.itemType,
          name: name ?? this.name,
      );

  static User fromJson(Map<String,dynamic> json) => User(

    id: jsonDecode(json[PurchaserDetails.id]),
    name: json[PurchaserDetails.name],
    rate: json[PurchaserDetails.rate],
    itemType: json[PurchaserDetails.itemType],

  );
}