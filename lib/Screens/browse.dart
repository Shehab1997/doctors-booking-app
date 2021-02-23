import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  Map<int, List> filters = {
    0: [Icons.filter_list_sharp, 'Filter'],
    1: [Icons.keyboard_arrow_down_rounded, 'Gender'],
    2: [Icons.keyboard_arrow_down_rounded, 'Distance'],
    3: [Icons.keyboard_arrow_down_rounded, 'Name'],
    4: [Icons.keyboard_arrow_down_rounded, 'City']
  };
  Map<int, List> drs = {
    0: [
      'Dr.Basel Allam',
      'https://avatars.githubusercontent.com/u/44323531?s=460&u=4a0966bc4213dfd7da98c0ca07273948bc32bfad&v=4'
    ],
    1: [
      'Dr.Shehab Ahmed',
      'https://avatars.githubusercontent.com/u/78522023?s=400&u=d0b37f284345d0544c2929a803191bc33662fba9&v=4'
    ],
    2: [
      'Dr.mohamed Ahmed',
      'https://avatars.githubusercontent.com/u/78522023?s=400&u=d0b37f284345d0544c2929a803191bc33662fba9&v=4'
    ]
  };

  Map<int, List> wishes = {
    0: [Icons.favorite_outline_rounded, ' Add To\n Favorites'],
    1: [Icons.calendar_today_outlined, ' Book\n Appointment']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 35, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Browse',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[90],
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [filter(filters), doctor(drs)],
        ),
      ),
    );
  }

  filter(Map map) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: map.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(5, 15, 0, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.cyan, width: 2),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    map[index][1],
                    style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    map[index][0],
                    color: Colors.cyan,
                    size: 30,
                  )
                ],
              ),
            );
          }),
    );
  }

  doctor(Map dr) {
    return Flexible(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: dr.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / dr.length,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 125.0,
                          width: MediaQuery.of(context).size.width / 3.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(dr[index][1]),
                              fit: BoxFit.fill,
                            ),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dr[index][0],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                          Text(
                            'Dentist 🤣',
                            style: TextStyle(
                                color: Color(0xff00BBDC),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                          Text(
                            '⭐⭐⭐⭐[186 reviews]',
                            style: TextStyle(
                                color: Color(0xff18435A),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '29 - Nov - 2020',
                            style: TextStyle(
                                color: Color(0xff00BBDC),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                          Text(
                            '\nAED 200',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height / 11,
                          width: MediaQuery.of(context).size.width / 1.20,
                          child: wish(wishes))
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  wish(Map wish) {
    return Container(
      height: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: wish.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(5, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    wish[index][0],
                    color: Colors.cyan,
                    size: 35,
                  ),
                  SizedBox(width: 15),
                  Text(
                    wish[index][1],
                    style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
