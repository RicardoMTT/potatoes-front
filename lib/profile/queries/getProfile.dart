import 'package:graphql_flutter/graphql_flutter.dart';

final getProfileQueryDoc = gql(r'''
 query getProfile{
  getProfile{
    cliente{
      __typename
      id
      nombre
      apellido
      dni
      telefono
      usuario{
        __typename
        email
      }
      avatar{
        __typename
        url
      }
    }
  }
}
''');
