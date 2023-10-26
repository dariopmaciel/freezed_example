import 'package:freezed_annotation/freezed_annotation.dart';

part 'pattern_matching.freezed.dart';

@freezed
class Union with _$Union {
  factory Union(int value) = UnionData;
  factory Union.loading() = UnionLoading;
  factory Union.error([String? message]) = UnionError;
}

// PATTERN MATCHING
//sÃO FORMAS DE ACESSAR OS ATRIBUTOS DA CLASSE

void main() {
  //se eu trocar tb troca a chamada
  // var union = Union(1);
  var union = Union.loading();
  // var union = Union.error();

//não dá para acessar assim
//union.value;

/*
São formas ou metodos de recuperar estes atributos ou acessár os atributos
São eles 
-when   'quando'
-mayWhen
-map
-maybyMap
*/

  var mensagem = union.when<String>(
    (value) => 'Union data implementado',
    loading: () => "Loading implementado",
    error: (String? message) => "Erro implementado",
  );
  print(mensagem);

  var mensagemMaybe = union.maybeWhen(
    (value) => null,
    loading: () => "Loading Implementadooooo",
    orElse: () => "Padrão Implementado",
  );
  print(mensagemMaybe);


//aqui se recebe a classe a ser implementada
  var mensagemMap = union.map(
    (UnionData value) => "${value.runtimeType} implementado!!!!",
    loading: (UnionLoading loading) => "${loading.runtimeType} implementado!!!!",
    error: (UnionError error) => "${error.runtimeType} implementado!!!!",
  );
  print(mensagemMap);
}
