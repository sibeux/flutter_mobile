// ignore_for_file: unused_import

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile/SiHALAL-ecommerce-app/main_sihalal_app.dart';
import 'package:flutter_mobile/course_kopianan/main_anan.dart';
import 'package:flutter_mobile/udemy_max/chat_app/main_chat_app.dart';
import 'package:flutter_mobile/udemy_max/dice_roller/gradient_container.dart';
import 'package:flutter_mobile/udemy_max/dice_roller/main_dice_roller.dart';
import 'package:flutter_mobile/udemy_max/expenses_track/main_expenses_app.dart';
import 'package:flutter_mobile/udemy_max/favorite_places/favorite_app_main.dart';
import 'package:flutter_mobile/udemy_max/meal_app/meal_app_main.dart';
import 'package:flutter_mobile/udemy_max/quiz_app/main_quiz_app.dart';
import 'package:flutter_mobile/udemy_max/quiz_app/start_screen.dart';
import 'package:flutter_mobile/udemy_max/shopping_list/shopping_list_app.dart';
import 'package:flutter_mobile/udemy_max/todo_app/main_todo_app.dart';
import 'package:flutter_mobile/unicorn-app/how-to-play-music/main_music_app.dart';
import 'package:flutter_mobile/unicorn-app/how-to-play-music/screen/music_screen.dart';
import 'package:flutter_mobile/unicorn-app/just-audio-background/main_just_audio_background.dart';
import 'package:flutter_mobile/unicorn-app/music-player-app/main_music_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:just_audio_background/just_audio_background.dart';

// buat materi firebase
// import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  // buat materi firebase
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // just audio background
  // await JustAudioBackground.init(
  //   androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
  //   androidNotificationChannelName: 'Audio playback',
  //   androidNotificationOngoing: true,
  // );

  // lock orientation to portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
    // tinggal ganti MainApp-nya

    // runApp(const MainExpensesApp());
    // runApp(const MainTodoApp());
    // runApp(const ProviderScope(child: MainMealApp()));
    // runApp(const ProviderScope(child: MainSihalalApp()));
    // runApp(const ShoppingListApp());
    // runApp(const ProviderScope(child: FavoriteAppMain()));
    // runApp(const MainMusicApp());
    // runApp(const MainChatApp());
    // runApp(const ProviderScope(child: MainMusicPlayerApp()));
    runApp(const ProviderScope(child: MainJustAudioBackgroundApp()));
  });
}
