import 'package:flutter/material.dart';

import 'color.dart';

class Receipt extends StatefulWidget {
  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  final List _recent = [
    "assets/images/joeys.png",
    "assets/images/tenga.png",
    "assets/images/freshinabox.png",
    "assets/images/horn.png",
    "assets/images/paymy.png",
  ];

  final List _fourteen = [
    {
      "image": "assets/images/joeys.png",
      "type": "Payment",
      "detail": "Order 3214",
      "amount": -9.99,
    },
    {
      "image": "assets/images/joeys.png",
      "type": "Signed In",
      "detail": "Joeys App iOS - Balance",
      "amount": 240.44,
    },
    {
      "image": "assets/images/paymy.png",
      "type": "Payment",
      "detail": "Netflix Voucher",
      "amount": -15.00,
    },
    {
      "image": "assets/images/vendor.png",
      "type": "Received",
      "detail": "For Takeaway",
      "amount": 25.00,
    },
    {
      "image": "assets/images/freshinabox.png",
      "type": "Payment",
      "detail": "Order 3654",
      "amount": -56.99,
    },
    {
      "image": "assets/images/freshinabox.png",
      "type": "Sign In",
      "detail": "FIAB Website - Balance",
      "amount": 25.00,
    },
    {
      "image": "assets/images/ecocash.png",
      "type": "Received",
      "detail": "FCA Transfer",
      "amount": 250.00,
    }
  ];

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: getHeight(context),
          width: getWidth(context),
          child: Stack(
            children: [
              Container(
                height: getHeight(context),
                color: deepGreen,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage("assets/images/face.png"),
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 17,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      maxRadius: 12,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "\$230.45",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Balance",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Sites",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: getWidth(context),
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _recent.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: ClipOval(
                                child: Image(
                                  image: AssetImage(_recent[index]),
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: getWidth(context),
                  height: getHeight(context) * 0.63,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selected = 0;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 7.0,
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _selected == 0 ? deepGreen : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "History",
                                style: TextStyle(
                                  color:
                                      _selected == 0 ? Colors.white : deepGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selected = 1;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 7.0,
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _selected == 1 ? deepGreen : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  color:
                                      _selected == 1 ? Colors.white : deepGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selected = 2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 7.0,
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _selected == 2 ? deepGreen : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Payments",
                                style: TextStyle(
                                  color:
                                      _selected == 2 ? Colors.white : deepGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: shadowGrey,
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 20.0,
                          bottom: 5.0,
                        ),
                        child: Text(
                          "14 July 2020",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Container(
                          width: getWidth(context),
                          constraints: BoxConstraints(
                            maxHeight: getHeight(context) / 2.367,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _fourteen.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                leading: ClipOval(
                                  child: Image(
                                    image: AssetImage(
                                      _fourteen[index]["image"],
                                    ),
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  _fourteen[index]["type"],
                                  style: TextStyle(
                                    color: deepGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  _fourteen[index]["detail"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: _fourteen[index]["type"] == "Received"
                                    ? Text(
                                        "+${_fourteen[index]["amount"]}",
                                        style: TextStyle(
                                          color: _fourteen[index]["amount"] < 0
                                              ? Colors.red
                                              : deepGreen,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      )
                                    : Text(
                                        _fourteen[index]["amount"].toString(),
                                        style: TextStyle(
                                          color: _fourteen[index]["amount"] < 0
                                              ? Colors.red
                                              : deepGreen,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
