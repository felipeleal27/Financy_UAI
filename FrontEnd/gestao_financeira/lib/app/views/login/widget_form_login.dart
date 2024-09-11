import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/viewmmodel/login/login_viewmodel.dart';
import 'package:gestao_financeira/app/views/cadastro/module/cadastro_nome_rotas.dart';
import 'package:gestao_financeira/app/views/login/module/login_nome_rotas.dart';
import 'package:gestao_financeira/app/widgets/custom_snack_bar.dart';
import 'package:gestao_financeira/app/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WidgetFormLogin extends StatefulWidget {
  const WidgetFormLogin({super.key, required this.viewmodel});

  final LoginViewModel viewmodel;

  @override
  State<WidgetFormLogin> createState() => _WidgetFormLoginState();
}

TextEditingController emailController = TextEditingController();
TextEditingController senhaController = TextEditingController();

class _WidgetFormLoginState extends State<WidgetFormLogin> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: screenSize.height / 2.5),
                  _buildFormEmail(),
                  _buildFormSenha(),
                  _lembrarSenha(),
                  _buildButtonLogin(),
                  _cadastrar()
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
        ),
      );
    });
  }

  Widget _buildFormEmail(
      {String labelText = 'Email', String hintText = 'Digite seu email'}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
      child: CustomTextFormField(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: const Icon(LucideIcons.mail),
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo obrigatório';
            }
            return null;
          },
          onChanged: (value) {
            if (value.isNotEmpty) {
              _formKey.currentState?.validate();
            }
          },
      ),
    );
  }

  Widget _buildFormSenha() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: CustomTextFormField(
        labelText: "Senha",
        hintText: "Digite sua senha",
        isObscureText: widget.viewmodel.chengeObscureText,
        controller: senhaController,
        prefixIcon: const Icon(LucideIcons.lock),
        suffixIcon: IconButton(
          icon: widget.viewmodel.chengeObscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () => widget.viewmodel.changeObscureText(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            _formKey.currentState?.validate();
          }
        },
      ),
    );
  }

  Widget _buildButtonLogin() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            CustomSnackBar.success(context,
                text: 'Login realizado com sucesso');
          } else {
            CustomSnackBar.info(context,
                text: 'Preencha os campos obrigatórios!', duration: 1);
          }
          // widget.viewmodel.login();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: const Color(0XFF9AD0D3),
        ),
        child: const Text(
          'ENTRAR',
          style: TextStyle(color: Color(0XFF0A2049)),
        ),
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
                value: widget.viewmodel.lembrarSenha,
                onChanged: (value) {
                  widget.viewmodel.changeLembrarSenha(value ?? false);
                },
              ),
              const Text('Lembrar senha'),
            ],
          ),
          TextButton(
            onPressed: () {
              // widget.viewmodel.recuperarSenha();
            },
            child: const Text(
              'Recuperar senha',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cadastrar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Modular.to.pushNamed('${LoginNomeRotas.modulo}${LoginNomeRotas.login}${CadastroNomeRotas.modulo}${CadastroNomeRotas.cadastro}');
            },
            child: const Text('Cadastre-se',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
