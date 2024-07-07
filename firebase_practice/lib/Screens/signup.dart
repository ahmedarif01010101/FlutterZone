import "package:firebase_practice/Auth/authservices.dart";
import "package:firebase_practice/Model/user.dart";
import "package:firebase_practice/Screens/home.dart";
import "package:flutter/material.dart";

class SignUp extends StatefulWidget
{
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthServices _authServices = AuthServices();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sign UP"),
              TextFormField(
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please enter email";
                  }
                },
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter Email"
                ),
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty)
                  {
                    return "Please enter Password";
                  }
                },
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Enter Password"
                ),
              ),
              MaterialButton(
                child: Text("Sign UP"),
                onPressed: () async{
                  if(_formKey.currentState!.validate())
                  {
                   try
                      {
                        MyUser? _user = await _authServices.signUp(_emailController.text, _passwordController.text);
                        if(_user != null)
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                        }
                      }
                      catch (e)
                      {
                        print("User not Signed up");
                      }
                  }
                  else
                  {
                    setState(() {
                      
                    });
                  }
                },
              )
            ],
          )
        ),
      )
    );
  }
}