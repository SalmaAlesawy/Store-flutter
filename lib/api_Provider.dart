import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Models/ProductsModel.dart';
import 'Models/categories_Model.dart';





class Apiprovider {
  ProductsModel? produtList;
  ProductsModel? bueatylist;
  ProductsModel? fragranceslist;
  ProductsModel? furniturelsit;
  ProductsModel? grocerieslist;

  String baseUrl = 'https://dummyjson.com/products';

  getProduct() async {

    try {
      Response response = await Dio().get(baseUrl);

      produtList = ProductsModel.fromJson(response.data);


      return produtList;
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
      }
      print(e);
    }
  }




  bueaty()async{
    try {
      Response respone=await Dio().get('https://dummyjson.com/products/category/beauty');
      bueatylist =ProductsModel.fromJson(respone.data);
      return bueatylist;
    }
    catch(e){
      if(e is DioError){
        print(e.response);
      }
      print(e);
    }

  }
  fragrances()async{
    try {
      Response respone=await Dio().get('https://dummyjson.com/products/category/fragrances');
      fragranceslist =ProductsModel.fromJson(respone.data);
      return fragranceslist;
    }
    catch(e){
      if(e is DioError){
        print(e.response);
      }
      print(e);
    }

  }
  furniture()async{
    try {
      Response respone=await Dio().get('https://dummyjson.com/products/category/furniture');
      furniturelsit =ProductsModel.fromJson(respone.data);
      return furniturelsit;
    }
    catch(e){
      if(e is DioError){
        print(e.response);
      }
      print(e);
    }

  }
  groceries()async{
    try {
      Response response=await Dio().get('https://dummyjson.com/products/category/groceries');
      grocerieslist =ProductsModel.fromJson(response.data);
      return grocerieslist;
    }
    catch(e){
      if(e is DioError){
        print(e.response);
      }
      print(e);
    }

  }
}