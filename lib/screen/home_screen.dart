import 'package:flutter/material.dart';
import 'package:skillhub_api/screen/login_screen.dart';
import 'package:skillhub_api/util/custom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _State();
}

class _State extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF0A0A0F),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo_name.png',
          height: 32,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0A0A0F)),
              child: Center(
                  child: Column(
                children: [
                  Icon(
                    Icons.person_3_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                  Text(
                    'Marcio Sales',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              )),
            ),
            ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text(
                  'Inicio',
                ),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.search),
                title: Text('Buscar Serviços'),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.hardware_outlined),
                title: Text('Meus Serviços'),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.person_3_outlined),
                title: Text('Perfil'),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
                onTap: () {
                  push(context, LoginScreen(), replace: true);
                })
          ],
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text('data'),
    );
  }
}
