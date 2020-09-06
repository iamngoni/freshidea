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
    "assets/images/joeys.png",
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
  List _filtered = [];
  bool _isExpanded = false;
  final _controller = new TextEditingController();
  @override
  void initState() {
    _filtered = [..._fourteen].toList();
    _controller.addListener(() {
      setState(() {
        _filtered = _fourteen
            .where((element) =>
                element["detail"]
                    .toString()
                    .toLowerCase()
                    .contains(_controller.text.toLowerCase()) ||
                element["type"]
                    .toString()
                    .toLowerCase()
                    .contains(_controller.text.toLowerCase()) ||
                element["amount"]
                    .toString()
                    .toLowerCase()
                    .contains(_controller.text.toLowerCase()))
            .toList();
      });
      print(_controller.text);
      print(_filtered);
    });
    super.initState();
  }

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
              AnimatedPositioned(
                height: _isExpanded
                    ? getHeight(context)
                    : getHeight(context) * 0.63,
                duration: Duration(milliseconds: 500),
                bottom: 0,
                child: Container(
                  width: getWidth(context),
                  height: _isExpanded
                      ? getHeight(context)
                      : getHeight(context) * 0.63,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: _isExpanded
                        ? BorderRadius.zero
                        : BorderRadius.only(
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
                                _filtered = [..._fourteen].toList();
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
                                _filtered = _fourteen
                                    .where((element) => element["amount"] > 0)
                                    .toList();
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
                                _filtered = _fourteen
                                    .where((element) => element["amount"] < 0)
                                    .toList();
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                                _controller.text = "";
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: shadowGrey,
                              child: Icon(
                                _isExpanded ? Icons.close : Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _isExpanded
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 16.0,
                              ),
                              child: TextFormField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: shadowGrey,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search),
                                  labelText: "Filter",
                                ),
                              ),
                            )
                          : SizedBox(height: 0),
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
                            maxHeight: _isExpanded
                                ? getHeight(context) / 1.9
                                : getHeight(context) / 2.367,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _filtered.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                leading: ClipOval(
                                  child: Image(
                                    image: AssetImage(
                                      _filtered[index]["image"],
                                    ),
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  _filtered[index]["type"],
                                  style: TextStyle(
                                    color: deepGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  _filtered[index]["detail"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: _filtered[index]["type"] == "Received"
                                    ? Text(
                                        "+${_filtered[index]["amount"]}",
                                        style: TextStyle(
                                          color: _filtered[index]["amount"] < 0
                                              ? Colors.red
                                              : deepGreen,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      )
                                    : Text(
                                        _filtered[index]["amount"].toString(),
                                        style: TextStyle(
                                          color: _filtered[index]["amount"] < 0
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
