classdef test_bothrunning < matlab.uitest.TestCase
    properties
        App
    end
    
    methods (TestMethodSetup)
        function launchApp(testCase)
           testCase.App = Elevator;
        end
    end
    methods (Test)
        %test2.1
        function test_upup(testCase)
            % State: left,right: 1,1 -> 2,2 -> 3,3 -> 1,2 -> 3,3 -> 2,1 ->
            % 3,3
            % Input: left,right elevator inside button press: 2,2; 3,3;
            % 1,2; 3,3; 2,1; 3,3
            % Expected Output: left,right: 1,1 -> 2,2 -> 3,3 -> 1,2 -> 2,3 -> 2,1 ->
            % 3,2
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            
            
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            
            
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
        end
        
        %test2.2
        function test_downdown(testCase)
            % State: left,right: 1,1 -> 3,3 -> 2,2 -> 1,1 -> 2,3 -> 1,2 ->
            % 3,2 -> 2,1
            % Input: left,right elevator inside button press: 3,3; 2,2; 1,1; 
            % 2,3; 1,2; 3,2; 2,1.
            % Expected Output:  left,right: 1,1 -> 3,3 -> 2,2 -> 1,1 -> 2,3 -> 1,2 ->
            % 3,2 -> 2,1
            
            
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            
            
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            
            
            
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
        end 
        
        %test2.3
        function test_updown(testCase)
            % State: left,right: 1,1 -> 1,3 -> 2,2 -> 3,1 -> 1,2 -> 2,1 ->
            % 2,3 -> 3,2
            % Input: left,right elevator inside button press: 1,1; 1,3;
            % 2,2; 3,1; 1,2; 2,1; 2,3; 3,2
            % Expected Output: left,right: 1,1 -> 1,3 -> 2,2 -> 3,1 -> 1,2 -> 2,1 ->
            % 2,3 -> 3,2
         
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            
            
            
            
            
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            
            
            
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
    
        end 
        
        
        %test2.4
        function test_downup(testCase)
            % State: right,left: 1,1 -> 1,3 -> 2,2 -> 3,1 -> 1,2 -> 2,1 ->
            % 2,3 -> 3,2
            % Input: right,left elevator inside button press: 1,1; 1,3;
            % 2,2; 3,1; 1,2; 2,1; 2,3; 3,2
            % Expected Output: right,left: 1,1 -> 1,3 -> 2,2 -> 3,1 -> 1,2 -> 2,1 ->
            % 2,3 -> 3,2
         
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            

            
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.press(testCase.App.dummy.panelr.inside1r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'1.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside1l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'1.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            
            
            
            testCase.press(testCase.App.dummy.panell.inside3l);
            testCase.press(testCase.App.dummy.panelr.inside2r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'3.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'2.png');
            testCase.App.testflag = 0;
            testCase.press(testCase.App.dummy.panell.inside2l);
            testCase.App.testflag = 1;
            testCase.press(testCase.App.dummy.panelr.inside3r);
            testCase.verifyEqual(testCase.App.floor1imgl.ImageSource,'2.png');
            testCase.verifyEqual(testCase.App.floor1imgr.ImageSource,'3.png');
            
            testCase.addTeardown(@delete,testCase.App.dummy.panell);
            testCase.addTeardown(@delete,testCase.App.dummy.panelr);
            testCase.addTeardown(@delete,testCase.App);
    
        end 
        
    end
end