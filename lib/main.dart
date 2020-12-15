import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
    home: Login(),
  debugShowCheckedModeBanner: false,
));

class Login extends StatelessWidget {
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  get value => null;
    void validate(){
      if(formkey.currentState.validate()){
        print('Validated');
      }else{
        print('Not Validated');
      }
    }

    String validatepass(value){
      if(value.isEmpty){
        return "Required";
      }else if(value.length<6){
        return "should be atleast 6 Character";
      }else if(value.length>15){
        return "should not be more than 15 character";
      }else {
        return null;
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('AppBar')
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(

                    ),labelText: 'Email'
                  ),validator:MultiValidator([
                    RequiredValidator(errorText: 'Required'),
                  EmailValidator(errorText: "Not a Valid Email")
                ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(

                      ),labelText: 'Password',

                    ),validator: validatepass,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: validate,
                    child: Text('Login'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
