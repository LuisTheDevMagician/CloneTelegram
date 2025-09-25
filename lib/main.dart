import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1C1C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1C1C1C),
          elevation: 0,
        ),
      ),
      home: const TelegramHome(),
    );
  }
}

class TelegramHome extends StatelessWidget {
  const TelegramHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TelegramDrawer(),
      appBar: AppBar(
        title: const Text("Telegram"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: const [
          Icon(Icons.lock_outline),
          SizedBox(width: 15),
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              ChatTile(
                name: "Trocas Mercado Livre",
                message: "Sousa: Levei um Golpe!!!",
                time: "10:34",
                unreadCount: 18,
                imageUrl:
                    "https://play-lh.googleusercontent.com/2uEptSnLOcFWnSjxLLIfGOWrf6lWSQ8pheDbGdzhqn0dcV93PBSrUkyjAKPgY7ejmA",
              ),
              ChatTile(
                name: "Rumo ao Mestre - Wild Rift",
                message: "OtakuHero: Cheguei ao Desafiante kct",
                time: "10:16",
                unreadCount: 263,
                imageUrl:
                    "https://play-lh.googleusercontent.com/4b8E4y0776rFq9cUJTLjUnZAjRa2nd9kjGD_HH4sOYbKaEMsMPh3YCXVQ1871dBDtxIi",
              ),
              ChatTile(
                name: "RatoFlix",
                message: "Raul: Alguém tem curso de Flutter?",
                time: "10:06",
                unreadCount: 438,
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSefFfwDfGv-AaiDnpktR3QtJXbwsrBJVEw1g&s",
              ),
              ChatTile(
                name: "Grupo Oficial 38tão",
                message: "Renato: É isso ou não é? Em?",
                time: "10:06",
                unreadCount: 1000,
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqMwzvWCpJflD1hf9F6_YiH6jGIz__tROJ2A&s",
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  heroTag: "lapis",
                  backgroundColor: Colors.blueGrey,
                  shape: const CircleBorder(),
                  onPressed: () {},
                  child: const Icon(Icons.edit),
                ),
                const SizedBox(height: 16),
                FloatingActionButton(
                  heroTag: "camera",
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(),
                  onPressed: () {},
                  child: const Icon(Icons.camera_alt_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String imageUrl;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    this.unreadCount = 0,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: Colors.grey.shade800,
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontSize: 12)),
          if (unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(
                "$unreadCount",
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

class TelegramDrawer extends StatelessWidget {
  const TelegramDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2C2C2C),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF2C2C2C)),
            accountName: const Text("GigaChad"),
            accountEmail: const Text("+55 (89) 99999-9999"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wiktionary/en/thumb/6/6c/Ernest_Khalimov.png/250px-Ernest_Khalimov.png",
              ),
            ),
            otherAccountsPictures: const [
              Icon(Icons.wb_sunny, color: Colors.white),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Meu Perfil"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text("Carteira"),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "NEW",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text("Novo Grupo"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text("Contatos"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text("Chamadas"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text("Mensagens Salvas"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configurações"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text("Convidar Amigos"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Recursos do Telegram"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
