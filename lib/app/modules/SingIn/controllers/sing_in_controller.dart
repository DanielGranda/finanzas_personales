import 'dart:convert';
import 'package:finanzas_personales/app/modules/SingIn/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:finanzas_personales/app/utils/enviroments.dart';
import 'package:finanzas_personales/app/modules/SingIn/models/user_model.dart';

class SingInController extends GetxController {
  final RxBool isSignupScreen = true.obs;
  final RxBool isMale = true.obs;
  final RxBool isRememberMe = false.obs;
  //!-------------KeySingIn-----------!//
  final GlobalKey<FormBuilderState> signInKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> signUpKey = GlobalKey<FormBuilderState>();
  //!-------------Variables manejo de usuario-----------!//
  final RxBool autenticando = false.obs;
  Usuario usuario;
  final _storage = FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //!-------------Autentificacion-----------!//
  Future<bool> login(String email, String password) async {
    this.autenticando.value = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post('${Environment.apiUrl}/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
    this.autenticando.value = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      await this._guardarToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }

  //!-------------Autentificacion-----------!//
  Future registro(String nombre, String email, String password) async {
    this.autenticando.value = true;
    final data = {'nombre': nombre, 'email': email, 'password': password};

    final resp = await http.post('${Environment.apiUrl}/login/new',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
    this.autenticando.value = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      await this._guardarToken(loginResponse.token);
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

//!-------------Si ya esta logeado-----------!//
  Future<bool> isLoggedId() async {
    final token = await _storage.read(key: 'token');

    final resp = await http.get('${Environment.apiUrl}/login/renew',
        headers: {'Content-Type': 'application/json', 'x-token': token});

    print(resp.body);
    this.autenticando.value = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      await this._guardarToken(loginResponse.token);
      return true;
    } else {
      this.logut();
      return false;
    }

    //print(token);
  }

  //!-------------Guardar Token-----------!//
  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  //!-------------LogOut-----------!//
  Future logut() async {
    return await _storage.delete(key: 'token');
  }

  //!-------------LeerToken para acceso panrallas-----------!//
  static Future<String> getToken() async {
    final _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  //!-------------borrar Token para acceso panrallas-----------!//
  static Future<void> deleteToken() async {
    final _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }
}
