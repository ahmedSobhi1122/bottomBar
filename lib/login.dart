import 'package:flutter/material.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffcc4600), Color(0xffff7900)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.12),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: height * 0.7,
        decoration:  const BoxDecoration(
          color: Color(0xfffef5ec),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffff7900).withOpacity(.25),
                      blurRadius: 20,
                      spreadRadius: 6,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xfffef5ec),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Email or Phone Number",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.002,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xfffef5ec),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: height * 0.05),
            MaterialButton(
              height: height * 0.07,
              minWidth: width * 0.6,
              onPressed: () {},
              color: const Color(0xffff7900),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: height * 0.05),
            const Text(
              "Continue with social media",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  height: height * 0.07,
                  minWidth: width * 0.35,
                  onPressed: () {},
                  color: const Color(0xff0496ff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Facebook",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: width * 0.07),
                MaterialButton(
                  height: height * 0.07,
                  minWidth: width * 0.35,
                  onPressed: () {},
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Github",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}