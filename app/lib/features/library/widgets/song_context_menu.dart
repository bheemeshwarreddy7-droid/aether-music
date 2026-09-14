import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class SongContextMenu extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final bool isLiked;

  const SongContextMenu({
    super.key,
    required this.songTitle,
    required this.artistName,
    this.isLiked = false,
  });

  static Future<void> show(BuildContext context, {required String songTitle, required String artistName, bool isLiked = false}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => SongContextMenu(songTitle: songTitle, artistName: artistName, isLiked: isLiked),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = <_MenuItemData>[
      _MenuItemData(Icons.playlist_play, 'Play Next', () {}),
      _MenuItemData(Icons.queue_music, 'Add to Queue', () {}),
      _MenuItemData(Icons.playlist_add, 'Add to Playlist', () {}),
      _MenuItemData(Icons.download_outlined, 'Download', () {}),
      _MenuItemData(Icons.cloud_upload_outlined, 'Download to Cloud', () {}),
      _MenuItemData(isLiked ? Icons.favorite : Icons.favorite_border, isLiked ? 'Unlike' : 'Like', () {}),
      _MenuItemData(Icons.thumb_down_outlined, 'Dislike', () {}),
      _MenuItemData(Icons.share_outlined, 'Share', () {}),
      _MenuItemData(Icons.lyrics_outlined, 'View Lyrics', () {}),
      _MenuItemData(Icons.person_outline, 'Artist Page', () {}),
      _MenuItemData(Icons.album_outlined, 'Album Page', () {}),
      _MenuItemData(Icons.high_quality_outlined, 'Audio Quality', () {}),
      _MenuItemData(Icons.bedtime_outlined, 'Sleep Timer', () {}),
      _MenuItemData(Icons.info_outline, 'Song Details', () {}),
      _MenuItemData(Icons.flag_outlined, 'Report Issue', () {}),
    ];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GlassContainer(
        padding: EdgeInsets.zero,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.75),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(color: AppColors.secondaryNavy, borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.music_note, color: AppColors.textSecondary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(songTitle, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600
