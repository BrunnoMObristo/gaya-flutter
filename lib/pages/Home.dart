import 'package:flutter/material.dart';
import 'package:app_gaya/helper/LojaHelper.dart';
import 'package:app_gaya/model/Loja.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _razaoSocialController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _nomeFantasiaController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _celularController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _complementoController = TextEditingController();
  TextEditingController _segmentoController = TextEditingController();

  var _db = LojaHelper();
  List<Loja> _lojas = <Loja>[];
 
  _exibirTelaCadastro({Loja? loja}) {
    String textoSalvarAtualizar = "";
    if (loja == null) {
      //salvando
      _razaoSocialController.text = "";      
      _cnpjController.text = "";
      _nomeFantasiaController.text = "";
      _telefoneController.text = "";
      _celularController.text = "";
      _cepController.text = "";
      _estadoController.text = "";
      _cidadeController.text = "";
      _enderecoController.text = "";
      _descricaoController.text = "";
      _segmentoController.text = "";
      _complementoController.text = "";
      
      textoSalvarAtualizar = "Salvar";
    } else {
      //editar
       _razaoSocialController.text = loja.razaoSocial!;
      _descricaoController.text = loja.descricao!;
      _cnpjController.text = loja.cnpj!;
      _nomeFantasiaController.text = loja.nomeFantasia!;
      _telefoneController.text = loja.telefone!;
      _celularController.text = loja.celular!;
      _cepController.text = loja.cep!;
      _estadoController.text =loja.estado!;
      _cidadeController.text = loja.cidade!;
      _enderecoController.text = loja.endereco!;
      _descricaoController.text = loja.descricao!;
      _segmentoController.text = loja.segmento!;
      _complementoController.text = loja.complemento!;
      textoSalvarAtualizar = "Editar";
    }
 
    showDialog(
        context: context,        
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar loja"),
            insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            content: Column(              
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[                                
                TextField(
                  controller: _nomeFantasiaController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Nome Fantasia"),
                ),                
                TextField(
                  controller: _celularController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "N° de celular"),
                ),
                TextField(
                  controller: _cepController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "CEP"),
                ),                
                TextField(
                  controller: _cidadeController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Cidade"),
                ),                
                TextField(
                  controller: _descricaoController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Descrição da Loja"),
                ),                       
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarLoja(lojaSelecionada: loja);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarLojas() async {
    List lojasRecuperadas = await _db.recuperarLojas();
 
    List<Loja>? listaTemporaria = <Loja>[];
    for (var item in lojasRecuperadas) {
      Loja loja = Loja.fromMap(item);
      listaTemporaria.add(loja);
    }
 
    setState(() {
      _lojas = listaTemporaria!;
    });
    listaTemporaria = null;

  }
 
  _salvarAtualizarLoja({Loja? lojaSelecionada}) async {
      String razaoSocial = _razaoSocialController.text;
      String cnpj = _cnpjController.text;
      String nomeFantasia = _nomeFantasiaController.text;
      String telefone = _telefoneController.text;
      String celular = _celularController.text;
      String cep = _cepController.text;
      String estado = _estadoController.text;
      String cidade =  _cidadeController.text;
      String endereco = _enderecoController.text;  
      String descricao = _descricaoController.text;
      String segmento = _segmentoController.text;
      String complemento = _complementoController.text;
 
    if (lojaSelecionada == null) {
      //salvar
      Loja loja =
          Loja(razaoSocial, cnpj, nomeFantasia, telefone, celular, cep, estado, cidade, endereco, descricao, segmento, complemento);
      int resultado = await _db.salvarLoja(loja);
    } else {
      //atualizar
      lojaSelecionada.razaoSocial = razaoSocial;
      lojaSelecionada.cnpj = cnpj;
      lojaSelecionada.nomeFantasia = nomeFantasia;
      lojaSelecionada.telefone = telefone;
      lojaSelecionada.celular = celular;
      lojaSelecionada.cep = cep;
      lojaSelecionada.estado = estado;
      lojaSelecionada.cidade = cidade;
      lojaSelecionada.endereco = endereco;  
      lojaSelecionada.descricao = descricao;
      lojaSelecionada.segmento = segmento;
      lojaSelecionada.complemento = complemento;
      int resultado = await _db.atualizarLoja(lojaSelecionada);
    }
 
    _razaoSocialController.clear();  
      _cnpjController.clear();
      _nomeFantasiaController.clear();
      _telefoneController.clear();
      _celularController.clear();
      _cepController.clear();
      _estadoController.clear();
      _cidadeController.clear();
      _enderecoController.clear();
      _descricaoController.clear();
      _segmentoController.clear();
      _complementoController.clear();
    _descricaoController.clear();
 
    _recuperarLojas();
  }
 
  _formatarData(String data) {
    initializeDateFormatting("pt_BR");
 
    //Year -> y month-> M Day -> d
    // Hour -> H minute -> m second -> s
    //var formatador = DateFormat("d/MMMM/y H:m:s");
    var formatador = DateFormat.yMd("pt_BR");
 
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
 
    return dataFormatada;
  }
 
  _removerLoja(int id) async {
    await _db.removerLoja(id);
 
    _recuperarLojas();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarLojas();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _lojas.length,
                  itemBuilder: (context, index) {
                  final loja = _lojas[index];
                    return  SizedBox(
                     
                      height: 150,
                      width:100,
                 child: Card(
                    child: ListTile(                      
                        title: Text(loja.nomeFantasia!, style: TextStyle(color:Colors.green[800], fontSize: 20)),
                        leading: const CircleAvatar(              
                        radius: 40,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage('https://img2.gratispng.com/20180402/qkq/kisspng-business-company-building-organization-economy-5ac1d028926ef5.1613807515226511765998.jpg'),
                        ),              
                      ),                
                              
                        subtitle: Text(
                            (loja.descricao!)),     
                                                   
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[                            
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(loja: loja);
                              },
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerLoja(loja.id!);
                              },
                              child: const Padding(
                               padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
 

