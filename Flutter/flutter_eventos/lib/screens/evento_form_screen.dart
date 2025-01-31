import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/api_service.dart';
import '../widgets/gradient_button.dart';
import '../widgets/date_picker_dialog.dart';

class EventoFormScreen extends StatefulWidget {
  @override
  _EventoFormScreenState createState() => _EventoFormScreenState();
}

class _EventoFormScreenState extends State<EventoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  DateTime? _selectedDate;
  bool _isLoading = false;
  String? _dateError; // Para mostrar errores de selección de fecha

  Future<void> _guardarEvento() async {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      setState(() {
        _isLoading = true;
        _dateError = null;
      });
      final horaActual = DateFormat('HH:mm:ss').format(DateTime.now());
      final response = await ApiService.guardarEvento(
        titulo: _tituloController.text,
        descripcion: _descripcionController.text,
        fecha: DateFormat('yyyy-MM-dd').format(_selectedDate!),
        hora: horaActual,
      );

      setState(() {
        _isLoading = false;
      });

      if (response) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Evento guardado con éxito!"), backgroundColor: Colors.green),
        );
        _tituloController.clear();
        _descripcionController.clear();
        setState(() {
          _selectedDate = null;
          _dateError = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("❌ Error al guardar el evento"), backgroundColor: Colors.redAccent),
        );
      }
    } else {
      setState(() {
        if (_selectedDate == null) {
          _dateError = "Seleccione una fecha";
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ Complete todos los campos correctamente"), backgroundColor: Colors.redAccent),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Center(
        child: Container(
          width: 380,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, spreadRadius: 3, offset: const Offset(0, 8))],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text("Registrar Evento", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
                ),
                const SizedBox(height: 20),

                /// **Campo de Título**
                TextFormField(
                  controller: _tituloController,
                  decoration: InputDecoration(
                    labelText: "Título",
                    filled: true,
                    fillColor: const Color(0xFFF8F9FA),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Ingrese un título";
                    if (value.length < 3) return "Debe tener al menos 3 caracteres";
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                /// **Campo de Descripción**
                TextFormField(
                  controller: _descripcionController,
                  decoration: InputDecoration(
                    labelText: "Descripción",
                    filled: true,
                    fillColor: const Color(0xFFF8F9FA),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value!.isEmpty) return "Ingrese una descripción";
                    if (value.length < 10) return "Debe tener al menos 10 caracteres";
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                /// **Campo de Fecha**
                InkWell(
                  onTap: () async {
                    final selectedDate = await showCustomDatePicker(context);
                    if (selectedDate != null) {
                      setState(() {
                        _selectedDate = selectedDate;
                        _dateError = null; // Limpia el error cuando se selecciona una fecha
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Fecha del evento",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      suffixIcon: const Icon(Icons.calendar_today, color: Colors.blueGrey),
                      errorText: _dateError, // 🔹 Muestra error si no se selecciona una fecha
                    ),
                    child: Text(
                      _selectedDate == null ? "Seleccione una fecha" : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                /// **Botón Guardar con Loading**
                GradientButton(onPressed: _isLoading ? null : _guardarEvento, text: "Guardar Evento", isLoading: _isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
