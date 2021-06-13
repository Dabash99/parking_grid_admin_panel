import 'package:flutter/material.dart';
import 'package:parking_grid_admin/shared/components/components.dart';

class Emad extends StatelessWidget {
  const Emad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/images/I.png',
                                  width: 5,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Doctorrrrrrrr'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Doctorrrrrrrr'),
                                      SizedBox(width: 80,),
                                      Text('Year'),
                                    ],
                                  ),

                                ],
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black
                                ),
                                  onPressed: (){

                              }, child: Text('اتصال')),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black
                                  ),
                                  onPressed: (){

                                  }, child: Text('اتصال')),
                            ],
                          )
                        ],
                      ),
                    )),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemCount: 10));
  }
}
