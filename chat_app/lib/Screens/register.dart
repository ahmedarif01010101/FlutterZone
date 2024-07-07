import 'package:chat_app/Authentication/auth.dart';
import 'package:chat_app/Database/database_services.dart';
import 'package:chat_app/Models/usermodel.dart';
// import 'package:chat_app/Screens/routes.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final DatabaseServices _database = DatabaseServices();
  Auth _auth = Auth();
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
           
              SizedBox(
                height: 15,
              ),
              Text(
                "SignUp",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(right: 35, left: 35),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } 
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            } 
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _confirmPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Confirm Passorward",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                          ),
                        ),
                        SizedBox(height: 15,),
                        ElevatedButton(
                          child: Text(
                            "Register!",
                            style: TextStyle(fontSize: 20,color: Colors.black),
                          ),
                          onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                              UserModel? user =  await _auth.Register(_email.text, _password.text);
                              print(user!.email);
                              await _database.addUser(user);
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          child: Text("Already have an account?"),
                          onTap: (){
                            // Navigator.pushNamed(context, Myroute.loginroute);
                          },
                        )
        
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
