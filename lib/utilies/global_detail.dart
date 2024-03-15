import 'package:quotes/model/factory.dart';

Global g1 = Global();
class Global
{
    List<MaptoModel> quotes =[];

    List<Map> l1= [
      {'quotes':"Be yourself; everyone else is already taken.",'author':"Oscar Wilde",'category':"Inspirational"},
      {'quotes':"So many books, so little time.",'author':"Frank Zappa",'category':"Inspirational"},
      {'quotes':"A room without books is like a body without a soul.",'author':" Marcus Tullius Cicero",'category':"Inspirational"},
      {'quotes':"Be yourself; everyone else is already taken.",'author':"Oscar Wilde",'category':"Inspirational"},
    ];

    void create()
    {
      quotes = l1.map((e) => MaptoModel.quotes(e)).toList();
    }
}