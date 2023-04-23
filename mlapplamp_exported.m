classdef mlapplamp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        Lamp              matlab.ui.control.Lamp
        Label             matlab.ui.control.Label
        Button            matlab.ui.control.Button
        lampforoperationindicationLabel  matlab.ui.control.Label
        AppdesignerLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button
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
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 449 333];
            app.UIFigure.Name = 'MATLAB App';

            % Create AppdesignerLabel
            app.AppdesignerLabel = uilabel(app.UIFigure);
            app.AppdesignerLabel.BackgroundColor = [0 0.4471 0.7412];
            app.AppdesignerLabel.HorizontalAlignment = 'center';
            app.AppdesignerLabel.FontSize = 20;
            app.AppdesignerLabel.FontWeight = 'bold';
            app.AppdesignerLabel.FontColor = [1 1 1];
            app.AppdesignerLabel.Position = [2 272 449 62];
            app.AppdesignerLabel.Text = 'Appdesigner 运行指示灯一种简易实现';

            % Create lampforoperationindicationLabel
            app.lampforoperationindicationLabel = uilabel(app.UIFigure);
            app.lampforoperationindicationLabel.BackgroundColor = [0 0.4471 0.7412];
            app.lampforoperationindicationLabel.HorizontalAlignment = 'center';
            app.lampforoperationindicationLabel.FontSize = 16;
            app.lampforoperationindicationLabel.FontWeight = 'bold';
            app.lampforoperationindicationLabel.FontColor = [1 1 1];
            app.lampforoperationindicationLabel.Position = [2 232 449 41];
            app.lampforoperationindicationLabel.Text = 'lamp for operation indication';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.FontName = '微软雅黑';
            app.Button.FontSize = 22;
            app.Button.Position = [92 99 100 37];
            app.Button.Text = '计算';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'right';
            app.Label.FontSize = 16;
            app.Label.Position = [288 132 69 22];
            app.Label.Text = '运行状态';

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Position = [305 81 41 41];
            app.Lamp.Color = [0.651 0.651 0.651];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = mlapplamp_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end