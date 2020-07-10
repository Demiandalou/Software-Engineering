classdef PainkillerInjectionSystem < handle
    properties
        Patient
        Physician
        
        dailylimit
        hourlylimit
        
        %the Recommended dosage limit
        bolusinterval
        baselineinterval
        
        %how much medicine exactly
        currentbaseline
        currentbolus
        
        %history data
        baseline
        bolus
        
        hour_in
        day_in
        
    end
        
    methods
        
    end
    
end