import 'package:flutter/material.dart';
import 'package:medicine_app/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage ({Key? key}) : super(key: key);
  String? user_email, user_password ;
  GlobalKey<FormState> _loginkey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          
          child: Center(
            child: Form(
              key: _loginkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/heartlogo.png'),
                  const Text('MedCall', style: TextStyle(fontSize: 30, color: Color(0xff609acb)),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    validator: (email) {
                      if(!email!.contains('@') || !email.contains('.com'))
                      {
                        return 'Your Email must include @ and .com';
                      }
                      else if(email.length < 15)
                      {
                        return 'Your Email must be greater than 15 charcters';
                      }
                      return null;
                    },
                    onChanged: (value) => user_password=value,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffb6e1fe),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    )
                    ,
                  ),
                  const SizedBox(height: 30,),
                TextFormField(
                  validator: (password) {
                      if(!password!.contains('\$') && !password.contains('#') && !password.contains('&'))
                      {
                        return 'Your Password must include Special Characters';
                      }
                      else if(password.length < 10)
                      {
                        return 'Your Password must be greater than 10 charcters';
                      }
                      return null;
                    },
                  obscureText: true,
                    obscuringCharacter: '#',
                    onChanged: (value) => user_email=value,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffb6e1fe),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    )
                    ,
                  ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: (){
                    if(_loginkey.currentState!.validate())
                    {
                      print('Login Procees is Successful');
                      Navigator.pushNamed(context, 'Home Page');
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff012169),
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  ),
                  child: Text('Log In', style: TextStyle(color: Colors.amber, fontSize: 30),),
                ),
                const SizedBox(height: 30,),
                TextButton(
                  onPressed: (){}, 
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  child: Text('Forget Password', style: TextStyle(fontSize: 25, color: Color(0xff012169),),),
                )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}