import 'package:dine_inn/models/category.dart';
import 'package:flutter/material.dart';

List<Category>categoriesList =[
  Category(name: "Fast food", image: "fast food.jpg"),
  Category(name: "Beverages", image: "beverages.jpg"),
  Category(name: "Chinese", image: "chinese.jpg"),
  Category(name: "Continental", image: "continental.jpg"),
  Category(name: "Italian", image: "italian.jpg"),
  Category(name: "Mexican", image: "mexican.jpg"),
  Category(name: "South Indian", image: "south indian.jpg"),
  Category(name: "Desserts", image: "desserts.jpg"),
];
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      height:95,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_HomePageState,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration (
                        color:Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red[50],
                              offset: Offset(4,6),
                              blurRadius: 4
                          )
                        ]
                    ),
                    child: Padding(padding:EdgeInsets.all(4),
                      child: Image.asset("assets/images/${categoriesList[index].image}",width: 50,height: 50,),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: Text("${categoriesList[index].name}",style:TextStyle(fontSize: 14,color: Colors.grey[700])),
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
