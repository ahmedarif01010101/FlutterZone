import "package:flutter/material.dart";

class ChatScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    List? contactData = ModalRoute.of(context)!.settings.arguments as List?;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.inversePrimary))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                             Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios), 
                          color: Color.fromRGBO(255, 0, 0, 100),
                          onPressed: (){
                            Navigator.pop(context);
                          },),
                        Spacer(flex: 1),
                        Icon(Icons.person),
                        SizedBox(width: 5),
                        Text(contactData![0]),
                        Spacer(flex:6),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: Container(
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(top: BorderSide(color: Theme.of(context).colorScheme.inversePrimary))
            ),
            child: Row(
              children: [
                Icon(Icons.add),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Send Message",
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.tertiary,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.black)),
                      contentPadding: EdgeInsets.all(10)
                    ),
                    cursorColor: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}