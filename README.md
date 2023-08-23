# graphql_example

![graphql_example_flutter](https://github.com/imdanielreis/graphql_flutter_example/assets/97130440/d7f07760-ba1c-42f0-9e69-47846502323e)

This is an example project consuming a GraphQL API with Flutter

The chosen API was:
https://barcelona-urban-mobility-graphql-api.netlify.app/graphql

Library:
ql_fluttergraphic

------------------------------------------------------------------------

Esse é um projeto de exemplo consumindo uma API GraphQL com Flutter 

A API escolhida foi: 
https://barcelona-urban-mobility-graphql-api.netlify.app/graphql

Biblioteca: 
graphql_flutter

# graphql_example

This is an example project consuming a GraphQL API with Flutter

The chosen API was:
https://barcelona-urban-mobility-graphql-api.netlify.app/graphql

Library:
ql_fluttergraphic

Control: 

the `request` by changing the `lineId` and the quantity in the `first`

the `answer` in the query by removing the parameters inside `[edge][node]`

```
_query:
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
```

------------------------------------------------------------------------

Esse é um projeto de exemplo consumindo uma API GraphQL com Flutter 

A API escolhida foi: 
https://barcelona-urban-mobility-graphql-api.netlify.app/graphql

Biblioteca: 
graphql_flutter

Controle:

o `request` alterando o `lineId` e a quantidade no `first`

o `response` na query removendo os parametros dentro de `[edge][node]`


```
_query:
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
```
