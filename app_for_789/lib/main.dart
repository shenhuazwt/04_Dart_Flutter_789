import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_for_8910',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: '8910章知识点'),
      home: const myPage(),
    );
  }
}

class myPage extends StatelessWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const notePage();
  }
}

//选第九章 动画 （https://book.flutterchina.club/chapter9/index）
class notePage extends StatelessWidget {
  const notePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('8、9、10章知识点'),
      ),
      body: ListView(
        //
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          //第九章 9.3  自定义路由切换动画
          TextButton(
            child: const Text("第九章 9.3  自定义路由切换动画",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onPressed: () {
              //导航到新路由
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const notePage_9_2();
                }),
              );
            },
          ),
          //第九章 9.4 Hero动画
          TextButton(
            child: const Text("第九章 9.4 Hero动画",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onPressed: () {
              //导航到新路由
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const notePage_9_4();
                }),
              );
            },
          ),
          //第九章 9.5 交织动画
          TextButton(
            child: const Text("第九章 9.5 交织动画",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onPressed: () {
              //导航到新路由
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const notePage_9_5();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

// 9.2 动画基本结构及状态监听
// （https://book.flutterchina.club/chapter9/animation_structure.html#_9-2-%E5%8A%A8%E7%94%BB%E5%9F%BA%E6%9C%AC%E7%BB%93%E6%9E%84%E5%8F%8A%E7%8A%B6%E6%80%81%E7%9B%91%E5%90%AC）
class notePage_9_2 extends StatelessWidget {
  const notePage_9_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9.2 动画基本结构及状态监听'),
      ),
      body: ListView(
        //
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          // 9.2.1 动画基本结构
          TextButton(
            child: const Text("动画基本结构",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onPressed: () {
              //导航到新路由
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const notePage_9_2_1();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

// 9.2.1 动画基本结构
// (https://book.flutterchina.club/chapter9/animation_structure.html#_9-2-1-%E5%8A%A8%E7%94%BB%E5%9F%BA%E6%9C%AC%E7%BB%93%E6%9E%84)
class notePage_9_2_1 extends StatelessWidget {
  const notePage_9_2_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9.2.1 动画基本结构'),
      ),
      body: ListView(
        //
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          // 9.2.1.1 基础版本
          TextButton(
            child: const Text("基础版本",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onPressed: () {
              //导航到新路由
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const notePage_9_2_1_1();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

// 1. 基础版本
// (https://book.flutterchina.club/chapter9/animation_structure.html#_1-%E5%9F%BA%E7%A1%80%E7%89%88%E6%9C%AC)
class notePage_9_2_1_1 extends StatelessWidget {
  const notePage_9_2_1_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9.2.1 动画基本结构'),
      ),
      body: const ScaleAnimationRoute(),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  const ScaleAnimationRoute({Key? key}) : super(key: key);

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() => {});
      });
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "images/壁纸.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

// 9.4 Hero动画
// （https://book.flutterchina.club/chapter9/hero.html#_9-4-hero%E5%8A%A8%E7%94%BB）
class notePage_9_4 extends StatelessWidget {
  const notePage_9_4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9.4 Hero动画'),
      ),
      body: ListView(
        //
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          //
          TextButton(
            child: const Text("自实现Hero动画",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onPressed: () {
              //导航到新路由
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const notePage_9_4_1();
                }),
              );
            },
          ),
          //
          TextButton(
            child: const Text("Flutter Hero动画",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onPressed: () {
              //导航到新路由
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const notePage_9_4_2();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

//9.4.1 自实现Hero动画
//(https://book.flutterchina.club/chapter9/hero.html#_9-4-1-%E8%87%AA%E5%AE%9E%E7%8E%B0hero%E5%8A%A8%E7%94%BB)
class notePage_9_4_1 extends StatelessWidget {
  const notePage_9_4_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9.4.1 自实现Hero动画'),
      ),
      body: const CustomHeroAnimation(),
    );
  }
}

class CustomHeroAnimation extends StatefulWidget {
  const CustomHeroAnimation({Key? key}) : super(key: key);

  @override
  _CustomHeroAnimationState createState() => _CustomHeroAnimationState();
}

class _CustomHeroAnimationState extends State<CustomHeroAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _animating = false;
  AnimationStatus? _lastAnimationStatus;
  late Animation _animation;

  //两个组件在Stack中的rect
  Rect? child1Rect;
  Rect? child2Rect;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    //应用curve
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.addListener(() {
      if (_controller.isCompleted || _controller.isDismissed) {
        if (_animating) {
          setState(() {
            _animating = false;
          });
        }
      } else {
        _lastAnimationStatus = _controller.status;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //小头像
    final Widget child1 = wChild1();
    //大头像
    final Widget child2 = wChild2();

    //是否展示小头像；只有在动画执行时、初始状态或者刚从大图变为小图时才应该显示小头像
    bool showChild1 =
        !_animating && _lastAnimationStatus != AnimationStatus.forward;

    // 执行动画时的目标组件；如果是从小图变为大图，则目标组件是大图；反之则是小图
    Widget targetWidget;
    if (showChild1 || _controller.status == AnimationStatus.reverse) {
      targetWidget = child1;
    } else {
      targetWidget = child2;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        //我们让Stack 填满屏幕剩余空间
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            if (showChild1)
              AfterLayout(
                //获取小图在Stack中占用的Rect信息
                callback: (value) => child1Rect = _getRect(value),
                child: child1,
              ),
            if (!showChild1)
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  //求出 rect 插值
                  final rect = Rect.lerp(
                    child1Rect,
                    child2Rect,
                    _animation.value,
                  );
                  // 通过 Positioned 设置组件大小和位置
                  return Positioned.fromRect(rect: rect!, child: child!);
                },
                child: targetWidget,
              ),
            // 用于测量 child2 的大小，设置为全透明并且不能响应事件
            IgnorePointer(
              child: Center(
                child: Opacity(
                  opacity: 0,
                  child: AfterLayout(
                    //获取大图在Stack中占用的Rect信息
                    callback: (value) => child2Rect = _getRect(value),
                    child: child2,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget wChild1() {
    //点击后执行正向动画
    return GestureDetector(
      onTap: () {
        setState(() {
          _animating = true;
          _controller.forward();
        });
      },
      child: SizedBox(
        width: 50,
        child: ClipOval(child: Image.asset("images/壁纸.jpg")),
      ),
    );
  }

  Widget wChild2() {
    // 点击后执行反向动画
    return GestureDetector(
      onTap: () {
        setState(() {
          _animating = true;
          _controller.reverse();
        });
      },
      child: Image.asset("images/壁纸.jpg", width: 400),
    );
  }

  Rect _getRect(RenderAfterLayout renderAfterLayout) {
    //我们需要获取的是AfterLayout子组件相对于Stack的Rect
    return renderAfterLayout.localToGlobal(
          Offset.zero,
          //找到Stack对应的 RenderObject 对象
          ancestor: context.findRenderObject(),
        ) &
        renderAfterLayout.size;
  }
}

//9.4.2 Flutter Hero动画
// (https://book.flutterchina.club/chapter9/hero.html#_9-4-2-flutter-hero%E5%8A%A8%E7%94%BB)
class notePage_9_4_2 extends StatelessWidget {
  const notePage_9_4_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9.4.2 Flutter Hero动画'),
      ),
      body: const HeroAnimationRouteA(),
    );
  }
}

class HeroAnimationRouteA extends StatelessWidget {
  const HeroAnimationRouteA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset(
                  "images/壁纸.jpg",
                  width: 50.0,
                ),
              ),
            ),
            onTap: () {
              //打开B路由
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (
                  BuildContext context,
                  animation,
                  secondaryAnimation,
                ) {
                  return FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text("原图"),
                      ),
                      body: HeroAnimationRouteB(),
                    ),
                  );
                },
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text("点击头像"),
          )
        ],
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("images/壁纸.jpg"),
      ),
    );
  }
}

// 9.5 交织动画
// (https://book.flutterchina.club/chapter9/stagger_animation.html#_9-5-%E4%BA%A4%E7%BB%87%E5%8A%A8%E7%94%BB)
class notePage_9_5 extends StatelessWidget {
  const notePage_9_5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9.5 交织动画'),
      ),
      body: ListView(
        //
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          //
          TextButton(
            child: const Text("9.5.2 示例",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            onPressed: () {
              //导航到新路由
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const notePage_9_5_2();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

//9.5.2 示例
// (https://book.flutterchina.club/chapter9/hero.html#_9-4-2-flutter-hero%E5%8A%A8%E7%94%BB)
class notePage_9_5_2 extends StatelessWidget {
  const notePage_9_5_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9.5.2 示例'),
      ),
      body: StaggerRoute(),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({
    Key? key,
    required this.controller,
  }) : super(key: key) {
    //高度动画
    height = Tween<double>(
      begin: .0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(left: .0),
      end: const EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
  }

  late final Animation<double> controller;
  late final Animation<double> height;
  late final Animation<EdgeInsets> padding;
  late final Animation<Color?> color;

  Widget _buildAnimation(BuildContext context, child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _playAnimation(),
            child: Text("start animation"),
          ),
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            //调用我们定义的交错动画Widget
            child: StaggerAnimation(controller: _controller),
          ),
        ],
      ),
    );
  }
}
