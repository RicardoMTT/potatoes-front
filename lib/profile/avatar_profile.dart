import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/app_widgets/common_avatar.dart';

import 'package:potatoes_test/profile/profile_controller.dart';
import 'package:potatoes_test/profile/screens/form_bloc.dart';

class HeadScreenButton extends StatelessWidget {
  const HeadScreenButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileFormBloc(),
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
              child: Row(
                children: [
                  Obx(() => ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Avatar(
                          newImageFile: ProfileController.to.fileRx.value,
                        ),
                      )),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
