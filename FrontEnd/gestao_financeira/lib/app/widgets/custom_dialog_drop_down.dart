import 'package:flutter/material.dart';

class CustomDialogDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? itemSelected;
  final ValueChanged<T> onChange;
  final String Function(T) itemLabel;
  final Color? dialogBackground;
  final String? Function(T?)? validator;
  final String title;
  final String labelText;
  final GlobalKey<FormState> formkey;
  final Icon? prefixIcon;
  final String hintText;
  final bool isThemeDark;

  const CustomDialogDropdown({
    super.key,
    required this.items,
    required this.onChange,
    required this.itemLabel,
    this.itemSelected,
    this.dialogBackground,
    this.validator,
    this.title = "Selecione um item",
    this.labelText = "Selecionar Item",
    this.hintText = "Selecione um item",
    required this.formkey,
    this.prefixIcon,
    required this.isThemeDark,
  });

  void _showDialog(BuildContext context, ValueChanged<T> onSelected) {
    List<T> filteredItems = List.from(items);
    final TextEditingController searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return StatefulBuilder(
              builder: (context, setStateDialog) {
                void filterItems(String query) {
                  setStateDialog(() {
                    filteredItems = items.where((item) {
                      final label = itemLabel(item).toLowerCase();
                      return label.startsWith(query.toLowerCase()) ||
                          label.contains(query.toLowerCase());
                    }).toList();

                    // Ordena colocando os que começam com a busca primeiro
                    filteredItems.sort((a, b) {
                      final aLabel = itemLabel(a).toLowerCase();
                      final bLabel = itemLabel(b).toLowerCase();
                      if (aLabel.startsWith(query.toLowerCase()) &&
                          !bLabel.startsWith(query.toLowerCase())) {
                        return -1;
                      } else if (!aLabel.startsWith(query.toLowerCase()) &&
                          bLabel.startsWith(query.toLowerCase())) {
                        return 1;
                      }
                      return aLabel.compareTo(bLabel);
                    });
                  });
                }

                return Dialog(
                  backgroundColor: dialogBackground ?? Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              labelText: 'Pesquisar...',
                              border: const OutlineInputBorder(),
                              suffixIcon: searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        searchController.clear();
                                        filterItems('');
                                      },
                                    )
                                  : null,
                            ),
                            onChanged: filterItems,
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(height: 10),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height *
                                  0.5, // Limita altura
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                final item = filteredItems[index];
                                return ListTile(
                                  title: Text(itemLabel(item)),
                                  onTap: () {
                                    onSelected(item);
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: validator,
      builder: (FormFieldState<T> field) {
        return GestureDetector(
          onTap: () {
            _showDialog(context, (selectedItem) {
              onChange(selectedItem);
              field.didChange(selectedItem);
              formkey.currentState?.validate();
            });
          },
          child: InputDecorator(
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              labelText: labelText,
              labelStyle: const TextStyle(fontSize: 16.0),
              filled: true,
              fillColor: isThemeDark ? Colors.black : const Color(0XFFF7F7F7),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide:
                    const BorderSide(color: Color(0XFFCDCDCD), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
              ),
              errorText: field.errorText,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itemSelected != null
                      ? itemLabel(itemSelected as T)
                      : hintText,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        );
      },
    );
  }
}
