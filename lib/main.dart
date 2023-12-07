import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xff1e41ff);
    return MaterialApp(
      title: 'SocialProfile',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          brightness: Brightness.light,
          primary: primaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                side: MaterialStateProperty.all(BorderSide(
                  width: 1.5,
                  color: primaryColor,
                )),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                padding: MaterialStateProperty.all(EdgeInsets.all(14)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                padding: MaterialStateProperty.all(EdgeInsets.all(14)))),
        appBarTheme: AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white, // Navigation bar
            statusBarColor: Colors.white, // Status bar
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        useMaterial3: false,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left,
                size: 32,
              )),
        ),
        body: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.only(left: 18, right: 18),
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 3,
          itemCount: 50,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const ProfileHeader();
            } else {
              return Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.all(4),
              );
            }
          },
          staggeredTileBuilder: (index) {
            if (index == 0) {
              return const StaggeredTile.fit(3);
            } else {
              return const StaggeredTile.count(1, 1);
            }
          },
        ));
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                  )
                ]),
            child: ClipOval(
                child: Image.asset(
              'assets/images/profile_image.jpg',
              width: 120,
            )),
          ),
          Text(
            'Catherine Massey',
            style: theme.textTheme.headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'UI/UX Designer',
                style:
                    theme.textTheme.titleSmall!.copyWith(color: Colors.black54),
              ),
              Container(
                width: 1,
                height: 16,
                color: Theme.of(context).dividerColor,
                margin: const EdgeInsets.only(left: 8, right: 8),
              ),
              Text(
                'Daily',
                style:
                    theme.textTheme.titleSmall!.copyWith(color: Colors.black54),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 4),
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.purpleAccent),
                child: const Text(
                  '71',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImagedButton(imagePath: 'assets/images/instagram_logo.png'),
              SizedBox(width: 24),
              ImagedButton(imagePath: 'assets/images/facebook_logo.png'),
              SizedBox(width: 24),
              ImagedButton(imagePath: 'assets/images/pinterest_logo.png'),
              SizedBox(width: 24),
              ImagedButton(imagePath: 'assets/images/twitter_logo.png'),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '80',
                      style: theme.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    const Text('Posts'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Container(
                alignment: Alignment.center,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '110',
                      style: theme.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    const Text('Followers'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Container(
                alignment: Alignment.center,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '152',
                      style: theme.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    const Text('Following'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                  child:
                      OutlinedButton(onPressed: () {}, child: Text('Message'))),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Follow'))),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class ImagedButton extends StatelessWidget {
  final String imagePath;
  const ImagedButton({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffebf2ff),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        imagePath,
        width: 20,
        height: 20,
      ),
    );
  }
}
