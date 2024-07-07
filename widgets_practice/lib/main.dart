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
          home: Scaffold(
          body: SafeArea(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("https://img.freepik.com/premium-photo/serious-muslim-man_23-2147794224.jpg"),
                    ),
                  title: Text("Ali Maqsood"),
                  subtitle: Text("Enterprnuer"),
                  trailing: Icon(Icons.time_to_leave_outlined),
                );
              }, 
            ),
          )
            // Center(
            //   // child: RichText(
            //   //   text: TextSpan(
            //   //     text: "Don't have an account? ",
            //   //     style: Theme.of(context).textTheme.bodyText1,
            //   //     children: [
            //   //       TextSpan(
            //   //         text: "Signup",
            //   //         style: TextStyle(fontWeight: FontWeight.bold))
            //   //     ]
            //   //   )
            //   // )
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 50),
            //         child: TextField(
            //         keyboardType: TextInputType.emailAddress,
            //         decoration: InputDecoration(
            //         hintText: "Email",
            //         prefixIcon: Icon(Icons.email_outlined),
            //         fillColor: Colors.lime,
            //         filled: false,
            //         enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.teal, width: 3),
            //           borderRadius: BorderRadius.circular(10) 
            //         ),
            //       focusedBorder: OutlineInputBorder(
            //           borderSide:BorderSide(color: Colors.teal, width: 3),
            //           borderRadius: BorderRadius.circular(10) 
            //         )
            //       ),
            //       onChanged: (value){
            //           print(value);
            //       },
            //                         ),
            //       ),
            //     SizedBox(height: 5,),
            //     Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 50),
            //         child: TextField(
            //         keyboardType: TextInputType.text,
            //         decoration: InputDecoration(
            //         hintText: "Password",
            //         prefixIcon: Icon(Icons.password_outlined),
            //         fillColor: Colors.lime,
            //         filled: false,
            //         enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.teal, width: 3),
            //           borderRadius: BorderRadius.circular(10) 
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderSide:BorderSide(color: Colors.teal, width: 3),
            //           borderRadius: BorderRadius.circular(10) 
            //         )
            //       ),
            //       onChanged: (value){
            //           print(value);
            //       },
            //                         ),
            //       )]
            //   ),
            // )
          ),
    );
  }
}
