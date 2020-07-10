classdef panellfunc < handle
    properties
        app
    end
    methods
        function openoptionl(panelldummy)
            pause(0.3);
            panelldummy.app.elevimgl.ImageSource = 'opened.jpg';
            pause(1);
            panelldummy.app.elevimgl.ImageSource = 'closed.jpg';
        end

    end
    
end