//This file was generated from (Academic) UPPAAL 4.1.24 (rev. 29A3ECA4E5FB0808), November 2019

/*

*/
A[] not deadlock

/*

*/
A[] hour_cnt<=24

/*

*/
A[] InjectionSys.running imply (validity==1)

/*

*/
A[] bolus_changed==1 imply bolus==new_bolus

/*

*/
A[] baseline_changed==1 imply baseline==new_baseline

/*

*/
A[] (bolus_injected==1 && hourly_injection+bolus<=HourlyLimit && daily_injection+bolus<=DailyLimit) imply bolus_injected==1

/*

*/
A[]daily_injection<=DailyLimit

/*

*/
A[]hourly_injection<=HourlyLimit
