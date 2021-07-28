import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/app_widgets/common_asset_image.dart';
import 'package:potatoes_test/profile/queries/getProfile.dart';

class Avatar extends StatelessWidget {
  final File newImageFile;

  const Avatar({Key key, this.newImageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _client = Get.find<GraphQLClient>();
    final _request = QueryOptions(
            document: getProfileQueryDoc, fetchPolicy: FetchPolicy.cacheFirst)
        .asRequest;

    final _getMyInfoJson = _client.readQuery(_request) != null
        ? _client.readQuery(_request)['getProfile']['cliente']
        : null;

    print("zz $_getMyInfoJson");
    if (newImageFile != null) {
      return Image.file(
        newImageFile,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      );
    } else if (_getMyInfoJson != null) {
      if (_getMyInfoJson['avatar'] != null) {
        print('else');
        return Image.network(
          "https://potatoes-app-heroku.herokuapp.com" +
              _getMyInfoJson['avatar']['url'],
          height: 160,
          width: 65,
          fit: BoxFit.cover,
        );
      }
    } else {
      print('aca');
      return const CommonAssetImage(
        asset: 'profile/profile.png',
        height: 50,
      );
    }
  }
}
