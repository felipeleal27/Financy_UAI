import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gestao_financeira/app/utils/ui_config_theme.dart';
import 'package:gestao_financeira/app/viewmmodel/home/home_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({super.key, required this.viewmodel});

  final HomeViewmodel viewmodel;

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: UiConfigTheme.themelight.appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 50, right: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Felipe da Silva Leal',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            widget.viewmodel.setCanSeeValue();
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => widget.viewmodel.mudarMes(-1),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      widget.viewmodel.meses[widget.viewmodel.mesAtual],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => widget.viewmodel.mudarMes(1),
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
                Observer(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.viewmodel.canSeeValue
                            ? _saldo(
                            widget.viewmodel.formatarMoeda(widget.viewmodel.saldo).trim(), 'Saldo atual')
                            : _saldo('***', 'Saldo atual'),
                        widget.viewmodel.canSeeValue
                          ? _saldo('134,87', 'Limite disponível') :_saldo('***', 'Limite disponível'),
                      ],
                    ),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Color(0xFF0A2049),
                    thickness: 3,
                    indent: 135,
                    endIndent: 135,
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _saldo(String valor, String descricao) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('R\$',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(width: 5),
            Text(valor,
                style: GoogleFonts.poppins(
                    fontSize: 28, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(descricao),
      ],
    );
  }
}
