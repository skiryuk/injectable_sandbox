import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.dart';

abstract class Serializable<T> {
  Map<String, dynamic> toMap();
  T fromMap(Map<String, dynamic> map);
}

@LazySingleton(as: ILocalStorage)
class SharedPreferencesStorage implements ILocalStorage {
  @override
  Future<dynamic> get(String key) async {
    final shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  /// [value] может быть примитивным типом,
  /// или json объектом типа Map<String, value>
  @override
  Future<void> put(String key, dynamic value) async {
    assert(
      value is num ||
          value is String ||
          value is bool ||
          value is List<String> ||
          value is Map ||
          value is Set ||
          value is Serializable,
      'not valid value',
    );

    final shared = await SharedPreferences.getInstance();
    if (value is int) {
      shared.setInt(key, value);
    } else if (value is double) {
      shared.setDouble(key, value);
    } else if (value is String) {
      shared.setString(key, value);
    } else if (value is bool) {
      shared.setBool(key, value);
    } else if (value is List<String>) {
      shared.setStringList(key, value);
    } else if (value is Map) {
      shared.setString(key, jsonEncode(value));
    } else if (value is Serializable) {
      shared.setString(key, jsonEncode(value.toMap()));
    }
  }

  @override
  Future<void> clearAll() async {
    final shared = await SharedPreferences.getInstance();
    shared.clear();
  }

  @override
  Future<void> dispose() async {}

  @override
  Future<void> delete(String key) async {
    final shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }
}
