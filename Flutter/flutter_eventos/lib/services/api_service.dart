import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      "http://localhost:3000"; // Reemplaza con la URL real de tu backend

  /// 🔹 **Guardar un evento en el backend**
  static Future<bool> guardarEvento({
    required String titulo,
    required String descripcion,
    required String fecha,
    required String hora,
  }) async {
    final url =
        Uri.parse("$_baseUrl/eventos"); // Ruta donde tu backend guarda eventos
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "titulo": titulo,
          "descripcion": descripcion,
          "fecha": fecha,
          "hora": hora
        }),
      );

      if (response.statusCode == 201) {
        print("✅ Evento guardado correctamente.");
        return true;
      } else {
        print("❌ Error al guardar evento: ${response.body}");
        return false;
      }
    } catch (e) {
      print("🚨 Error de conexión: $e");
      return false;
    }
  }

  /// 🔹 **Obtener lista de eventos desde el backend**
  static Future<List<Map<String, dynamic>>> obtenerEventos() async {
    final url = Uri.parse("$_baseUrl/eventos");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> eventos = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(eventos);
      } else {
        print("❌ Error al obtener eventos: ${response.body}");
        return [];
      }
    } catch (e) {
      print("🚨 Error de conexión: $e");
      return [];
    }
  }
}
