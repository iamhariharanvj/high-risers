import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:highrisers/2.0/pages/showOrders.dart';
import 'package:highrisers/Window/shutter.dart';
import 'package:highrisers/Window/window.dart';
import 'package:highrisers/Window/windowSize.dart';
import 'package:highrisers/pages/demo.dart';
import 'package:highrisers/pages/details.dart';
import 'package:highrisers/pages/doors.dart';
import 'package:highrisers/dsize/singleSize.dart';
import 'package:highrisers/doors/single.dart';
import 'package:highrisers/pages/form.dart';
import 'package:highrisers/pages/orderDetails.dart';
import 'package:highrisers/pages/phone.dart';
import 'package:highrisers/pages/verify.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '2.0/pages/myform.dart';
import '2.0/pages/myhome.dart';
import '2.0/pages/search.dart';
import 'loouvers/loouver.dart';
import 'nilai/nilaiSize.dart';
import 'nilai/nilais.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      Get.to(MyPhone());
    } else {
      print('User is signed in!');
    }
  });

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? login = prefs.getBool("login");
  print("login:" + login.toString());
  runApp(MaterialApp(
    home: login == null ? MyPhone() : myhome(),
    routes: {
      '/verify': (context) => MyVerify(),
      '/phone': (context) => MyPhone(),
      '/home': (context) => myhome(),
      '/myform': (context) => myForm(),
      '/search': (context) => search(
            users: null,
          ),
      '/showOrders': (context) => showOrders(),
      '/door': (context) => Door(),
      '/single_size': (context) => single_size(),
      '/single': (context) => single(
            doorSize: '',
            type: '',
          ),
      '/form': (context) =>
          sForm(img: File(''), type: '', doorSize: '', contact: ''),
      '/nilaiSize': (context) => nilai_size(),
      '/nilais': (context) => nilais(),
      '/window': (context) => Window(),
      '/windowSize': (context) => window_size(),
      '/orderDetails': (context) => order_details(),
      '/shutter': (context) => shutter(type: ''),
      '/demo': (context) => HomeScreen(),
      '/loouver': (context) => loouvers(type: 'Loouvers'),
      '/details': (context) => details(
            oimage: File(''),
            type: '',
            doorSize: '',
            phno: '',
            city: '',
            name: '',
            due: '',
            pimage: File(''),
            id: null,
          ),
    },
  ));
}

sendemail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_c6cr8oj";
  const templateId = "template_hu3uukc";
  const userId = "YGAx4yxcHGzMqj22C";
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "to_name": "hari",
          "message": "hello",
          "user_email": "harikrishnantce@gmail.com",
        }
      }));
  print(response.statusCode);
  return response.statusCode;
}
