import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConfiguracionCuenta(),
    );
  }
}

class ConfiguracionCuenta extends StatefulWidget {
  @override
  _ConfiguracionCuentaState createState() => _ConfiguracionCuentaState();
}

class _ConfiguracionCuentaState extends State<ConfiguracionCuenta> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
              },
            ),
            SizedBox(width: 8),
            Text('Cuenta de Google'),
            Spacer(),
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              },
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/b/b9/Terminator-2-judgement-day.jpg/220px-Terminator-2-judgement-day.jpg'),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Principal'),
            Tab(text: 'Información personal'),
            Tab(text: 'Datos y privacidad'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text('Tu cuenta está protegida', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'La verificación de seguridad revisó tu cuenta y no encontró acciones recomendadas.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        'https://www.gstatic.com/identity/boq/accountsettingsmobile/securitycheckup_green_with_new_shield_96x96_26d2e3da755cc2e67209838c9cd08271.png',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                      },
                      child: Text('Ver más detalles'),
                    ),
                  ],
                ),
               
                Divider(
                  color: Colors.black,
                  height: 20,
                ),
                SizedBox(height: 10),
                Text('Verificación de privacidad', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Elige la configuración de privacidad indicada para ti con esta guía paso a paso.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        'https://www.gstatic.com/identity/boq/accountsettingsmobile/privacycheckup_initial_with_new_shield_96x96_ca8e6c5983e01665ee5f08396b6c114c.png',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                      },
                      child: Text('Realizar la Verificación de privacidad'),
                    ),
                  ],
                ),

                Divider(
                  color: Colors.black,
                  height: 20,
                ),

                Text('¿Buscas otra información?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                  SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text('Buscar en la cuenta de Google'),
                            Spacer(),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                  SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {  
                        },
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text('Ver las opciones de ayuda'),
                            Spacer(),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                  SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text('Enviar comentarios'),
                            Spacer(),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Text(
                        'Solo tú puedes ver la configuración. También puedes revisar la configuración de Maps, la Búsqueda o cualquier servicio de Google que uses con frecuencia. Google protege la privacidad y la seguridad de tus datos. Más información',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        'https://www.gstatic.com/identity/boq/accountsettingsmobile/privacycheckup_initial_with_new_shield_96x96_ca8e6c5983e01665ee5f08396b6c114c.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(child: Text('Contenido de la información personal')),
          Center(child: Text('Contenido de los datos y privacidad')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
