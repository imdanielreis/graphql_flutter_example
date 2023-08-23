import 'package:flutter/material.dart';
import 'package:graphql_example/screens/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final HttpLink link = HttpLink(
      "https://barcelona-urban-mobility-graphql-api.netlify.app/graphql");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});

  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Graphql Example',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
