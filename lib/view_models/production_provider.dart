// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:admin_ui/models/production_model.dart';
import 'package:admin_ui/url_path.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductionProvider extends ChangeNotifier{
  List<ProductionModel> productionsList=[];

  List<ProductionModel> get productions=>productionsList;

  void verifyProductions()async{
    final response=await http.get(Uri.parse("${APIpath.ngRok}/api2/admin/verify/productions"));

    print(response.body);
    if(response.statusCode==200)
    {
      List tempProductions=jsonDecode(response.body);
    List<ProductionModel> productionTemp=[];
    for (var element in tempProductions) {
      var production=ProductionModel.fromMap(element);
      productionTemp.add(production);
    }
    productionsList=productionTemp;
    notifyListeners();
    }
    else{
      print("inside-----------------------------------------------------------------------------------");
      productionsList=[];
      notifyListeners();
    }
  }

  Future<bool> approveProductions(id)async{
    final response=await http.post(Uri.parse("${APIpath.ngRok}/api2/admin/verify/production"),body: {'productionID':id});

    if(response.statusCode==200)
    {
      return true;
    }
    return false;
  }

  void getProductions()async{
    final response=await http.get(Uri.parse("${APIpath.ngRok}/api2/admin/productions"));

    print(response.body);
    if(response.statusCode==200)
    {
      List tempProductions=jsonDecode(response.body);
    List<ProductionModel> productionTemp=[];
    for (var element in tempProductions) {
      var production=ProductionModel.fromMap(element);
      productionTemp.add(production);
    }
    productionsList=productionTemp;
    notifyListeners();
    }
    else{
      print("inside-----------------------------------------------------------------------------------");
      productionsList=[];
      notifyListeners();
    }
  }
  
}

