import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza/components/macros.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - (40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 5,
                        offset: Offset(3, 3))
                  ],
                  image: DecorationImage(image: AssetImage("assets/1.png")),
                  borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 5,
                        offset: Offset(3, 3))
                  ],
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Truffle Temptation Extravagnza",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  "\$12.00",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "15.00",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Macros(
                            value: 256,
                            title: "Calories",
                            icon: FontAwesomeIcons.fire),
                        Macros(
                            value: 36,
                            title: "Protein",
                            icon: FontAwesomeIcons.dumbbell),
                        Macros(
                            value: 21,
                            title: "Fat",
                            icon: FontAwesomeIcons.oilWell),
                        Macros(
                            value: 38,
                            title: "Carbs",
                            icon: FontAwesomeIcons.breadSlice),
                      ],
                    ),
                    SizedBox(height: 40,),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(onPressed: (){}, child: Text("Buy Now",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold
                      ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
