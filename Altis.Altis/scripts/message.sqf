_text1 = parseText format ["<t color='#1BCADE' size='1'>All cops, Medics and Army need to be on TeamSpeak. Those who aren't may be kicked without warning!</t>"];
_text2 = parseText format ["<t color='#1BCADE' size='1'>Please sync data regularly! Failing to do so may result in the loss of your equipment!</t>"];
_text3 = parseText format ["<t color='#1BCADE' size='1'>We hope you have a good time on ALRP</t>"];
_text4 = parseText format ["<t color='#1BCADE' size='1'>If you require any assistance, Please join our Teamspeak!!</t>"];
_text5 = parseText format ["<t color='#1BCADE' size='1'>Join us on Teamspeak: AltisLifeRP.co.uk</t>"];
//_text6 = parseText format ["<t color='#1BCADE' size='1'>If You Require Assistance With Anything In Relation To Our Server, Please Connect To Our Teamspeak3 This Will Ensure Your Situation Is Sorted Asap !</t>"];
//_text7 = parseText format ["<t color='#1BCADE' size='1'>Please Sync Data Regularly ! Failing To Do So May Result In The Loss Of Your Equipment !</t>"];


while {true} do
{
	sleep 600;
	hint _text1;
	sleep 600;
	hint _text2;
	sleep 600;
	hint _text3;
	sleep 600;
	hint _text4;
	sleep 600;
	hint _text5;
	/*sleep 600;
	hint _text6;
	sleep 600; 
	hint _text7;
	sleep 600;*/
};