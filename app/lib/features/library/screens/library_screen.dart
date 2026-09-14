import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/song_context_menu.dart';

class LibrarySong {
  final String title;
  final String artist;
  final bool isLiked;
  final bool isDownloaded;
  const LibrarySong({required this.title, required this.artist, this.isLiked = false, this.isDownloaded = false});
}

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  static const _songs = [
    LibrarySong(title: 'Midnight Static', artist: 'Nova Reyes', isLiked: true, isDownloaded: true),
    LibrarySong(title: 'Glass Horizon', artist: 'The Quiet Wire', isDownloaded: true),
    LibrarySong(title: 'Amber Skies', artist: 'Nova Reyes'),
    LibrarySong(title: 'Low Orbit', artist: 'Kessler & Vane', isLiked: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlack,
        title: const Text('Your Library'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _songs.length,
        separatorBuilder: (_, __) => const Divider(color: AppColors.glassBorder, height: 1, indent: 72),
        itemBuilder: (context, index) {
          final song = _songs[index];
          return ListTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(color: AppColors.secondaryNavy, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.music_note, color: AppColors.textSecondary),
            ),
            title: Text(song.title, style: const TextStyle(color: AppColors.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text(song.artist, style: const TextStyle(color: AppColors.textSecondary)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (song.isDownloaded) const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.download_done_rounded, color: AppColors.accentTeal, size: 18),
                ),
                if (song.isLiked) const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.favorite, color: AppColors.accentTeal, size: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: AppColors.textSecondary),
                  onPressed: () => SongContextMenu.show(
                    context,
                    songTitle: song.title,
                    artistName: song.artist,
                    isLiked: song.isLiked,
                  ),
                ),
              ],
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
