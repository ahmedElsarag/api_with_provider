import 'package:api_with_provider/model/posts.dart';
import 'package:api_with_provider/pages/HomeScreen.dart';
import 'package:flutter/material.dart';


class HomeProvider extends ChangeNotifier{
  late Posts postsModel;

  fetchData(context) async{
    postsModel = await getData(context);
    notifyListeners();
  }

}