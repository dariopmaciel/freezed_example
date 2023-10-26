import 'package:freezed_annotation/freezed_annotation.dart';

part 'unions.freezed.dart';

@freezed
class Example with _$Example {
  const factory Example.person(String name, int age) = Person;
  const factory Example.city(String name, int population) = City;
}

void main() {
  var example = Example.person("Dario", 39);

  // não é possivel acessar mais uma unica classe, por não ser apenas uma unica classe
  // temos agora temos uma classe que contem outras duas classes, como em person
  // example.age;

  // podemos acessar por em ambos os contrutores temos os mesmos atributos com o mesmo nome
  example.name;

  //Para acessar o atributo especifico, é necessário definir com um condicional a classe a ser atingida
  if (example is Person) {
    example.age;
  }
  

  // PATTERN MATCHING
  //sÃO FORMAS DE ACESSAR OS ATRIBUTOS DA CLASSE
}
