import 'package:flutter/material.dart';

void main() {
  runApp(InstagramClone());
}

class InstagramClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.camera_alt, color: Colors.black),
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong',
            fontSize: 32,
          ),
        ),
        actions: [
          Icon(Icons.send, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Stories Section
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return StoryCircle(index: index);
              },
            ),
          ),
          Divider(height: 1, color: Colors.grey[300]),
          // Feed Section
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return PostCard(index: index);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage:
                  NetworkImage("https://via.placeholder.com/150"), // User avatar
            ),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class StoryCircle extends StatelessWidget {
  final int index;

  const StoryCircle({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://via.placeholder.com/150?text=User+$index"),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "User $index",
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final int index;

  const PostCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage("https://via.placeholder.com/150?text=User+$index"),
          ),
          title: Text("User $index", style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("Location $index"),
          trailing: Icon(Icons.more_vert),
        ),
        // Post Image
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Image.network(
            "https://via.placeholder.com/500?text=Post+$index",
            fit: BoxFit.cover,
          ),
        ),
        // Post Actions
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.comment_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),
        // Likes and Comments
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Liked by UserX and 10 others",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: "User $index ",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "This is a sample caption for post $index.",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                "View all 5 comments",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 5),
              Text(
                "UserY: Nice post!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.grey[300]),
      ],
    );
  }
}
