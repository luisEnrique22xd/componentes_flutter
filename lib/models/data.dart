class Data {
  String? nombre;
  bool? gustoFlutter;
  int? califFlutter;
  String? movilSev;
  bool? web; 
  bool? emulador;
  bool? dispositivo;

  Data({required String nomb, required bool gusto, required int calif, required String movil, required bool nav, required bool emula, required bool device}){
    nombre = nomb;
    gustoFlutter = gusto;
    califFlutter = calif;
    movilSev = movil;
    web = nav;
    emulador = emula;
    dispositivo = device;
  }
}
