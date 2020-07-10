classdef test_integration < matlab.uitest.TestCase
    properties
        App
    end
    
    methods (TestMethodSetup)
        function launchApp(testCase)
           testCase.App = Elevator;
        end
    end
    methods (Test)
        %test3.1
        % State: left,right: 1,1 -> 1,2 -> 1,3 -> 2,3 ->(left door open->close) -> 1,3
        % Input: right elevator inside button: 2,3; left elevator inside
        % button 2, open, close; outside button: 1
        % Expected Output: left,right: 1,1 -> 1,2 -> 1,3 -> 2,3 ->(left door open->close) -> 1,3
        function test(testCase)
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            
            testCase.press(testCase.App.dummy.panell.OpenButtonl);
            testCase.press(testCase.App.dummy.panell.CloseButtonl);
            testCase.verifyEqual(testCase.App.dummy.panell.elevimgl.ImageSource , 'closed.jpg');
            
            testCase.press(testCase.App.floor1up);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
        end
    end
end