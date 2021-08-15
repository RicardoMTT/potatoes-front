import 'package:graphql_flutter/graphql_flutter.dart';

final updateProfileDoc = gql(r'''
mutation updateClientMutation($nombre:String,$telefono:String,$dni:String){
  updateClientProfile(input:{
    cliente:{
      nombre:$nombre,
      telefono:$telefono,
      dni:$dni
    }
  }){
    __typename
    id
    nombre
    apellido
     telefono
    usuario{
      email
    }
    dni
  }
}
''');
