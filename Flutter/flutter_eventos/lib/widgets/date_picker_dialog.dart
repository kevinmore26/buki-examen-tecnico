import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Future<DateTime?> showCustomDatePicker(BuildContext context) async {
  DateTime? selectedDate;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("📅 Seleccionar Fecha", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              const SizedBox(height: 10),
              SfDateRangePicker(
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.single,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  selectedDate = args.value as DateTime?;
                },
              ),
              const SizedBox(height: 15),
              TextButton(child: const Text("Aceptar"), onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      );
    },
  );

  return selectedDate;
}
