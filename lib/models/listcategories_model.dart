import 'dart:convert';

List<ListCategories> listCategoriesFromJson(String str) => List<ListCategories>.from(json.decode(str).map((x) => ListCategories.fromJson(x)));

String listCategoriesToJson(List<ListCategories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListCategories {
    ListCategories({
        this.idCategoria,
        this.descricao,
        this.bloqueio,
        this.imagemcategoria,
    });

    int idCategoria;
    String descricao;
    bool bloqueio;
    String imagemcategoria;

    factory ListCategories.fromJson(Map<String, dynamic> json) => ListCategories(
        idCategoria: json["idCategoria"],
        descricao: json["descricao"],
        bloqueio: json["bloqueio"],
        imagemcategoria: json["imagemcategoria"],
    );

    Map<String, dynamic> toJson() => {
        "idCategoria": idCategoria,
        "descricao": descricao,
        "bloqueio": bloqueio,
        "imagemcategoria": imagemcategoria,
    };
}
