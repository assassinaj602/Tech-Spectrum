// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1B1B1B),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFF1B1B1B),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.bar_chart,
                    color: Colors.white,
                  ),
                  Text(
                    "Statistic",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF93C572),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.credit_card,
                    color: Colors.white,
                  ),
                  Text(
                    "Target",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Text(
                    "Menu",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://platform.polygon.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/9490719/thor_big.jpg?quality=90&strip=all&crop=3.5714285714286%2C0%2C92.857142857143%2C100&w=2400'),
                ),
                title: Text(
                  "Thor",
                  style: TextStyle(
                    fontFamily: "Rubik Medium",
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Good Morning',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Color(0xFF2C2C2C),
                  child: Icon(Icons.notifications, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xFF3B3838),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Cards",
                          style: TextStyle(
                              fontFamily: "Rubik Regular",
                              color: Colors.white,
                              fontSize: 22),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2C2C2C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.add, color: Colors.white),
                          label: Text(
                            "Add Card",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF93C572),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "VISA",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Icon(Icons.wifi, color: Colors.black),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "**** **** **** 5466",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(Icons.visibility_off, color: Colors.black),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Balance",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                          Text(
                            "\$796,000,960.00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                letterSpacing: -.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90,
                    width: 77,
                    decoration: BoxDecoration(
                        color: Color(0xFF3B3838),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_upward_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Deposit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: "Rubik Regular",
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 90,
                    width: 77,
                    decoration: BoxDecoration(
                        color: Color(0xFF3B3838),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Withdrawal",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: "Rubik Regular",
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 90,
                    width: 77,
                    decoration: BoxDecoration(
                        color: Color(0xFF3B3838),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.request_page_sharp,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Loan",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: "Rubik Regular",
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 90,
                    width: 77,
                    decoration: BoxDecoration(
                        color: Color(0xFF3B3838),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.swap_horiz,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Remit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: "Rubik Regular",
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transactions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Rubik Medium",
                        fontWeight: FontWeight.bold,
                      )),
                  Text("View All",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: "Rubik Regular",
                      ))
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3838),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/736x/0a/5c/0f/0a5c0f0dfbaedef4197fa719ec92b198.jpg'),
                        ),
                        title: Text(
                          "Tony Stark",
                          style: TextStyle(
                            fontFamily: "Rubik Medium",
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          '10:30 AM',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+\$450.00",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "Deposit",
                              style: TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3838),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://previews.123rf.com/images/mcurmen/mcurmen2005/mcurmen200500026/146249297-valladolid-spain-march-8-2020-captain-america-model-sit-down-is-isolated-on-white-background.jpg'),
                        ),
                        title: Text(
                          "Captain Rogers",
                          style: TextStyle(
                            fontFamily: "Rubik Medium",
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          '07:30 AM',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+\$250.00",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "Deposit",
                              style: TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3838),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://www.pngplay.com/wp-content/uploads/2/Peter-Parker-Transparent-Background.png'),
                        ),
                        title: Text(
                          "Peter Parker",
                          style: TextStyle(
                            fontFamily: "Rubik Medium",
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          '11:00 PM',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+\$340.00",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "Deposit",
                              style: TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
