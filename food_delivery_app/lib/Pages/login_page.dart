import "package:flutter/material.dart";
import "package:food_delivery_app/Components/custom_text_field.dart";
import "package:food_delivery_app/Components/custom_button.dart";
import "./home_page.dart";
class LoginPage extends StatefulWidget
{
  final Function()? onTap;
  LoginPage({required this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
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
                //Login Button
                CustomButton(text: "Login", onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }),
                const SizedBox(height:20),
                //Don't have an account
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                        onTap: widget.onTap,
                        child:  Text("Signup", style: TextStyle(
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