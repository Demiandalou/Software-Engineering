classdef panell < handle
    properties
        app
    end
    methods
        function openoptionl(dummy)
            pause(0.3);
            dummy.app.elevimgl.ImageSource = 'opened.jpg';
            pause(1);
            dummy.app.elevimgl.ImageSource = 'closed.jpg';
        end
    end
    
end