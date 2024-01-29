import 'dart:convert';

import 'package:asp_arch/app/data/adapters/todo_adapter.dart';
import 'package:asp_arch/app/interactor/models/todo_model.dart';
import 'package:asp_arch/app/interactor/repositories/todo_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _key = 'TODO_LIST';

class SharedTodoRepository implements TodoRepository {
  @override
  Future<List<TodoModel>> getAll() async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => TodoAdapter.fromMap(e)).toList();
  }

  @override
  Future<TodoModel> insert(TodoModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final id = list.isEmpty ? 1 : list.last['id'] + 1;
    final newModel = model.copyWith(id: id);
    list.add(TodoAdapter.toMap(newModel));
    await shared.setString(_key, jsonEncode(list));
    return newModel;
  }

  @override
  Future<TodoModel> update(TodoModel model) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.indexWhere((e) => e['id'] == model.id);
    if (index == -1) throw Exception('Todo not found');
    list[index] = TodoAdapter.toMap(model);
    await shared.setString(_key, jsonEncode(list));
    return model;
  }

  @override
  Future<bool> delete(int id) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(_key) ?? '[]';
    final list = jsonDecode(json) as List;
    final index = list.indexWhere((e) => e['id'] == id);
    if (index == -1) return false;
    list.removeAt(index);
    await shared.setString(_key, jsonEncode(list));
    return true;
  }
}
