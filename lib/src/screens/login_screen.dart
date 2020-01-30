import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/bloc.dart';
import 'package:login_bloc/src/bloc/provider.dart';

class LoginScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
         emailField(bloc),
         passwordField(bloc),
         Container(margin: EdgeInsets.only(top: 25.0),),
         submitField()
        ],
      ),
    );
  }

  Widget  emailField(Bloc bloc){

    return  StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
          return  TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email',
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail,
          );
      },
    );

  }

  Widget  passwordField(Bloc bloc){

    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snapshot){
          return  TextField(
            obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            hintText: '**********',
            errorText: snapshot.error
          ),
          onChanged: bloc.changePassword,
        );
      },
    );

  }

  Widget  submitField(){
    return  RaisedButton(
      child: Text('Enviar'),
      onPressed: (){},
    );
  }

}