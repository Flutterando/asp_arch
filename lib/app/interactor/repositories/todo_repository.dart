import 'package:asp_arch/app/interactor/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getAll();

  Future<TodoModel> insert(TodoModel model);

  Future<TodoModel> update(TodoModel model);

  Future<bool> delete(int id);
}
