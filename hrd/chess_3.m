% % 1*2 block
classdef chess_3<chess
    %CHESS_3 此处显示有关此类的摘要
    %   此处显示详细说明
    properties
    end
    methods
        function move_3(chess_3,pos,value,x,y)
            if pos==2
                chess_3.Button.Position(1,2)=chess_3.Button.Position(1,2)+value;
                chess_3.Sys.empty_block=[x,y];
                chess_3.Sys.step=chess_3.Sys.step+1;
                chess_3.Sys.UI.Label.Text=num2str(chess_3.Sys.step);
                return ;
            end
            if pos==1
                chess_3.Button.Position(1,pos)=chess_3.Button.Position(1,pos)+value;
                chess_3.Sys.empty_block(chess_3.Sys.empty_block==y(1,1))=x;
                chess_3.Sys.step=chess_3.Sys.step+1;
                chess_3.Sys.UI.Label.Text=num2str(chess_3.Sys.step);
                return ;
            end    
        end    
      function button3_moment(chess_3)
            closeVisible(chess_3.Sys.UI);
            [num,q]=update_prop(chess_3.Sys,chess_3,3);
            up=[num+1,num+6];
            down=[num-1,num+4];
            leftRight=[num-5,num+10];
            if (q==1)
                down=[-99,-99];
            end
            if (q==5)
                up=[-99,-99];
            end
            if ismember(up(1,1),chess_3.Sys.empty_block)==1 && ismember(up(1,2),chess_3.Sys.empty_block)==1
                    move_3(chess_3,2,60,num,num+5);
            end
            if ismember(down(1,1),chess_3.Sys.empty_block)==1 && ismember(down(1,2),chess_3.Sys.empty_block)==1
                    move_3(chess_3,2,-60,num,num+5);
            end
            if ismember(leftRight(1,1),chess_3.Sys.empty_block)==1 && ismember(leftRight(1,2),chess_3.Sys.empty_block)==1
                    chess_3.Sys.UI.LeftButton.Visible="on";
                    chess_3.Sys.UI.RightButton.Visible="on";
            end
            if ismember(leftRight(1,1),chess_3.Sys.empty_block)==1 && ismember(leftRight(1,2),chess_3.Sys.empty_block)==0
                 move_3(chess_3,1,-60,num+5,leftRight(1,1));
            end
            if ismember(leftRight(1,1),chess_3.Sys.empty_block)==0 && ismember(leftRight(1,2),chess_3.Sys.empty_block)==1
                move_3(chess_3,1,60,num,leftRight(1,2));
            end
        end
        function Before_set3(chess_3)
            list3=[];
            for i=1:19
                if (i+5>20)
                    continue
                end
                if (ismember(i,chess_3.Sys.have)||ismember(i+5,chess_3.Sys.have))
                    continue
                end
                list3=[list3;[i,i+5]];
            end
            [m,~]=size(list3);
            for j=1:m
                k=fix(list3(j,1)/5);
                q=mod(list3(j,1),5);
                if (q==0)
                    q=5;
                    k=k-1;
                end
                chess_3.Sys.posButton{1,j}.Position(1,1)=k*60+47.5;
                chess_3.Sys.posButton{1,j}.Position(1,2)=(q-1)*60+17.5;
                chess_3.Sys.posButton{1,j}.Visible="on";
            end
            
        end
    end
end

