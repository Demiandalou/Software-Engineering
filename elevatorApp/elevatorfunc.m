% floor1: app.Image.Position = [235 1 150 186];
% floor2: app.Image.Position = [235 198 150 186];
% floor3: app.Image.Position = [235 402 150 186];

% elevtor left: floor3:[191 321 150 186];floor2:[191 165 150 186] floor1:[191 10 150 186]
% elevtor right: floor3:[31 338 150 186];floor2:[31 182 150 186]; floor1:[31 27 150 186]
classdef elevatorfunc < handle
    properties
        app
        panell
        panelr
    end
    
    methods
        function movel(dummy,startpos,endpos)
%             dummy.app.requestl
            if dummy.panell.elevimgl.ImageSource == 'opened.jpg'
                dummy.panell.elevimgl.ImageSource = 'closed.jpg';
            end
            if abs(startpos-endpos)<300
                cut=10;
            else
                cut=20;
            end
            interval=(endpos-startpos)/cut;
            for i=1:cut
                pause(0.1);
                dummy.panell.elevimgl.Position = [191 startpos+interval*i 150 186];
                if abs(dummy.panell.elevimgl.Position(2)-198)<=20
                    atfloor2l(dummy);
                end
            end
        end
        function mover(dummy,startpos,endpos)
            if dummy.panelr.elevimgr.ImageSource == 'opened.jpg'
                dummy.panelr.elevimgr.ImageSource = 'closed.jpg';
            end
            if abs(startpos-endpos)<210
                cut=10;
            else
                cut=20;
            end
            interval=(endpos-startpos)/cut;
            for i=1:cut
                pause(0.1);
                dummy.panelr.elevimgr.Position = [31 startpos+interval*i 150 186];
                if abs(dummy.panelr.elevimgr.Position(2)-198)<=20
                    atfloor2r(dummy);
                end
            end
        end
        function moveboth(dummy,startposl,endposl,startposr,endposr)
            if dummy.panell.elevimgl.ImageSource == 'opened.jpg'
                dummy.panell.elevimgl.ImageSource = 'closed.jpg';
            end
            if dummy.panelr.elevimgr.ImageSource == 'opened.jpg'
                dummy.panelr.elevimgr.ImageSource = 'closed.jpg';
            end
            cut=10;
            intervall=(endposl-startposl)/cut;
            intervalr=(endposr-startposr)/cut;
            for i=1:cut
                dummy.panell.elevimgl.Position = [191 startposl+intervall*i 150 186];
                dummy.panelr.elevimgr.Position = [31 startposr+intervalr*i 150 186];
                pause(0.1);
            end
        end
        
        function atfloor1l(dummy)
            dummy.app.floor1imgl.ImageSource = '1.png';
            dummy.app.floor2imgl.ImageSource = '1.png';
            dummy.app.floor3imgl.ImageSource = '1.png';
            dummy.panell.insideimgl.ImageSource = '1.png';
        end
        function atfloor1r(dummy)
            dummy.app.floor1imgr.ImageSource = '1.png';
            dummy.app.floor2imgr.ImageSource = '1.png';
            dummy.app.floor3imgr.ImageSource = '1.png';
            dummy.panelr.insideimgr.ImageSource = '1.png';
        end
        function atfloor2l(dummy)
            dummy.app.floor1imgl.ImageSource = '2.png';
            dummy.app.floor2imgl.ImageSource = '2.png';
            dummy.app.floor3imgl.ImageSource = '2.png';
            dummy.panell.insideimgl.ImageSource = '2.png';
        end
        function atfloor2r(dummy)
            dummy.app.floor1imgr.ImageSource = '2.png';
            dummy.app.floor2imgr.ImageSource = '2.png';
            dummy.app.floor3imgr.ImageSource = '2.png';
            dummy.panelr.insideimgr.ImageSource = '2.png';
        end
        function atfloor3l(dummy)
            dummy.app.floor1imgl.ImageSource = '3.png';
            dummy.app.floor2imgl.ImageSource = '3.png';
            dummy.app.floor3imgl.ImageSource = '3.png';
            dummy.panell.insideimgl.ImageSource = '3.png';
        end
        function atfloor3r(dummy)
            dummy.app.floor1imgr.ImageSource = '3.png';
            dummy.app.floor2imgr.ImageSource = '3.png';
            dummy.app.floor3imgr.ImageSource = '3.png';
            dummy.panelr.insideimgr.ImageSource = '3.png';
        end
        function gotofloor1l(dummy)
            startpos=dummy.panell.elevimgl.Position(2);
            movel(dummy,startpos,10);
            atfloor1l(dummy);
            opendoorl(dummy);
            closedoorl(dummy);
        end
        function gotofloor1r(dummy)
            startpos=dummy.panelr.elevimgr.Position(2);
            mover(dummy,startpos,27);
            atfloor1r(dummy);
            opendoorr(dummy);
            closedoorr(dummy);
        end
        function gotofloor2l(dummy)
            startpos=dummy.panell.elevimgl.Position(2);
            movel(dummy,startpos,165);
            atfloor2l(dummy);
            opendoorl(dummy);
            closedoorl(dummy);
        end
        function gotofloor2r(dummy)
            startpos=dummy.panelr.elevimgr.Position(2);
            mover(dummy,startpos,182);
            atfloor2r(dummy);
            opendoorr(dummy);
            closedoorr(dummy);
        end
        function gotofloor3l(dummy)
            startpos=dummy.panell.elevimgl.Position(2);
            movel(dummy,startpos,321);
            atfloor3l(dummy);
            opendoorl(dummy);
            closedoorl(dummy);
        end
        function gotofloor3r(dummy)
            startpos=dummy.panelr.elevimgr.Position(2);
            mover(dummy,startpos,338);
            atfloor3r(dummy);
            opendoorr(dummy);
            closedoorr(dummy);
        end
        function opendoorl(dummy)
            pause(0.3);
            dummy.panell.elevimgl.ImageSource = 'opened.jpg';
        end
        function opendoorr(dummy)
            pause(0.3);
            dummy.panelr.elevimgr.ImageSource = 'opened.jpg';
        end
        function openoptionl(dummy)
            pause(0.3);
            dummy.panell.elevimgl.ImageSource = 'opened.jpg';
            pause(1);
            dummy.panell.elevimgl.ImageSource = 'closed.jpg';
        end
        function openoptionr(dummy)
            pause(0.3);
            dummy.panelr.elevimgr.ImageSource = 'opened.jpg';
            pause(1);
            dummy.panelr.elevimgr.ImageSource = 'closed.jpg';
        end
        function closedoorl(dummy)
            pause(0.3);
            dummy.panell.elevimgl.ImageSource = 'closed.jpg';
        end
        function closedoorr(dummy)
            pause(0.3);
            dummy.panelr.elevimgr.ImageSource = 'closed.jpg';
        end
        function runelevs(dummy)
%             finishonerun=1;
            while sum(dummy.app.request)+sum(dummy.app.requestl)+sum(dummy.app.requestr)~=0
                if (dummy.app.request(1)==1 || dummy.app.requestl(1)==1) & dummy.app.floor1imgl.ImageSource == '1.png'
                    opendoorl(dummy);
                    closedoorl(dummy);
                    dummy.app.request(1)=0;
                    dummy.app.requestl(1)=0;
                elseif (dummy.app.request(1)==1 || dummy.app.requestr(1)==1) & dummy.app.floor1imgr.ImageSource == '1.png'
                    opendoorr(dummy);
                    closedoorr(dummy);
                    dummy.app.request(1)=0;
                    dummy.app.requestr(1)=0;
                elseif (dummy.app.request(2)==1 || dummy.app.requestl(2)==1) & dummy.app.floor1imgl.ImageSource == '2.png'
                    opendoorl(dummy);
                    closedoorl(dummy);
                    dummy.app.request(2)=0;
                    dummy.app.requestl(2)=0;
                elseif (dummy.app.request(2)==1 || dummy.app.requestr(2)==1) & dummy.app.floor1imgr.ImageSource == '2.png'
                    opendoorr(dummy);
                    closedoorr(dummy);
                    dummy.app.request(2)=0;
                    dummy.app.requestr(2)=0;
                elseif (dummy.app.request(3)==1 || dummy.app.requestl(3)==1) & dummy.app.floor1imgl.ImageSource == '3.png'
                    opendoorl(dummy);
                    closedoorl(dummy);
                    dummy.app.request(3)=0;
                    dummy.app.requestl(3)=0;
                elseif (dummy.app.request(3)==1 || dummy.app.requestr(3)==1) & dummy.app.floor1imgr.ImageSource == '3.png'
                    opendoorr(dummy);
                    closedoorr(dummy);
                    dummy.app.request(3)=0;
                    dummy.app.requestr(3)=0;
%                 end
                %%%%%%%%%%%%%%%%%%%%%%%% only outside %%%%%%%%%%%%%%%%%%%%%%
                elseif sum(dummy.app.requestr)==0 & sum(dummy.app.requestl)==0 & sum(dummy.app.request)~=0
%                     dummy.app.floor1imgl.ImageSource
%                     dummy.app.request(1)
                    if dummy.app.floor1imgl.ImageSource == '1.png'
                        if dummy.app.request(2)==1
                            gotofloor2l(dummy);
                            dummy.app.request(2)=0;
                        elseif dummy.app.request(3)==1
                            gotofloor3l(dummy);
                            dummy.app.request(3)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '2.png'
                        if dummy.app.request(1)==1
                            gotofloor1l(dummy);
                            dummy.app.request(1)=0;
                        elseif dummy.app.request(3)==1
                            gotofloor3l(dummy);
                            dummy.app.request(3)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '3.png'
                        if dummy.app.request(2)==1
                            gotofloor2l(dummy);
                            dummy.app.request(2)=0;
                        elseif dummy.app.request(1)==1
                            gotofloor1l(dummy);
                            dummy.app.request(1)=0;
                        end
                    end
                %%%%%%%%%%%%%%%%%%%%%%%% only left %%%%%%%%%%%%%%%%%%%%%%
                elseif sum(dummy.app.requestr)==0 & sum(dummy.app.requestl)~=0
                    if dummy.app.floor1imgl.ImageSource == '1.png'
                        if dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            gotofloor2l(dummy);
                            dummy.app.requestl(2)=0;
                            dummy.app.request(2)=0;
                        elseif dummy.app.requestl(3)==1 || dummy.app.request(3)==1
                            dummy.app.requestl(3)=0;
                            dummy.app.request(3)=0;
%                             line=249
                            gotofloor3l(dummy);
%                             line=254
                            dummy.app.requestl(3)=0;
                            dummy.app.request(3)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '2.png'
                        if dummy.app.requestl(1)==1 || dummy.app.request(1)==1
                            gotofloor1l(dummy);
                            dummy.app.requestl(1)=0;
                            dummy.app.request(1)=0;
                        elseif dummy.app.requestl(3)==1 || dummy.app.request(3)==1
                            gotofloor3l(dummy);
                            dummy.app.requestl(3)=0;
                            dummy.app.request(3)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '3.png'
                        if dummy.app.request(2)==1 || dummy.app.requestl(2)==1
                            gotofloor2l(dummy);
                            dummy.app.requestl(2)=0;
                            dummy.app.request(2)=0;
                        elseif dummy.app.request(1)==1 || dummy.app.requestl(1)==1
                            gotofloor1l(dummy);
                            dummy.app.requestl(1)=0;
                            dummy.app.request(1)=0;
                        end
                    end
                %%%%%%%%%%%%%%%%%%%%%%%% only right %%%%%%%%%%%%%%%%%%%%%%
                elseif sum(dummy.app.requestl)==0  & sum(dummy.app.requestr)~=0
                    if dummy.app.floor1imgr.ImageSource == '1.png'
                        if dummy.app.requestr(2)==1 || dummy.app.request(2)==1
                            gotofloor2r(dummy);
                            dummy.app.requestr(2)=0;
                            dummy.app.request(2)=0;
                        elseif dummy.app.requestr(3)==1 || dummy.app.request(3)==1
                            gotofloor3r(dummy);
                            dummy.app.requestr(3)=0;
                            dummy.app.request(3)=0;
                        end
                    elseif dummy.app.floor1imgr.ImageSource == '2.png'
                        if dummy.app.requestr(1)==1 || dummy.app.request(1)==1
                            gotofloor1r(dummy);
                            dummy.app.requestr(1)=0;
                            dummy.app.request(1)=0;
                        elseif dummy.app.requestr(3)==1 || dummy.app.request(3)==1
                            gotofloor3r(dummy);
                            dummy.app.requestr(3)=0;
                            dummy.app.request(3)=0;
                        end
                    elseif dummy.app.floor1imgr.ImageSource == '3.png'
                        if dummy.app.request(2)==1 || dummy.app.requestr(2)==1
                            gotofloor2r(dummy);
                            dummy.app.requestr(2)=0;
                            dummy.app.request(2)=0;
                        elseif dummy.app.request(1)==1 || dummy.app.requestr(1)==1
                            gotofloor1r(dummy);
                            dummy.app.requestr(1)=0;
                            dummy.app.request(1)=0;
                        end
                    end
                else
                    %%%%%%%%%%%%%%%%%%%%%%%% both %%%%%%%%%%%%%%%%%%%%%%
                    % elevtor left: floor3:[191 321 150 186];floor2:[191 165 150 186] floor1:[191 10 150 186]
                    % elevtor right: floor3:[31 338 150 186];floor2:[31 182 150 186]; floor1:[31 27 150 186]
                    %%%%%%%%%% both up %%%%%%%%%%%%%%
                    if dummy.app.floor1imgl.ImageSource == '1.png' & dummy.app.floor1imgr.ImageSource == '1.png' & (dummy.app.requestr(2)==1 || dummy.app.requestr(3)==1) &(dummy.app.requestl(2)==1 || dummy.app.request(2)==1 || dummy.app.requestl(3)==1 || dummy.app.request(3)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),165,dummy.panelr.elevimgr.Position(2),182); %1->2
                        atfloor2l(dummy); 
                        if dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            opendoorl(dummy);closedoorl(dummy);
                            dummy.app.requestl(2)=0;dummy.app.request(2)=0;
                        end
                        atfloor2r(dummy); 
                        if dummy.app.requestr(2)==1
                            opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(2)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '2.png' & dummy.app.floor1imgr.ImageSource == '2.png' & dummy.app.requestr(3)==1 & (dummy.app.requestl(3)==1 || dummy.app.request(3)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),321,dummy.panelr.elevimgr.Position(2),338); %2->3
                        atfloor3l(dummy); opendoorl(dummy);closedoorl(dummy);dummy.app.requestl(3)=0;dummy.app.request(3)=0;
                        atfloor3r(dummy); opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(3)=0;
                    elseif dummy.app.floor1imgl.ImageSource == '1.png' & dummy.app.floor1imgr.ImageSource == '2.png' & dummy.app.requestr(3)==1 &(dummy.app.requestl(2)==1 || dummy.app.request(2)==1 || dummy.app.requestl(3)==1 || dummy.app.request(3)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),165,dummy.panelr.elevimgr.Position(2),338); %1->2; 2->3
                        atfloor2l(dummy); 
                        if dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            opendoorl(dummy);closedoorl(dummy);
                            dummy.app.requestl(2)=0;dummy.app.request(2)=0;
                        end
                        atfloor3r(dummy); opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(3)=0;
                    elseif dummy.app.floor1imgl.ImageSource == '2.png' & dummy.app.floor1imgr.ImageSource == '1.png' & (dummy.app.requestr(2)==1 || dummy.app.requestr(3)==1) &(dummy.app.requestl(3)==1 || dummy.app.request(3)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),321,dummy.panelr.elevimgr.Position(2),182); %2->3; 1->2
                        atfloor3l(dummy); opendoorl(dummy);closedoorl(dummy);dummy.app.requestl(3)=0;dummy.app.request(3)=0;
                        atfloor2r(dummy); 
                        if dummy.app.requestr(2)==1
                            opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(2)=0;
                        end
                    %%%%%%%%%% both down %%%%%%%%%%%%%%
                    elseif dummy.app.floor1imgl.ImageSource == '3.png' & dummy.app.floor1imgr.ImageSource == '3.png' & (dummy.app.requestr(2)==1 || dummy.app.requestr(1)==1) &(dummy.app.requestl(2)==1 || dummy.app.request(2)==1 || dummy.app.requestl(1)==1 || dummy.app.request(1)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),165,dummy.panelr.elevimgr.Position(2),182); %3->2
                        atfloor2l(dummy);
                        if dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            opendoorl(dummy);closedoorl(dummy);
                            dummy.app.requestl(2)=0;dummy.app.request(2)=0;
                        end
                        atfloor2r(dummy);
                        if dummy.app.requestr(2)==1
                            opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(2)=0;
                        end
                        dummy.app.floor1imgl.ImageSource
                    elseif dummy.app.floor1imgl.ImageSource == '2.png' & dummy.app.floor1imgr.ImageSource == '3.png' & (dummy.app.requestr(2)==1 || dummy.app.requestr(1)==1) &(dummy.app.requestl(1)==1 || dummy.app.request(1)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),10,dummy.panelr.elevimgr.Position(2),182); %2->1; 3->2
                        atfloor1l(dummy); opendoorl(dummy);closedoorl(dummy);dummy.app.requestl(1)=0;dummy.app.request(1)=0;
                        atfloor2r(dummy); 
                        if dummy.app.requestr(2)==1
                            opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(2)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '3.png' & dummy.app.floor1imgr.ImageSource == '2.png' & dummy.app.requestr(1)==1 & (dummy.app.requestl(2)==1 || dummy.app.request(2)==1 || dummy.app.requestl(1)==1 || dummy.app.request(1)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),165,dummy.panelr.elevimgr.Position(2),27); %3->2;  2->1
                        atfloor2l(dummy); 
                        if  dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            opendoorl(dummy);closedoorl(dummy);
                            dummy.app.requestl(2)=0;dummy.app.request(2)=0;
                        end
                        atfloor1r(dummy); opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(1)=0;
                    elseif dummy.app.floor1imgl.ImageSource == '2.png' & dummy.app.floor1imgr.ImageSource == '2.png' & dummy.app.requestr(1)==1 & (dummy.app.requestl(1)==1 || dummy.app.request(1)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),10,dummy.panelr.elevimgr.Position(2),27); %2->1
                        atfloor1l(dummy); opendoorl(dummy);closedoorl(dummy);dummy.app.requestl(1)=0;dummy.app.request(1)=0;
                        atfloor1r(dummy); opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(1)=0;
                    %%%%%%%%%% left up right down %%%%%%%%%%%%%%
                    elseif dummy.app.floor1imgl.ImageSource == '1.png' & dummy.app.floor1imgr.ImageSource == '3.png' & (dummy.app.requestr(2)==1 || dummy.app.requestr(1)==1) &(dummy.app.requestl(2)==1 || dummy.app.request(2)==1 || dummy.app.requestl(3)==1 || dummy.app.request(3)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),165,dummy.panelr.elevimgr.Position(2),182); %1->2; 3->2
                        atfloor2l(dummy); 
                        if dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            opendoorl(dummy);closedoorl(dummy);
                            dummy.app.requestl(2)=0;dummy.app.request(2)=0;
                        end
                        atfloor2r(dummy); 
                        if dummy.app.requestr(2)==1
                            opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(2)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '1.png' & dummy.app.floor1imgr.ImageSource == '2.png' & dummy.app.requestr(1)==1 &(dummy.app.requestl(2)==1 || dummy.app.request(2)==1 || dummy.app.requestl(3)==1 || dummy.app.request(3)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),165,dummy.panelr.elevimgr.Position(2),27); %1->2; 2->1
                        atfloor2l(dummy); 
                        if dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            opendoorl(dummy);closedoorl(dummy);
                            dummy.app.requestl(2)=0;dummy.app.request(2)=0;
                        end
                        atfloor1r(dummy); opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(1)=0;
                    elseif dummy.app.floor1imgl.ImageSource == '2.png' & dummy.app.floor1imgr.ImageSource == '3.png' & (dummy.app.requestr(2)==1 || dummy.app.requestr(1)==1) &(dummy.app.requestl(3)==1 || dummy.app.request(3)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),321,dummy.panelr.elevimgr.Position(2),182); %2->3; 3->2
                        atfloor3l(dummy); opendoorl(dummy);closedoorl(dummy);dummy.app.requestl(3)=0;dummy.app.request(3)=0;
                        atfloor2r(dummy); 
                        if dummy.app.requestr(2)==1
                            opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(2)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '2.png' & dummy.app.floor1imgr.ImageSource == '2.png' & (dummy.app.requestr(1)==1) &(dummy.app.requestl(3)==1 || dummy.app.request(3)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),321,dummy.panelr.elevimgr.Position(2),27); %2->3; 2->1
                        atfloor3l(dummy); opendoorl(dummy);closedoorl(dummy);dummy.app.requestl(3)=0;dummy.app.request(3)=0;
                        atfloor1r(dummy); opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(1)=0;
                    %%%%%%%%%% left down right up %%%%%%%%%%%%%%
                    elseif dummy.app.floor1imgl.ImageSource == '2.png' & dummy.app.floor1imgr.ImageSource == '1.png' & (dummy.app.requestr(2)==1 || dummy.app.requestr(3)==1) & (dummy.app.requestl(1)==1 || dummy.app.request(1)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),10,dummy.panelr.elevimgr.Position(2),182); %2->1;1->2
                        atfloor1l(dummy); opendoorl(dummy);closedoorl(dummy);dummy.app.requestl(1)=0;dummy.app.request(1)=0;
                        atfloor2r(dummy); 
                        if dummy.app.requestr(2)==1
                            opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(2)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '3.png' & dummy.app.floor1imgr.ImageSource == '1.png' & (dummy.app.requestr(2)==1 || dummy.app.requestr(3)==1) & (dummy.app.requestl(1)==1 || dummy.app.request(1)==1 || dummy.app.requestl(2)==1 || dummy.app.request(2)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),165,dummy.panelr.elevimgr.Position(2),182); %3->2;1->2
                        atfloor2l(dummy); 
                        if dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            opendoorl(dummy);closedoorl(dummy);
                            dummy.app.requestl(2)=0;dummy.app.request(2)=0;
                        end
                        atfloor2r(dummy); 
                        if dummy.app.requestr(2)==1
                            opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(2)=0;
                        end
                    elseif dummy.app.floor1imgl.ImageSource == '2.png' & dummy.app.floor1imgr.ImageSource == '2.png' & dummy.app.requestr(3)==1 & (dummy.app.requestl(1)==1 || dummy.app.requestr(1)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),10,dummy.panelr.elevimgr.Position(2),338); %2-1;2-3
                        atfloor1l(dummy); opendoorl(dummy);closedoorl(dummy);dummy.app.requestl(1)=0;dummy.app.request(1)=0;
                        atfloor3r(dummy); opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(3)=0;
                    elseif dummy.app.floor1imgl.ImageSource == '3.png' & dummy.app.floor1imgr.ImageSource == '2.png' & dummy.app.requestr(3)==1 & (dummy.app.requestl(2)==1 || dummy.app.requestr(2)==1 || dummy.app.requestl(1)==1 || dummy.app.requestr(1)==1)
                        moveboth(dummy,dummy.panell.elevimgl.Position(2),165,dummy.panelr.elevimgr.Position(2),338); %3->2;2-3
                        atfloor2l(dummy); 
                        if dummy.app.requestl(2)==1 || dummy.app.request(2)==1
                            opendoorl(dummy);closedoorl(dummy);
                            dummy.app.requestl(2)=0;dummy.app.request(2)=0;
                        end
                        atfloor3r(dummy); opendoorr(dummy);closedoorr(dummy);dummy.app.requestr(3)=0;
                    end %end of both move
                    
                    
                end
%                 line=449
%                 finishonerun=1;
            end
            dummy.app.flagrunning=0;
        end
        
 
    end  
end