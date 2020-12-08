import 'package:dine_inn/models/restaurants.dart';
import 'package:flutter/material.dart';
List<Restaurants> restaurantsList = [
  Restaurants(name: "Radisson Blu Hotel",rating: 4.4,wishlist: true,image: "radisson.jpg"),
  Restaurants(name: "Equinox Restaurant",rating: 4.2,wishlist: false,image: "equinox.jpg"),
  Restaurants(name: "Moti Mahal",rating: 4.0,wishlist: true,image: "motimahal.jpg"),
  Restaurants(name: "Kaveri Restaurant",rating: 4.5,wishlist: false,image: "kaveri.jpg"),
  Restaurants(name: "Rainbow Restaurant",rating: 4.1,wishlist: true,image: "rainbow.jpg"),
];
class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: restaurantsList.length,
          itemBuilder: (_HomePageState,index){
            return Padding(padding: EdgeInsets.all(8),
              child: Container(
                height: 240,
                width: 250,
                decoration: BoxDecoration (
                    color:Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red[50],
                          offset: Offset(15,5),
                          blurRadius: 30
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Image.asset("assets/images/${restaurantsList[index].image}",height: 140,width: 140,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Text(restaurantsList[index].name,style:TextStyle(fontSize: 18)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(20),
                                color:Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      offset: Offset(1,1),
                                      blurRadius: 4
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: restaurantsList[index].wishlist? Icon(
                                Icons.favorite,size: 20,color: Colors.red,)
                                  :Icon(
                                Icons.favorite_border,size: 20,color: Colors.red,),

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:35.0),
                          child: Text(restaurantsList[index].rating.toString(),style:TextStyle(fontSize: 17,color: Colors.grey[900])),
                        ),
                        SizedBox(width: 15,),
                        Icon(Icons.star,color: Colors.red,size: 18,),
                        Icon(Icons.star,color: Colors.red,size: 18,),
                        Icon(Icons.star,color: Colors.red,size: 18,),
                        Icon(Icons.star,color: Colors.red,size: 18,),
                        Icon(Icons.star,color: Colors.grey,size: 18,),
                      ],
                    )
                  ],
                ),
              ),);
          }),
    );
  }
}

