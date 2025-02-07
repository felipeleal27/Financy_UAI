import 'package:flutter/material.dart';
import 'package:gestao_financeira/app/viewmmodel/home/home_viewmodel.dart';

class WidgetsButtons extends StatefulWidget {
  const WidgetsButtons({super.key, required this.viewmodel});

  final HomeViewmodel viewmodel;

  @override
  State<WidgetsButtons> createState() => _WidgetsButtonsState();
}

class _WidgetsButtonsState extends State<WidgetsButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buttonDiaSelecionado(
          onTap: () async {
            widget.viewmodel.selectDespesa();
          },
          text: "Despesa",
          isSelected: widget.viewmodel.isSelectedDespesa,
        ),
        buttonDiaSelecionado(
          onTap: () async {
            widget.viewmodel.selectReceita();
          },
          text: "Receita",
          isSelected: widget.viewmodel.isSelectedReceita,
        ),
      ],
    );
  }

  Widget buttonDiaSelecionado({
    required String text,
    required bool isSelected,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.green.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
          border: Border.all(
            color: isSelected ? Colors.green : Colors.black,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
