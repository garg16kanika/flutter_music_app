import 'package:flutter/cupertino.dart';

class songDetail {
  String title;
  String audioPath;
  String artistName;
  String imageURL;
  bool isPlaying = false;

  songDetail(
      {required this.title,
      required this.isPlaying,
      required this.artistName,
      required this.audioPath,
      required this.imageURL});
}

List<songDetail> songs = [
  songDetail(
      isPlaying: false,
      title: 'Besharam Rang',
      artistName: 'Shreya Goshal',
      imageURL: 'assets/Besharam Rang.png',
      audioPath: 'Besharam Rang.mp3'),
  songDetail(
      isPlaying: false,
      title: 'Blank Space',
      artistName: 'Taylor Swift',
      imageURL: 'assets/blank_space.png',
      audioPath: 'blank_space.mp3'),
  songDetail(
      isPlaying: false,
      title: 'Kesariya',
      artistName: 'Arijit Singh',
      imageURL: 'assets/kesariya.png',
      audioPath: 'kesariya.mp3'),
  songDetail(
      isPlaying: false,
      title: 'Maan meri Jaan',
      artistName: 'King',
      imageURL: 'assets/Maan Meri Jaan.png',
      audioPath: 'Maan Meri Jaan.mp3'),
  songDetail(
      isPlaying: false,
      title: 'Mera Dil Ye Pukare Aaja',
      artistName: 'Shreya Goshal',
      imageURL: 'assets/Mera Dil Ye Pukare Aaja.png',
      audioPath: 'Mera Dil Ye Pukare Aaja.mp3'),
  songDetail(
      isPlaying: false,
      title: 'Srivalli',
      artistName: 'Shreya Goshal',
      imageURL: 'assets/Srivalli.png',
      audioPath: 'Srivalli.mp3'),
];
