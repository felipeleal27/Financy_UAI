import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_financeira/app/data/model/categoria_model.dart';
import 'package:gestao_financeira/app/data/model/movimentacao_model.dart';
import 'package:gestao_financeira/app/utils/bottom_navigation_bar.dart';
import 'package:gestao_financeira/app/utils/ui_config_theme.dart';
import 'package:gestao_financeira/app/viewmmodel/home/home_viewmodel.dart';
import 'package:gestao_financeira/app/views/home/widgets/app_bar_home.dart';
import 'package:gestao_financeira/app/widgets/custom_date_container.dart';
import 'package:gestao_financeira/app/widgets/custom_dialog_drop_down.dart';
import 'package:gestao_financeira/app/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewmodel = Modular.get<HomeViewmodel>();
  final reactionDisposer = <ReactionDisposer>[];
  late TextEditingController textEditingController = TextEditingController();
  late TextEditingController valorController = TextEditingController();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    reactionDisposer.add(when(
      (p0) => true,
      () async {
        await viewmodel.buscarDadosIniciais();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (viewmodel.shouldOpenDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialogDespesaReceita(context);
        viewmodel.isDialogOpen(false);
      });
    }

    return Scaffold(
      body: Observer(builder: (context) {
        return viewmodel.carregado
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBarHome(viewmodel: viewmodel),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25.0, right: 25, top: 20),
                    child: CustomTextFormField(
                      labelText: 'Buscar',
                      hintText: 'Buscar',
                      prefixIcon: const Icon(Icons.search),
                      controller: TextEditingController(),
                      onChanged: (value) {},
                    ),
                  ),
                  if (viewmodel.movimentacoesDoMes.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Nenhuma movimentação encontrada'),
                    ),
                  viewmodel.carregouMes
                      ? Expanded(
                          child: ListView.builder(
                            itemCount:
                                viewmodel.movimentacoesPorData.keys.length,
                            itemBuilder: (context, index) {
                              final data = viewmodel.movimentacoesPorData.keys
                                  .elementAt(index);
                              final movimentacoes =
                                  viewmodel.movimentacoesPorData[data]!;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, left: 20),
                                    child: Text(
                                      data,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  ...movimentacoes.map((movimentacao) {
                                    return _cardTransacao(movimentacao);
                                  }),
                                ],
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ],
              )
            : const Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            showDialogDespesaReceita(context);
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
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }

  void showDialogDespesaReceita(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 24.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  'Nova Transação',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton.icon(
                onPressed: () {
                  Modular.to.pop();
                  viewmodel.setIsSaida(false);
                  showDialogNovaMovimentacao(context, viewmodel.isSaida);
                },
                icon: const Icon(Icons.add_circle,
                    color: Colors.white, size: 24.0),
                label: const Text(
                  'Receita',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 6.0,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: () {
                  Modular.to.pop();
                  viewmodel.setIsSaida(true);
                  showDialogNovaMovimentacao(context, viewmodel.isSaida);
                },
                icon: const Icon(Icons.remove_circle,
                    color: Colors.white, size: 24.0),
                label: const Text(
                  'Despesa',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 6.0,
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showDialogNovaMovimentacao(BuildContext context, bool isDespesa) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return Observer(builder: (_) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 24.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: isDespesa
                          ? const Text(
                              'Nova Despesa',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              'Nova Receita',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    const SizedBox(height: 24.0),
                    CustomTextFormField(
                      labelText: 'Nome Movimentação',
                      hintText: 'Digite um nome para movimentação',
                      controller: TextEditingController(),
                      onChanged: (value) {
                        viewmodel.setNomeMovimentacao(value);
                      },
                      textCapitalization: TextCapitalization.sentences,
                      prefixIcon: Icon(
                        isDespesa ? Icons.remove_circle : Icons.add_circle,
                        color: UiConfigTheme.themelight.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    CustomTextFormField(
                      labelText: 'Valor',
                      hintText: 'Digite o valor',
                      controller: valorController,
                      isCurrency: true,
                      onChanged: (value) {
                        // Remove pontos de separadores de milhar
                        final rawValue = value.replaceAll('.', '');

                        // Substitui vírgula por ponto
                        final formattedValue = rawValue.replaceAll(',', '.');

                        // Tenta parsear o valor para double
                        final parsedValue =
                            double.tryParse(formattedValue) ?? 0.0;

                        // Atualiza o valor no viewmodel
                        if (isDespesa) {
                          viewmodel.setValor(-parsedValue);
                        } else {
                          viewmodel.setValor(parsedValue);
                        }
                      },
                      isDespesa: isDespesa,
                    ),
                    const SizedBox(height: 14.0),
                    CustomDateContainer(
                      labelText: 'Data',
                      dataSelecionada: viewmodel.dataSelecionada,
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: UiConfigTheme.themelight.colorScheme.primary,
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (selectedDate != null) {
                          viewmodel.setDataSelecionada(selectedDate);
                        }
                      },
                      isThemeDark: viewmodel.isDark,
                    ),
                    const SizedBox(height: 14.0),
                    CustomDialogDropdown<CategoriaModel>(
                      items: viewmodel.categoria,
                      itemSelected: viewmodel.categoriaSelecionada,
                      onChange: (categoria) {
                        setState(() {
                          viewmodel.categoriaSelecionada = categoria;
                        });
                      },
                      itemLabel: (categoria) => categoria.nome,
                      dialogBackground: Colors.grey[200],
                      labelText: viewmodel.categoriaSelecionada != null
                          ? 'Categoria'
                          : '',
                      validator: (value) =>
                          value == null ? "Selecione uma categoria" : null,
                      formkey: formKey,
                      prefixIcon: Icon(
                        Icons.category,
                        color: UiConfigTheme.themelight.colorScheme.primary,
                      ),
                      hintText: 'Categoria',
                      isThemeDark: viewmodel.isDark,
                    ),
                    const SizedBox(height: 14.0),
                    CustomDialogDropdown<CategoriaModel>(
                      items: viewmodel.categoria,
                      itemSelected: viewmodel.categoriaSelecionada,
                      onChange: (categoria) {
                        setState(() {
                          viewmodel.categoriaSelecionada = categoria;
                        });
                      },
                      itemLabel: (categoria) => categoria.nome,
                      dialogBackground: Colors.grey[200],
                      labelText: viewmodel.categoriaSelecionada != null
                          ? 'Forma de pagamento'
                          : '',
                      validator: (value) => value == null
                          ? "Selecione a forma de pagamento"
                          : null,
                      formkey: formKey,
                      prefixIcon: Icon(
                        Icons.payment,
                        color: UiConfigTheme.themelight.colorScheme.primary,
                      ),
                      hintText: 'Forma de pagamento',
                      isThemeDark: viewmodel.isDark,
                    ),
                    const SizedBox(height: 14.0),
                    CustomTextFormField(
                      labelText: 'Descrição',
                      hintText: 'Descrição',
                      controller: TextEditingController(),
                      prefixIcon: Icon(
                        Icons.description,
                        color: UiConfigTheme.themelight.colorScheme.primary,
                      ),
                      onChanged: (value) {},
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(
                                  fontSize: 16.0, color: Color(0XFFD10000)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                viewmodel.addMovimentacao(
                                  MovimentacaoModel(
                                    id: (viewmodel.movimentacoesDoMes.length +
                                        1),
                                    nome: viewmodel.nomeMovimentacao,
                                    valor: viewmodel.valor,
                                    idCategoria:
                                        viewmodel.categoriaSelecionada!.id,
                                    isSaida: viewmodel.isSaida,
                                    dataMovimentacao: viewmodel.dataSelecionada,
                                    descricao: '',
                                    idUsuario: 1,
                                  ),
                                );
                                await viewmodel.gravarMovimentacao(
                                  MovimentacaoModel(
                                    id: null,
                                    nome: viewmodel.nomeMovimentacao,
                                    valor: viewmodel.valor,
                                    idCategoria:
                                        viewmodel.categoriaSelecionada!.id,
                                    isSaida: viewmodel.isSaida,
                                    dataMovimentacao: viewmodel.dataSelecionada,
                                    descricao: '',
                                    idUsuario: 1,
                                  ),
                                );
                                await viewmodel.atualizarSaldo(
                                    viewmodel.movimentacoesDoMes.last, false);
                                viewmodel.limparDados();
                                valorController =
                                    TextEditingController(text: '');
                                await viewmodel.buscarMovimentacoesDoMes();
                                Modular.to.pop();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF7AE49A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(
                                    color: Colors.black), // Added black border
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 24.0),
                              elevation: 6.0,
                            ),
                            child: const Text(
                              'Confirmar',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF005218)),
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
        });
      },
    );
  }

  Widget _cardTransacao(MovimentacaoModel movimentacao) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.4,
            children: [
              CustomSlidableAction(
                onPressed: (context) async {
                  await viewmodel.removerMovimentacao(movimentacao);
                  await viewmodel.atualizarSaldo(movimentacao, true);
                },
                padding: EdgeInsets.zero,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFE4A49),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete, color: Colors.white, size: 24),
                      SizedBox(height: 5),
                      Text(
                        'Remover',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              CustomSlidableAction(
                onPressed: (context) {},
                padding: EdgeInsets.zero,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF21B7CA),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.more_horiz, color: Colors.white, size: 24),
                      SizedBox(height: 5),
                      Text(
                        'Mais',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: movimentacao.isSaida
                  ? const Color(0xFFFFEBEE)
                  : const Color(0xFFE8F5E9),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor:
                            UiConfigTheme.themelight.colorScheme.primary,
                        child: const Icon(
                          Icons.car_crash,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movimentacao.nome,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            viewmodel.categoria
                                .firstWhere(
                                    (e) => movimentacao.idCategoria == e.id)
                                .nome,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    viewmodel.canSeeValue
                        ? NumberFormat.currency(
                                locale: 'pt_BR',
                                symbol: 'R\$',
                                decimalDigits: 2)
                            .format(movimentacao.valor)
                        : 'R\$ ***',
                    style: TextStyle(
                      color: movimentacao.isSaida ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
