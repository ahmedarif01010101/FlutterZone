import "package:flutter/material.dart";

import "../Components/custom_button.dart";
import "../Components/custom_text_field.dart";

class RegisterPage extends StatefulWidget
{
  final Function()? onTap;
  RegisterPage({required this.onTap});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController confirmPassword_controller = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(Icons.lock_open_rounded,
                size: 200,
                color: Theme.of(context).colorScheme.inversePrimary
                ),
                const SizedBox(height: 20),
                //app slogan
                Text("Food App Delivery"),
                const SizedBox(height: 20),
                //emial textfield
                CustomTextField(
                  text: "Email", 
                  controller: email_controller, 
                  obscureText: false
                  ),
                const SizedBox(height: 10),
                //password textfield
                CustomTextField(
                  text: "Password", 
                  controller: password_controller, 
                  obscureText: true
                ),
                const SizedBox(height: 10),
                //confirm password textfield
                CustomTextField(
                  text: "Confirm Password", 
                  controller: confirmPassword_controller, 
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                //Login Button
                CustomButton(text: "Signup", onTap: (){
                  print("Signedup");
                }),
                const SizedBox(height:20),
                //Don't have an account
                RichText(
                  text: TextSpan(
                    text: "Already a memeber? ",
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                        onTap: widget.onTap,
                        child:  Text("Login", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary
                      )),
                        )
                      )
                     
                    ]
                  ))

              ],
            )
          ),
    );
  }
}