import 'package:flutter/material.dart';
import 'package:gestao_financeira/app/viewmmodel/login/login_viewmodel.dart';
import 'package:gestao_financeira/app/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WidgetFormLogin extends StatefulWidget {
  const WidgetFormLogin({super.key, required this.viewmodel});

  final LoginViewModel viewmodel;

  @override
  State<WidgetFormLogin> createState() => _WidgetFormLoginState();
}

class _WidgetFormLoginState extends State<WidgetFormLogin> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Form(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: screenSize.height / 2.5),
              _buildFormEmail(),
              _buildFormSenha(),
              _lembrarSenha(),
              _buildButtonLogin(),
            ],
          ),
          Positioned(
            top: screenSize.height * 0.15,
            left: screenSize.width * 0.3,
            child: Column(
              children: [
                Image(
                  image: const AssetImage('assets/img/logo.png'),
                  height: screenSize.height / 5.5,
                  width: screenSize.width / 2.5,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Financy uAI',
                    style: GoogleFonts.shrikhand(
                      fontSize: 20,
                      color: const Color(0XFF046DB5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormEmail() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
      child: CustomTextFormField(
        labelText: "Email",
        hintText: "Digite seu email",
        prefixIcon: const Icon(LucideIcons.mail),
        controller: TextEditingController(),
      ),
    );
  }

  Widget _buildFormSenha() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: CustomTextFormField(
        labelText: "Senha",
        hintText: "Digite sua senha",
        controller: TextEditingController(),
        prefixIcon: const Icon(LucideIcons.lock),
        suffixIcon: IconButton(
          icon: widget.viewmodel.chengeObscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              widget.viewmodel.chengeObscureText =
                  !widget.viewmodel.chengeObscureText;
            });
          },
        ),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: ElevatedButton(
        onPressed: () {
          // widget.viewmodel.login();
        },
        child: const Text('Entrar'),
      ),
    );
  }

  Widget _lembrarSenha() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              const Text('Lembrar senha'),
            ],
          ),
          TextButton(
            onPressed: () {
              // widget.viewmodel.recuperarSenha();
            },
            child: const Text('Recuperar senha'),
          ),
        ],
      ),
    );
  }
}
