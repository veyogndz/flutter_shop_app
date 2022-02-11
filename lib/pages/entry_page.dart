import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/pages/my_shop_page.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  late FirebaseAuth auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 80,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("MyShop",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  SizedBox(width: 10),
                  Icon(
                    Icons.shopping_basket,
                    size: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: <Widget>[
                Container(
                  width: 600,
                  padding: const EdgeInsets.all(18),
                  color: Colors.white54,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-mail",
                        hintStyle:
                            TextStyle(color: Colors.grey[480], fontSize: 20)),
                  ),
                ),
                Container(
                  width: 600,
                  padding: const EdgeInsets.all(18),
                  color: Colors.white54,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "password",
                        hintStyle:
                            TextStyle(color: Colors.grey[480], fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 220,
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    ElevatedButton(
                        onPressed: () {
                          loginUserEmailAndPassword();
                        },
                        child: const Text("sign-in")),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          signupUserEmailAndPassword();
                        },
                        child: const Text("sign-up")),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loginUserEmailAndPassword() async {
    try {
      UserCredential _userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (_userCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyShopPage()));
      }
      debugPrint("Giriş Başarılı " + _userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signupUserEmailAndPassword() async {
    try {
      var _userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var _myUser = _userCredential.user;

      if (!_myUser!.emailVerified) {
        await _myUser.sendEmailVerification();
      } else {
        debugPrint('kullanıcın maili onaylanmış, ilgili sayfaya gidebilir.');
      }

      debugPrint(_userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
