import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton2<T> extends StatefulWidget {
  final String hint;
  final T? value;
  final List<T> dropdownItems;
  final IconData? prefixIcon;
  final ValueChanged<dynamic>? onChanged;
  final TextEditingController textEditingController;
  final String title;
  final DropdownButtonBuilder? selectedItemBuilder;
  final String? Function(dynamic)? validator;
  final bool isSearchable;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.prefixIcon,
    required this.onChanged,
    required this.textEditingController,
    required this.title,
    this.selectedItemBuilder,
    this.validator,
    this.isSearchable = true,
    super.key,
  });

  @override
  State<CustomDropdownButton2> createState() =>
      _CustomDropdownButton2State<T>();
}

class _CustomDropdownButton2State<T> extends State<CustomDropdownButton2> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        isExpanded: true,
        decoration: InputDecoration(
          labelText: widget.title,
          labelStyle: const TextStyle(fontSize: 16.0, color: Colors.black),
          hintText: widget.hint,
          hintStyle:
              const TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: Colors.black, // Cor do ícone
                  size: 24.0, // Tamanho do ícone
                )
              : null,
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
        ),
        items: widget.dropdownItems
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: Text(
                  item.toString(),
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            )
            .toList(),
        onChanged: widget.onChanged,
        value: widget.value,
        validator: widget.validator,
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 48.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        dropdownSearchData: widget.isSearchable
            ? DropdownSearchData(
                searchController: widget.textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widget.textEditingController,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      hintText: 'Procure...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              )
            : null,
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            widget.textEditingController.clear();
          }
        },
      ),
    );
  }
}
