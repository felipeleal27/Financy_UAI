import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.labelColor,
    this.onItemSelected,
    required this.items,
    this.selectedItem,
    this.showSearchBox = true,
    this.dialogBackgroundColor,
    this.compareFn,
  });

  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? labelColor;
  final void Function(T?)? onItemSelected;
  final DropdownSearchOnFind<T> items;
  final T? selectedItem;
  final bool showSearchBox;
  final Color? dialogBackgroundColor;
  final bool Function(T?, T?)? compareFn; // Função de comparação

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedItem != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                labelText ?? '',
                style: TextStyle(
                  color: labelColor ?? Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: labelColor ?? Colors.black,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Row(
              children: [
                if (prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: prefixIcon!,
                  ),
                Expanded(
                  child: DropdownSearch<T>(
                    popupProps: PopupProps.dialog(
                      showSearchBox: showSearchBox,
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          hintText: "Pesquisar...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      dialogProps: DialogProps(
                        backgroundColor: dialogBackgroundColor ?? Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    decoratorProps: DropDownDecoratorProps(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: hintText ?? "Selecione um item",
                        labelStyle: TextStyle(color: labelColor ?? Colors.black),
                        border: InputBorder.none,
                      ),
                    ),
                    items: items,
                    selectedItem: selectedItem,
                    onChanged: onItemSelected,
                    compareFn: compareFn, // Passa a função de comparação
                  ),
                ),
                if (suffixIcon != null) suffixIcon!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
