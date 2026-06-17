import 'package:cinnabon_cake_app/components/cart_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List sizeList = ["2.50", "3.50", "4.50"];
  String price = "2.50";
  int selectedIndex = 0;
  int selectedType = 0;
  int text = 1;

  final List<CartItem> cartItems = [];

  int selectedQuantity = 1;
  int selectedFlavor = 0;

  void addToCart() {
    final flavors = [
      
      {"name": "Lavanda Cream", "image": "images/cake2...png"},
      {"name": "Gorgonzola and Pear", "image": "images/cake1..png"},
      {"name": "Tea Rose", "image": "images/cake3...png"},
    ];
    final selected = flavors[selectedType];
    final sizeLabel = ["70gr", "120gr", "180gr"][selectedIndex];
    final fullDescription = "${selected['name']} $sizeLabel";

    final existing = cartItems.where(
      (item) => item.description == fullDescription, 
    );

    if (existing.isNotEmpty) {
      // Varsa adedi artır
      setState(() {
        existing.first.quantity += selectedQuantity;
      });
    } else {
      setState(() {
        final List<double> prices = [2.50, 3.50, 4.50];
        cartItems.add(
          CartItem(
            image: selected["image"]!,
            name: "cinnabon",
            description: fullDescription,
            price: prices[selectedIndex],
          ),
        );
      });
    }
    setState(() => selectedQuantity = 1);
  }

  void decreaseFromCart(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
    });
  }

  void increaseInCart(int index) {
    setState(() => cartItems[index].quantity++);
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: -10,
              top: -25,
              child: Image.asset(
                "images/Vector.png",
                fit: BoxFit.cover,
                height: 500,
              ),
            ),
            Positioned(
              width: 407,
              child: Image.asset(
                "images/Vector2.png",
                fit: BoxFit.cover,
                //height: 575,
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 70, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hey, Abdullatif",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF854E34),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("images/myfoto.jpeg"),
                        ),
                      ],
                    ),
                    Text(
                      "We have smth yummy for you",
                      style: TextStyle(color: Color(0xFFBD9D96)),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "cinnabon",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " with pear and",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF4F4F4F),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Gorgonzola Cream",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF4F4F4F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90, top: 5),
                      child: Container(
                        height: 27,
                        width: 82,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF50CAD9),
                        ),
                        child: Center(
                          child: Text(
                            "$price \$",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 10),
                      child: Image.asset("images/cake1.png"),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Image.asset("images/line.png"),
                        ),
                        Positioned(
                          child: SizedBox(
                            height: 120,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  top: -25,
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIndex = 0;
                                            price = sizeList[selectedIndex];
                                          });
                                        },
                                        icon: Icon(
                                          Icons.circle,
                                          size: 18,
                                          color: selectedIndex == 0
                                              ? Color(0xFF6BBEC8)
                                              : Color(0xFFCEB7B2),
                                        ),
                                      ),
                                      Text(
                                        "Small\n70gr",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: selectedIndex == 0
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  top: 18,
                                  left: 110,
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIndex = 1;
                                            price = sizeList[selectedIndex];
                                          });
                                        },
                                        icon: Icon(
                                          Icons.circle,
                                          size: 18,
                                          color: selectedIndex == 1
                                              ? Color(0xFF6BBEC8)
                                              : Color(0xFFCEB7B2),
                                        ),
                                      ),
                                      Text(
                                        "Medium\n  120gr",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: selectedIndex == 1
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -20,
                                  bottom: 55,
                                  right: 30,
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIndex = 2;
                                            price = sizeList[selectedIndex];
                                          });
                                        },
                                        icon: Icon(
                                          Icons.circle,
                                          size: 18,
                                          color: selectedIndex == 2
                                              ? Color(0xFF6BBEC8)
                                              : Color(0xFFCEB7B2),
                                        ),
                                      ),
                                      Text(
                                        "Large\n180gr",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: selectedIndex == 2
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedType = 0;
                                });
                              },
                              icon: Icon(
                                Icons.circle,
                                color: Color(0xFFD7ACE7),
                              ),
                            ),
                            Text(
                              "Lavanda",
                              style: TextStyle(
                                color: selectedType == 0
                                    ? Colors.black
                                    : Color(0xFFBDBDBD),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedType = 1;
                                  });
                                },
                                icon: Icon(
                                  Icons.circle,
                                  color: Color(0xFF6BBEC8),
                                ),
                              ),
                              Text(
                                "Gorgonzola and Pear",
                                style: TextStyle(
                                  color: selectedType == 1
                                      ? Colors.black
                                      : Color(0xFFBDBDBD),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedType = 2;
                                });
                              },
                              icon: Icon(
                                Icons.circle,
                                color: Color(0xFFF37B98),
                              ),
                            ),
                            Text(
                              "Tea Rose",
                              style: TextStyle(
                                color: selectedType == 2
                                    ? Colors.black
                                    : Color(0xFFBDBDBD),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFFCEB7B2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (selectedQuantity > 1) {
                                setState(() {
                                  selectedQuantity--;
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xFFCEB7B2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "$selectedQuantity",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFFCEB7B2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedQuantity++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                        SizedBox(width: 60),
                        MaterialButton(
                          onPressed: addToCart,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: Color(0xFF4ABBC9),
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.10,
              minChildSize: 0.10,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Container(
                          width: 45,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        if (cartItems.isEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.grey[600],
                                  size: 22,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Cart is empty",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                bottom: 30,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, right: 40),
                                child: Text("Your Choice"),
                              ),
                            ),
                          ),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartItems.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = cartItems[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Row(
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        child: Image.asset(
                                          "images/shadow_cart.png",
                                          height: 75,
                                        ),
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: -10,
                                        child: Image.asset(item.image),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  SizedBox(
                                    width: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(item.name),
                                        Text(item.description),
                                        Text(item.price.toString()),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCEB7B2),
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              decreaseFromCart(index);
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 17,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFCEB7B2),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                          child: Text(
                                            "${item.quantity}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCEB7B2),
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              increaseInCart(index);
                                            });
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
