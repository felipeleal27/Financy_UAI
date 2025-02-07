import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final bool isPassword;
  final bool isObscureText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool isCurrency;
  final TextCapitalization textCapitalization; // Adicionando este parâmetro

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.onChanged,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.isPassword = false,
    this.isObscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isCurrency = false,
    this.textCapitalization = TextCapitalization.none, // Valor padrão
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _internalController;
  bool _isListenerActive = true;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller;
    if (widget.isCurrency) {
      _internalController.addListener(_formatCurrency);
    }
  }

  @override
  void dispose() {
    if (widget.isCurrency) {
      _internalController.removeListener(_formatCurrency);
    }
    super.dispose();
  }

  void _formatCurrency() {
    if (!_isListenerActive) return;

    _isListenerActive = false;

    final rawText = _internalController.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (rawText.isNotEmpty) {
      try {
        if (rawText.length > 12) {
          _isListenerActive = true;
          return;
        }

        final value = double.parse(rawText) / 100;
        final formattedValue = NumberFormat.currency(
          locale: 'pt_BR',
          symbol: '',
          decimalDigits: 2,
        ).format(value).trim();

        _internalController.value = TextEditingValue(
          text: formattedValue,
          selection: TextSelection.collapsed(offset: formattedValue.length),
        );

        widget.onChanged?.call(value.toString());
      } catch (e) {
        debugPrint('Erro ao formatar moeda: $e');
      }
    } else {
      _internalController.value = const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
      widget.onChanged?.call('');
    }

    _isListenerActive = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        widget.onChanged?.call(value.toString().trim());
      },
      controller: _internalController,
      keyboardType: widget.isCurrency ? TextInputType.number : widget.keyboardType,
      inputFormatters:
          widget.isCurrency ? [FilteringTextInputFormatter.digitsOnly] : null,
      obscureText: widget.isObscureText,
      textCapitalization: widget.textCapitalization, // Definindo o comportamento da capitalização
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(fontSize: 16.0),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontStyle: FontStyle.italic),
        filled: true,
        fillColor: const Color(0XFFF7F7F7),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Color(0XFFCDCDCD), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        prefixIcon: widget.isCurrency
            ? const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 8.0),
                child: Text(
                  'R\$',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: widget.prefixIcon,
                  )
                : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator,
    );
  }
}

