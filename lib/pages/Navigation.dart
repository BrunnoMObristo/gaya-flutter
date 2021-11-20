import 'package:flutter/material.dart';
import 'package:app_gaya/pages/Home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);
 
  @override
  _NavigationState createState() => _NavigationState();
}
 
class _NavigationState extends State<Navigation> {
  int _currentPage = 1;

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _appBar(("GAYA")),
        body: _body(),
        drawer: Drawer(
            child: ListView(
          children: [
            Icon(Icons.house),
            _titulo("Gaya - By Movtin"),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Home'),
              subtitle: Text('Tela inicial do Gaya'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Lista das Lojas'),
              subtitle: Text('Tela de lojas sustentáveis'),
              trailing: Icon(Icons.account_box_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            
          ],
        )),
      ),
    );
  }
 
  _appBar(texto) {
    return AppBar(
      title: Text(texto),
      centerTitle: true,
      backgroundColor: Colors.blue[900],
    );
  }

  _titulo(texto){
    return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(texto,
            style: TextStyle(fontSize: 22)));
  }
  
 
  _body() {
    if (_currentPage == 1) {
     return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _texto("A Gaya é um aplicativo que veio para centralizar as informações e deixar você bem informada sobre as empresas que ajudam nosso meio ambiente sendo sustentáveis durante sua produtividade!"),
          _texto("Sabemos que sustentabilidade não é brincadeira, então aqui você só encontrará as empresas que realmente estão cientes deste assunto!"),
          _texto("Este App foi desenvolvido pela equipe Movtin.")  
        ],
      ),
    );
    } else if (_currentPage == 2) {
      return Home();
    } 
  }

  _texto(texto) {    
   return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(texto,
            style: TextStyle(fontSize: 22)));
  }
}
