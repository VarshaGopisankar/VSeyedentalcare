import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffdd5546),
        width:double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Welcome!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xfffff9db),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("VS Eye and Dental Care",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xfffff9db),
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/eye.png")
                  )
              ),
            ),

            Column(
              children: <Widget>[
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyLogin()));
                  },
                  //defining shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xfffff9db),
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xfffff9db),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height:20),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MySignUp()));
                  },
                  color: Color(0xfffff9db),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xffdd5546),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
