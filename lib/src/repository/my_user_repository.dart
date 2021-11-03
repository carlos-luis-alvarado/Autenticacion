import 'dart:io';

import 'package:flutter_application_1/src/model/user.dart';

abstract class MyUserRepositoryBase {
  Future<MyUser?> getMyUser();
  Future<void> saveMyUser(MyUser user, File? image);
}
