classdef controlSys <handle
    %CONTROLSYS 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties(Access=public)
        UI
        empty_block% Description
        current_chess % Description
        current_block
        type
        
        step=0 % Description
        mode=0 % Description
        pos={} % Description
        have=[]
        Block_type
        Block % Description
        posButton={} % Description
        chessList={}
        b2
        b4
    end
    
    methods (Access=public)
        %start the whole system with the function to calculate the position
        %of blank grid.
        function start_UI(constrolSys)
            constrolSys.cal_blank();
        end
        
         % initialize one chessMan
         function [result]=init_chess(controlSys,type,button,name,size)
            chess=type;
            chess.Button=button;
            chess.name=name;
            chess.size=size;
            chess.Sys=controlSys;
            controlSys.chessList={controlSys.chessList,chess};
            result=chess;
         end
         
        %initialize all chessMan at begin
        function init_Allchess(controlSys)
            controlSys.UI.chess1=init_chess(controlSys,chess_1,controlSys.UI.Button,"Caocao",4);
            controlSys.UI.chess2_1=init_chess(controlSys,chess_2,controlSys.UI.Button_2,"ZhaoYun",2);
            controlSys.UI.chess2_2=init_chess(controlSys,chess_2,controlSys.UI.Button_3,"Zhangfei",2);
            controlSys.UI.chess2_3=init_chess(controlSys,chess_2,controlSys.UI.Button_4,"Huangzhong",2);
            controlSys.UI.chess2_4=init_chess(controlSys,chess_2,controlSys.UI.Button_5,"Machao",2);
            controlSys.UI.chess3=init_chess(controlSys,chess_3,controlSys.UI.Button_6,"GuanYu",2);
            controlSys.UI.chess4_1=init_chess(controlSys,chess_4,controlSys.UI.Button_7,"Zu1",1);
            controlSys.UI.chess4_2=init_chess(controlSys,chess_4,controlSys.UI.Button_8,"Zu2",1);
            controlSys.UI.chess4_3=init_chess(controlSys,chess_4,controlSys.UI.Button_9,"Zu3",1);
            controlSys.UI.chess4_4=init_chess(controlSys,chess_4,controlSys.UI.Button_10,"Zu4",1);
        end
        
        %the function of calculating the position of the blank space. 
        function cal_blank(controlSys)
            init_Allchess(controlSys);
            alpha=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
            controlSys.b2={controlSys.UI.Button_2,controlSys.UI.Button_3,controlSys.UI.Button_4,controlSys.UI.Button_5};
            controlSys.b4={controlSys.UI.Button_7,controlSys.UI.Button_10,controlSys.UI.Button_8,controlSys.UI.Button_9};
            
            %for chess_2, calculate the number of it in grid->change the
            %position information into the number from 1 to 20
            for i=1:4
                item=controlSys.b2{i};
                point1=[item.Position(1,1)+30,item.Position(1,2)+90];
                point2=[item.Position(1,1)+30,item.Position(1,2)+30];
                k=round((point1(1,1)-30)/60);
                q=round((point1(1,2)-30)/60);
                q=q+1;
                alpha(alpha==k*5+q)=[];
                k=round((point2(1,1)-30)/60);
                q=round((point2(1,2)-30)/60);
                q=q+1;
                alpha(alpha==k*5+q)=[];
            end
            
            %for chess_4, calculate the number of it in grid->change the
            %position information into the number from 1 to 20
            for i=1:4
                item=controlSys.b4{i};
                point1=[item.Position(1,1)+30,item.Position(1,2)+30];
                k=round((point1(1,1)-30)/60);
                q=round((point1(1,2)-30)/60);
                q=q+1;
                alpha(alpha==k*5+q)=[];
            end
            point1=[controlSys.UI.Button_6.Position(1,1)+30,controlSys.UI.Button_6.Position(1,2)+30];
            point2=[controlSys.UI.Button_6.Position(1,1)+90,controlSys.UI.Button_6.Position(1,2)+30];
            k=round((point1(1,1)-30)/60);
            q=round((point1(1,2)-30)/60);
            q=q+1;
            alpha(alpha==k*5+q)=[];
            k=round((point2(1,1)-30)/60);
            q=round((point2(1,2)-30)/60);
            q=q+1;
            alpha(alpha==k*5+q)=[];
            point1=[controlSys.UI.Button.Position(1,1)+30,controlSys.UI.Button.Position(1,2)+30];
            point2=[controlSys.UI.Button.Position(1,1)+90,controlSys.UI.Button.Position(1,2)+90];
            point3=[controlSys.UI.Button.Position(1,1)+30,controlSys.UI.Button.Position(1,2)+90];
            point4=[controlSys.UI.Button.Position(1,1)+90,controlSys.UI.Button.Position(1,2)+30];
            points={point1,point2,point3,point4};
            for i=1:4
                k=round((points{i}(1,1)-30)/60);
                q=round((points{i}(1,2)-30)/60);
                q=q+1;
                alpha(alpha==k*5+q)=[];
            end
            controlSys.empty_block=alpha;
        end
        
        function [output,q]= update_prop(controlSys,C,type)
            controlSys.type=type;
            controlSys.current_chess=C;
            k=round((C.Button.Position(1,1)-30)/60);
            q=round((C.Button.Position(1,2)-30)/60);
            q=q+1;
            num=k*5+q;
            controlSys.current_block=num;
            output=num;
        end
        function directionControl(controlSys,d)
            
            if d==1
                controlSys.current_chess.Button.Position(1,2)= controlSys.current_chess.Button.Position(1,2)+60;
                controlSys.updateEmptyBlock(controlSys.type,1);
            end
            if d==2
                controlSys.current_chess.Button.Position(1,2)= controlSys.current_chess.Button.Position(1,2)-60;
                controlSys.updateEmptyBlock(controlSys.type,2);
            end
            if d==3
                controlSys.current_chess.Button.Position(1,1)= controlSys.current_chess.Button.Position(1,1)-60;
                controlSys.updateEmptyBlock(controlSys.type,3);
            end
            if d==4
                controlSys.current_chess.Button.Position(1,1)= controlSys.current_chess.Button.Position(1,1)+60;
                controlSys.updateEmptyBlock(controlSys.type,4);
            end
            controlSys.UI.closeVisible();
            controlSys.step=controlSys.step+1;
            controlSys.UI.Label.Text=num2str(controlSys.step);
        end
        
        
        function updateEmptyBlock(controlSys,type,direction)
            if (type==4)
                switch direction
                    case 1
                        controlSys.empty_block(controlSys.empty_block==controlSys.current_block+1)=controlSys.current_block;
                    case 2
                        controlSys.empty_block(controlSys.empty_block==controlSys.current_block-1)=controlSys.current_block;
                    case 3
                        controlSys.empty_block(controlSys.empty_block==controlSys.current_block-5)=controlSys.current_block;
                    case 4
                        controlSys.empty_block(controlSys.empty_block==controlSys.current_block+5)=controlSys.current_block;
                end
            
            end
            if (type==2)
                switch direction
                    case 1
                        controlSys.empty_block(controlSys.empty_block==controlSys.current_block+2)=controlSys.current_block;
                    case 2
                        controlSys.empty_block(controlSys.empty_block==controlSys.current_block-1)=controlSys.current_block+1;
                end
            end
            if (type==3)
                switch direction
                    case 3
                        controlSys.empty_block(controlSys.empty_block==controlSys.current_block-5)=controlSys.current_block+5;
                    case 4
                        controlSys.empty_block(controlSys.empty_block==controlSys.current_block+10)=controlSys.current_block;
                end
            end
            
        end 
         
        function resize_block(controlSys,cur,Button,x,y)
            if cur==Button
                Button.Position(1,3)=x;
                Button.Position(1,4)=y;
            end
        end
        function choosePos(controlSys)
            
            cur=controlSys.pos{1,1};
            controlSys.resize_block(cur,controlSys.UI.Button_3,60,120)
            controlSys.resize_block(cur,controlSys.UI.Button_5,60,120)
            controlSys.resize_block(cur,controlSys.UI.Button_2,60,120)
            controlSys.resize_block(cur,controlSys.UI.Button_4,60,120)
            controlSys.resize_block(cur,controlSys.UI.Button_6,120,60)
            
            if (cur.Position(1,3)==120) && (cur.Position(1,4)==120)
               controlSys.Block_type=1; 
            end
            if (cur.Position(1,3)==60) && (cur.Position(1,4)==60)
               controlSys.Block_type=4;
            end
            if (cur.Position(1,3)==60) && (cur.Position(1,4)==120)
                controlSys.Block_type=2;
            end
            if (cur.Position(1,3)==120) && (cur.Position(1,4)==60)
                controlSys.Block_type=3;
            end
            controlSys.Block=cur;
            cur.Position(1,1)=300;
            cur.Position(1,2)=120;
            if (cur==controlSys.UI.Button_11)
                controlSys.UI.PlayButton.Visible="on";
                return ;
            end
            if controlSys.Block_type==1
               controlSys.Block.Visible="on";
               controlSys.UI.chess1.Before_set1();
            end
            if controlSys.Block_type==2
                controlSys.Block.Visible="on";
                controlSys.UI.chess2_1.Before_set2();
            end
            if controlSys.Block_type==3
                controlSys.Block.Visible="on";
                controlSys.UI.chess3.Before_set3();
            end
            if controlSys.Block_type==4
               controlSys.Block.Visible="on";
               controlSys.Block.Position(1,3)=60;
               controlSys.Block.Position(1,4)=60;
               controlSys.UI.chess4_1.Before_set4();
            end
            
           
        end
        function butPos(controlSys,butt)
            x1=butt.Position(1,1);
            y1=butt.Position(1,2);
            if controlSys.Block_type==1
                k=(x1-47.5)/60;
                q=(y1-47.5)/60+1;
                moveBlock(controlSys,(x1-47.5)+1,(y1-47.5)+1);
                controlSys.have=[k*5+q,controlSys.have];
                controlSys.have=[k*5+q+1,controlSys.have];
                controlSys.have=[k*5+q+5,controlSys.have];
                controlSys.have=[k*5+q+6,controlSys.have];
             end
             if controlSys.Block_type==2
                 k=(x1-17.5)/60;
                 q=(y1-47.5)/60+1;
                 moveBlock(controlSys,k*60+1,(q-1)*60+1);
                 controlSys.have=[k*5+q,controlSys.have];
                 controlSys.have=[k*5+q+1,controlSys.have];
             end
             if controlSys.Block_type==3
                 k=(x1-47.5)/60;
                 q=(y1-17.5)/60+1;
                 moveBlock(controlSys,k*60+1,(q-1)*60+1);
                 controlSys.have=[k*5+q,controlSys.have];
                 controlSys.have=[k*5+q+5,controlSys.have];
             end
             if controlSys.Block_type==4
                 k=(x1-17.5)/60;
                 q=(y1-17.5)/60+1;
                 moveBlock(controlSys,k*60+1,(q-1)*60+1);
                 controlSys.have=[k*5+q,controlSys.have];
             end
             controlSys.choosePos();
        end
        function moveBlock(controlSys,x,y)
            controlSys.Block.Position(1,1)=x;
            controlSys.Block.Position(1,2)=y;
            controlSys.pos{1,1}=[];
            controlSys.pos=controlSys.pos(1,2:end);
            closePosition(controlSys);
        end
         function closePosition(controlSys)
            controlSys.UI.Button_11.Visible="off";
            controlSys.UI.Button_12.Visible="off";
            controlSys.UI.Button_13.Visible="off";
            controlSys.UI.Button_14.Visible="off";
            controlSys.UI.Button_15.Visible="off";
            controlSys.UI.Button_16.Visible="off";
            controlSys.UI.Button_17.Visible="off";
            controlSys.UI.Button_18.Visible="off";
            controlSys.UI.Button_19.Visible="off";
            controlSys.UI.Button_20.Visible="off";
            controlSys.UI.Button_21.Visible="off";
            controlSys.UI.Button_22.Visible="off";
        end
    end
        
end

