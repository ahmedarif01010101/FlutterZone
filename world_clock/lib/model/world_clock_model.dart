import "dart:convert";
import "package:http/http.dart";

class WorldClockModel
{
  //Attributes.
   String location;
   String uri;
   String? time;
   String flag;
   String? hour;
   String? minutes;
   String? seconds;


   //Setting up the constructor.
   WorldClockModel({required this.uri, required this.flag, required this.location});

  Future<void> getTime () async
  {
    String? datetime = "";
    String? utc_offset = "";
    //Getting the World Time from the World Clock Api.
    try
    {
    Uri url = Uri.parse("http://worldtimeapi.org/api/timezone/$uri");
    Response response = await get(url);
    Map data = json.decode(response.body);
     datetime = data["datetime"];
     utc_offset = data["utc_offset"].toString().substring(1,3);
    }
    catch (e)
    {
        print("Unable to fetch time, error: $e");
    }

    //Making DateTime.
    DateTime now = DateTime.parse(datetime!);
    now = now.add(Duration(hours: int.parse(utc_offset!)));
    time = now.toString();

    //initializing the time.
    hour = now.hour.toString();
    print(hour);
    minutes = now.minute.toString();
    print(minutes);
    seconds = now.second.toString();
  }
}