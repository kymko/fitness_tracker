
import 'dart:convert';

import 'package:flutter/services.dart';

class FormDataRepository {

  Future<String> _loadFormDataAsset() async {
    return await rootBundle.loadString('assets/json/form_data.json');
  }

  Future<Map<String, dynamic>> getFormData() async {
    String jsonFormData = await _loadFormDataAsset();
    return jsonDecode(jsonFormData);
  }
}