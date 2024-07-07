import "package:flutter/material.dart";

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.white,
                body: SafeArea(
                  child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height:130
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("images/logo.png"), width: 60, height: 60,),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("MAINTENANCE", style: TextStyle(fontSize:20, fontFamily:"Rubik", fontWeight: FontWeight.bold),),
                                  Text("BOX", style: TextStyle(fontSize:20, fontFamily:"Rubik", fontWeight:FontWeight.bold, color: Color(0XffF9730B)))
                                ],)
                            ]),
                          SizedBox(height:40),
                          Text("Log in ", style: TextStyle(fontSize: 20, fontFamily:"Rubik", fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Lorem ipsum dolor sit dolore magna aliqua.sunt in culpa qui officia.",textAlign: TextAlign.center,style: TextStyle(fontFamily:"Rubik", fontSize: 10, fontWeight: FontWeight.normal),),
                          SizedBox(height: 40,),
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                fillColor: Color(0xffF8F9FA),
                                filled: true,
                                prefixIcon: Icon(Icons.alternate_email, color: Color(0xff323F4B),),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffE4E7EB)),
                                  borderRadius: BorderRadius.circular(10))
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                fillColor: Color(0xffF8F9FA),
                                filled: true,
                                prefixIcon: Icon(Icons.password_sharp, color: Color(0xff323F4B),),
                                suffix: Icon(Icons.visibility_off_outlined, color: Color(0xff323F4B),),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffE4E7EB)),
                                  borderRadius: BorderRadius.circular(10))
                              ),
                            ),
                          ),
                        SizedBox(height: 5,),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 43),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Forgot Password?", style: TextStyle(),)
                            ],),
                        ),
                        SizedBox(height: 80),
                        Container(
                          height: 50,
                          width:330,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                                        color: Color(0xffF9730B),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                          child: Text("LOG IN", style: TextStyle(fontFamily: "Rubik", fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),),

                        ),
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          SizedBox(width: 5,),
                          Text("Sign up", style: TextStyle(color: Color(0xffF9730B), fontWeight: FontWeight.bold),)
                        ],)
                        ],
                      )
                  ),
                ),
              )
            );
  }
}