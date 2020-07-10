classdef test_unit < matlab.uitest.TestCase
    properties
        App
    end
    
    methods (TestMethodSetup)
        function launchApp(testCase)
            
            testCase.App = Elevator;
        end
    end
    methods (Test)
        %test1.1
        function test_OutsideButton(testCase)
            % State: left elevator: 1 -> 2 -> 3 -> 2 ->(right 1-> 2)-> 1 -> 3 -> 1
            % Input: floor 2 press up, floor 3 press down, floor 2 press
            % down, right elevator press 2, floor 1 press up, floor 3 press down, floor 1 press up.
            % Expected Output: left elevator: 1 -> 2 -> 3 -> 2 ->(right 1-> 2)-> 1 -> 3 -> 1
         
            testCase.App.testflag = 1;
            testCase.press(testCase.App.floor2up);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
                        
            testCase.press(testCase.App.floor3down);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            
            testCase.press(testCase.App.floor2down);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            
            %move the right left to make the left elevator cover all the
            %outside buttton part branch.
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            
            testCase.press(testCase.App.floor1up);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            
            testCase.press(testCase.App.floor3down);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            
            testCase.press(testCase.App.floor1up);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
        end
        
        %test1.2
        function test_LeftOnly(testCase)
            % State: left: 1 -> 2 -> 3 -> 2 -> 2 -> 1 -> 3 -> 3 -> 1 -> 1
            % Input: press left elevator inside button: 2,3,2,1,3,1
            % Expected Output: left: 1 -> 2 -> 3 -> 2 -> 2 -> 1 -> 3 -> 3 -> 1 -> 1
         
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
           
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
           
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
        end
        
        %test1.3
        function test_RightOnly(testCase)
            % State: right elevator: 1 -> 2 -> 3 -> 2 -> 2 -> 1 -> 3 -> 3 -> 1 -> 1
            % Input: press right elevator inside button: 2,3,2,1,3,1
            % Expected Output: right elevator: 1 -> 2 -> 3 -> 2 -> 2 -> 1 -> 3 -> 3 -> 1 -> 1
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
           
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
    
        end 
        
        %test1.4
        function test_OpenButton(testCase)
            % State: left:close -> open -> close, right: close -> open ->
            % close
            % Input: left elevator press inside button open and close, right
            % elevator press inside button open and close.
            % Expected Output: left: close -> open -> close, right: close -> open ->
            % close
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panell.OpenButtonl);
            %testCase.verifyEqual(testCase.App.dummy.panell.elevimgl.ImageSource , 'opened.jpg');
            testCase.press(testCase.App.dummy.panell.CloseButtonl);
            testCase.verifyEqual(testCase.App.dummy.panell.elevimgl.ImageSource , 'closed.jpg');
            
            
            testCase.press(testCase.App.dummy.panelr.OpenButtonr);
            testCase.press(testCase.App.dummy.panelr.CloseButtonr);
            testCase.verifyEqual(testCase.App.dummy.panelr.elevimgr.ImageSource , 'closed.jpg');
            
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
        end 
    end
end