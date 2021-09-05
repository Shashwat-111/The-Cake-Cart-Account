import 'dart:core';

import 'package:flutter/material.dart';

class PurchaserDetails
{
  static final String id = "Id";
  static final String name = "Name";
  static final String rate = "Rate";
  static final String itemType = "Item Type";
  static final String cakeImage = "Url";

  static List<String> getFields() => [id,name,rate,itemType,cakeImage];
}