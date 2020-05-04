import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/api/models/user.dart';

class UserService {
  Future<UserData> login({
    @required String username,
    @required String password,
  }) async {
    try {
      // print("Before -- api");

      final body = FormData.fromMap({
        "username": '02760',
        "password": 'P@ss12345',
        "grant_type": "password"
      });
      
      final oath2Username = "panda-dev-auth-client";
      final oath2Password =
          "ZCuuZzRzyfWEKNL7uQEQhggiGdbrGuMNLCKDKKKvogPfkEgeEokYfnwMFHwcmjKb";
      final basicAuth =
          "Basic " + base64Encode(utf8.encode("$oath2Username:$oath2Password"));
      // print(" Basic :  $basicAuth");
      // print("Before -- api 2");
     final accept = "*/*";
     final  contentType = "application/x-www-form-urlencoded";
     String url = 'http://68.183.178.206:8081/oauth/token';

      final result = await Dio().post(url,
          
          data: body,
          options: Options(headers: {
            'authorization': basicAuth,
            'content-type' : contentType,
            'Accept' : accept,
            'Access-Control-Allow-Origin': '*',
            'Cache-Control': null,
            'X-Requested-With': null,
             'Access-Control-Allow-Credentials': true,
          }));
      // print(result);
      // print("Before -- api 3");
      
      return UserData.fromJson(result.data);
    } catch (e) {
      print("Error from login Service ==> $e");
      throw e;
    }
    
      


  }
}
