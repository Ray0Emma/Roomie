class command {

String id;
double? budjet;
int? capacity;
String? city;
List<String>? Equipment;
List<String>? Regulation;
String? adresse;




command({
  required this.id,
  required this.adresse,
  required this.Regulation,
  required this.Equipment,
  required this.city,
  required this.capacity,
  required this.budjet});


List citys=[
  "El Jadida",
  "Khouribga",
  "Mohammedia",
  "Safi",
  "Temara",
  "Tetouan",
  "Agadir",
  "Oujda",
  "Kenitra",
  "Rabat",
  "Meknes",
  "Salé",
  "Marrakesh",
  "Fez",
  "Casablanca",
];

List? listLanguages = [
  {
    "display": "Garden",
    "value": "Garden",
  },
  {
    "display": "Heater",
    "value": "Heater",
  },
  {
    "display": "French",
    "value": "French",
  },
  {
    "display": "German",
    "value": "German",
  },
  {
    "display": "Chinese",
    "value": "Chinese",
  },
  {
    "display": "Spanish",
    "value": "Spanish",
  },
  {
    "display": "Japanese",
    "value": "Japanese",
  },
];

}