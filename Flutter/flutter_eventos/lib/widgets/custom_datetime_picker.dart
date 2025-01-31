import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({Key? key, required this.selectedDate, required this.onDateSelected}) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  void _showDatePicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "📅 Seleccionar Fecha",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
                const SizedBox(height: 10),
                SfDateRangePicker(
                  selectionMode: DateRangePickerSelectionMode.single,
                  onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                    widget.onDateSelected(args.value);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showDatePicker,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedDate == null ? "Seleccione una fecha" : DateFormat('dd/MM/yyyy').format(widget.selectedDate!),
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Icon(Icons.calendar_today, color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }
}
