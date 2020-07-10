classdef OperationProcessor < handle
    
    properties
        patientApp
        physicianApp
        pis
    end
    
    methods
        function initialization(process)
            process.pis.dailylimit = 3;
            process.pis.hourlylimit = 1;
            switch process.pis.Patient.weight
                case 20
                    process.pis.baselineinterval = 0.01;
                    process.pis.bolusinterval = 0.2;
                case 30
                    process.pis.baselineinterval = 0.03;
                    process.pis.bolusinterval = 0.25;
                case 40
                    process.pis.baselineinterval = 0.05;
                    process.pis.bolusinterval = 0.3;
                case 50
                    process.pis.baselineinterval = 0.07;
                    process.pis.bolusinterval = 0.4;
                case 60
                    process.pis.baselineinterval = 0.08;
                    process.pis.bolusinterval = 0.45;
                case 70
                    process.pis.baselineinterval = 0.09;
                    process.pis.bolusinterval = 0.5;
                case 80
                    process.pis.baselineinterval = 0.1;
                    process.pis.bolusinterval = 0.5;
                otherwise
                    process.pis.baselineinterval = process.pis.Patient.weight * 0.0012;
                    process.pis.bolusinterval = process.pis.Patient.weight * 0.006;
            end
            process.pis.currentbolus = 0;
            process.pis.currentbaseline = 0;
            process.pis.hour_in = 0;
            process.pis.day_in = 0;
        end
        
        
        function effect=decideButtonPressEffect(process)
            effect = true;
            amount_h = process.pis.hour_in + process.pis.currentbolus + process.pis.currentbaseline;
            amount_d = process.pis.day_in + process.pis.currentbolus + process.pis.currentbaseline;
            if (amount_d > process.pis.dailylimit) || (amount_h > process.pis.hourlylimit)
                effect = false;
            end
        end
        
        
        function recordInjectionAmount(process)
            if length(process.pis.baseline(:)) == length(process.pis.bolus(:))
                process.pis.bolus = [process.pis.bolus; 0];
            end
            process.pis.baseline = [process.pis.baseline; process.pis.currentbaseline];
            
            l = length(process.pis.baseline(:));
            if  l <= 60
                process.pis.hour_in = process.pis.hour_in + process.pis.baseline(l) + process.pis.bolus(l);
                process.pis.day_in = process.pis.day_in + process.pis.baseline(l) + process.pis.bolus(l);
            elseif 60 < l <= 24 * 60
                process.pis.hour_in = process.pis.hour_in + process.pis.baseline(l) + process.pis.bolus(l) - process.pis.baseline(l-60) - process.pis.bolus(l-60);
                process.pis.day_in = process.pis.day_in + process.pis.baseline(l) + process.pis.bolus(l);
            else
                process.pis.hour_in = process.pis.hour_in + process.pis.baseline(l) + process.pis.bolus(l) - process.pis.baseline(l-60) - process.pis.bolus(l-60);
                process.pis.day_in = process.pis.day_in + process.pis.baseline(l) + process.pis.bolus(l)- process.pis.baseline(l-60 *24) - process.pis.bolus(l-60*24);
            end
                
           
        end
        
        function stopInjection_daily(process)
            if process.pis.day_in + process.pis.currentbaseline > process.pis.dailylimit
                process.pis.currentbaseline = 0;
            end
        end
        
        function stopInjection_hourly(process)
            if process.pis.hour_in + process.pis.currentbaseline > process.pis.hourlylimit
                process.pis.currentbaseline = 0;
            end
        end
        
        
        
        function displayMessage_patient(process,Message)
            process.patientApp.Message.Text=[process.patientApp.Message.Text;{Message}];
        end
        function displayMessage_physician(process,Message)
            process.physicianApp.Message.Text=[process.physicianApp.Message.Text;{Message}];
        end
        
        
        
        function showline(process)
            l = length(process.pis.baseline(:));
            ax = process.patientApp.UIAxes;
            bx = process.physicianApp.UIAxes;
            if l < 60 * 24
                x = 1:1:l;
                plot(ax,x,process.pis.baseline,x,process.pis.bolus);
                plot(bx,x,process.pis.baseline,x,process.pis.bolus);
            else
                x = l- 60*24+1:1:l;
                plot(ax,x,process.pis.baseline(l-60*24+1:l),x,process.pis.bolus(l-60*24+1:l));
                plot(bx,x,process.pis.baseline(l-60*24+1:l),x,process.pis.bolus(l-60*24+1:l));
            end
        end
    end
end