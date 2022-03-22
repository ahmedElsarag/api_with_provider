import 'dart:convert';
import 'package:api_with_provider/pages/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/posts.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HomeProvider>(context,listen: false);
    provider.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Center(
        child: Text(provider.postsModel.title.toString()),
      ),
    );
  }
}

Future<Posts> getData(context) async {
  late Posts postsModel;
try {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    postsModel = Posts.fromJson(data);
  } else {
    print('error');
  }
}catch(e){
  print(e.toString());
}
  return postsModel;
}
