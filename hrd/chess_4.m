% small soldier block
classdef chess_4<chess
    %CHESS_4 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
    end
    
    methods
        function move_4(chess_4,pos,able,x,num)
            chess_4.Sys.empty_block(chess_4.Sys.empty_block==able(1,2))=num;
            chess_4.Button.Position(1,pos)=chess_4.Button.Position(1,pos)+x;
            chess_4.Sys.step=chess_4.Sys.step+1;
            chess_4.Sys.UI.Label.Text=num2str(chess_4.Sys.step);
        end
        
         function button4_movement(chess_4)
            closeVisible(chess_4.Sys.UI);
            [num,q]=update_prop(chess_4.Sys,chess_4,4);
            able=[];
            k=1;
            actions=[num+1,num-1,num-5,num+5];
            if (q==1)
                actions(actions==num-1)=-99;
            end
            if (q==5)
                actions(actions==num+1)=-99;
            end
            for i=1:length(chess_4.Sys.empty_block)
                for j=1:length(actions)
                    if (chess_4.Sys.empty_block(i)==actions(j))
                        able(k,1)=j;
                        able(k,2)=actions(j);
                        k=k+1;
                    end
                end
            end
            
           [m,~]=size(able);
           if (m==1)
               if (able(1,1)==1)
                   move_4(chess_4,2,able,60,num)
                   return ;
               end
               if (able(1,1)==2)
                   move_4(chess_4,2,able,-60,num)
                   return ;
               end
               if (able(1,1)==3)
                   move_4(chess_4,1,able,-60,num)
                   return ;
               end
               if (able(1,1)==4)
                   move_4(chess_4,1,able,60,num)
                   return ;
               end
           end
           %Show direction options
           if (m==2)
               directButton={chess_4.Sys.UI.UpButton,chess_4.Sys.UI.DownButton,chess_4.Sys.UI.LeftButton,chess_4.Sys.UI.RightButton};
               directButton{able(1,1)}.Visible="On";
               directButton{able(2,1)}.Visible="On";
           end
         end
         function Before_set4(chess_4)
            list1=[];
            for i=1:20
                if ismember(i,chess_4.Sys.have)
                    continue
                end
                list1=[list1,i];
            end
            [~,m]=size(list1);
            for j=1:m
                k=fix(list1(1,j)/5);
                q=mod(list1(1,j),5);
                if (q==0)
                    q=5;
                    k=k-1;
                end
                chess_4.Sys.posButton{1,j}.Position(1,1)=k*60+17.5;
                chess_4.Sys.posButton{1,j}.Position(1,2)=(q-1)*60+17.5;
                chess_4.Sys.posButton{1,j}.Visible="on";
            end
         end
    end
end

