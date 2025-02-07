import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/utils/bottom_navigation_bar.dart';
import 'package:gestao_financeira/app/utils/ui_config_theme.dart';
import 'package:gestao_financeira/app/viewmmodel/home/home_viewmodel.dart';
import 'package:gestao_financeira/app/views/home/module/home_nome_rotas.dart';
import 'package:gestao_financeira/app/views/login/module/login_nome_rotas.dart';
import 'package:gestao_financeira/app/widgets/custom_snack_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Escolher da Galeria"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Tirar uma Foto"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiConfigTheme.themelight.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Modular.to.navigate(HomeNomeRotas.navigate);
        }, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Ajustes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 20),
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : const AssetImage('assets/img/user_img.png')
                                  as ImageProvider,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt, size: 16),
                              color: Colors.blue,
                              onPressed: _showImageSourceDialog,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    'Felipe da Silva Leal',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                  'felipe.leal@aluno.unifenas.br',
                ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8),
              child: Column(
                children: [
                  groupInfo(
                    title: 'Geral',
                      [
                      listTileCard(icon: Icons.person, title: 'Perfil', onTap: () {}),
                      listTileCard(icon: Icons.nightlight_round, title: 'Tema Claro', onTap: () {}, isSwitch: true),
                      listTileCard(icon: Icons.logout, title: 'Sair', onTap: () {
                        Modular.to.navigate(LoginNomeRotas.navigate);
                      }),
                    ],
                  ),
                  const SizedBox(height: 20),
                  groupInfo(title: 'Configurações', [
                    listTileCard(icon: Icons.category, title: 'Adicionar Categoria', onTap: () {}),
                    listTileCard(icon: Icons.attach_money, title: 'Definir Limite', onTap: () {}),
                  ]),
                  const SizedBox(height: 20),
                    groupInfo(title: 'Feedback', [
                    listTileCard(icon: Icons.warning, title: 'Reportar um bug', onTap: () {}),
                    listTileCard(icon: Icons.star, title: 'Avaliar Aplicativo', onTap: () {
                      showRatingDialog(context);
                    }),
                  ]),
                  
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Modular.get<HomeViewmodel>().isDialogOpen(true);
            Modular.to.navigate(HomeNomeRotas.navigate);
          },
          backgroundColor: const Color(0XFF076106),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 4),
    );
  }

  Widget groupInfo(List<Widget> children, {required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Card(
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget listTileCard(
      {required IconData icon,
      required String title,
      required Function() onTap,
      bool isSwitch = false}) {
    return ListTile(
      onTap: onTap,
      leading: Card(
        color: UiConfigTheme.themelight.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(title),
      trailing: !isSwitch ? const Icon(Icons.arrow_forward_ios_outlined) : Switch(value: true, onChanged: (value) {}),
    );
  }

  void showRatingDialog(BuildContext context) {
  double rating = 0;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Center(child: Text("Avaliar")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 40,
                      ),
                      onPressed: () {
                        setState(() {
                          rating = index + 1.0;
                        });
                      },
                    );
                  }),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (rating > 4) {
                showFireworks(context);
              }
              CustomSnackBar.success(context, 'Avaliação enviada com sucesso!');
            },
            child: const Text("Enviar"),
          ),
        ],
      );
    },
  );
}

void showFireworks(BuildContext context) {
  final overlay = Overlay.of(context);

  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned.fill(
      child: Stack(
        children: [
          Center(
            child: Lottie.asset('assets/lottie/confetti.json', repeat: false),
          ),
        ],
      ),
    ),
  );

  WidgetsBinding.instance.addPostFrameCallback((_) {
    overlay.insert(overlayEntry);
  });

  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

}
