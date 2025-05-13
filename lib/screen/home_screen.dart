import 'package:bookingapp/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void get_category() async {
    var response = await http
        .get(Uri.parse("http://192.168.0.109:5000/category/all_category"));
    print("response : ${response.body}");
  }
  Category myCategory = Category("Books", "books.png");

  @override
  void initState() {
    // TODO: implement initState
    // get_category();
    myCategory.print_name_category();
    // print(myCategory.name_category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Card(
                elevation: 4,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Hotels',
                    style: TextStyle(color: Colors.white),
                  ),
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/96444/pexels-photo-96444.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
