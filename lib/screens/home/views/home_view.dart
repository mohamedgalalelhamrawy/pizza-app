import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/screens/auth/blocs/signInBloc/sign_in_bloc.dart';
import 'package:pizza/screens/home/views/details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: const Icon(CupertinoIcons.arrow_right_to_line))
        ],
        title: Row(
          children: [
            Image.asset(
              "assets/8.png",
              scale: 14,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "PIZZA",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 9 / 16),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return DetailsScreen();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Image.asset("assets/1.png"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("NON-VEG",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w800,fontSize: 10),),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("🌶️ BALANCE",style: TextStyle(color:Colors.green,fontWeight: FontWeight.w800,fontSize: 10),),
                          )
                        ],
                      ),
                       const SizedBox(height: 5),
                      Text("Chessy Marvel",style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                      ),),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 12),
                         child: Text("cratting hay your pizza,your roles,best taste",style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade500
                                             ),),
                       ),
                      //  const SizedBox(height: 8),
                       Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$12.00",style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                                const SizedBox(width: 5,),
                                Text("\$15.00",style: TextStyle(
                                  decoration: TextDecoration.lineThrough,color: Colors.grey ,
                                  fontSize: 12
                                ),)
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon:  const Icon(CupertinoIcons.add_circled_solid,))
                        ],
                       )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
