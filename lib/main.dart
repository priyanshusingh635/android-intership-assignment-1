import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Map<String, List<String>> famousPlaces = {
    'Mumbai': ['Gateway of India', 'Marine Drive', 'Juhu Beach'],
    'Bangalore': ['Lalbagh Botanical Garden', 'Cubbon Park', 'Bangalore Palace'],
    'Varanasi': ['Kashi Vishwanath Temple', 'Dashashwamedh Ghat', 'Sarnath'],
    'Delhi':['Qutub Minar','Red fort','India gate','Lotus temple'],
  };

  List<String> dropDownOptions = [];

  void _onSearchChanged(String query) {
    if (famousPlaces.containsKey(query)) {
      setState(() {
        dropDownOptions = famousPlaces[query]!;
      });
    } else {
      setState(() {
        dropDownOptions = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Famous Places'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Enter city name (e.g., Mumbai)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            if (dropDownOptions.isNotEmpty)
              DropdownButton<String>(
                isExpanded: true,
                value: dropDownOptions[0],
                items: dropDownOptions.map((String place) {
                  return DropdownMenuItem<String>(
                    value: place,
                    child: Text(place),
                  );
                }).toList(),
                onChanged: (String? selectedPlace) {
                  // You can implement further actions here
                },
              ),
          ],
        ),
      ),
    );
  }
}
