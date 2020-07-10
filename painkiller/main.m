close all
clear all 
 pro = OperationProcessor;
 pis = PainkillerInjectionSystem;
 phy = physician;
 phy.Name = "myx";
 phy.password = "1234";

 
 physicianapp = PhysicianUI;
 patientapp = PatientUI;
 pa = patientapp.OperationProcessor.pis.patient;
 patientapp.OperationProcessor=pro;
 physicianapp.OperationProcessor=pro;
 pro.patientApp = patientapp;
 pro.physicianApp = physicianapp;
 pro.pis = pis;
 pis.Patient = pa;
 pis.Physician = phy;
 pro.initialization();
 
 
  t =timer('TimerFcn',{@mycallback,pro}, 'Period',1,'executionmode','fixeddelay');%,'TasksToExecute',100);

  start(t);
  
  function mycallback(obj,event,pro)
    pro.stopInjection_daily();
    pro.stopInjection_hourly();
    pro.recordInjectionAmount();
    pro.showline();
    
  end