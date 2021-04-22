import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Screens/browse.dart';
import 'package:flutter_app_itshare/Widgets/customappbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_itshare/Models/categories/categoryController.dart';
import 'package:flutter_app_itshare/Models/categories/categoryModel.dart';
import 'package:flutter_app_itshare/Widgets/loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void initState() {
  Provider.of<CategoryController>(context,listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listen=Provider.of<CategoryController>(context,listen: true);
    var notListen=Provider.of<CategoryController>(context,listen: false);
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              CustomAppBar(
                  MediaQuery.of(context).size.height / 4,
                  'Cairo, Egypt\n search for doctors near you',
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.5),
                        color: Colors.white70),
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Search By Location',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  Icons.sort),
              Container(
                  height: MediaQuery.of(context).size.height / 5.5,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xffedf7f8),
                      image: DecorationImage(
                          image: AssetImage('assets/images/doctorhome.jpg'),
                          alignment: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    '  Schedule your next\n  Doctor appointments\n  Today!',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff03CBC8)),
                  )),
              headline('Categories'),
              Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 4.10,
                  child: listen.allCategories.isEmpty? Loading(): scrollSection(notListen.allCategories)),
              headline('Suggested Doctors'),
              doctorSuggestions('Shehab Ahmed', 'Dental'),
              doctorSuggestions('Basel Allam', 'Kids'),
              doctorSuggestions('Mohamed Ahmed', 'Cardiologist')
            ],
          ),
        ));
  }

  headline(String title) {
    return ListTile(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (_) {
          return (title == 'Categories'
              ? Browse()
              : Container(
                  color: Colors.amber,
                ));
        }));
      },
      title: Text(title,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      trailing: Icon(
        Icons.navigate_next,
        size: 25,
        color: Colors.grey,
      ),
    );
  }

  scrollSection(List<CategoryModel> pro) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pro.length,
        itemBuilder: (context, index) {
          return Container(
              width: MediaQuery.of(context).size.width / 2.5,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(pro[index].categoryImage),
                      fit: BoxFit.fill,
                      colorFilter:
                          ColorFilter.mode(Colors.black38, BlendMode.color))),
              alignment: Alignment.center,
              child: Text(
                pro[index].categoryName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ));
        });
  }

  doctorSuggestions(String drName, String drProf) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: ListTile(
        leading: CircleAvatar(
          minRadius: 35,
          maxRadius: 35,
          backgroundImage: AssetImage('assets/images/doctor1.jpg'),
        ),
        title: Text(
          'Dr. $drName',
          style: TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              drProf,
              style: TextStyle(
                  color: Color(0xff03CBC8),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.amber,
                ),
                Text('  4.9  25 Reviews',
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 15))
              ],
            )
          ],
        ),
      ),
    );
  }
}
