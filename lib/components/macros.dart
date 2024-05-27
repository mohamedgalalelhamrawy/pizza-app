

      import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Macros extends StatelessWidget {
        const Macros({super.key, required this.value, required this.title, required this.icon});
        final int value;
        final String title;
        final IconData icon;
        @override
        Widget build(BuildContext context) {
          return   Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 5,
                                offset: Offset(2, 2)
                              )
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icon,
                                color: Colors.redAccent,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                title == "Calories" ?
                                "$value $title" :
                                "${value}g $title" 
                                ,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
        }
      }