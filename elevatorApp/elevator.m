classdef elevator < handle
    properties
        goal_floor = 0;
        current_floor = 1;
        % elevtor left: floor3:[191 321 150 186];floor2:[191 165 150 186] floor1:[191 10 150 186]
        % elevtor right: floor3:[31 338 150 186];floor2:[31 182 150 186]; floor1:[31 27 150 186]
        left_position = [10,165,321];
        right_position = [27,182,338];
    end
end