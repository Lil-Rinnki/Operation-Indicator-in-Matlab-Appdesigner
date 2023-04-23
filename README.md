# Matlab Appdesinger实现运行指示灯

#### Implementing the Operation Indicator with the Matlab Applesinger Lamp

## 一、前言

Matlab AppDesigner是一个用于构建应用程序的环境，它运用面向对象编程思想，使用设计视图与代码视图协助构建。这对非科班出生但有需求的工科生非常友好，可用于进行课程设计与项目实现。

个人在项目推进过程中遇到了如下的需求：由于处理数据量大、耗时长，希望在AppDesigner中利用lamp控件实现 **“运行指示灯”** 效果，即当程序在计算处理中时指示灯为黄色，处理完成时指示灯为绿色，以此将处理进程更好地可视化。

最初的尝试是在处理按键的回调函数的首尾分别对lamp控件的颜色属性进行修改：

```matlab
function ButtonPushed(app, event)

  app.Lamp.Color = 'y';

  % 此处用延时5秒以模拟运算耗时情况
  pause(5);

  app.Lamp.Color = 'g';

end
```

但运行后发现，lamp控件只在计算完成后变为绿色，所希望的在运行过程中变为黄色的指示效果并为实现。本分享主要介绍了**drawnow指令**，并实现对此简单运行指示灯的实现效果简例。

## 二、实现效果

![](https://raw.githubusercontent.com/Lil-Rinnki/Operation-Indicator-in-Matlab-Applesinger/main/readme_image/step1.png)

图1 初始状态 —— 指示灯灰色

![](https://raw.githubusercontent.com/Lil-Rinnki/Operation-Indicator-in-Matlab-Applesinger/main/readme_image/step2.png)

图2 点击计算 —— 指示灯黄色

![](https://raw.githubusercontent.com/Lil-Rinnki/Operation-Indicator-in-Matlab-Applesinger/main/readme_image/step3.png)

图3 计算结束 —— 指示灯绿色

## 三、代码原理

```matlab
function ButtonPushed(app, event)
    % 1.首先在默认状态下将lamp控件颜色设置为灰色

    % 2.按下"计算"按键后，将lamp颜色设置为黄色，表示正在运行
    % 重点：使用"drawonw"语句即刻反应在视图上
    app.Lamp.Color = 'y';
    drawnow

    % 3.进行实际运行，此处使用延时5秒以模拟计算耗时情况
    pause(5);

    % 4.完成计算后，将lamp颜色设置为绿色，表示运行完成
    app.Lamp.Color = 'g';

end
```

drawonw指令官网文档: [点击此处](https://ww2.mathworks.cn/help/matlab/ref/drawnow.html?searchHighlight=drawnow\&s_tid=srchtitle_drawnow_1 "点击此处")

本例基于Matlab R2022a版本。
