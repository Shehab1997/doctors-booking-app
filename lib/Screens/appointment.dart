import 'package:flutter/material.dart';
import 'package:flutter_app_itshare/Screens/browse.dart';
import 'package:flutter_app_itshare/Widgets/customappbar.dart';
import 'package:flutter_app_itshare/Widgets/doctors.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
              preferredSize: Size(0, 102),
              child: CustomAppBar(
                  MediaQuery.of(context).size.height / 5.5,
                  'Manage Your Appointment',
                  TabBar(
                    tabs: [Text('Previous'), Text('Upcoming')],
                    labelColor: Colors.white,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.white30,
                    unselectedLabelStyle: TextStyle(
                        color: Colors.white30,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.white)),
                  ),
                  Icons.sort)),
        ),
        body: TabBarView(
          children: [Previous(), Upcoming()],
        ),
      ),
    );
  }
}

class Previous extends StatefulWidget {
  @override
  _PreviousState createState() => _PreviousState();
}

class _PreviousState extends State<Previous> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 125.0,
                    width: MediaQuery.of(context).size.width / 3.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://avatars.githubusercontent.com/u/44323531?s=460&u=4a0966bc4213dfd7da98c0ca07273948bc32bfad&v=4'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr: Bassel Allam',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      ),
                      Text(
                        'Dentist',
                        style: TextStyle(
                            color: Color(0xff00BBDC),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
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
                        'Revisit at:\n Mon 20 - Feb - 2021',
                        style: TextStyle(
                            color: Color(0xff18435A),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  Map<int, List> upcomingAppointments = {
    0: [
      "Dr. Ahmed Saber",
      "Dental",
      "Date: 20-Apr-2021",
      "Time: 06:30 PM",
      "https://pulse.doctor/media_/images/photos/doctor4.jpg"
    ],
    1: [
      "Dr. Ahmed Ali",
      "Cardio",
      "Date: 25-Apr-2021",
      "Time: 08:30 PM",
      "https://www.pinnaclecare.com/wp-content/uploads/2017/12/bigstock-African-young-doctor-portrait-28825394-300x425.jpg"
    ],
    2: [
      "Dr. Adel Hamed",
      "General",
      "Date: 10-Apr-2021",
      "Time: 03:30 PM",
      "https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1569586526901-doctor.jpg"
    ],
    3: [
      "Dr. Samia Omar",
      "Therapy",
      "Date: 10-Apr-2021",
      "Time: 10:00 PM",
      "https://image.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg"
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: upcomingAppointments.length,
        itemBuilder: (context, index) {
          return Doctors(
            doctorName: upcomingAppointments[index]![0],
            type: upcomingAppointments[index]![1],
            date: upcomingAppointments[index]![2],
            time: upcomingAppointments[index]![3],
            image: upcomingAppointments[index]![4],
            className: "Upcoming",
          );
        },
      ),
    );
  }
}
