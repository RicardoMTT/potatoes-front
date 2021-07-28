import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/jwt.dart';

GraphQLClient getGraphqlClient() {
  final HttpLink httpLink = HttpLink(
    'https://potatoes-app-heroku.herokuapp.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => Jwt.token != null ? 'Bearer ${Jwt.token}' : null,
  );

  final link = authLink.concat(httpLink);

  final client = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: InMemoryStore(),
    ),
  );
  return client;
}
