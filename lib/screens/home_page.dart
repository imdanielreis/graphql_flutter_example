import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _query = """
    {
      stations: metroStations(
        filterBy: { lineId: 2 }
        first: 100
      ) {
        edges {
          node {
            id
            name
            lines
            coordinates {
              longitude
              latitude
            }
          }
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Estaciones de metro en Barcelona',
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(_query),
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: result.data?['stations']['edges'].length,
            itemBuilder: (context, index) {
              final item = result.data?['stations']['edges'][index];

              var identifier = item['node']['id'] ?? "";

              if (identifier != "") {
                identifier = "$identifier - ";
              }

              final name = item['node']['name'] ?? "";
              final latitude = item['node']['coordinates']?['latitude'];
              final longitude = item['node']['coordinates']?['longitude'];

              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 23, left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              color: Colors.grey.shade300,
                              blurRadius: 30)
                        ]),
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Text('$identifier Nombre: $name'),
                      if (latitude != null && longitude != null)
                        Text('Latitud: $latitude | Longitud: $longitude')
                    ]),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
