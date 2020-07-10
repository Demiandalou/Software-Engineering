classdef hrd_test < matlab.uitest.TestCase
    properties
        App
    end
    
    methods (TestMethodSetup)
        function launchApp(testCase)
           mainSystem=controlSys;
           huangrdUI=huangrd;
            mainSystem.UI=huangrdUI;
            huangrdUI.controlSys=mainSystem;

            mainSystem.UI.SUCCESSLabel.Text="HuaRongDao!";
            mainSystem.UI.SUCCESSLabel.Visible="On";
            mainSystem.start_UI();
            testCase.App = mainSystem.UI;
        end
    end
    methods (Test)
        % T2: Integration Test -  T2.1: Fixed Level Test
         function test_movement(testCase)
             testCase.press(testCase.App.Level1Button);
             pause(0.5);
             testCase.press(testCase.App.Button_6);
             pause(0.5);
             testCase.press(testCase.App.Button_6);%gy
             pause(0.5);
             testCase.press(testCase.App.LeftButton);
             pause(0.5);
             testCase.press(testCase.App.Button_8);
             pause(0.5);
             testCase.press(testCase.App.Button_8);%soldier2
             pause(0.5);
             testCase.press(testCase.App.LeftButton);
             pause(0.5);
             testCase.press(testCase.App.Button_9);
             pause(0.5);
             testCase.press(testCase.App.Button_9);%soldier3
             pause(0.5);
             testCase.press(testCase.App.UpButton);
             pause(0.5);
             testCase.press(testCase.App.Button_5);
             pause(0.5);
             testCase.press(testCase.App.Button_5);%mc
             pause(0.5);
             testCase.press(testCase.App.UpButton);
             pause(0.5);
             testCase.press(testCase.App.Button_4);%hz
             pause(0.5);
             testCase.press(testCase.App.Button_3);%zy
             pause(0.5);
             testCase.press(testCase.App.Button_2);%zf
             pause(0.5);
             testCase.press(testCase.App.Button_10);%soldier4
             pause(0.5);
             testCase.press(testCase.App.Button_10);
             pause(0.5);
             testCase.press(testCase.App.DownButton);
             pause(0.5);
             testCase.press(testCase.App.Button_7);%soldier1
             pause(0.5);
             testCase.press(testCase.App.Button_7);
             pause(0.5);
             testCase.press(testCase.App.DownButton);
             pause(0.5);
             testCase.press(testCase.App.Button);
             pause(0.5);
             testCase.addTeardown(@delete,testCase.App);
         end
        
        % T2: Integration Test -  T2.2:  Customized level Test
        function test_start_game(testCase)
            testCase.press(testCase.App.StartyourowngameButton);
            pause(0.5);
            testCase.press(testCase.App.Button_11);%cc
            pause(0.5);
            testCase.press(testCase.App.Button_11);%zf
            pause(0.5);
            testCase.press(testCase.App.Button_11);%zy
            pause(0.5);
            testCase.press(testCase.App.Button_11);%hz
            pause(0.5);
            testCase.press(testCase.App.Button_11);%mc
            pause(0.5);
            testCase.press(testCase.App.Button_11);%gy
            pause(0.5);
            testCase.press(testCase.App.Button_11);%soldier1
            pause(0.5);
            testCase.press(testCase.App.Button_11);%soldier2
            pause(0.5);
            testCase.press(testCase.App.Button_11);%soldier3
            pause(0.5);
            testCase.press(testCase.App.Button_11);%soldier4
            pause(0.5);
            
            
            testCase.press(testCase.App.PlayButton);
            pause(0.5);
            testCase.press(testCase.App.Button_10);
            pause(0.5);
            testCase.press(testCase.App.Button_10);
            pause(0.5);
            testCase.press(testCase.App.UpButton);
            pause(0.5);
            testCase.press(testCase.App.Button_9);
            pause(0.5);
            testCase.press(testCase.App.Button_9);
            pause(0.5);
            testCase.press(testCase.App.UpButton);
            pause(0.5);
            testCase.press(testCase.App.Button_8);
            pause(0.5);
            testCase.press(testCase.App.Button_8);
            pause(0.5);
            testCase.press(testCase.App.UpButton);
            pause(0.5);
            testCase.press(testCase.App.Button_4);
            pause(0.5);
            testCase.press(testCase.App.Button);
            pause(1);
            
            testCase.addTeardown(@delete,testCase.App);
        end
    end
    
    
end