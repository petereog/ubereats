import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ConvienceScreen extends StatefulWidget {
  const ConvienceScreen({super.key});

  @override
  State<ConvienceScreen> createState() => _ConvienceScreenState();
}

class _ConvienceScreenState extends State<ConvienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('convience', style:TextStyle(fontSize: 34, fontWeight: .bold),),
                Text('Featured stores', style:TextStyle(fontSize: 24, fontWeight: .bold),),
                const SizedBox(height: 12,),
               SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                  child: Row(
                   mainAxisAlignment: .spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        width: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFEFF3FE)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png'),
                            const SizedBox(height: 44,),
                            Text('Gopuff', style: TextStyle(fontWeight: .bold, fontSize: 20,),),
                            Text('Opens at 10:00AM'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15,),


                       Container(
                        height: 200,
                        width: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFEFF3FE)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1 (1).png'),
                            const SizedBox(height: 44,),
                            Text('7Eleven', style: TextStyle(fontWeight: .bold, fontSize: 20,),),
                            Text('Opens at 10:00AM'),
                          ],
                        ),
                      ),


const SizedBox(width: 15,),

                       Container(
                        height: 200,
                        width: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFEFF3FE)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png'),
                            const SizedBox(height: 44,),
                            Text('Gopuff', style: TextStyle(fontWeight: .bold, fontSize: 20,),),
                            Text('Opens at 10:00AM'),
                          ],
                        ),
                      ),

const SizedBox(width: 15,),

                       Container(
                        height: 200,
                        width: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFEFF3FE)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png'),
                            const SizedBox(height: 44,),
                            Text('Gopuff', style: TextStyle(fontWeight: .bold, fontSize: 20,),),
                            Text('Opens at 10:00AM'),
                          ],
                        ),
                      ),

const SizedBox(width: 15,),

                       Container(
                        height: 200,
                        width: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFEFF3FE)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png'),
                            const SizedBox(height: 44,),
                            Text('Gopuff', style: TextStyle(fontWeight: .bold, fontSize: 20,),),
                            Text('Opens at 10:00AM'),
                          ],
                        ),
                      ),


const SizedBox(width: 15,),

                       Container(
                        height: 200,
                        width: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFEFF3FE)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png'),
                            const SizedBox(height: 44,),
                            Text('Gopuff', style: TextStyle(fontWeight: .bold, fontSize: 20,),),
                            Text('Opens at 10:00AM'),
                          ],
                        ),
                      ),


const SizedBox(width: 15,),

                       Container(
                        height: 200,
                        width: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFEFF3FE)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png'),
                            const SizedBox(height: 44,),
                            Text('Gopuff', style: TextStyle(fontWeight: .bold, fontSize: 20,),),
                            Text('Opens at 10:00AM'),
                          ],
                        ),
                      ),
                     
const SizedBox(width: 15,),
                    ],
                  ),
                )
              ]
            )
          )
        )

      )
    
    );
        
  }
}