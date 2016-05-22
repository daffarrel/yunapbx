/*
SQLyog Community v12.15 (64 bit)
MySQL - 5.1.73 : Database - webui
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE `webui`;

/*Data for the table `Admins` */

insert  into `Admins`(`PK_User`,`name`,`password`) values 

(1,'admin','fe01ce2a7fbac8fafaed7c982a04e229');

/*Data for the table `Codecs` */

insert  into `Codecs`(`PK_Codec`,`Name`,`Description`,`Recomended`) values 

(1,'alaw','G.711 aLAW',1),
(2,'ulaw','G.711 uLAW',0),
(3,'h263','H.263 Video',0),
(4,'gsm','GSM',0),
(5,'g726','G.726',0),
(6,'ilbc','iLBC',0),
(7,'speex','Speex',0),
(8,'g722','G.722 (HD)',1),
(9,'h263p','H.263+ (1998) Video',0),
(10,'h264','H.264 Video',0);

/*Data for the table `DTMFModes` */

insert  into `DTMFModes`(`PK_DTMFMode`,`Name`,`Description`) values 

(1,'rfc2833','RFC2833 (Default)'),
(2,'info','Info'),
(3,'inband','Inband'),
(4,'auto','Auto');

/*Data for the table `Features` */

insert  into `Features`(`PK_Feature`,`Name`,`ShortName`,`Recomended`) values 

(1,'Voicemail','voicemail',1),
(2,'Block Calls','block_calls',1),
(3,'Forward Calls','forward_calls',1),
(4,'Voicemail Forwarding ','voicemail_forwarding',0),
(5,'Web Tool Access','web_tool_access',1),
(6,'Unpark Calls','unpark_calls',0);

/*Data for the table `Moh_Groups` */

insert  into `Moh_Groups`(`PK_Group`,`Name`,`Description`,`Volume`,`Ordered`,`Protected`) values 

(1,'default','Default music files for use as music on hold. Add and remove files to customize your on hold playlist.',100,0,1);

/*Data for the table `NATTypes` */

insert  into `NATTypes`(`PK_NATType`,`Name`,`Description`) values 

(1,'force_rport,comedia','Force NAT'),
(2,'no','No'),
(3,'auto_force_rport,auto_comedia','Auto');

/*Data for the table `RingStrategies` */

insert  into `RingStrategies`(`PK_RingStrategy`,`Name`,`Description`) values 

(1,'ringall','ring all available queue members until one answers'),
(2,'rrmemory','round robin with memory, remember where we left off last ring pass'),
(3,'leastrecent','ring the member which was least recently called by this queue'),
(4,'fewestcalls','ring the member with fewest completed calls from this queue'),
(5,'random','ring random member');

/*Data for the table `Settings` */

insert  into `Settings`(`Name`,`Value`) values 

('Agent_AckCall','0'),
('Agent_MissedCalls','5'),
('Voicemail_OperatorExtension',''),
('Voicemail_From','voicemail@starfish-pbx'),
('Voicemail_AllowLogin','1'),
('Voicemail_EmailTemplate_Original','Dear %VM_NAME%:\r\n\r\n   Just wanted to let you know you just received a %VM_DUR% long message (number %VM_MSGNUM%)\r\nin mailbox %VM_MAILBOX% from %VM_CALLERID%, on %VM_DATE% so you might \r\nwant to check it when you get a chance.\r\n\r\nYou can check your message via the phone or use the links below to download your message:\r\n\r\nUse the link below to just download the voicemail.\r\n*Note* This does not mark it as read in the system.\r\n%DOWNLOAD_LINK%\r\n\r\nUse this link below to download the voicemail and mark it as read.\r\n*Note* This will move this voicemail message to your Old folder and this link will no longer work.\r\n%DOWNLOAD_LINK_AND_MARK_READ%\r\n\r\nUse this link below to download the voicemail and delete it.\r\n*Note* This will completely remove the voicemail from the system and this link will no longer work.\r\n%DOWNLOAD_LINK_AND_MARK_DELETED%\r\n\r\n\r\nThanks!'),
('Voicemail_UseExternal','0'),
('Voicemail_EmailTemplate','Dear %VM_NAME%:\r\n\r\n   Just wanted to let you know you just received a %VM_DUR% long message (number %VM_MSGNUM%)\r\nin mailbox %VM_MAILBOX% from %VM_CALLERID%, on %VM_DATE% so you might \r\nwant to check it when you get a chance.\r\n\r\nYou can check your message via the phone or use the links below to download your message:\r\n\r\nUse the link below to just download the voicemail.\r\n*Note* This does not mark it as read in the system.\r\n%DOWNLOAD_LINK%\r\n\r\nUse this link below to download the voicemail and mark it as read.\r\n*Note* This will move this voicemail message to your Old folder and this link will no longer work.\r\n%DOWNLOAD_LINK_AND_MARK_READ%\r\n\r\nUse this link below to download the voicemail and delete it.\r\n*Note* This will completely remove the voicemail from the system and this link will no longer work.\r\n%DOWNLOAD_LINK_AND_MARK_DELETED%\r\n\r\n\r\nThanks!'),
('Voicemail_PK_SipProvider','12'),
('Network_ExternalAddress','94.174.117.9'),
('Network_SSL_Certificate',''),
('Network_RSA_Key',''),
('Network_UseNAT','1'),
('NTPServer','ntp.ubuntu.com'),
('Current_TimeZone','Europe/London'),
('DisableNTP',''),
('Network_Additional_LAN','10.0.0.0/8;172.16.0.0/12;192.168.0.0/16'),
('Voicemail_SMTP_Server',''),
('Voicemail_SMTP_User',''),
('Voicemail_SMTP_Pass','');

/*Data for the table `SoundEntries` */

insert  into `SoundEntries`(`PK_SoundEntry`,`Type`,`FK_SoundFolder`) values 

(4167,'System',14),

(4168,'System',1),

(4169,'System',2),

(4170,'System',14),

(4171,'System',2),

(4172,'System',2),

(4173,'System',14),

(4174,'System',2),

(4175,'System',1),

(4176,'System',14),

(4177,'System',14),

(4178,'System',1),

(4179,'System',2),

(4180,'System',2),

(4181,'System',11),

(4182,'System',18),

(4183,'System',2),

(4184,'System',14),

(4185,'System',16),

(4186,'System',8),

(4187,'System',12),

(4188,'System',8),

(4189,'System',1),

(4190,'System',1),

(4191,'System',8),

(4192,'System',1),

(4193,'System',8),

(4194,'System',1),

(4195,'System',16),

(4196,'System',8),

(4197,'System',8),

(4198,'System',1),

(4199,'System',1),

(4200,'System',1),

(4201,'System',8),

(4202,'System',1),

(4203,'System',8),

(4204,'System',8),

(4205,'System',16),

(4206,'System',8),

(4207,'System',8),

(4208,'System',1),

(4209,'System',16),

(4210,'System',1),

(4211,'System',16),

(4212,'System',1),

(4213,'System',1),

(4214,'System',12),

(4215,'System',1),

(4216,'System',16),

(4217,'System',1),

(4218,'System',1),

(4219,'System',16),

(4220,'System',1),

(4221,'System',1),

(4222,'System',8),

(4223,'System',12),

(4224,'System',1),

(4225,'System',1),

(4226,'System',8),

(4227,'System',1),

(4228,'System',16),

(4229,'System',8),

(4230,'System',1),

(4231,'System',1),

(4232,'System',8),

(4233,'System',8),

(4234,'System',8),

(4235,'System',1),

(4236,'System',1),

(4237,'System',12),

(4238,'System',1),

(4239,'System',8),

(4240,'System',1),

(4241,'System',12),

(4242,'System',1),

(4243,'System',1),

(4244,'System',8),

(4245,'System',1),

(4246,'System',1),

(4247,'System',8),

(4248,'System',8),

(4249,'System',8),

(4250,'System',12),

(4251,'System',1),

(4252,'System',8),

(4253,'System',1),

(4254,'System',1),

(4255,'System',1),

(4256,'System',1),

(4257,'System',16),

(4258,'System',8),

(4259,'System',12),

(4260,'System',16),

(4261,'System',1),

(4262,'System',1),

(4263,'System',8),

(4264,'System',8),

(4265,'System',16),

(4266,'System',8),

(4267,'System',16),

(4268,'System',14),

(4269,'System',14),

(4270,'System',2),

(4271,'System',14),

(4272,'System',11),

(4273,'System',14),

(4274,'System',14),

(4275,'System',14),

(4277,'System',14),

(4279,'System',14),

(4280,'System',23),

(4281,'System',14),

(4282,'System',2),

(4284,'System',13),

(4285,'System',1),

(4286,'System',13),

(4287,'System',14),

(4288,'System',9),

(4289,'System',1),

(4290,'System',9),

(4291,'System',14),

(4292,'System',1),

(4293,'System',11),

(4294,'System',14),

(4295,'System',14),

(4296,'System',14),

(4297,'System',23),

(4298,'System',14),

(4299,'System',13),

(4301,'System',14),

(4302,'System',14),

(4303,'System',11),

(4304,'System',14),

(4305,'System',14),

(4306,'System',1),

(4307,'System',14),

(4308,'System',18),

(4309,'System',9),

(4310,'System',14),

(4311,'System',1),

(4312,'System',14),

(4313,'System',14),

(4314,'System',14),

(4315,'System',14),

(4316,'System',9),

(4317,'System',1),

(4318,'System',1),

(4319,'System',1),

(4320,'System',1),

(4321,'System',1),

(4322,'System',1),

(4323,'System',1),

(4324,'System',1),

(4325,'System',1),

(4326,'System',1),

(4327,'System',1),

(4328,'System',1),

(4329,'System',1),

(4330,'System',1),

(4331,'System',1),

(4332,'System',1),

(4333,'System',1),

(4334,'System',1),

(4335,'System',1),

(4336,'System',1),

(4337,'System',1),

(4338,'System',1),

(4339,'System',1),

(4340,'System',1),

(4341,'System',1),

(4342,'System',1),

(4343,'System',1),

(4344,'System',1),

(4345,'System',1),

(4346,'System',1),

(4347,'System',1),

(4348,'System',1),

(4349,'System',1),

(4350,'System',1),

(4351,'System',1),

(4352,'System',1),

(4353,'System',1),

(4354,'System',1),

(4355,'System',1),

(4356,'System',1),

(4357,'System',1),

(4358,'System',1),

(4359,'System',1),

(4360,'System',1),

(4361,'System',1),

(4362,'System',1),

(4363,'System',1),

(4364,'System',1),

(4365,'System',1),

(4366,'System',1),

(4367,'System',1),

(4368,'System',1),

(4369,'System',1),

(4370,'System',1),

(4371,'System',1),

(4372,'System',1),

(4373,'System',1),

(4374,'System',1),

(4375,'System',1),

(4376,'System',1),

(4377,'System',1),

(4378,'System',1),

(4379,'System',1),

(4380,'System',11),

(4381,'System',2),

(4382,'System',14),

(4383,'System',2),

(4384,'System',1),

(4385,'System',9),

(4386,'System',14),

(4387,'System',1),

(4388,'System',1),

(4389,'System',14),

(4390,'System',11),

(4391,'System',2),

(4393,'System',14),

(4394,'System',23),

(4395,'System',2),

(4396,'System',10),

(4397,'System',18),

(4398,'System',14),

(4399,'System',14),

(4400,'System',2),

(4401,'System',1),

(4402,'System',14),

(4403,'System',14),

(4404,'System',14),

(4405,'System',14),

(4406,'System',14),

(4407,'System',14),

(4408,'System',1),

(4409,'System',1),

(4410,'System',1),

(4411,'System',1),

(4412,'System',1),

(4413,'System',1),

(4414,'System',1),

(4415,'System',1),

(4416,'System',1),

(4417,'System',1),

(4418,'System',1),

(4419,'System',1),

(4420,'System',2),

(4421,'System',14),

(4422,'System',14),

(4423,'System',11),

(4424,'System',14),

(4425,'System',14),

(4426,'System',14),

(4427,'System',9),

(4428,'System',14),

(4429,'System',14),

(4430,'System',11),

(4431,'System',1),

(4432,'System',14),

(4433,'System',14),

(4434,'System',2),

(4435,'System',14),

(4436,'System',2),

(4437,'System',14),

(4438,'System',1),

(4439,'System',14),

(4440,'System',14),

(4441,'System',2),

(4442,'System',2),

(4443,'System',2),

(4444,'System',1),

(4445,'System',14),

(4447,'System',1),

(4448,'System',14),

(4449,'System',14),

(4450,'System',1),

(4452,'System',14),

(4453,'System',1),

(4454,'System',14),

(4455,'System',2),

(4456,'System',2),

(4457,'System',14),

(4458,'System',10),

(4459,'System',1),

(4460,'System',1),

(4461,'System',1),

(4462,'System',1),

(4463,'System',1),

(4464,'System',1),

(4465,'System',14),

(4466,'System',14),

(4467,'System',2),

(4468,'System',14),

(4469,'System',13),

(4470,'System',13),

(4471,'System',2),

(4472,'System',14),

(4473,'System',14),

(4474,'System',14),

(4475,'System',14),

(4476,'System',14),

(4477,'System',14),

(4478,'System',1),

(4479,'System',18),

(4480,'System',9),

(4481,'System',14),

(4483,'System',14),

(4485,'System',14),

(4487,'System',14),

(4488,'System',1),

(4489,'System',13),

(4490,'System',14),

(4491,'System',14),

(4492,'System',11),

(4493,'System',14),

(4494,'System',14),

(4495,'System',14),

(4496,'System',14),

(4497,'System',14),

(4498,'System',2),

(4499,'System',14),

(4500,'System',14),

(4501,'System',14),

(4502,'System',8),

(4503,'System',8),

(4504,'System',8),

(4505,'System',8),

(4506,'System',8),

(4507,'System',8),

(4508,'System',8),

(4509,'System',8),

(4510,'System',8),

(4511,'System',8),

(4512,'System',1),

(4513,'System',2),

(4514,'System',14),

(4515,'System',14),

(4516,'System',14),

(4517,'System',18),

(4518,'System',14),

(4519,'System',1),

(4520,'System',1),

(4521,'System',14),

(4522,'System',13),

(4523,'System',14),

(4525,'System',14),

(4526,'System',14),

(4527,'System',1),

(4528,'System',1),

(4529,'System',1),

(4530,'System',1),

(4531,'System',1),

(4532,'System',1),

(4533,'System',1),

(4534,'System',1),

(4535,'System',1),

(4536,'System',1),

(4537,'System',1),

(4538,'System',1),

(4539,'System',1),

(4540,'System',1),

(4541,'System',1),

(4542,'System',1),

(4543,'System',1),

(4544,'System',1),

(4545,'System',1),

(4546,'System',1),

(4547,'System',1),

(4548,'System',1),

(4549,'System',1),

(4550,'System',1),

(4551,'System',1),

(4552,'System',1),

(4553,'System',1),

(4554,'System',14),

(4555,'System',14),

(4556,'System',14),

(4557,'System',13),

(4558,'System',13),

(4559,'System',14),

(4560,'System',14),

(4561,'System',11),

(4562,'System',23),

(4563,'System',11),

(4564,'System',2),

(4565,'System',14),

(4566,'System',14);

/*Data for the table `SoundFiles` */

insert  into `SoundFiles`(`PK_SoundFile`,`FK_SoundEntry`,`FK_SoundPack`,`Name`,`Description`,`Filename`,`FK_SoundLanguage`) values 

(4138,4167,0,'vm-mismatch','','/var/lib/asterisk/sounds/en/vm-mismatch.gsm',1),

(4139,4168,0,'spy-agent','','/var/lib/asterisk/sounds/en/spy-agent.gsm',1),

(4140,4169,0,'conf-leaderhasleft','','/var/lib/asterisk/sounds/en/conf-leaderhasleft.gsm',1),

(4141,4170,0,'vm-nobox','','/var/lib/asterisk/sounds/en/vm-nobox.gsm',1),

(4142,4171,0,'conf-getpin','','/var/lib/asterisk/sounds/en/conf-getpin.gsm',1),

(4143,4172,0,'conf-enteringno','','/var/lib/asterisk/sounds/en/conf-enteringno.gsm',1),

(4144,4173,0,'vm-tempgreetactive','','/var/lib/asterisk/sounds/en/vm-tempgreetactive.gsm',1),

(4145,4174,0,'conf-onlyperson','','/var/lib/asterisk/sounds/en/conf-onlyperson.gsm',1),

(4146,4175,0,'hello-world','','/var/lib/asterisk/sounds/en/hello-world.gsm',1),

(4147,4176,0,'vm-youhave','','/var/lib/asterisk/sounds/en/vm-youhave.gsm',1),

(4148,4177,0,'vm-tomakecall','','/var/lib/asterisk/sounds/en/vm-tomakecall.gsm',1),

(4149,4178,0,'spy-sip','','/var/lib/asterisk/sounds/en/spy-sip.gsm',1),

(4150,4179,0,'conf-hasleft','','/var/lib/asterisk/sounds/en/conf-hasleft.gsm',1),

(4151,4180,0,'conf-getconfno','','/var/lib/asterisk/sounds/en/conf-getconfno.gsm',1),

(4152,4181,0,'Hold Time (short)','Hold time','/var/lib/asterisk/sounds/en/queue-reporthold.gsm',1),

(4153,4182,0,'Wrong','Something is terribly wrong.','/var/lib/asterisk/sounds/en/tt-somethingwrong.gsm',1),

(4154,4183,0,'conf-onlyone','','/var/lib/asterisk/sounds/en/conf-onlyone.gsm',1),

(4155,4184,0,'vm-tocancel','','/var/lib/asterisk/sounds/en/vm-tocancel.gsm',1),

(4156,4185,0,'October','October.','/var/lib/asterisk/sounds/en/digits/mon-9.gsm',1),

(4157,4186,0,'20','','/var/lib/asterisk/sounds/en/digits/20.gsm',1),

(4158,4187,0,'Sunday','Sunday.','/var/lib/asterisk/sounds/en/digits/day-0.gsm',1),

(4159,4188,0,'11','','/var/lib/asterisk/sounds/en/digits/11.gsm',1),

(4160,4189,0,'h-1','','/var/lib/asterisk/sounds/en/digits/h-1.gsm',1),

(4161,4190,0,'h-16','','/var/lib/asterisk/sounds/en/digits/h-16.gsm',1),

(4162,4191,0,'14','','/var/lib/asterisk/sounds/en/digits/14.gsm',1),

(4163,4192,0,'h-13','','/var/lib/asterisk/sounds/en/digits/h-13.gsm',1),

(4164,4193,0,'13','','/var/lib/asterisk/sounds/en/digits/13.gsm',1),

(4165,4194,0,'oclock','','/var/lib/asterisk/sounds/en/digits/oclock.gsm',1),

(4166,4195,0,'February','February.','/var/lib/asterisk/sounds/en/digits/mon-1.gsm',1),

(4167,4196,0,'40','','/var/lib/asterisk/sounds/en/digits/40.gsm',1),

(4168,4197,0,'4','','/var/lib/asterisk/sounds/en/digits/4.gsm',1),

(4169,4198,0,'pound','','/var/lib/asterisk/sounds/en/digits/pound.gsm',1),

(4170,4199,0,'oh','','/var/lib/asterisk/sounds/en/digits/oh.gsm',1),

(4171,4200,0,'h-8','','/var/lib/asterisk/sounds/en/digits/h-8.gsm',1),

(4172,4201,0,'8','','/var/lib/asterisk/sounds/en/digits/8.gsm',1),

(4173,4202,0,'p-m','','/var/lib/asterisk/sounds/en/digits/p-m.gsm',1),

(4174,4203,0,'10','','/var/lib/asterisk/sounds/en/digits/10.gsm',1),

(4175,4204,0,'18','','/var/lib/asterisk/sounds/en/digits/18.gsm',1),

(4176,4205,0,'March','March.','/var/lib/asterisk/sounds/en/digits/mon-2.gsm',1),

(4177,4206,0,'30','','/var/lib/asterisk/sounds/en/digits/30.gsm',1),

(4178,4207,0,'7','','/var/lib/asterisk/sounds/en/digits/7.gsm',1),

(4179,4208,0,'star','','/var/lib/asterisk/sounds/en/digits/star.gsm',1),

(4180,4209,0,'September','September.','/var/lib/asterisk/sounds/en/digits/mon-8.gsm',1),

(4181,4210,0,'h-3','','/var/lib/asterisk/sounds/en/digits/h-3.gsm',1),

(4182,4211,0,'July','July','/var/lib/asterisk/sounds/en/digits/mon-6.gsm',1),

(4183,4212,0,'h-15','','/var/lib/asterisk/sounds/en/digits/h-15.gsm',1),

(4184,4213,0,'hundred','','/var/lib/asterisk/sounds/en/digits/hundred.gsm',1),

(4185,4214,0,'Thursday','Thursday.','/var/lib/asterisk/sounds/en/digits/day-4.gsm',1),

(4186,4215,0,'h-19','','/var/lib/asterisk/sounds/en/digits/h-19.gsm',1),

(4187,4216,0,'June','June.','/var/lib/asterisk/sounds/en/digits/mon-5.gsm',1),

(4188,4217,0,'h-30','','/var/lib/asterisk/sounds/en/digits/h-30.gsm',1),

(4189,4218,0,'Today','Today.','/var/lib/asterisk/sounds/en/digits/today.gsm',1),

(4190,4219,0,'November','November.','/var/lib/asterisk/sounds/en/digits/mon-10.gsm',1),

(4191,4220,0,'at','','/var/lib/asterisk/sounds/en/digits/at.gsm',1),

(4192,4221,0,'h-14','','/var/lib/asterisk/sounds/en/digits/h-14.gsm',1),

(4193,4222,0,'0','','/var/lib/asterisk/sounds/en/digits/0.gsm',1),

(4194,4223,0,'Monday ','Monday.','/var/lib/asterisk/sounds/en/digits/day-1.gsm',1),

(4195,4224,0,'h-6','','/var/lib/asterisk/sounds/en/digits/h-6.gsm',1),

(4196,4225,0,'h-5','','/var/lib/asterisk/sounds/en/digits/h-5.gsm',1),

(4197,4226,0,'16','','/var/lib/asterisk/sounds/en/digits/16.gsm',1),

(4198,4227,0,'h-7','','/var/lib/asterisk/sounds/en/digits/h-7.gsm',1),

(4199,4228,0,'December','December.','/var/lib/asterisk/sounds/en/digits/mon-11.gsm',1),

(4200,4229,0,'6','','/var/lib/asterisk/sounds/en/digits/6.gsm',1),

(4201,4230,0,'Yesterday','Yesterday.','/var/lib/asterisk/sounds/en/digits/yesterday.gsm',1),

(4202,4231,0,'90','','/var/lib/asterisk/sounds/en/digits/90.gsm',1),

(4203,4232,0,'17','','/var/lib/asterisk/sounds/en/digits/17.gsm',1),

(4204,4233,0,'3','','/var/lib/asterisk/sounds/en/digits/3.gsm',1),

(4205,4234,0,'60','','/var/lib/asterisk/sounds/en/digits/60.gsm',1),

(4206,4235,0,'a-m','','/var/lib/asterisk/sounds/en/digits/a-m.gsm',1),

(4207,4236,0,'h-20','','/var/lib/asterisk/sounds/en/digits/h-20.gsm',1),

(4208,4237,0,'Wednesday','Wednesday.','/var/lib/asterisk/sounds/en/digits/day-3.gsm',1),

(4209,4238,0,'h-12','','/var/lib/asterisk/sounds/en/digits/h-12.gsm',1),

(4210,4239,0,'80','','/var/lib/asterisk/sounds/en/digits/80.gsm',1),

(4211,4240,0,'h-10','','/var/lib/asterisk/sounds/en/digits/h-10.gsm',1),

(4212,4241,0,'Saturday','Saturday.','/var/lib/asterisk/sounds/en/digits/day-6.gsm',1),

(4213,4242,0,'tomorrow','','/var/lib/asterisk/sounds/en/digits/tomorrow.gsm',1),

(4214,4243,0,'dollars','','/var/lib/asterisk/sounds/en/digits/dollars.gsm',1),

(4215,4244,0,'50','','/var/lib/asterisk/sounds/en/digits/50.gsm',1),

(4216,4245,0,'h-4','','/var/lib/asterisk/sounds/en/digits/h-4.gsm',1),

(4217,4246,0,'h-9','','/var/lib/asterisk/sounds/en/digits/h-9.gsm',1),

(4218,4247,0,'70','','/var/lib/asterisk/sounds/en/digits/70.gsm',1),

(4219,4248,0,'19','','/var/lib/asterisk/sounds/en/digits/19.gsm',1),

(4220,4249,0,'2','','/var/lib/asterisk/sounds/en/digits/2.gsm',1),

(4221,4250,0,'Tuesday','Tuesday.','/var/lib/asterisk/sounds/en/digits/day-2.gsm',1),

(4222,4251,0,'h-2','','/var/lib/asterisk/sounds/en/digits/h-2.gsm',1),

(4223,4252,0,'5','','/var/lib/asterisk/sounds/en/digits/5.gsm',1),

(4224,4253,0,'h-18','','/var/lib/asterisk/sounds/en/digits/h-18.gsm',1),

(4225,4254,0,'million','','/var/lib/asterisk/sounds/en/digits/million.gsm',1),

(4226,4255,0,'h-11','','/var/lib/asterisk/sounds/en/digits/h-11.gsm',1),

(4227,4256,0,'minus','','/var/lib/asterisk/sounds/en/digits/minus.gsm',1),

(4228,4257,0,'May','May','/var/lib/asterisk/sounds/en/digits/mon-4.gsm',1),

(4229,4258,0,'15','','/var/lib/asterisk/sounds/en/digits/15.gsm',1),

(4230,4259,0,'Friday','Friday.','/var/lib/asterisk/sounds/en/digits/day-5.gsm',1),

(4231,4260,0,'August','August.','/var/lib/asterisk/sounds/en/digits/mon-7.gsm',1),

(4232,4261,0,'h-17','','/var/lib/asterisk/sounds/en/digits/h-17.gsm',1),

(4233,4262,0,'thousand','','/var/lib/asterisk/sounds/en/digits/thousand.gsm',1),

(4234,4263,0,'1','','/var/lib/asterisk/sounds/en/digits/1.gsm',1),

(4235,4264,0,'12','','/var/lib/asterisk/sounds/en/digits/12.gsm',1),

(4236,4265,0,'January','January.','/var/lib/asterisk/sounds/en/digits/mon-0.gsm',1),

(4237,4266,0,'9','','/var/lib/asterisk/sounds/en/digits/9.gsm',1),

(4238,4267,0,'April','April.','/var/lib/asterisk/sounds/en/digits/mon-3.gsm',1),

(4239,4268,0,'vm-nobodyavail','','/var/lib/asterisk/sounds/en/vm-nobodyavail.gsm',1),

(4240,4269,0,'vm-savefolder','','/var/lib/asterisk/sounds/en/vm-savefolder.gsm',1),

(4241,4270,0,'conf-invalidpin','','/var/lib/asterisk/sounds/en/conf-invalidpin.gsm',1),

(4242,4271,0,'vm-undelete','','/var/lib/asterisk/sounds/en/vm-undelete.gsm',1),

(4243,4272,0,'Thank You','Thank you for your patience.','/var/lib/asterisk/sounds/en/queue-thankyou.gsm',1),

(4244,4273,0,'vm-received','','/var/lib/asterisk/sounds/en/vm-received.gsm',1),

(4245,4274,0,'vm-changeto','','/var/lib/asterisk/sounds/en/vm-changeto.gsm',1),

(4246,4275,0,'vm-rec-temp','','/var/lib/asterisk/sounds/en/vm-rec-temp.gsm',1),

(4248,4277,0,'vm-Family','','/var/lib/asterisk/sounds/en/vm-Family.gsm',1),

(4250,4279,0,'vm-from-phonenumber','','/var/lib/asterisk/sounds/en/vm-from-phonenumber.gsm',1),

(4251,4280,0,'privacy-thankyou','','/var/lib/asterisk/sounds/en/privacy-thankyou.gsm',1),

(4252,4281,0,'vm-tempgreeting2','','/var/lib/asterisk/sounds/en/vm-tempgreeting2.gsm',1),

(4253,4282,0,'conf-waitforleader','','/var/lib/asterisk/sounds/en/conf-waitforleader.gsm',1),

(4255,4284,0,'No Match','No directory entries match your search.','/var/lib/asterisk/sounds/en/dir-nomatch.gsm',1),

(4256,4285,0,'priv-introsaved','','/var/lib/asterisk/sounds/en/priv-introsaved.gsm',1),

(4257,4286,0,'Introduction','Welcome to the directory. Please enter the first three letters of your party\'s last name using your touch tone key pad. Use the seven key for Q and the nine key for Z.','/var/lib/asterisk/sounds/en/dir-intro.gsm',1),

(4258,4287,0,'vm-num-i-have','','/var/lib/asterisk/sounds/en/vm-num-i-have.gsm',1),

(4259,4288,0,'Agent Log In','Agent Login. Please enter your agent number followed by the pound key.','/var/lib/asterisk/sounds/en/agent-user.gsm',1),

(4260,4289,0,'transfer','','/var/lib/asterisk/sounds/en/transfer.gsm',1),

(4261,4290,0,'Already On','That agent is already logged on. Please enter your agent number followed by the pound key.','/var/lib/asterisk/sounds/en/agent-alreadyon.gsm',1),

(4262,4291,0,'vm-advopts','','/var/lib/asterisk/sounds/en/vm-advopts.gsm',1),

(4263,4292,0,'invalid','','/var/lib/asterisk/sounds/en/invalid.gsm',1),

(4264,4293,0,'Less Then','less then','/var/lib/asterisk/sounds/en/queue-less-than.gsm',1),

(4265,4294,0,'vm-prev','','/var/lib/asterisk/sounds/en/vm-prev.gsm',1),

(4266,4295,0,'vm-nomore','','/var/lib/asterisk/sounds/en/vm-nomore.gsm',1),

(4267,4296,0,'vm-tempremoved','','/var/lib/asterisk/sounds/en/vm-tempremoved.gsm',1),

(4268,4297,0,'privacy-unident','','/var/lib/asterisk/sounds/en/privacy-unident.gsm',1),

(4269,4298,0,'vm-whichbox','','/var/lib/asterisk/sounds/en/vm-whichbox.gsm',1),

(4270,4299,0,'Instructions','If this is the person you are looking for press one now. Otherwise please press star now.','/var/lib/asterisk/sounds/en/dir-instr.gsm',1),

(4272,4301,0,'vm-Cust3','','/var/lib/asterisk/sounds/en/vm-Cust3.gsm',1),

(4273,4302,0,'vm-saveoper','','/var/lib/asterisk/sounds/en/vm-saveoper.gsm',1),

(4274,4303,0,'queue-periodic-announce','','/var/lib/asterisk/sounds/en/queue-periodic-announce.gsm',1),

(4275,4304,0,'vm-unknown-caller','','/var/lib/asterisk/sounds/en/vm-unknown-caller.gsm',1),

(4276,4305,0,'vm-onefor','','/var/lib/asterisk/sounds/en/vm-onefor.gsm',1),

(4277,4306,0,'spy-h323','','/var/lib/asterisk/sounds/en/spy-h323.gsm',1),

(4278,4307,0,'vm-tooshort','','/var/lib/asterisk/sounds/en/vm-tooshort.gsm',1),

(4279,4308,0,'All Busy','All representatives of the household are currently assisting other telemarketers. Please hold and your call will be answered in the order it was received.','/var/lib/asterisk/sounds/en/tt-allbusy.gsm',1),

(4280,4309,0,'Incorrect','Login incorrect. Please enter your agent number followed by the pound key.','/var/lib/asterisk/sounds/en/agent-incorrect.gsm',1),

(4281,4310,0,'vm-tohearenv','','/var/lib/asterisk/sounds/en/vm-tohearenv.gsm',1),

(4282,4311,0,'priv-callpending','','/var/lib/asterisk/sounds/en/priv-callpending.gsm',1),

(4283,4312,0,'vm-toreply','','/var/lib/asterisk/sounds/en/vm-toreply.gsm',1),

(4284,4313,0,'vm-helpexit','','/var/lib/asterisk/sounds/en/vm-helpexit.gsm',1),

(4285,4314,0,'vm-Cust4','','/var/lib/asterisk/sounds/en/vm-Cust4.gsm',1),

(4286,4315,0,'vm-instructions','','/var/lib/asterisk/sounds/en/vm-instructions.gsm',1),

(4287,4316,0,'Logged In','Agent logged in.','/var/lib/asterisk/sounds/en/agent-loginok.gsm',1),

(4288,4317,0,'ascii92','','/var/lib/asterisk/sounds/en/letters/ascii92.gsm',1),

(4289,4318,0,'l','','/var/lib/asterisk/sounds/en/letters/l.gsm',1),

(4290,4319,0,'exclaimation-point','','/var/lib/asterisk/sounds/en/letters/exclaimation-point.gsm',1),

(4291,4320,0,'s','','/var/lib/asterisk/sounds/en/letters/s.gsm',1),

(4292,4321,0,'z','','/var/lib/asterisk/sounds/en/letters/z.gsm',1),

(4293,4322,0,'slash','','/var/lib/asterisk/sounds/en/letters/slash.gsm',1),

(4294,4323,0,'p','','/var/lib/asterisk/sounds/en/letters/p.gsm',1),

(4295,4324,0,'ascii93','','/var/lib/asterisk/sounds/en/letters/ascii93.gsm',1),

(4296,4325,0,'ascii39','','/var/lib/asterisk/sounds/en/letters/ascii39.gsm',1),

(4297,4326,0,'ascii40','','/var/lib/asterisk/sounds/en/letters/ascii40.gsm',1),

(4298,4327,0,'zed','','/var/lib/asterisk/sounds/en/letters/zed.gsm',1),

(4299,4328,0,'ascii62','','/var/lib/asterisk/sounds/en/letters/ascii62.gsm',1),

(4300,4329,0,'j','','/var/lib/asterisk/sounds/en/letters/j.gsm',1),

(4301,4330,0,'dash','','/var/lib/asterisk/sounds/en/letters/dash.gsm',1),

(4302,4331,0,'d','','/var/lib/asterisk/sounds/en/letters/d.gsm',1),

(4303,4332,0,'e','','/var/lib/asterisk/sounds/en/letters/e.gsm',1),

(4304,4333,0,'ascii123','','/var/lib/asterisk/sounds/en/letters/ascii123.gsm',1),

(4305,4334,0,'ascii44','','/var/lib/asterisk/sounds/en/letters/ascii44.gsm',1),

(4306,4335,0,'ascii36','','/var/lib/asterisk/sounds/en/letters/ascii36.gsm',1),

(4307,4336,0,'c','','/var/lib/asterisk/sounds/en/letters/c.gsm',1),

(4308,4337,0,'q','','/var/lib/asterisk/sounds/en/letters/q.gsm',1),

(4309,4338,0,'ascii95','','/var/lib/asterisk/sounds/en/letters/ascii95.gsm',1),

(4310,4339,0,'asterisk','','/var/lib/asterisk/sounds/en/letters/asterisk.gsm',1),

(4311,4340,0,'ascii42','','/var/lib/asterisk/sounds/en/letters/ascii42.gsm',1),

(4312,4341,0,'ascii38','','/var/lib/asterisk/sounds/en/letters/ascii38.gsm',1),

(4313,4342,0,'plus','','/var/lib/asterisk/sounds/en/letters/plus.gsm',1),

(4314,4343,0,'dot','','/var/lib/asterisk/sounds/en/letters/dot.gsm',1),

(4315,4344,0,'h','','/var/lib/asterisk/sounds/en/letters/h.gsm',1),

(4316,4345,0,'ascii34','','/var/lib/asterisk/sounds/en/letters/ascii34.gsm',1),

(4317,4346,0,'at','','/var/lib/asterisk/sounds/en/letters/at.gsm',1),

(4318,4347,0,'dollar','','/var/lib/asterisk/sounds/en/letters/dollar.gsm',1),

(4319,4348,0,'y','','/var/lib/asterisk/sounds/en/letters/y.gsm',1),

(4320,4349,0,'space','','/var/lib/asterisk/sounds/en/letters/space.gsm',1),

(4321,4350,0,'ascii96','','/var/lib/asterisk/sounds/en/letters/ascii96.gsm',1),

(4322,4351,0,'ascii124','','/var/lib/asterisk/sounds/en/letters/ascii124.gsm',1),

(4323,4352,0,'o','','/var/lib/asterisk/sounds/en/letters/o.gsm',1),

(4324,4353,0,'f','','/var/lib/asterisk/sounds/en/letters/f.gsm',1),

(4325,4354,0,'ascii91','','/var/lib/asterisk/sounds/en/letters/ascii91.gsm',1),

(4326,4355,0,'ascii94','','/var/lib/asterisk/sounds/en/letters/ascii94.gsm',1),

(4327,4356,0,'equals','','/var/lib/asterisk/sounds/en/letters/equals.gsm',1),

(4328,4357,0,'b','','/var/lib/asterisk/sounds/en/letters/b.gsm',1),

(4329,4358,0,'k','','/var/lib/asterisk/sounds/en/letters/k.gsm',1),

(4330,4359,0,'x','','/var/lib/asterisk/sounds/en/letters/x.gsm',1),

(4331,4360,0,'ascii125','','/var/lib/asterisk/sounds/en/letters/ascii125.gsm',1),

(4332,4361,0,'v','','/var/lib/asterisk/sounds/en/letters/v.gsm',1),

(4333,4362,0,'g','','/var/lib/asterisk/sounds/en/letters/g.gsm',1),

(4334,4363,0,'n','','/var/lib/asterisk/sounds/en/letters/n.gsm',1),

(4335,4364,0,'ascii59','','/var/lib/asterisk/sounds/en/letters/ascii59.gsm',1),

(4336,4365,0,'ascii41','','/var/lib/asterisk/sounds/en/letters/ascii41.gsm',1),

(4337,4366,0,'w','','/var/lib/asterisk/sounds/en/letters/w.gsm',1),

(4338,4367,0,'m','','/var/lib/asterisk/sounds/en/letters/m.gsm',1),

(4339,4368,0,'u','','/var/lib/asterisk/sounds/en/letters/u.gsm',1),

(4340,4369,0,'ascii63','','/var/lib/asterisk/sounds/en/letters/ascii63.gsm',1),

(4341,4370,0,'i','','/var/lib/asterisk/sounds/en/letters/i.gsm',1),

(4342,4371,0,'r','','/var/lib/asterisk/sounds/en/letters/r.gsm',1),

(4343,4372,0,'ascii58','','/var/lib/asterisk/sounds/en/letters/ascii58.gsm',1),

(4344,4373,0,'ascii37','','/var/lib/asterisk/sounds/en/letters/ascii37.gsm',1),

(4345,4374,0,'ascii126','','/var/lib/asterisk/sounds/en/letters/ascii126.gsm',1),

(4346,4375,0,'ascii60','','/var/lib/asterisk/sounds/en/letters/ascii60.gsm',1),

(4347,4376,0,'a','','/var/lib/asterisk/sounds/en/letters/a.gsm',1),

(4348,4377,0,'t','','/var/lib/asterisk/sounds/en/letters/t.gsm',1),

(4349,4378,0,'spy-mgcp','','/var/lib/asterisk/sounds/en/spy-mgcp.gsm',1),

(4350,4379,0,'spy-zap','','/var/lib/asterisk/sounds/en/spy-zap.gsm',1),

(4351,4380,0,'Hold Time','The estimated hold time is currently.','/var/lib/asterisk/sounds/en/queue-holdtime.gsm',1),

(4352,4381,0,'conf-lockednow','','/var/lib/asterisk/sounds/en/conf-lockednow.gsm',1),

(4353,4382,0,'vm-saved','','/var/lib/asterisk/sounds/en/vm-saved.gsm',1),

(4354,4383,0,'conf-errormenu','','/var/lib/asterisk/sounds/en/conf-errormenu.gsm',1),

(4355,4384,0,'spy-skinny','','/var/lib/asterisk/sounds/en/spy-skinny.gsm',1),

(4356,4385,0,'Logged Off','Agent logged off.','/var/lib/asterisk/sounds/en/agent-loggedoff.gsm',1),

(4357,4386,0,'vm-nonumber','','/var/lib/asterisk/sounds/en/vm-nonumber.gsm',1),

(4358,4387,0,'spy-iax2','','/var/lib/asterisk/sounds/en/spy-iax2.gsm',1),

(4359,4388,0,'minutes','','/var/lib/asterisk/sounds/en/minutes.gsm',1),

(4360,4389,0,'vm-deleted','','/var/lib/asterisk/sounds/en/vm-deleted.gsm',1),

(4361,4390,0,'Minutes','Minutes.','/var/lib/asterisk/sounds/en/queue-minutes.gsm',1),

(4362,4391,0,'conf-usermenu','','/var/lib/asterisk/sounds/en/conf-usermenu.gsm',1),

(4364,4393,0,'vm-tocallnum','','/var/lib/asterisk/sounds/en/vm-tocallnum.gsm',1),

(4365,4394,0,'privacy-incorrect','','/var/lib/asterisk/sounds/en/privacy-incorrect.gsm',1),

(4366,4395,0,'conf-placeintoconf','','/var/lib/asterisk/sounds/en/conf-placeintoconf.gsm',1),

(4367,4396,0,'Thank You','Thank You.','/var/lib/asterisk/sounds/en/auth-thankyou.gsm',1),

(4368,4397,0,'Monkeys','<Monkey Sounds>','/var/lib/asterisk/sounds/en/tt-monkeys.gsm',1),

(4369,4398,0,'vm-goodbye','','/var/lib/asterisk/sounds/en/vm-goodbye.gsm',1),

(4370,4399,0,'vm-extension','','/var/lib/asterisk/sounds/en/vm-extension.gsm',1),

(4371,4400,0,'conf-kicked','','/var/lib/asterisk/sounds/en/conf-kicked.gsm',1),

(4372,4401,0,'pbx-invalidpark','','/var/lib/asterisk/sounds/en/pbx-invalidpark.gsm',1),

(4373,4402,0,'vm-torerecord','','/var/lib/asterisk/sounds/en/vm-torerecord.gsm',1),

(4374,4403,0,'vm-sorry','','/var/lib/asterisk/sounds/en/vm-sorry.gsm',1),

(4375,4404,0,'vm-tocancelmsg','','/var/lib/asterisk/sounds/en/vm-tocancelmsg.gsm',1),

(4376,4405,0,'vm-starmain','','/var/lib/asterisk/sounds/en/vm-starmain.gsm',1),

(4377,4406,0,'vm-msgsaved','','/var/lib/asterisk/sounds/en/vm-msgsaved.gsm',1),

(4378,4407,0,'vm-star-cancel','','/var/lib/asterisk/sounds/en/vm-star-cancel.gsm',1),

(4379,4408,0,'record_mode','','/var/lib/asterisk/sounds/en/dictate/record_mode.gsm',1),

(4380,4409,0,'forhelp','','/var/lib/asterisk/sounds/en/dictate/forhelp.gsm',1),

(4381,4410,0,'both_help','','/var/lib/asterisk/sounds/en/dictate/both_help.gsm',1),

(4382,4411,0,'enter_filename','','/var/lib/asterisk/sounds/en/dictate/enter_filename.gsm',1),

(4383,4412,0,'playback','','/var/lib/asterisk/sounds/en/dictate/playback.gsm',1),

(4384,4413,0,'playback_mode','','/var/lib/asterisk/sounds/en/dictate/playback_mode.gsm',1),

(4385,4414,0,'record','','/var/lib/asterisk/sounds/en/dictate/record.gsm',1),

(4386,4415,0,'play_help','','/var/lib/asterisk/sounds/en/dictate/play_help.gsm',1),

(4387,4416,0,'paused','','/var/lib/asterisk/sounds/en/dictate/paused.gsm',1),

(4388,4417,0,'truncating_audio','','/var/lib/asterisk/sounds/en/dictate/truncating_audio.gsm',1),

(4389,4418,0,'record_help','','/var/lib/asterisk/sounds/en/dictate/record_help.gsm',1),

(4390,4419,0,'pause','','/var/lib/asterisk/sounds/en/dictate/pause.gsm',1),

(4391,4420,0,'conf-unlockednow','','/var/lib/asterisk/sounds/en/conf-unlockednow.gsm',1),

(4392,4421,0,'vm-intro','','/var/lib/asterisk/sounds/en/vm-intro.gsm',1),

(4393,4422,0,'vm-incorrect-mailbox','','/var/lib/asterisk/sounds/en/vm-incorrect-mailbox.gsm',1),

(4394,4423,0,'Calls Waiting','Waiting to speak to a representative.','/var/lib/asterisk/sounds/en/queue-callswaiting.gsm',1),

(4395,4424,0,'vm-msginstruct','','/var/lib/asterisk/sounds/en/vm-msginstruct.gsm',1),

(4396,4425,0,'vm-and','','/var/lib/asterisk/sounds/en/vm-and.gsm',1),

(4397,4426,0,'vm-toforward','','/var/lib/asterisk/sounds/en/vm-toforward.gsm',1),

(4398,4427,0,'New Extension','Please enter a new extension followed by pound.','/var/lib/asterisk/sounds/en/agent-newlocation.gsm',1),

(4399,4428,0,'vm-isonphone','','/var/lib/asterisk/sounds/en/vm-isonphone.gsm',1),

(4400,4429,0,'vm-isunavail','','/var/lib/asterisk/sounds/en/vm-isunavail.gsm',1),

(4401,4430,0,'You Are Next','Your call is now first in line and will be answered by the next available representative.','/var/lib/asterisk/sounds/en/queue-youarenext.gsm',1),

(4402,4431,0,'priv-recordintro','','/var/lib/asterisk/sounds/en/priv-recordintro.gsm',1),

(4403,4432,0,'vm-options','','/var/lib/asterisk/sounds/en/vm-options.gsm',1),

(4404,4433,0,'vm-delete','','/var/lib/asterisk/sounds/en/vm-delete.gsm',1),

(4405,4434,0,'conf-adminmenu','','/var/lib/asterisk/sounds/en/conf-adminmenu.gsm',1),

(4406,4435,0,'vm-minutes','','/var/lib/asterisk/sounds/en/vm-minutes.gsm',1),

(4407,4436,0,'conf-getchannel','','/var/lib/asterisk/sounds/en/conf-getchannel.gsm',1),

(4408,4437,0,'vm-first','','/var/lib/asterisk/sounds/en/vm-first.gsm',1),

(4409,4438,0,'priv-callee-options','','/var/lib/asterisk/sounds/en/priv-callee-options.gsm',1),

(4410,4439,0,'vm-from-extension','','/var/lib/asterisk/sounds/en/vm-from-extension.gsm',1),

(4411,4440,0,'vm-review','','/var/lib/asterisk/sounds/en/vm-review.gsm',1),

(4412,4441,0,'conf-userswilljoin','','/var/lib/asterisk/sounds/en/conf-userswilljoin.gsm',1),

(4413,4442,0,'conf-otherinparty','','/var/lib/asterisk/sounds/en/conf-otherinparty.gsm',1),

(4414,4443,0,'conf-invalid','','/var/lib/asterisk/sounds/en/conf-invalid.gsm',1),

(4415,4444,0,'hours','','/var/lib/asterisk/sounds/en/hours.gsm',1),

(4416,4445,0,'vm-repeat','','/var/lib/asterisk/sounds/en/vm-repeat.gsm',1),

(4418,4447,0,'beeperr','','/var/lib/asterisk/sounds/en/beeperr.gsm',1),

(4419,4448,0,'vm-message','','/var/lib/asterisk/sounds/en/vm-message.gsm',1),

(4420,4449,0,'vm-rec-unv','','/var/lib/asterisk/sounds/en/vm-rec-unv.gsm',1),

(4421,4450,0,'seconds','','/var/lib/asterisk/sounds/en/seconds.gsm',1),

(4423,4452,0,'vm-passchanged','','/var/lib/asterisk/sounds/en/vm-passchanged.gsm',1),

(4424,4453,0,'spy-iax','','/var/lib/asterisk/sounds/en/spy-iax.gsm',1),

(4425,4454,0,'vm-no','','/var/lib/asterisk/sounds/en/vm-no.gsm',1),

(4426,4455,0,'conf-unmuted','','/var/lib/asterisk/sounds/en/conf-unmuted.gsm',1),

(4427,4456,0,'conf-locked','','/var/lib/asterisk/sounds/en/conf-locked.gsm',1),

(4428,4457,0,'vm-tempgreeting','','/var/lib/asterisk/sounds/en/vm-tempgreeting.gsm',1),

(4429,4458,0,'Incorrect','Password incorrect. Please enter your password followed by the pound key.','/var/lib/asterisk/sounds/en/auth-incorrect.gsm',1),

(4430,4459,0,'status','','/var/lib/asterisk/sounds/en/followme/status.gsm',1),

(4431,4460,0,'call-from','','/var/lib/asterisk/sounds/en/followme/call-from.gsm',1),

(4432,4461,0,'sorry','','/var/lib/asterisk/sounds/en/followme/sorry.gsm',1),

(4433,4462,0,'options','','/var/lib/asterisk/sounds/en/followme/options.gsm',1),

(4434,4463,0,'pls-hold-while-try','','/var/lib/asterisk/sounds/en/followme/pls-hold-while-try.gsm',1),

(4435,4464,0,'no-recording','','/var/lib/asterisk/sounds/en/followme/no-recording.gsm',1),

(4436,4465,0,'vm-savemessage','','/var/lib/asterisk/sounds/en/vm-savemessage.gsm',1),

(4437,4466,0,'vm-newuser','','/var/lib/asterisk/sounds/en/vm-newuser.gsm',1),

(4438,4467,0,'conf-muted','','/var/lib/asterisk/sounds/en/conf-muted.gsm',1),

(4439,4468,0,'vm-rec-busy','','/var/lib/asterisk/sounds/en/vm-rec-busy.gsm',1),

(4440,4469,0,'No More Entries','There are no more compatible entires in the directory.','/var/lib/asterisk/sounds/en/dir-nomore.gsm',1),

(4441,4470,0,'dir-multi3','','/var/lib/asterisk/sounds/en/dir-multi3.gsm',1),

(4442,4471,0,'conf-hasjoin','','/var/lib/asterisk/sounds/en/conf-hasjoin.gsm',1),

(4443,4472,0,'vm-Work','','/var/lib/asterisk/sounds/en/vm-Work.gsm',1),

(4444,4473,0,'vm-calldiffnum','','/var/lib/asterisk/sounds/en/vm-calldiffnum.gsm',1),

(4445,4474,0,'vm-rec-name','','/var/lib/asterisk/sounds/en/vm-rec-name.gsm',1),

(4446,4475,0,'vm-tocallback','','/var/lib/asterisk/sounds/en/vm-tocallback.gsm',1),

(4447,4476,0,'vm-reenterpassword','','/var/lib/asterisk/sounds/en/vm-reenterpassword.gsm',1),

(4448,4477,0,'vm-for','','/var/lib/asterisk/sounds/en/vm-for.gsm',1),

(4449,4478,0,'pbx-invalid','','/var/lib/asterisk/sounds/en/pbx-invalid.gsm',1),

(4450,4479,0,'Weasles','Weasels have eaten our phone system.','/var/lib/asterisk/sounds/en/tt-weasels.gsm',1),

(4451,4480,0,'Password','Please enter your password followed by the pound key.','/var/lib/asterisk/sounds/en/agent-pass.gsm',1),

(4452,4481,0,'vm-reachoper','','/var/lib/asterisk/sounds/en/vm-reachoper.gsm',1),

(4454,4483,0,'vm-password','','/var/lib/asterisk/sounds/en/vm-password.gsm',1),

(4456,4485,0,'vm-savedto','','/var/lib/asterisk/sounds/en/vm-savedto.gsm',1),

(4458,4487,0,'vm-Cust2','','/var/lib/asterisk/sounds/en/vm-Cust2.gsm',1),

(4459,4488,0,'screen-callee-options','','/var/lib/asterisk/sounds/en/screen-callee-options.gsm',1),

(4460,4489,0,'dir-multi1','','/var/lib/asterisk/sounds/en/dir-multi1.gsm',1),

(4461,4490,0,'vm-incorrect','','/var/lib/asterisk/sounds/en/vm-incorrect.gsm',1),

(4462,4491,0,'vm-enter-num-to-call','','/var/lib/asterisk/sounds/en/vm-enter-num-to-call.gsm',1),

(4463,4492,0,'queue-quantity1','','/var/lib/asterisk/sounds/en/queue-quantity1.gsm',1),

(4464,4493,0,'vm-INBOX','','/var/lib/asterisk/sounds/en/vm-INBOX.gsm',1),

(4465,4494,0,'vm-forward','','/var/lib/asterisk/sounds/en/vm-forward.gsm',1),

(4466,4495,0,'vm-from','','/var/lib/asterisk/sounds/en/vm-from.gsm',1),

(4467,4496,0,'vm-mailboxfull','','/var/lib/asterisk/sounds/en/vm-mailboxfull.gsm',1),

(4468,4497,0,'vm-toenternumber','','/var/lib/asterisk/sounds/en/vm-toenternumber.gsm',1),

(4469,4498,0,'conf-thereare','','/var/lib/asterisk/sounds/en/conf-thereare.gsm',1),

(4470,4499,0,'vm-opts','','/var/lib/asterisk/sounds/en/vm-opts.gsm',1),

(4471,4500,0,'vm-leavemsg','','/var/lib/asterisk/sounds/en/vm-leavemsg.gsm',1),

(4472,4501,0,'vm-Cust1','','/var/lib/asterisk/sounds/en/vm-Cust1.gsm',1),

(4473,4502,0,'4','','/var/lib/asterisk/sounds/en/silence/4.gsm',1),

(4474,4503,0,'8','','/var/lib/asterisk/sounds/en/silence/8.gsm',1),

(4475,4504,0,'10','','/var/lib/asterisk/sounds/en/silence/10.gsm',1),

(4476,4505,0,'7','','/var/lib/asterisk/sounds/en/silence/7.gsm',1),

(4477,4506,0,'6','','/var/lib/asterisk/sounds/en/silence/6.gsm',1),

(4478,4507,0,'3','','/var/lib/asterisk/sounds/en/silence/3.gsm',1),

(4479,4508,0,'2','','/var/lib/asterisk/sounds/en/silence/2.gsm',1),

(4480,4509,0,'5','','/var/lib/asterisk/sounds/en/silence/5.gsm',1),

(4481,4510,0,'1','','/var/lib/asterisk/sounds/en/silence/1.gsm',1),

(4482,4511,0,'9','','/var/lib/asterisk/sounds/en/silence/9.gsm',1),

(4483,4512,0,'pbx-transfer','','/var/lib/asterisk/sounds/en/pbx-transfer.gsm',1),

(4484,4513,0,'conf-userwilljoin','','/var/lib/asterisk/sounds/en/conf-userwilljoin.gsm',1),

(4485,4514,0,'vm-newpassword','','/var/lib/asterisk/sounds/en/vm-newpassword.gsm',1),

(4486,4515,0,'vm-Cust5','','/var/lib/asterisk/sounds/en/vm-Cust5.gsm',1),

(4487,4516,0,'vm-login','','/var/lib/asterisk/sounds/en/vm-login.gsm',1),

(4488,4517,0,'Monkeys Have','They have been carried away by monkeys.','/var/lib/asterisk/sounds/en/tt-monkeysintro.gsm',1),

(4489,4518,0,'vm-theperson','','/var/lib/asterisk/sounds/en/vm-theperson.gsm',1),

(4490,4519,0,'ss-noservice','','/var/lib/asterisk/sounds/en/ss-noservice.gsm',1),

(4491,4520,0,'beep','','/var/lib/asterisk/sounds/en/beep.gsm',1),

(4492,4521,0,'vm-Friends','','/var/lib/asterisk/sounds/en/vm-Friends.gsm',1),

(4493,4522,0,'Introduction (Firstname)','Welcome to the directory. Please enter the first three letters of your party\'s first name. Use the 7 key for Q and the 9 key for Z.','/var/lib/asterisk/sounds/en/dir-intro-fn.gsm',1),

(4494,4523,0,'vm-messages','','/var/lib/asterisk/sounds/en/vm-messages.gsm',1),

(4496,4525,0,'vm-dialout','','/var/lib/asterisk/sounds/en/vm-dialout.gsm',1),

(4497,4526,0,'vm-next','','/var/lib/asterisk/sounds/en/vm-next.gsm',1),

(4498,4527,0,'l_p','','/var/lib/asterisk/sounds/en/phonetic/l_p.gsm',1),

(4499,4528,0,'g_p','','/var/lib/asterisk/sounds/en/phonetic/g_p.gsm',1),

(4500,4529,0,'j_p','','/var/lib/asterisk/sounds/en/phonetic/j_p.gsm',1),

(4501,4530,0,'q_p','','/var/lib/asterisk/sounds/en/phonetic/q_p.gsm',1),

(4502,4531,0,'n_p','','/var/lib/asterisk/sounds/en/phonetic/n_p.gsm',1),

(4503,4532,0,'t_p','','/var/lib/asterisk/sounds/en/phonetic/t_p.gsm',1),

(4504,4533,0,'a_p','','/var/lib/asterisk/sounds/en/phonetic/a_p.gsm',1),

(4505,4534,0,'m_p','','/var/lib/asterisk/sounds/en/phonetic/m_p.gsm',1),

(4506,4535,0,'h_p','','/var/lib/asterisk/sounds/en/phonetic/h_p.gsm',1),

(4507,4536,0,'d_p','','/var/lib/asterisk/sounds/en/phonetic/d_p.gsm',1),

(4508,4537,0,'p_p','','/var/lib/asterisk/sounds/en/phonetic/p_p.gsm',1),

(4509,4538,0,'o_p','','/var/lib/asterisk/sounds/en/phonetic/o_p.gsm',1),

(4510,4539,0,'w_p','','/var/lib/asterisk/sounds/en/phonetic/w_p.gsm',1),

(4511,4540,0,'r_p','','/var/lib/asterisk/sounds/en/phonetic/r_p.gsm',1),

(4512,4541,0,'b_p','','/var/lib/asterisk/sounds/en/phonetic/b_p.gsm',1),

(4513,4542,0,'i_p','','/var/lib/asterisk/sounds/en/phonetic/i_p.gsm',1),

(4514,4543,0,'c_p','','/var/lib/asterisk/sounds/en/phonetic/c_p.gsm',1),

(4515,4544,0,'x_p','','/var/lib/asterisk/sounds/en/phonetic/x_p.gsm',1),

(4516,4545,0,'s_p','','/var/lib/asterisk/sounds/en/phonetic/s_p.gsm',1),

(4517,4546,0,'v_p','','/var/lib/asterisk/sounds/en/phonetic/v_p.gsm',1),

(4518,4547,0,'y_p','','/var/lib/asterisk/sounds/en/phonetic/y_p.gsm',1),

(4519,4548,0,'f_p','','/var/lib/asterisk/sounds/en/phonetic/f_p.gsm',1),

(4520,4549,0,'z_p','','/var/lib/asterisk/sounds/en/phonetic/z_p.gsm',1),

(4521,4550,0,'9_p','','/var/lib/asterisk/sounds/en/phonetic/9_p.gsm',1),

(4522,4551,0,'k_p','','/var/lib/asterisk/sounds/en/phonetic/k_p.gsm',1),

(4523,4552,0,'u_p','','/var/lib/asterisk/sounds/en/phonetic/u_p.gsm',1),

(4524,4553,0,'e_p','','/var/lib/asterisk/sounds/en/phonetic/e_p.gsm',1),

(4525,4554,0,'vm-press','','/var/lib/asterisk/sounds/en/vm-press.gsm',1),

(4526,4555,0,'vm-forwardoptions','','/var/lib/asterisk/sounds/en/vm-forwardoptions.gsm',1),

(4527,4556,0,'vm-last','','/var/lib/asterisk/sounds/en/vm-last.gsm',1),

(4528,4557,0,'dir-multi9','','/var/lib/asterisk/sounds/en/dir-multi9.gsm',1),

(4529,4558,0,'dir-multi2','','/var/lib/asterisk/sounds/en/dir-multi2.gsm',1),

(4530,4559,0,'vm-duration','','/var/lib/asterisk/sounds/en/vm-duration.gsm',1),

(4531,4560,0,'vm-undeleted','','/var/lib/asterisk/sounds/en/vm-undeleted.gsm',1),

(4532,4561,0,'queue-quantity2','','/var/lib/asterisk/sounds/en/queue-quantity2.gsm',1),

(4533,4562,0,'privacy-prompt','','/var/lib/asterisk/sounds/en/privacy-prompt.gsm',1),

(4534,4563,0,'Seconds','Seconds.','/var/lib/asterisk/sounds/en/queue-seconds.gsm',1),

(4535,4564,0,'conf-noempty','','/var/lib/asterisk/sounds/en/conf-noempty.gsm',1),

(4536,4565,0,'vm-Old','','/var/lib/asterisk/sounds/en/vm-Old.gsm',1),

(4537,4566,0,'vm-then-pound','','/var/lib/asterisk/sounds/en/vm-then-pound.gsm',1),

(4558,0,0,'','','',0);

/*Data for the table `SoundFolders` */

insert  into `SoundFolders`(`PK_SoundFolder`,`Name`,`Description`,`Type`) values 

(1,'Unsorted','','System'),
(2,'Conference','','System'),
(8,'Digits','','System'),
(9,'Agent','','System'),
(10,'Authentication','','System'),
(11,'Call Queues','','System'),
(12,'Days','','System'),
(13,'Directory','','System'),
(14,'Voicemail','','System'),
(18,'Humor','','System'),
(16,'Months','','System'),
(19,'IVR','','System'),
(20,'Letters','','System'),
(21,'Miscellaneous','','System'),
(22,'Phonetic','','System'),
(23,'Privacy','','System');

/*Data for the table `SoundLanguages` */

insert  into `SoundLanguages`(`PK_SoundLanguage`,`Name`,`Type`,`Default`) values 

(1,'English','System',1);

/*Data for the table `SoundPacks` */

insert  into `SoundPacks`(`PK_SoundPack`,`Name`) values 

(1,'Default Sounds');

/*Data for the table `Templates` */

insert  into `Templates`(`PK_Template`,`Name`,`Name_Editable`,`Password_Editable`,`Email_Editable`,`FK_NATType`,`FK_DTMFMode`,`IVRDial`,`Protected`) values 

(1,'Default',1,1,1,2,1,1,1);

/*Data for the table `Timeframe_Intervals` */

insert  into `Timeframe_Intervals`(`PK_Interval`,`FK_Timeframe`,`StartDate`,`EndDate`,`StartDay`,`EndDay`,`StartTime`,`StartTimeMode`,`EndTime`,`EndTimeMode`,`OrderDummy`) values 

(1,1,'2015-01-01','2015-04-01',0,0,'','AM','','AM','2015-04-12 00:24:33'),
(2,1,'2015-04-03','2015-04-03',0,0,'','AM','','AM','2015-04-12 00:24:47'),
(3,1,'2015-04-06','2015-04-06',0,0,'','AM','','AM','2015-04-12 00:24:57'),
(4,1,'2015-05-04','2015-05-04',0,0,'','AM','','AM','2015-04-12 00:25:11'),
(5,1,'2015-05-25','2015-05-25',0,0,'','AM','','AM','2015-04-12 00:25:25'),
(6,1,'2015-08-31','2015-08-31',0,0,'','AM','','AM','2015-04-12 00:25:40'),
(7,1,'2015-12-25','2015-12-28',0,0,'','AM','','AM','2015-04-12 00:26:00'),
(8,2,'0000-00-00','0000-00-00',6,7,'','AM','','AM','2015-06-28 20:59:22'),
(9,3,'0000-00-00','0000-00-00',1,5,'','AM','','AM','2015-06-28 20:59:38');

/*Data for the table `Timeframes` */

insert  into `Timeframes`(`PK_Timeframe`,`Name`,`FK_Extension`) values 

(1,'Bank Holidays',0),
(2,'Weekends',0),
(3,'Workdays',0);
