import 'package:ejercicio2/models/user_model.dart';
import 'package:ejercicio2/services/db_servise.dart';

class UserController {
  final DbService _dbService = DbService();

  Future<List <User>> getAllUsers() async {
    return await _dbService.getUsers();

  } 
  
  Future<void>  addUsers(User user) async {
    await _dbService.insertUser(user);

  }
  Future<void> updateUsers(User user) async{
    await _dbService.updateUser(user);

  }
   
  Future<void> deleteUser(int id) async{
    await _dbService.deleteUser(id);

  }
}