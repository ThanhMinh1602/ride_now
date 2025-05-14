import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class InfoWindowsWidget extends StatelessWidget {
  final String title;
  final String snippet;
  final double borderRadius;

  const InfoWindowsWidget({
    super.key,
    required this.title,
    required this.snippet,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SpeechBubblePainter(borderRadius: borderRadius),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.heading15SemiBoldPrimary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              snippet,
              style: AppStyle.body12RegularPrimary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class SpeechBubblePainter extends CustomPainter {
  final double borderRadius;

  SpeechBubblePainter({this.borderRadius = 10.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final Paint shadowPaint =
        Paint()
          ..color = AppColor.black.withOpacity(0.1)
          ..style = PaintingStyle.fill
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5.0);

    final double tailHeight = 7.0;
    final double tailWidth = 10.0;

    // Vẽ bóng
    final Path shadowPath =
        Path()
          ..moveTo(0, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height - tailHeight)
          ..lineTo(size.width / 2 + tailWidth / 2, size.height - tailHeight)
          ..lineTo(size.width / 2, size.height)
          ..lineTo(size.width / 2 - tailWidth / 2, size.height - tailHeight)
          ..lineTo(0, size.height - tailHeight)
          ..close();
    canvas.drawPath(shadowPath, shadowPaint);

    // Vẽ bong bóng
    final RRect bubble = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height - tailHeight,
      Radius.circular(borderRadius),
    );
    canvas.drawRRect(bubble, paint);

    // Vẽ đuôi
    final Path tailPath =
        Path()
          ..moveTo(size.width / 2 - tailWidth / 2, size.height - tailHeight)
          ..lineTo(size.width / 2, size.height)
          ..lineTo(size.width / 2 + tailWidth / 2, size.height - tailHeight)
          ..close();
    canvas.drawPath(tailPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
