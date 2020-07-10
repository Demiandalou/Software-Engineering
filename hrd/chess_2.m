% 2*1 block
classdef chess_2<chess
    %CHESS_2 此处显示有关此类的摘要
    %   此处显示详细说明
    properties
    end
    methods
        function move_2(chess_2,pos,value,x,y)
            if pos==1
             chess_2.Button.Position(1,pos)=chess_2.Button.Position(1,pos)+value;
             chess_2.Sys.empty_block=[x,y];
             chess_2.Sys.step=chess_2.Sys.step+1;
             chess_2.Sys.UI.Label.Text=num2str(chess_2.Sys.step);
             return ;
            end
            if pos==2
                chess_2.Button.Position(1,2)=chess_2.Button.Position(1,2)+value;
                chess_2.Sys.empty_block(chess_2.Sys.empty_block==y)=x;
                chess_2.Sys.step=chess_2.Sys.step+1;
                chess_2.Sys.UI.Label.Text=num2str(chess_2.Sys.step);
            end
        end
       function button2_moment(chess_2)
            [num,q]=update_prop(chess_2.Sys,chess_2,2);
            upDown=[num+2,num-1];
            left=[num-5,num-4];
            right=[num+5,num+6];
            if (q==1)
                upDown=[num+2,-99];
            end
            if (q==4)
                upDown=[-99,num-1];
            end
            if ismember(left(1,1),chess_2.Sys.empty_block)==1 && ismember(left(1,2),chess_2.Sys.empty_block)==1
                    move_2(chess_2,1,-60,num,num+1)
                    return ;
            end
            if ismember(right(1,1),chess_2.Sys.empty_block)==1 && ismember(right(1,2),chess_2.Sys.empty_block)==1
                    move_2(chess_2,1,60,num,num+1)
                    return ;
            end
            if ismember(upDown(1,1),chess_2.Sys.empty_block)==1 && ismember(upDown(1,2),chess_2.Sys.empty_block)==1
                    chess_2.Sys.UI.UpButton.Visible="on";
                    chess_2.Sys.UI.DownButton.Visible="on";
                    return ;
            end
            if ismember(upDown(1,1),chess_2.Sys.empty_block)==1 && ismember(upDown(1,2),chess_2.Sys.empty_block)==0
               move_2(chess_2,2,60,num,upDown(1,1));
            end
            if ismember(upDown(1,1),chess_2.Sys.empty_block)==0 && ismember(upDown(1,2),chess_2.Sys.empty_block)==1
                move_2(chess_2,2,-60,num+1,upDown(1,2));
                return;
            end
        end
        function Before_set2(chess_2)
            list2=[];
            for i=1:19
                if (ismember(i,chess_2.Sys.have)||ismember(i+1,chess_2.Sys.have))
                    continue
                end
                if (mod(i,5)==0)
                    continue
                end
                list2=[list2;[i,i+1]];
            end
            [m,n]=size(list2);
            for j=1:m
                k=fix(list2(j,1)/5);
                q=mod(list2(j,1),5);
                chess_2.Sys.posButton{1,j}.Position(1,1)=k*60+17.5;
                chess_2.Sys.posButton{1,j}.Position(1,2)=(q-1)*60+47.5;
                chess_2.Sys.posButton{1,j}.Visible="on";
            end    
        end
    end
end

