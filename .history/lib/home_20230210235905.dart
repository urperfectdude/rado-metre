import 'package:emf_app/models/magnitudeProvider.dart';
import 'package:emf_app/pages/visuals.dart';
import 'package:emf_app/utils/colors.dart';
import 'package:emf_app/widgets/mainReading.dart';
import 'package:emf_app/widgets/meterReading.dart';
import 'package:emf_app/widgets/xyzReading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MainReading(),
              XYZReading(),
              MeterReading(),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide())),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Visuals()));
                    },
                    child: Text('Visualize',
                        style: TextStyle(color: Colors.black))),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<MagnitudeProvider>(
                builder: (context, model, child) => Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: BorderSide(color: Colors.black))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        model.changeValues();
                      },
                      child: Text(
                        'Start',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ),

              // StartButton()
            ],
          ),
        ),
      ),
    );
  }
}
