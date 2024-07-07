import "package:flutter/material.dart";
//Scafolding and learning the use of AssetImage, Network image and also learned to change the app icon.
void main()
{
  runApp(MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text("Image"),
                backgroundColor: Colors.grey,
              ),
              backgroundColor: Colors.blue.shade700,
              body:Center(
                    //This is how we can get picture from the internet 
                    // child: Image(image: NetworkImage("https://img.freepik.com/free-photo/digital-art-moon-boat_23-2150918859.jpg?t=st=1708103780~exp=1708107380~hmac=1a214c7a528e4d3de72682a1154bc50991524d3fabd6d44765c816b03fc38364&w=1060"))
                    //This is how we can use image the we have available in our project.
                    child:  Image(image: AssetImage("pictures/pic2.jpg"))

              )
            ),

  )
  );
}