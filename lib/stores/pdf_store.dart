import 'package:mobx/mobx.dart';

part 'pdf_store.g.dart';

class PdfStore = _PdfStore with _$PdfStore;

abstract class _PdfStore with Store {
  @observable
  ObservableList<String> qtdSelos = ObservableList<String>();

  @observable
  String endereco = "";

  @observable
  String codigoEmpresa = "1";

  @observable
  String nomeparc = "";

  @observable
  String descrprod = "";

  @observable
  String descrprod2 = "";

  @observable
  String descrprod3 = "";

  @observable
  String linha1 = "";

  @observable
  String linha2 = "";

  @observable
  String linha3 = "";

  @observable
  String linha4 = "";

  @observable
  String linha5 = "";

  @observable
  String linha6 = "";

  @observable
  String linha7 = "";

  @observable
  String linha8 = "";

  @observable
  String linha9 = "";

  @observable
  String linha10 = "";

  @observable
  String linha11 = "";

  @observable
  String linha12 = "";

  @action
  void retornaQtdSelos() {
    qtdSelos.clear();
    if (linha1 != "") {
      qtdSelos.addAll(linha1.trim().split(" "));
    }
    if (linha2 != "") {
      qtdSelos.addAll(linha2.trim().split(" "));
    }
    if (linha3 != "") {
      qtdSelos.addAll(linha3.trim().split(" "));
    }
    if (linha4 != "") {
      qtdSelos.addAll(linha4.trim().split(" "));
    }
    if (linha5 != "") {
      qtdSelos.addAll(linha5.trim().split(" "));
    }
    if (linha6 != "") {
      qtdSelos.addAll(linha6.trim().split(" "));
    }
    if (linha7 != "") {
      qtdSelos.addAll(linha7.trim().split(" "));
    }
    if (linha8 != "") {
      qtdSelos.addAll(linha8.trim().split(" "));
    }
    if (linha9 != "") {
      qtdSelos.addAll(linha9.trim().split(" "));
    }
    if (linha10 != "") {
      qtdSelos.addAll(linha10.trim().split(" "));
    }
    if (linha11 != "") {
      qtdSelos.addAll(linha11.trim().split(" "));
    }
    if (linha12 != "") {
      qtdSelos.addAll(linha12.trim().split(" "));
    }
  }

  @action
  void retornaQtdSelos2() {
    qtdSelos.clear();
    if (linha1 != "") {
      qtdSelos.addAll(linha1.trim().split(" "));
    }
    if (linha2 != "") {
      qtdSelos.addAll(linha2.trim().split(" "));
    }
    if (linha3 != "") {
      qtdSelos.addAll(linha3.trim().split(" "));
    }
    if (linha4 != "") {
      qtdSelos.addAll(linha4.trim().split(" "));
    }
    if (linha5 != "") {
      qtdSelos.addAll(linha5.trim().split(" "));
    }
    if (linha6 != "") {
      qtdSelos.addAll(linha6.trim().split(" "));
    }
  }

  @action
  void gerarDadosPDF(
      String endereco,
      String codigoEmpresa,
      String nomeparc,
      String descrprod,
      String linha1,
      String linha2,
      String linha3,
      String linha4,
      String linha5,
      String linha6,
      String linha7,
      String linha8,
      String linha9,
      String linha10,
      String linha11,
      String linha12) {
    this.endereco = "";
    this.codigoEmpresa = "1";
    this.nomeparc = "";
    this.descrprod = "";
    this.linha1 = "";
    this.linha2 = "";
    this.linha3 = "";
    this.linha4 = "";
    this.linha5 = "";
    this.linha6 = "";
    this.linha7 = "";
    this.linha8 = "";
    this.linha9 = "";
    this.linha10 = "";
    this.linha11 = "";
    this.linha12 = "";
    this.qtdSelos.clear();
    this.endereco = endereco;
    this.codigoEmpresa = codigoEmpresa;
    this.nomeparc = nomeparc;
    this.descrprod = descrprod;
    this.linha1 = linha1;
    this.linha2 = linha2;
    this.linha3 = linha3;
    this.linha4 = linha4;
    this.linha5 = linha5;
    this.linha6 = linha6;
    this.linha7 = linha7;
    this.linha8 = linha8;
    this.linha9 = linha9;
    this.linha10 = linha10;
    this.linha11 = linha11;
    this.linha12 = linha12;
  }

  @action
  void gerarDadosMultiPDF(
    String endereco,
    String codigoEmpresa,
    String nomeparc,
    String descrprod,
    String descrprod2,
    String descrprod3,
    String linha1,
    String linha2,
    String linha3,
    String linha4,
    String linha5,
    String linha6,
  ) {
    this.endereco = "";
    this.codigoEmpresa = "1";
    this.nomeparc = "";
    this.descrprod = "";
    this.descrprod2 = "";
    this.descrprod3 = "";
    this.linha1 = "";
    this.linha2 = "";
    this.linha3 = "";
    this.linha4 = "";
    this.linha5 = "";
    this.linha6 = "";
    this.qtdSelos.clear();
    this.endereco = endereco;
    this.codigoEmpresa = codigoEmpresa;
    this.nomeparc = nomeparc;
    this.descrprod = descrprod;
    this.descrprod2 = descrprod2;
    this.descrprod3 = descrprod3;
    this.linha1 = linha1;
    this.linha2 = linha2;
    this.linha3 = linha3;
    this.linha4 = linha4;
    this.linha5 = linha5;
    this.linha6 = linha6;
  }
}
