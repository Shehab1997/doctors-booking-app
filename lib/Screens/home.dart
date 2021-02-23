import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Screens/browse.dart';
import 'package:flutter_app_itshare/Screens/profile.dart';
import 'package:flutter_app_itshare/Screens/appointment.dart';
import 'package:flutter_app_itshare/Widgets/customappbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<int, List> offers = {
    0: [
      '25% Off',
      'https://img.freepik.com/free-vector/discount-concept-illustration_114360-1852.jpg?size=626&ext=jpg'
    ],
    1: [
      '50% Off',
      'https://image.freepik.com/free-vector/discount-loyalty-card-loyalty-program-customer-service-rewards-card-points-concept-isolated-concept-illustration-with-tiny-people-floral-elements-hero-image-website_126608-770.jpg'
    ],
    2: [
      'up to 75%',
      'https://image.freepik.com/free-vector/people-celebrating-with-gift-card-voucher-isolated-flat-vector-illustration-cartoon-happy-customers-winning-abstract-prize-certificate-discount-coupon-creative-strategy-camp-money_74855-8500.jpg'
    ],
    3: [
      '10% off',
      'https://image.freepik.com/free-vector/black-friday-shop-people-buying-super-discount-shop-online-service-promo-purchase-marketing-illustration_101179-927.jpg'
    ],
  };
  Map<int, List> categories = {
    0: [
      'Dentists',
      'https://image.freepik.com/free-vector/children-s-dentist-patient_42515-334.jpg'
    ],
    1: [
      'General',
      'https://cdn.pixabay.com/photo/2020/12/09/16/41/stethoscope-5817919_1280.png'
    ],
    2: [
      'Cardioilogist',
      'https://www.shareicon.net/data/512x512/2017/03/27/881663_medical_512x512.png'
    ],
    3: [
      'Kids',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJQtnoIW8DcWTBL-C9vMA3CQOMUxQA1GEbtA&usqp=CAU'
    ],
    4: [
      'Covid19',
      'https://image.freepik.com/free-vector/flat-illustration-vaccines-liquid-medicines-patients-hospitals-public-health-design-healthcare_4968-1231.jpg'
    ],
  };

  @override
  Widget build(BuildContext context) {
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
                  child: scrollSection(categories)),
              headline('Today Offers'),
              Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 4.10,
                  child: scrollSection(offers)),
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
        return Navigator.push(context, MaterialPageRoute(builder: (_) {
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

  scrollSection(Map map) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: map.length,
        itemBuilder: (context, index) {
          return Container(
              width: MediaQuery.of(context).size.width / 2.5,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(map[index][1]),
                      fit: BoxFit.fill,
                      colorFilter:
                          ColorFilter.mode(Colors.black38, BlendMode.color))),
              alignment: Alignment.center,
              child: Text(
                map[index][0],
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
