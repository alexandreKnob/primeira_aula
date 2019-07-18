import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String nome = "Alexandre";
  String endereco = "Rua Alfredo henn";
  String telefone = "334323434";
  String email = "alexandre@abase.com.br";
  String salario = "7890.34";
  Color corSalario = Colors.blue;

  TextEditingController campoNome = TextEditingController();
  TextEditingController campoEndereco = TextEditingController();
  TextEditingController campoTelefone = TextEditingController();
  TextEditingController campoSalario = TextEditingController();
  TextEditingController campoEmail = TextEditingController();

  void _formatar(){
    setState(() {
      nome      = campoNome.text;
      endereco  = campoEndereco.text;
      telefone  = campoTelefone.text;
      email     = campoEmail.text;
      salario   = campoSalario.text;
      if  (double.parse(salario) > 20000) {
        corSalario = Colors.red;
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Testando Dart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh, color: Colors.black), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.dashboard, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      body:   SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Seu Nome é : " + nome),
            Text("Seu Endereço é : " + endereco),
            Text("Seu Telefone é : " + telefone),
            Text("Seu E-Mail : " + email),
            Text("Seu Salário é " + salario.toString(), style: TextStyle(color: corSalario), ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Informe seus dados ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Informe o seu nome :",
                        labelStyle: TextStyle(color: Colors.blue, fontSize: 14)),
                    textAlign: TextAlign.left,
                    controller: campoNome,
                    validator: (value){
                      if (value.isEmpty){
                        return "Informe o Nome!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Informe o seu ndereço :",
                        labelStyle: TextStyle(color: Colors.blue, fontSize: 14)),
                    textAlign: TextAlign.left,
                    controller: campoEndereco,validator: (value){
                      if (value.isEmpty){
                        return "Informe o Endereço!";
                      }
                    },
                  ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Informe o seu Telefone :",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 14)),
                  textAlign: TextAlign.left,
                  controller: campoTelefone,
                  validator: (value){
                    if (value.isEmpty){
                      return "Informe o Telefone!";
                    }
                  },
                ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Informe o seu Mail :",
                        labelStyle: TextStyle(color: Colors.blue, fontSize: 14)),
                    textAlign: TextAlign.left,
                    controller: campoEmail,
                    validator: (value){
                      if (value.isEmpty){
                        return "Informe o Mail!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Informe o seu Salário :",
                        labelStyle: TextStyle(color: Colors.blue, fontSize: 14)),
                    textAlign: TextAlign.left,
                    controller: campoSalario,
                    validator: (value){
                      if (value.isEmpty){
                        return "Informe o Salário!";
                      }
                    },
                  ),
                  Container( //
                    padding: EdgeInsets.fromLTRB(20, 0.0, 20, 0.0),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 50,
                    child: RaisedButton(
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()){
                           _formatar();
                        }
                      },
                      child: Text("Enviar",style: TextStyle(color: Colors.white, fontSize: 25),),
                      color: Colors.blueAccent,
                    ),
                  ),

                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
