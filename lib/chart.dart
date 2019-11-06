import 'dart:math';

/// 自定义控件
import 'package:flutter/material.dart';

class SpiderNetView extends CustomPainter {
  ///多边形几个边
  int sideNum = 6;

  ///默认几层多边形
  int layerNum = 5;

  ///view 的中心点
  double viewCenterX;
  double viewCenterY;

  ///半径，最大的半径
  double maxRadius;
  Paint mPaint;
  Path mPath;
  final double CIRCLE_ANGLE = 360;
  Paint mLayerPaint;

  SpiderNetView(int sideNum) {
    this.sideNum = sideNum;
    mPaint = new Paint();
    mPaint.color = Color(0xffDCDCDC);
    mPaint.isAntiAlias = true;
    mPaint.style = PaintingStyle.stroke;
    mPath = new Path();

    mLayerPaint = new Paint();
    mLayerPaint.color = Color(0xffFFEFDC);
    mLayerPaint.isAntiAlias = true;
    mLayerPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    viewCenterX = size.width / 2;
    viewCenterY = size.height / 2;
    if (viewCenterX > viewCenterY) {
      maxRadius = viewCenterY;
    } else {
      maxRadius = viewCenterX;
    }
    canvas.save();
    drawPolygon(canvas);
    drawMaskLayer(canvas);
    drawText(canvas);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

  double eachRadius;
  double eachAngle;

  void drawPolygon(Canvas canvas) {
    ///每个角的度数
    eachAngle = CIRCLE_ANGLE / sideNum;

    ///找好所有的顶点，连接起来即可
    for (int i = 0; i < layerNum; i++) {
      mPath.reset();
      eachRadius = maxRadius / layerNum * (i + 1);

      for (int j = 0; j < sideNum + 1; j++) {
        if (j == 0) {
//          mPath.moveTo(viewCenterX + eachRadius, viewCenterY);
          mPath.moveTo(viewCenterX, viewCenterY - eachRadius);
        } else {
//          double x =
//              viewCenterX + eachRadius * cos(degToRad(eachAngle * j + 30));
//          double y =
//              viewCenterY + eachRadius * sin(degToRad(eachAngle * j + 30));
          double x, y;

          if (j == 1) {
            x = viewCenterX + eachRadius * cos(degToRad(30));
            y = viewCenterY + eachRadius * sin(degToRad(30));
            if (i == layerNum - 1) {
              TextPainter textPainter = TextPainter();
              textPainter.text = TextSpan(
                  text: '写作',
                  style: TextStyle(fontSize: 15, color: Colors.red));
              textPainter.textDirection = TextDirection.rtl;
              textPainter.layout(maxWidth: 50, minWidth: 20);

              textPainter.paint(canvas, Offset(x, y - 10));
            }
          } else if (j == 2) {
            x = viewCenterX - eachRadius * cos(degToRad(30));
            y = viewCenterY + eachRadius * sin(degToRad(30));

            if (i == layerNum - 1) {
              TextPainter textPainter = TextPainter();
              textPainter.text = TextSpan(
                  text: '听写',
                  style: TextStyle(color: Colors.red, fontSize: 15));
              textPainter.textDirection = TextDirection.rtl;
              textPainter.layout(maxWidth: 50, minWidth: 20);

              textPainter.paint(canvas, Offset(x - 30, y - 10));
            }
          } else {
            x = viewCenterX;
            y = viewCenterY - eachRadius;

            if (i == layerNum - 1) {
              TextPainter textPainter = TextPainter();
              textPainter.text = TextSpan(
                  text: '阅读',
                  style: TextStyle(color: Colors.red, fontSize: 15));
              textPainter.textDirection = TextDirection.rtl;
              textPainter.layout(maxWidth: 50, minWidth: 20);

              textPainter.paint(canvas, Offset(x - 15, y - 20));
            }
          }

          mPath.lineTo(x, y);
        }
      }
      mPath.close();
      canvas.drawPath(mPath, mPaint);
    }
//    drawLineLinkPoint(canvas, eachAngle, eachRadius);
  }

  void drawLineLinkPoint(Canvas canvas, double eachAngle, double eachRadius) {
    mPath.reset();
    for (int i = 0; i < sideNum; i++) {
      mPath.moveTo(viewCenterX, viewCenterY);
      double x = viewCenterX + eachRadius * cos(degToRad(eachAngle * i));
      double y = viewCenterY + eachRadius * sin(degToRad(eachAngle * i));
      mPath.lineTo(x, y);
      mPath.close();
      canvas.drawPath(mPath, mPaint);
    }
  }

  void drawMaskLayer(Canvas canvas) {
    mPath.reset();
    for (int i = 0; i < sideNum; i++) {
      double mRandomInt = randomInt();

      double x, y;
      if (i == 1) {
        x = viewCenterX + maxRadius * cos(degToRad(30)) * mRandomInt;
        y = viewCenterY + maxRadius * sin(degToRad(30)) * mRandomInt;
        TextPainter textPainter = TextPainter();
        textPainter.text =
            TextSpan(text: '2', style: TextStyle(color: Colors.red));
        textPainter.textDirection = TextDirection.ltr;
        textPainter.layout(maxWidth: 50, minWidth: 20);

        textPainter.paint(canvas, Offset(x - 20, y));
      } else if (i == 2) {
        x = viewCenterX - maxRadius * cos(degToRad(30)) * mRandomInt;
        y = viewCenterY + maxRadius * sin(degToRad(30)) * mRandomInt;
        TextPainter textPainter = TextPainter();
        textPainter.text =
            TextSpan(text: '2', style: TextStyle(color: Colors.red));
        textPainter.textDirection = TextDirection.ltr;
        textPainter.layout(maxWidth: 50, minWidth: 20);

        textPainter.paint(canvas, Offset(x, y - 20));
      } else {
        x = viewCenterX;
        y = viewCenterY - maxRadius * mRandomInt;
        TextPainter textPainter = TextPainter();
        textPainter.text =
            TextSpan(text: '2', style: TextStyle(color: Colors.red));
        textPainter.textDirection = TextDirection.ltr;
        textPainter.layout(maxWidth: 50, minWidth: 20);
        textPainter.paint(canvas, Offset(x, y - 15));
      }
      if (i == 0) {
        mPath.moveTo(x, y);
      } else {
        mPath.lineTo(x, y);
      }
    }
    mPath.close();
    canvas.drawPath(mPath, mLayerPaint);
  }

  void drawText(Canvas canvas) {
    for (int i = 0; i < sideNum; i++) {
      double x = viewCenterX + maxRadius * cos(degToRad(eachAngle * i));
      double y = viewCenterY + maxRadius * sin(degToRad(eachAngle * i));
    }
  }

  num degToRad(num deg) => deg * (pi / 180.0);

  num radToDeg(num rad) => rad * (180.0 / pi);

  Color randomRGB() {
    Random random = new Random();
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  Color randomARGB() {
    Random random = new Random();
    return Color.fromARGB(random.nextInt(180), random.nextInt(255),
        random.nextInt(255), random.nextInt(255));
  }

  double randomInt() {
    Random random = new Random();
    return (random.nextInt(10) + 1) / 10;
  }
}
