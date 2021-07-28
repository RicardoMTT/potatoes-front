import 'dart:io';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/profile/queries/getProfile.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  var firstName = "".obs;
  var lastName = "".obs;
  var email = "".obs;
  var dni = "".obs;
  var phone = "".obs;
  final fileRx = Rx<File>();

  @override
  void onInit() {
    print('Profile');
    this.getProfile();
    super.onInit();
  }

  void getProfile() async {
    final grapql = Get.find<GraphQLClient>();

    final _result =
        await grapql.query(QueryOptions(document: getProfileQueryDoc));
    print(_result);
    this.firstName.value = _result.data['getProfile']['cliente']['nombre'];
    this.lastName.value = _result.data['getProfile']['cliente']['apellido'];
    this.email.value =
        _result.data['getProfile']['cliente']['usuario']['email'];
    this.phone.value =
        _result.data['getProfile']['cliente']['telefono'].toString();
  }
}
