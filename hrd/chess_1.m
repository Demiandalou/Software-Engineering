% caocao
classdef chess_1 <chess
    %CHESS_1 此处显示有关此类的摘要
    %   此处显示详细说明
    properties
    end
    methods
         function move_1(chess_1,pos,value,x,y)
              chess_1.Button.Position(1,pos)=chess_1.Button.Position(1,pos)+value;
              chess_1.Sys.empty_block=[x,y];
              chess_1.Sys.step=chess_1.Sys.step+1;
              chess_1.Sys.UI.Label.Text=num2str(chess_1.Sys.step);
         end
         function button_movement(chess_1)
            [num,q]=update_prop(chess_1.Sys,chess_1,1);
            up=[num+2,num+7];
            down=[num-1,num+4];
            left=[num-5,num-4];
            right=[num+10,num+11];
            if (q==1)
                down=[-99,-99];
            end
            if (q==4)
                up=[-99,-99];
            end
            if ismember(left(1,1),chess_1.Sys.empty_block)==1 && ismember(left(1,2),chess_1.Sys.empty_block)==1
                   move_1(chess_1,1,-60,num+5,num+6)
                    return ;
            end
            if ismember(right(1,1),chess_1.Sys.empty_block)==1 && ismember(right(1,2),chess_1.Sys.empty_block)==1
                    move_1(chess_1,1,60,num,num+1)
                    return ;
            end
            if ismember(up(1,1),chess_1.Sys.empty_block)==1 && ismember(up(1,2),chess_1.Sys.empty_block)==1
                move_1(chess_1,2,60,num,num+5)
                return;
            end
            if ismember(down(1,1),chess_1.Sys.empty_block)==1 && ismember(down(1,2),chess_1.Sys.empty_block)==1
                move_1(chess_1,2,-60,num+1,num+6)
                return;
            end
         end
         function Before_set1(chess_1)
              leftDown=[1,2,3,4,7,8,9,11,12,13,14];
              [~,n]=size(leftDown);
              for j=1:n
                  k=fix(leftDown(1,j)/5);
                  q=mod(leftDown(1,j),5);
                  chess_1.Sys.posButton{1,j}.Position(1,1)=k*60+47.5;
                  chess_1.Sys.posButton{1,j}.Position(1,2)=(q-1)*60+47.5;
                  chess_1.Sys.posButton{1,j}.Visible="on";
              end     
        end
    end
end

