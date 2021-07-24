classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        UIAxes                       matlab.ui.control.UIAxes
        PlotDropDownLabel            matlab.ui.control.Label
        PlotDropDown                 matlab.ui.control.DropDown
        ErrorButtonGroup             matlab.ui.container.ButtonGroup
        ProportionalErrorButton      matlab.ui.control.RadioButton
        IntegralErrorButton          matlab.ui.control.RadioButton
        DerivativeErrorButton        matlab.ui.control.RadioButton
        IterationSliderLabel         matlab.ui.control.Label
        IterationSlider              matlab.ui.control.Slider
        GainButtonGroup              matlab.ui.container.ButtonGroup
        ProportionalGainButton       matlab.ui.control.RadioButton
        IntegralGainButton           matlab.ui.control.RadioButton
        DerivativeGainButton         matlab.ui.control.RadioButton
        ControllerSwitchLabel        matlab.ui.control.Label
        ControllerSwitch             matlab.ui.control.Switch
        OvershootEditFieldLabel      matlab.ui.control.Label
        OvershootEditField           matlab.ui.control.NumericEditField
        SettlingTime2EditFieldLabel  matlab.ui.control.Label
        SettlingTime2EditField       matlab.ui.control.NumericEditField
        RiseTimeEditFieldLabel       matlab.ui.control.Label
        RiseTimeEditField            matlab.ui.control.NumericEditField
        PlayButton                   matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.ProportionalGainButton.Enable = 'off';
            app.IntegralGainButton.Enable = 'off';
            app.DerivativeGainButton.Enable = 'off';
            app.ProportionalErrorButton.Enable = 'off';
            app.IntegralErrorButton.Enable = 'off';
            app.DerivativeErrorButton.Enable = 'off';
            app.IterationSlider.Enable = 'off';
            app.ControllerSwitch.Enable = 'off';
            app.OvershootEditField.Enable = 'off';
            app.RiseTimeEditField.Enable = 'off';
            app.SettlingTime2EditField.Enable = 'off';
            app.PlayButton.Enable = 'off';
        end

        % Value changed function: PlotDropDown
        function PlotDropDownValueChanged(app, event)
            load('data.mat','fitness','ITAE','ydist');
            dd = string(app.PlotDropDown.Value);
            
            if dd == "-Select-"
                plot(app.UIAxes,0,0);
                app.ProportionalGainButton.Enable = 'off';
                app.IntegralGainButton.Enable = 'off';
                app.DerivativeGainButton.Enable = 'off';
                app.ProportionalErrorButton.Enable = 'off';
                app.IntegralErrorButton.Enable = 'off';
                app.DerivativeErrorButton.Enable = 'off';
                app.IterationSlider.Enable = 'off';
                app.ControllerSwitch.Enable = 'off';
                app.OvershootEditField.Enable = 'off';
                app.RiseTimeEditField.Enable = 'off';
                app.SettlingTime2EditField.Enable = 'off';
                app.PlayButton.Enable = 'off';
            end
            
            if dd == "Servo response"
                app.ProportionalGainButton.Enable = 'off';
                app.IntegralGainButton.Enable = 'off';
                app.DerivativeGainButton.Enable = 'off';
                app.ProportionalErrorButton.Enable = 'off';
                app.IntegralErrorButton.Enable = 'off';
                app.DerivativeErrorButton.Enable = 'off';
                app.IterationSlider.Enable = 'off';
                app.ControllerSwitch.Enable = 'on';
                app.OvershootEditField.Enable = 'on';
                app.RiseTimeEditField.Enable = 'on';
                app.SettlingTime2EditField.Enable = 'on';
                app.PlayButton.Enable = 'off';
            end
            
            if dd == "Regulatory response"
                syms x;
                fplot(app.UIAxes,heaviside(x-1),[0 3]);
                hold(app.UIAxes,'on')
                plot(app.UIAxes,ydist.Time,ydist.Data);
                hold(app.UIAxes,'off')
                title(app.UIAxes,'Step Disturbance Response');
                ylim(app.UIAxes,[-0.1 1.1]);
                xlabel(app.UIAxes,'Time');
                app.ProportionalGainButton.Enable = 'off';
                app.IntegralGainButton.Enable = 'off';
                app.DerivativeGainButton.Enable = 'off';
                app.ProportionalErrorButton.Enable = 'off';
                app.IntegralErrorButton.Enable = 'off';
                app.DerivativeErrorButton.Enable = 'off';
                app.IterationSlider.Enable = 'off';
                app.ControllerSwitch.Enable = 'off';
                app.OvershootEditField.Enable = 'off';
                app.RiseTimeEditField.Enable = 'off';
                app.SettlingTime2EditField.Enable = 'off';
                app.PlayButton.Enable = 'off';
            end
            
            if dd == "Iteration wise output"
                app.ProportionalGainButton.Enable = 'off';
                app.IntegralGainButton.Enable = 'off';
                app.DerivativeGainButton.Enable = 'off';
                app.ProportionalErrorButton.Enable = 'off';
                app.IntegralErrorButton.Enable = 'off';
                app.DerivativeErrorButton.Enable = 'off';
                app.IterationSlider.Enable = 'on';
                app.ControllerSwitch.Enable = 'off';
                app.OvershootEditField.Enable = 'off';
                app.RiseTimeEditField.Enable = 'off';
                app.SettlingTime2EditField.Enable = 'off';
                app.PlayButton.Enable = 'on';
            end
            
            if dd == "Gain"
                app.ProportionalGainButton.Enable = 'on';
                app.IntegralGainButton.Enable = 'on';
                app.DerivativeGainButton.Enable = 'on';
                app.ProportionalErrorButton.Enable = 'off';
                app.IntegralErrorButton.Enable = 'off';
                app.DerivativeErrorButton.Enable = 'off';
                app.IterationSlider.Enable = 'off';
                app.ControllerSwitch.Enable = 'off';
                app.OvershootEditField.Enable = 'off';
                app.RiseTimeEditField.Enable = 'off';
                app.SettlingTime2EditField.Enable = 'off';
                app.PlayButton.Enable = 'off';
            end
            
            if dd == "Fitness"
                plot(app.UIAxes,fitness);
                title(app.UIAxes,'Fitness Value');
                xlabel(app.UIAxes,'# Iteration');
                ylim(app.UIAxes,[0.05 0.14]);
                app.ProportionalGainButton.Enable = 'off';
                app.IntegralGainButton.Enable = 'off';
                app.DerivativeGainButton.Enable = 'off';
                app.ProportionalErrorButton.Enable = 'off';
                app.IntegralErrorButton.Enable = 'off';
                app.DerivativeErrorButton.Enable = 'off';
                app.IterationSlider.Enable = 'off';
                app.ControllerSwitch.Enable = 'off';
                app.OvershootEditField.Enable = 'off';
                app.RiseTimeEditField.Enable = 'off';
                app.SettlingTime2EditField.Enable = 'off';
                app.PlayButton.Enable = 'off';
            end
            
            if dd == "ITAE"
                stairs(app.UIAxes,ITAE.Time,ITAE.Data);
                title(app.UIAxes,'ITAE');
                xlabel(app.UIAxes,'Time');
                ylim(app.UIAxes,[-0.005 0.065]);
                app.ProportionalGainButton.Enable = 'off';
                app.IntegralGainButton.Enable = 'off';
                app.DerivativeGainButton.Enable = 'off';
                app.ProportionalErrorButton.Enable = 'off';
                app.IntegralErrorButton.Enable = 'off';
                app.DerivativeErrorButton.Enable = 'off';
                app.IterationSlider.Enable = 'off';
                app.ControllerSwitch.Enable = 'off';
                app.OvershootEditField.Enable = 'off';
                app.RiseTimeEditField.Enable = 'off';
                app.SettlingTime2EditField.Enable = 'off';
                app.PlayButton.Enable = 'off';
            end
            
            if dd == "Error"
                app.ProportionalGainButton.Enable = 'off';
                app.IntegralGainButton.Enable = 'off';
                app.DerivativeGainButton.Enable = 'off';
                app.ProportionalErrorButton.Enable = 'on';
                app.IntegralErrorButton.Enable = 'on';
                app.DerivativeErrorButton.Enable = 'on';
                app.IterationSlider.Enable = 'off';
                app.ControllerSwitch.Enable = 'off';
                app.OvershootEditField.Enable = 'off';
                app.RiseTimeEditField.Enable = 'off';
                app.SettlingTime2EditField.Enable = 'off';
                app.PlayButton.Enable = 'off';
            end
            
        end

        % Selection changed function: GainButtonGroup
        function GainButtonGroupSelectionChanged(app, event)
            load('data.mat','Kp','Ki','Kd');
            
            if app.ProportionalGainButton.Value == true
                plot(app.UIAxes,Kp);
                title(app.UIAxes,'Proportional Gain');
                xlabel(app.UIAxes,'# Iteration');
                ylim(app.UIAxes,[-0.02 0.35]);
                
            elseif app.IntegralGainButton.Value == true
                plot(app.UIAxes,Ki);
                title(app.UIAxes,'Integral Gain');
                xlabel(app.UIAxes,'# Iteration');
                ylim(app.UIAxes,[-0.02 0.35]);
                
            elseif app.DerivativeGainButton.Value == true
                plot(app.UIAxes,Kd);
                title(app.UIAxes,'Derivative Gain');
                xlabel(app.UIAxes,'# Iteration');
                ylim(app.UIAxes,[-0.02 0.35]);
            end
        end

        % Selection changed function: ErrorButtonGroup
        function ErrorButtonGroupSelectionChanged(app, event)
            load('data.mat','prop_err','int_err','der_err');
            
            if app.ProportionalErrorButton.Value == true
                stairs(app.UIAxes,prop_err.Time,prop_err.Data);
                title(app.UIAxes,'Proportional Error');
                xlabel(app.UIAxes,'Time');
                ylim(app.UIAxes,[-0.1 1.1]);
                
            elseif app.IntegralErrorButton.Value == true
                stairs(app.UIAxes,int_err.Time,int_err.Data);
                title(app.UIAxes,'Integral Error');
                xlabel(app.UIAxes,'Time');
                ylim(app.UIAxes,[-0.5e-6 6e-6]);
                
            elseif app.DerivativeErrorButton.Value == true
                stairs(app.UIAxes,der_err.Time,der_err.Data);
                title(app.UIAxes,'Derivative Error');
                xlabel(app.UIAxes,'Time');
                ylim(app.UIAxes,[-3e-3 7.5e-3]);
            end
        end

        % Value changing function: IterationSlider
        function IterationSliderValueChanging(app, event)
            changingValue = round(event.Value);
            load('data.mat','op');
            if changingValue ~= 0
                plot(app.UIAxes,op(changingValue).Time,op(changingValue).Data);
            else
                plot(app.UIAxes,0,0);
            end
            ylim(app.UIAxes,[-0.2 1.4])
            title(app.UIAxes,'Output');
            xlabel(app.UIAxes,'Iteration #'+string(changingValue));
        end

        % Value changed function: ControllerSwitch, 
        % OvershootEditField
        function ControllerSwitchValueChanged(app, event)
            value = app.ControllerSwitch.Value;
            load('data.mat','y','yzn');
            syms x;
            fplot(app.UIAxes,heaviside(x-1),[0 3]);
            
            if value == "MPSO-IPID"
                hold(app.UIAxes,'on')
                plot(app.UIAxes,y.Time,y.Data);
                hold(app.UIAxes,'off')
                app.OvershootEditField.Value = (max(y.Data)-1)*100;
                for q = 1 : length(y.Data)
                    if y.Data(q) >= 1
                    app.RiseTimeEditField.Value = y.Time(q) - 1;
                    break;
                    end
                end
                for q = 1 : length(y.Data)
                    if (y.Data(q) > 1.002 || y.Data(q) < 0.998)
                    app.SettlingTime2EditField.Value = y.Time(q) - 1;
                    end
                end
            
            elseif value == "ZN"
                hold(app.UIAxes,'on')
                plot(app.UIAxes,yzn.Time,yzn.Data);
                hold(app.UIAxes,'off')
                app.OvershootEditField.Value = (max(yzn.Data)-1)*100;
                for q = 1 : length(yzn.Data)
                    if yzn.Data(q) >= 1
                    app.RiseTimeEditField.Value = yzn.Time(q) - 1;
                    break;
                    end
                end
                for q = 1 : length(yzn.Data)
                    if (yzn.Data(q) > 1.002 || yzn.Data(q) < 0.998)
                    app.SettlingTime2EditField.Value = yzn.Time(q) - 1;
                    end
                end
            end
            
            ylim(app.UIAxes,[-.2 1.8]);
            title(app.UIAxes,'Step Setpoint Change Response');
            xlabel(app.UIAxes,'Time');
        end

        % Callback function: IterationSlider, PlayButton
        function PlayButtonPushed(app, event)
            load('data.mat','op');
            for i = 1:20
                plot(app.UIAxes,op(i).Time,op(i).Data);
                pause(0.5);
                xlabel(app.UIAxes,'Iteration #'+string(i));
                ylim(app.UIAxes,[-0.2 1.4])
                title(app.UIAxes,'Output');
                app.IterationSlider.Value = i;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 703 507];
            app.UIFigure.Name = 'UI Figure';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, '')
            app.UIAxes.Position = [166 124 508 329];

            % Create PlotDropDownLabel
            app.PlotDropDownLabel = uilabel(app.UIFigure);
            app.PlotDropDownLabel.HorizontalAlignment = 'right';
            app.PlotDropDownLabel.Position = [280 463 26 22];
            app.PlotDropDownLabel.Text = 'Plot';

            % Create PlotDropDown
            app.PlotDropDown = uidropdown(app.UIFigure);
            app.PlotDropDown.Items = {'-Select-', 'Servo response', 'Regulatory response', 'Iteration wise output', 'Gain', 'Fitness', 'ITAE', 'Error'};
            app.PlotDropDown.ValueChangedFcn = createCallbackFcn(app, @PlotDropDownValueChanged, true);
            app.PlotDropDown.Position = [321 463 193 22];
            app.PlotDropDown.Value = '-Select-';

            % Create ErrorButtonGroup
            app.ErrorButtonGroup = uibuttongroup(app.UIFigure);
            app.ErrorButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ErrorButtonGroupSelectionChanged, true);
            app.ErrorButtonGroup.Title = 'Error';
            app.ErrorButtonGroup.Position = [21 183 133 106];

            % Create ProportionalErrorButton
            app.ProportionalErrorButton = uiradiobutton(app.ErrorButtonGroup);
            app.ProportionalErrorButton.Text = 'Proportional Error';
            app.ProportionalErrorButton.Position = [11 60 117 22];
            app.ProportionalErrorButton.Value = true;

            % Create IntegralErrorButton
            app.IntegralErrorButton = uiradiobutton(app.ErrorButtonGroup);
            app.IntegralErrorButton.Text = 'Integral Error';
            app.IntegralErrorButton.Position = [11 37 92 22];

            % Create DerivativeErrorButton
            app.DerivativeErrorButton = uiradiobutton(app.ErrorButtonGroup);
            app.DerivativeErrorButton.Text = 'Derivative Error';
            app.DerivativeErrorButton.Position = [11 11 105 22];

            % Create IterationSliderLabel
            app.IterationSliderLabel = uilabel(app.UIFigure);
            app.IterationSliderLabel.HorizontalAlignment = 'right';
            app.IterationSliderLabel.Position = [123 37 49 22];
            app.IterationSliderLabel.Text = 'Iteration';

            % Create IterationSlider
            app.IterationSlider = uislider(app.UIFigure);
            app.IterationSlider.Limits = [0 20];
            app.IterationSlider.ValueChangedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.IterationSlider.ValueChangingFcn = createCallbackFcn(app, @IterationSliderValueChanging, true);
            app.IterationSlider.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
            app.IterationSlider.Position = [183 47 493 3];
            app.IterationSlider.Value = 1;

            % Create GainButtonGroup
            app.GainButtonGroup = uibuttongroup(app.UIFigure);
            app.GainButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @GainButtonGroupSelectionChanged, true);
            app.GainButtonGroup.Title = 'Gain';
            app.GainButtonGroup.Position = [21 313 133 106];

            % Create ProportionalGainButton
            app.ProportionalGainButton = uiradiobutton(app.GainButtonGroup);
            app.ProportionalGainButton.Text = 'Proportional Gain';
            app.ProportionalGainButton.Position = [11 60 115 22];
            app.ProportionalGainButton.Value = true;

            % Create IntegralGainButton
            app.IntegralGainButton = uiradiobutton(app.GainButtonGroup);
            app.IntegralGainButton.Text = 'Integral Gain';
            app.IntegralGainButton.Position = [11 39 91 22];

            % Create DerivativeGainButton
            app.DerivativeGainButton = uiradiobutton(app.GainButtonGroup);
            app.DerivativeGainButton.Text = 'Derivative Gain';
            app.DerivativeGainButton.Position = [11 16 104 22];

            % Create ControllerSwitchLabel
            app.ControllerSwitchLabel = uilabel(app.UIFigure);
            app.ControllerSwitchLabel.HorizontalAlignment = 'center';
            app.ControllerSwitchLabel.Position = [47 75 58 22];
            app.ControllerSwitchLabel.Text = 'Controller';

            % Create ControllerSwitch
            app.ControllerSwitch = uiswitch(app.UIFigure, 'slider');
            app.ControllerSwitch.Items = {'ZN', 'MPSO-IPID'};
            app.ControllerSwitch.ValueChangedFcn = createCallbackFcn(app, @ControllerSwitchValueChanged, true);
            app.ControllerSwitch.Position = [54 95 45 20];
            app.ControllerSwitch.Value = 'ZN';

            % Create OvershootEditFieldLabel
            app.OvershootEditFieldLabel = uilabel(app.UIFigure);
            app.OvershootEditFieldLabel.HorizontalAlignment = 'right';
            app.OvershootEditFieldLabel.Position = [206 93 70 22];
            app.OvershootEditFieldLabel.Text = 'Overshoot %';

            % Create OvershootEditField
            app.OvershootEditField = uieditfield(app.UIFigure, 'numeric');
            app.OvershootEditField.ValueChangedFcn = createCallbackFcn(app, @ControllerSwitchValueChanged, true);
            app.OvershootEditField.Position = [283 93 59 22];

            % Create SettlingTime2EditFieldLabel
            app.SettlingTime2EditFieldLabel = uilabel(app.UIFigure);
            app.SettlingTime2EditFieldLabel.HorizontalAlignment = 'right';
            app.SettlingTime2EditFieldLabel.Position = [523 93 103 22];
            app.SettlingTime2EditFieldLabel.Text = 'Settling Time (2%)';

            % Create SettlingTime2EditField
            app.SettlingTime2EditField = uieditfield(app.UIFigure, 'numeric');
            app.SettlingTime2EditField.Position = [633 93 62 22];

            % Create RiseTimeEditFieldLabel
            app.RiseTimeEditFieldLabel = uilabel(app.UIFigure);
            app.RiseTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.RiseTimeEditFieldLabel.Position = [373 93 55 22];
            app.RiseTimeEditFieldLabel.Text = 'RiseTime';

            % Create RiseTimeEditField
            app.RiseTimeEditField = uieditfield(app.UIFigure, 'numeric');
            app.RiseTimeEditField.Position = [433 93 63 22];

            % Create PlayButton
            app.PlayButton = uibutton(app.UIFigure, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.Position = [21 28 84 22];
            app.PlayButton.Text = 'Play';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

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