import 'dart:html';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Nunito"
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(),
          ),
        ),
    );

  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  int _pageState = 0;
  double _headingTop = 100;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);
  double windowWidth = 0;
  double windowHeight = 0;
  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _loginWidth = 0;
  double _loginHeight = 0;
  double _registerHeight = 0;

  double _loginOpacity = 1;
  bool _keyboardVisible=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible=visible;
        });
      },
    );
  }

@override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery
        .of(context)
        .size
        .height;
    windowWidth = MediaQuery
        .of(context)
        .size
        .width;
 _loginHeight=windowHeight-220;
 _registerHeight = windowHeight-220;
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);
        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 100;
        _loginHeight = _keyboardVisible?windowHeight:windowHeight-220;
        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _loginYOffset = _keyboardVisible? 10:220;
        _loginHeight = _keyboardVisible?windowHeight:windowHeight-220;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 90;
        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _loginYOffset = 200;
        _registerYOffset = 220;
        _loginXOffset = 10;
        _loginWidth = windowWidth - 20;
        _loginOpacity = 0.7;
        _headingTop = 80;
        _loginHeight = _keyboardVisible?windowHeight:windowHeight-200;
        break;
    }
    return Stack(
      children: <Widget>[
        AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
                milliseconds: 1000
            ),
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(
                              milliseconds: 1000
                          ),
                          margin: EdgeInsets.only(
                              top: _headingTop
                          ),
                          child: Text(
                            "Showcase Your Talent",
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 28
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20
                          ),
                          child: Text(
                            "A platform for budding singers to show the world their talent and for all the music lovers get best unplugged versions.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 12
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30
                  ),
                  child: Center(
                    child: Image.asset("assets/images/img2.png"),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFB40284A),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(10),
          width: _loginWidth,
          height: _loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
              milliseconds: 1000
          ),
          transform: Matrix4.translationValues(
              _loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
              )
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin:EdgeInsets.only(bottom:10),
                    child: Text(
                      "Login To Continue",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter email..",
                  ),
                    SizedBox(height: 10,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter password",

                  )
                ],
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(
                    btnText: "Login",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 2;
                      });
                    },

                    child: OutlineBtn(
                      btnText: "Create New Account",
                    ),
                  )
                ],
              ),
            ],
          )
        ),
        AnimatedContainer(
          height: _registerHeight,
          padding: EdgeInsets.all(10),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
              milliseconds: 1000
          ),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin:EdgeInsets.only(bottom:10),
                    child: Text(
                        "Create a New Account",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                  InputWithIcon(
                    icon:Icons.email,
                    hint: "Enter Email..",
                  ),
                  SizedBox(height: 10,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password..",
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(
                    btnText: "Create Account",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Back To Login",
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
   final String hint;
  InputWithIcon({this.icon,this.hint});
  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFB40284A),
              width: 2
          ),
          borderRadius: BorderRadius.circular(30)
      ),
      
      child: Row(
        children: <Widget>[
          Container(
            width: 30,
              child: Icon(
                  widget.icon ,
                      size:20,
                color: Color(0xFFBB9B9B9),
              )
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
                hintText: widget.hint
              ),
            ),
          )

        ],
      ),
    );
  }
}


class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Color(0xFFB40284A),
        borderRadius: BorderRadius.circular(30)
      ),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
            widget.btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFB40284A),
              width: 2
          ),
          borderRadius: BorderRadius.circular(30)
      ),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Color(0xFFB40284A),
              fontSize: 16
          ),
        ),
      ),
    );
  }
}
