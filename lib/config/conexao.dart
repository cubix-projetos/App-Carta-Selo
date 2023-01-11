abstract class ConexaoApp {
  static String ip = "192.168.1.174";
  static String port = "330";

  static alterar(String ip, String port) {
    ConexaoApp.ip = ip;
    ConexaoApp.port = port;
  }
}
