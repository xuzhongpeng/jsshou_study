import 'dart:io';

import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http/src/io_client.dart';

class GQClient {
  static GraphQLClient client;
  static init() {
    HttpClient _httpClient = HttpClient()
      ..findProxy = (uri) {
        return "PROXY 127.0.0.1:8888";
      };
    final cache = OptimisticCache(dataIdFromObject: typenameDataIdFromObject);
    Client _client = IOClient(_httpClient);

    HttpLink _httpLink = HttpLink(
      uri: 'http://192.168.1.77:5000/graphql',
      // httpClient: _client
    );

    final AuthLink _authLink = AuthLink(
      getToken: () async => '',
    );

    Link _link = _authLink.concat(_httpLink);
    client = GraphQLClient(
      cache: cache,
      link: _link,
    );
    return client;
  }
}
