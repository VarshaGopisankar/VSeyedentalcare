import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vseyedentalcare/anime.dart';


class MyLogin extends StatefulWidget {

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffdd5546),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Color(0xfffff9db),
          ),
        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        color: Color(0xffdd5546),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffff9db),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Login into your account",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xfffff9db),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          inputFile(label: "Email"),
                          inputFile(label: "Password", obscureText: true)
                        ],
                      ),
                    ),
                    Padding(padding:
                    EdgeInsets.symmetric(horizontal: 40),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Anime()));
                        },
                        color: Color(0xfffff9db),
                        elevation: 8.8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xffdd5546),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?", style: TextStyle(
                      color: Color(0xfffff9db),
                    ),
                    ),
                    Text("Sign Up", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xfffff9db),
                    ),
                    ),
                  ],
                ),
              ],
            )
            ),
          ],

        ),
      ),
    );
  }
}
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Color(0xfffff9db),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}

