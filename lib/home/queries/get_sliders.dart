import 'package:graphql_flutter/graphql_flutter.dart';

final getSlidersQueryDoc = gql(r'''
  query getSliders{
  sliders{
    id
    descripcion
    titulo
    avatar{
      url
    }
  }
}
''');
