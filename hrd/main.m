mainSystem=controlSys;
huangrdUI=huangrd;
mainSystem.UI=huangrdUI;
huangrdUI.controlSys=mainSystem;

mainSystem.UI.SUCCESSLabel.Text="HuaRongDao!";
mainSystem.UI.SUCCESSLabel.Visible="On";
mainSystem.start_UI();
