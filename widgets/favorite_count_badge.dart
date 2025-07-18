import 'package:flutter/material.dart';

class FavoriteCountBadge extends StatelessWidget {
  final int count;
  final VoidCallback onTap;

  const FavoriteCountBadge({
    super.key,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      top: 16,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.favorite, size: 36, color: Colors.red),
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}