// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateContainer extends StatelessWidget {
  final String labelText;
  DateTime? dataSelecionada = DateTime.now();
  final Icon prefixIcon;
  final VoidCallback onTap;
  final bool isThemeDark;

  CustomDateContainer({
    super.key,
    required this.labelText,
    required this.dataSelecionada,
    required this.prefixIcon,
    required this.onTap,
    required this.isThemeDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 60,
        decoration: BoxDecoration(
          color: isThemeDark ? Colors.black : const Color(0XFFF7F7F7),
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: const Color(0XFFCDCDCD), width: 2.0),
        ),
        child: Row(
          children: [
            prefixIcon,
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                dataSelecionada == null ? labelText : DateFormat('dd/MM/yyyy').format(dataSelecionada!),
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
