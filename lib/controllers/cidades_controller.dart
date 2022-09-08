import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_nv1/model/cidades_model.dart';
import 'package:http/http.dart' as http;

class CidadeController {
  ValueNotifier<List<Cidade>> cidades = ValueNotifier<List<Cidade>>([]);
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  callAPI() async {
    var client = http.Client();
    try {
      loading.value = true;
      var response = await client.get(
        Uri.parse(
            'https://brasilapi.com.br/api/ibge/municipios/v1/RN?providers=dados-abertos-br,gov,wikipedia'),
      );
      List decodedResponse = jsonDecode(response.body);
      cidades.value = decodedResponse.map((e) => Cidade.fromJson(e)).toList();
    } finally {
      client.close();
      loading.value = false;
    }
  }
}
