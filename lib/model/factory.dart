class MaptoModel
{
  String? quotes,author,category;
  MaptoModel(this.quotes,this.author,this.category);

  factory MaptoModel.quotes(Map quotes)
  {
    MaptoModel m1 = MaptoModel(quotes ["quotes"], quotes["author"], quotes["category"]);
    return m1;
  }
}
