import 'package:flutter/material.dart';
import 'package:gestao_financeira/app/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WidgetFormCadastro extends StatefulWidget {
  const WidgetFormCadastro({super.key});

  @override
  State<WidgetFormCadastro> createState() => _WidgetFormCadastroState();
}

class _WidgetFormCadastroState extends State<WidgetFormCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
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
      ),
    );
  }

  Widget _buildFormEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: CustomTextFormField(
        labelText: "Email",
        hintText: "Digite seu email",
        prefixIcon: const Icon(LucideIcons.mail),
        controller: _emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira seu email';
          }
          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Por favor, insira um email válido';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildFormSenha() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: CustomTextFormField(
        labelText: "Senha",
        hintText: "Digite sua senha",
        controller: _passwordController,
        isObscureText: true,
        prefixIcon: const Icon(LucideIcons.lock),
        suffixIcon: IconButton(
          icon: const Icon(Icons.visibility_off),
          onPressed: () {},
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira sua senha';
          }
          if (value.length < 6) {
            return 'A senha deve ter pelo menos 6 caracteres';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildButtonLogin() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0XFF9AD0D3)),
                padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Entrar',
                style: TextStyle(color: Color(0XFF0A2049)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: ButtonStyle(
                side: WidgetStateProperty.all(
                  const BorderSide(color: Color(0XFF046DB5)),
                ),
                padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Registrar',
                style: TextStyle(color: Color(0XFF046DB5)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lembrarSenha() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
