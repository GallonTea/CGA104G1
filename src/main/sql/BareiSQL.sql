create database if not exists ba_rei;
use ba_rei;

-- 新增會員表格
create table MEMBER (
MEM_ID int not null auto_increment comment '會員編號',
MEM_ACCOUNT varchar(40) not null comment '會員帳號',
MEM_PASSWORD varchar(40) not null comment '會員密碼',
MEM_NAME varchar(40) not null comment '會員姓名',
MEM_ADDRESS varchar(200) not null comment '會員地址',
MEM_PHONE varchar(10) not null comment '會員電話',
MEM_UID varchar(10) not null comment '會員身分證字號',
MEM_EMAIL varchar(200) not null comment '會員電子信箱',
MEM_SEX varchar(10) not null comment '會員性別',
MEM_DOB date not null comment '會員生日',
MEM_STATUS tinyint not null default 1 comment '會員狀態 0:停權 1:未驗證  2:已啟用',
primary key (MEM_ID)
);

insert into MEMBER (MEM_ACCOUNT,MEM_PASSWORD,MEM_NAME,MEM_ADDRESS,MEM_PHONE,MEM_UID,MEM_EMAIL,MEM_SEX,MEM_DOB,MEM_STATUS)
values
('admin','admin','管理員','桃園市八德區興豐路521號','0955646766','F125675789','a99403@gmail.com','男','1985-1-2',1),
('test01','123456','章魚保羅','桃園市中壢區延平路一段169號','0988787535','H123456789','a2345@gmail.com','男','1980-11-04',1),
('test02','123456','五月花','桃園市桃園區中正路1178號','0912734535','A223456789','afg4435@gmail.com','女','1985-2-24',1),
('test03','123456','閃電俠','桃園市觀音區濱海遊憩區','0955646766','F125675789','a99403@gmail.com','男','1985-1-2',1),
('test04','123456','普羅斯旺','桃園市中壢區中大路300號','0997433253','w100012345','TEST@gmail.com','男','1999-01-01',0),
('test05','123456','鄭成功','金門縣金湖鎮新市里市港六路158號','0916345449','w100024345','TEST00@gmail.com','男','1999-04-01',1),
('test06','123456','梯八密','桃園市中壢區復興路11號','0907457111','w290000201','TEST426@gmail.com','女','1994-01-01',2);

-- 新增員工表格
create table EMP(
EMP_ID int not null  primary key auto_increment comment '員工編號',
EMP_NAME varchar(30) not null comment '員工名稱',
`ACCOUNT`  varchar(20) not null comment '員工帳戶',
`PASSWORD` varchar(20) not null comment '員工密碼',
ONJOB_DATE datetime not null comment '到職時間 ',
EMP_STATUS tinyint default 1 not null comment '狀態 0: 離職 ,1: 在職'
);

insert into EMP(EMP_NAME,ACCOUNT,PASSWORD,ONJOB_DATE,EMP_STATUS) values('管李元','admin','admin','2001-01-01',1);
insert into EMP(EMP_NAME,ACCOUNT,PASSWORD,ONJOB_DATE,EMP_STATUS) values('王英俊','a0002','a0002','2001-01-11',1);
insert into EMP(EMP_NAME,ACCOUNT,PASSWORD,ONJOB_DATE,EMP_STATUS) values('菜瀝青','a0003','a0003','2001-01-13',0);
insert into EMP(EMP_NAME,ACCOUNT,PASSWORD,ONJOB_DATE,EMP_STATUS) values('陳饜銀','a0004','a0004','2001-01-15',1);
insert into EMP(EMP_NAME,ACCOUNT,PASSWORD,ONJOB_DATE,EMP_STATUS) values('鄭文延','a0005','a0005','2001-02-27',1);
insert into EMP(EMP_NAME,ACCOUNT,PASSWORD,ONJOB_DATE,EMP_STATUS) values('官燈火','a0006','a0006','2001-03-31',0);


-- 新增通知表格 
create table NOTIFICATION(
NTF_ID int not null auto_increment comment'通知編號',
MEM_ID int not null comment'會員編號',
NTF_CONTEXT varchar (500) not null comment'通知內容', 
NTF_TIME timestamp default current_timestamp not null comment'通知時間',
NTF_READ tinyint not null default 0 comment'通知閱讀 0:未閱讀 1:已閱讀',
primary key (NTF_ID),
constraint fk_NOTIFICATION_MEM_ID foreign key (MEM_ID) references MEMBER(MEM_ID)

);

insert into NOTIFICATION(MEM_ID,NTF_CONTEXT,NTF_TIME,NTF_READ)
values(2,'測試測試','2022-10-14 12:10:10',0);

-- 新增認證碼表格
create table VERIFY_CODE(
VC_ID int not null auto_increment comment "驗證碼編號",
MEM_ID int not null comment "會員編號",
VC_code varchar(20) not null comment "驗證碼編號",
VC_TIME timestamp default current_timestamp comment "生產時間",
primary key (VC_ID),
constraint FK_VERIFY_CODE_MEM_ID foreign key (MEM_ID) references MEMBER (MEM_ID)
);


insert into VERIFY_CODE(MEM_ID,VC_CODE)
values
(1,"r5Y7IE35"),
(2,"R0y3F7gU");

-- 新增功能表格
create table EFFECT(
EFFECT_ID int auto_increment primary key,
EFFECT_NAME varchar(50),
EFFECT_INFO varchar(255)
);

insert into EFFECT(EFFECT_NAME,EFFECT_INFO)
values
('會員管理','負責會員資料處理'),
('商城管理','負責商城資料管理'),
('團購管理','負責團購資料管理'),
('貼文管理','負責貼文資料管理'),
('客服管理','負責處理及時客服'),
('員工管理','負責管理員工,及所有管理權限');



-- 新增員工權限
create table EMP_EFFECT(
EMP_ID int not null ,
EFFECT_ID int not null ,
primary key (EMP_ID,EFFECT_ID)
);

insert into EMP_EFFECT(EMP_ID,EFFECT_ID)
values
(1,'1'),
(1,'2'),
(1,'3'),
(1,'4'),
(1,'5'),
(1,'6'),
(3,'3'),
(4,'4'),
(5,'5'),
(2,'2');



-- 新增客服紀錄表格
create table CUSTOMER_SERVICE(
CS_ID int not null auto_increment comment '事件編號',
MEM_ID int not null comment '會員編號',
EMP_ID int  comment '員工編號',
CS_TIME timestamp not null default current_timestamp comment '訊息時間',
CS_CONTEXT varchar(500) not null comment '訊息內容',
CS_POINTER tinyint not null comment '訊息方向',
primary key (CS_ID),
constraint fk_CUSTOMER_SERVICE_EMP_ID foreign key (EMP_ID) references EMP(EMP_ID),
constraint fk_CUSTOMER_SERVICE_MEM_ID foreign key (MEM_ID) references MEMBER(MEM_ID)

);
insert into CUSTOMER_SERVICE(MEM_ID,EMP_ID,CS_TIME,CS_CONTEXT,CS_POINTER)
values
(2,1,'2022-10-14','try try',0),
(1,1,'2022-10-16','comm',0);


-- 創建 折價券 表格
create table COUPON(
	COUPON_ID             int not null primary key auto_increment,
	COUPON_NAR            varchar(255) not null,
	COUPON_VAL            int not null,
	RECEIVE_START         date not null,
	RECEIVE_OVER          date not null,
	USE_START             date not null,
	USE_OVER              date not null,
	MINIMUM               int not null
    );

insert into COUPON(COUPON_NAR, COUPON_VAL, RECEIVE_START, RECEIVE_OVER, USE_START, USE_OVER, MINIMUM)
 value ('會員入會禮300元折價券', 300, '2020-10-10', '2077-12-30', '2020-10-10', '2077-12-30', 999);

-- 新增會員持有折價券表格
create table MEMBER_COUPON(
COUPON_ID int not null,
MEM_ID int not null,
MCPN_GETTIME timestamp not null default current_timestamp comment'領取時間',
MCPN_USE tinyint not null default 0 comment '折價券使用 0:未使用 1:已使用 2:已逾期',
primary key (COUPON_ID,MEM_ID),
constraint fk_MEMBER_COUPON_COUPON_ID foreign key (COUPON_ID) references COUPON(COUPON_ID),
constraint fk_MEMBER_COUPON_MEM_ID foreign key (MEM_ID) references MEMBER(MEM_ID)
);
insert into MEMBER_COUPON(COUPON_ID,MEM_ID,MCPN_USE)
values
(1,1,0),
(1,2,0);


-- 新增認證醫生
create table QUALIFIED_DOCTOR(
DOC_ID int not null auto_increment comment'認證醫生編號',
MEM_ID int not null comment'會員編號',
DOC_STATUS tinyint not null default 1 comment'身分狀態 0:關閉中 1:啟用中',
primary key (DOC_ID),
constraint fk_QUALIFIED_DOCTOR_MEM_ID foreign key (MEM_ID) references MEMBER(MEM_ID)
);

insert into QUALIFIED_DOCTOR(MEM_ID,DOC_STATUS)
values(3,1);

-- 創建 商品類別 表格
create table ITEM_TYPE(
	ITEMT_ID             int not null primary key auto_increment,
	ITEMT_NAME           varchar(200) not null
    );

insert into ITEM_TYPE (ITEMT_NAME) value ('飲食/飲水');
insert into ITEM_TYPE (ITEMT_NAME) value ('狗狗飼料');
insert into ITEM_TYPE (ITEMT_NAME) value ('貓咪飼料');
insert into ITEM_TYPE (ITEMT_NAME) value ('貓狗罐頭');
insert into ITEM_TYPE (ITEMT_NAME) value ('貓狗零食');
insert into ITEM_TYPE (ITEMT_NAME) value ('寵物保健');
insert into ITEM_TYPE (ITEMT_NAME) value ('貓砂尿布');
insert into ITEM_TYPE (ITEMT_NAME) value ('抓板玩具');
insert into ITEM_TYPE (ITEMT_NAME) value ('美容護理');
insert into ITEM_TYPE (ITEMT_NAME) value ('清潔用品');
insert into ITEM_TYPE (ITEMT_NAME) value ('居家用品');
insert into ITEM_TYPE (ITEMT_NAME) value ('外出用品');

-- 創建 商品 表格
create table ITEM(
	ITEM_ID              int not null primary key auto_increment,
	ITEMT_ID             int not null,
	ITEM_NAME            varchar(200) not null,
	ITEM_CONTENT         text not null,
	ITEM_PRICE           int not null,
	ITEM_AMOUNT          int not null,
	ITEM_STATUS          tinyint not null default 0 comment '0:未上架, 1:已上架;',
	ITEM_DATE            date not null,
	ITEM_ENDDATE         date not null
    );
    
alter table ITEM add constraint FK_ITEM_ITEMT_ID foreign key (ITEMT_ID) references ITEM_TYPE (ITEMT_ID);
    
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (1, '[Zeniter先立特] 頂級無穀幼母犬1.2kg 幼母犬糧 狗飼料', '好吃喔', 499, 999, 0, '2020-01-01', '2023-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (5, '[極致Origg] 愛貓守護8無穀配方貓飼料', '好吃喔', 340, 999, 1, '2020-01-01', '2023-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (11, 'Petkit 小佩智能感應式除臭貓砂盆', '貓砂盆', 2380, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (11, '韓系makesure 麻薯半封閉式貓砂盆-三色', '貓砂盆', 2580, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (11, '【哈燒新品】UAH 貓砂盆智能伴侶-除臭專用-二代', '貓砂盆', 780, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (10, 'PIDAN 貓咪防砂墊 貓砂墊', '貓砂墊', 499, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (19, 'Petkit 小佩 寵物智能去味器-除臭首推', '去味器', 790, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (19, '【熱銷新品】UAH 負離子寵物梳 不傷健康毛囊', '寵物梳', 690, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (19, 'LED燈-照血管寵物指甲剪-隨機色', '指甲剪', 180, 959, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (10, '【團購訂制款】吸盤式瓦楞貓抓板', '超猛的!', 690, 117, 0, '2020-1-1', '2020-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (19, '【『爆玩新品』PIDAN 電動小雪怪-翻滾玩具', '玩具', 160, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (10, '美國CATIT 牆角磨蹭器', '磨蹭器', 140, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (10, '「日本超夯」滿月隧道 貓窩 隧道-兩色', '貓隧道', 649, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (10, '不倒翁 漏食球 可裝飼料零食(貓用)', '玩具', 165, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (10, 'PIDAN 寵物餵食針筒', '針筒', 185, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (10, 'PETKIT 小佩 寵物按摩梳 神奇梳毛 按摩梳 貓咪最愛', '按摩梳', 165, 999, 1, '2020-1-1', '2025-12-30');
-- insert into ITEM (ITEMT_ID, ITEM_NAME, ITEM_CONTENT, ITEM_PRICE, ITEM_AMOUNT, ITEM_STATUS, ITEM_DATE, ITEM_ENDDATE)
--     value (19, '寵物吸盤窩 觀景好幫手', 'Good', 599, 929, 1, '2022-1-1', '2025-12-30');


-- 創建 商品訂單 表格
create table ORDER_BUY(
	ORDER_ID             int not null primary key auto_increment,
	MEM_ID               int not null,
	ORIGINAL_PRICE       int not null,
	DISCOUNT_PRICE       int not null,
   	FINAL_PRICE          int not null,
	ORDER_DATE           datetime not null,
	ORDER_PAYING         tinyint not null comment '0:貨到付款, 1:ATM轉帳, 2:信用卡;',  
	ORDER_SEND           tinyint not null comment '0:宅配, 1:便利商店;',
	ORDER_STATUS         tinyint not null default 0 comment '0: 等待付款中, 1: 已取消, 2: 等待賣家確認中, 3: 準備出貨中, 4: 已出貨, 5: 未取貨，退回平台, 6.已取貨 , 7.退貨, 8.換貨;',
	ORDER_OTHER          text,
	TRACKING_NUM         varchar(15),
	RECEIVER_NAME        varchar(100) not null,
	RECEIVER_ADDRESS     varchar(200),
	RECEIVER_PHONE       varchar(20) not null,
	PICKUP_TIME          timestamp
    );
    
alter table ORDER_BUY add constraint FK_ORDER_BY_MEM_ID foreign key (MEM_ID) references `MEMBER` (MEM_ID);
    
-- 創建 訂單明細 表格
create table COMMODITY_DETAILS(
	ORDER_ID             int not null,
	ITEM_ID              int not null,
	ITEM_NAME            varchar(200) not null,
	CD_AMOUNT            int not null,
	ITEM_PRICE           int not null,
    primary key(ORDER_ID, ITEM_ID)
    );
    
alter table COMMODITY_DETAILS add constraint FK_COMMODITY_DETAILS_ORDER_ID foreign key (ORDER_ID) references ORDER_BUY (ORDER_ID);
alter table COMMODITY_DETAILS add constraint FK_COMMODITY_DETAILS_ITEM_ID foreign key (ITEM_ID) references ITEM (ITEM_ID) on delete cascade;

-- 創建 商品評價 表格
create table SHOP_REVIEW(
	SHOP_REVIEW_ID       int not null primary key auto_increment,
	ITEM_ID              int not null,
	MEM_ID               int not null,
	SHOP_COMMENT_CONTENT varchar(500),
	SHOP_COMMENT_DATE    date not null,
	SHOP_SATISFACTION    tinyint comment '1至5顆星'
    );
    
alter table SHOP_REVIEW add constraint FK_SHOP_REVIEW_ITEM_ID foreign key (ITEM_ID) references ITEM (ITEM_ID) on delete cascade;
alter table SHOP_REVIEW add constraint FK_SHOP_REVIEW_MEM_ID foreign key (MEM_ID) references `MEMBER` (MEM_ID);
   

-- 創建 商品圖片庫 表格
create table ITEM_PHOTOS(
	IP_ID                int not null primary key auto_increment,
	ITEM_ID              int not null,
	IP_PHOTO             longblob comment '移除not null方便放入假資料'
    );
    
alter table ITEM_PHOTOS add constraint ITEM_ID foreign key (ITEM_ID) references ITEM (ITEM_ID) on delete cascade;


-- 創建 購物車 表格
create table SHOPPING_CART(
	MEM_ID               int not null auto_increment,
	ITEM_ID              int not null,
	ITEM_AMOUNT          int not null,
    primary key(MEM_ID, ITEM_ID)
    );
    
alter table SHOPPING_CART add constraint FK_SHOPPING_CART_MEM_ID foreign key (MEM_ID) references `MEMBER` (MEM_ID);
alter table SHOPPING_CART add constraint FK_SHOPPING_CART_ITEM_ID foreign key (ITEM_ID) references ITEM (ITEM_ID);


-- 創建貼文分類表格
create table ARTICLE_SORTTYPE(
SORT_ID int not null auto_increment primary key comment "分類編號",
SORT_CONTENT varchar(10) not null comment "分類內容"
);
insert into ARTICLE_SORTTYPE(SORT_CONTENT) values("閒聊"), ("發問"), ("醫生專欄");


-- 創建貼文表格
create table ARTICLE(
ARTICLE_ID int not null auto_increment primary key comment "貼文編號",
MEM_ID int not null,
SORT_ID int not null,
ARTICLE_TITLE varchar(45) not null comment "文章標題",
ARTICLE_CONTENT text not null comment "文章內容",
ARTICLE_STATUS tinyint not null default 1 comment "文章狀態 0: 隱藏 1: 公開",
ARTICLE_LIKE int default 0 comment "文章按讚數",
ARTICLE_DISLIKE int default 0 comment "文章倒讚數",
ARTICLE_PUBLISH timestamp default current_timestamp comment"發文時間",
ARTICLE_UPDATE timestamp on update current_timestamp comment"編輯時間",
constraint FK_ARTICLE_MEM_ID foreign key (MEM_ID) references `MEMBER` (MEM_ID),
constraint FK_ARTICLE_SORT_ID foreign key (SORT_ID) references ARTICLE_SORTTYPE(SORT_ID)
);
insert into ARTICLE(MEM_ID, SORT_ID, ARTICLE_TITLE, ARTICLE_CONTENT, ARTICLE_LIKE, ARTICLE_DISLIKE) values
(1, 1, "我家的狗會後空翻", "如題", 0, 30),
(2, 2, "我家的貓三天沒吃東西了", "三天沒吃貓罐頭了，是不是生病了，求助QQ", 2, 0),
(4, 3, "如何判斷寵物生病與否?", "當狗狗活動量明顯下降，睡眠時間變長，我們就該有警覺心！
雖然嗜睡是一個比較沒那麼明顯的症狀，但如果我們發現了狗一直睡覺，平常會活動的時間卻還是窩在窩裡，建議聯繫您的獸醫。
很有可能因為身體哪邊出狀況導致不想動，所以嗜睡。", 55, 0);


-- 創建貼文留言表格
create table ARTICLE_COMMENT(
COM_ID int not null auto_increment primary key comment "回覆編號",
ARTICLE_ID int not null,
MEM_ID int not null,
COM_CONTENT text not null comment "留言內容",
COM_PUBLISH timestamp default current_timestamp comment "留言時間",
constraint FK_ARTICLE_COMMENT_ARTICLE_ID foreign key (ARTICLE_ID) references ARTICLE (ARTICLE_ID),
constraint FK_ARTICLE_COMMENT_MEM_ID foreign key (MEM_ID) references `MEMBER` (MEM_ID)
);
insert into ARTICLE_COMMENT (ARTICLE_ID, MEM_ID, COM_CONTENT) values
(1, 2, "廢到笑wwww"),
(1, 5, "欠檢舉"),
(2, 4, "您的狗可能是確診了，可以到王醫生寵物醫院，我免費幫您檢查看看"),
(3, 5, "謝謝醫生分享!");


-- 創建貼文圖片表格
create table ARTICLE_IDENTITY(
ARTICLE_PICNO int not null auto_increment primary key comment "會員圖片編號",
ARTICLE_PIC text comment "會員圖片",
MEM_ID int not null,
UPLOAD_TIME timestamp default current_timestamp comment "上傳時間",
constraint FK_ARTICLE_IDENTITY_MEM_ID foreign key (MEM_ID) references MEMBER (MEM_ID)
);
insert into ARTICLE_IDENTITY(MEM_ID) values
(1), (3);


-- 創建貼文檢舉表格
create table ARTICLE_REPORT(
AFREP_ID int not null auto_increment primary key comment "檢舉文章編號",
ARTICLE_ID int not null,
MEM_ID int not null,
AFREP_CONTENT text not null comment "檢舉內容",
AFREP_STATUS tinyint not null default 0 comment "檢舉狀態 0: 待審核  1: 已審核",
AFREP_RESULT tinyint not null default 0 comment "審核結果 0: 尚未審核完畢 1: 檢舉屬實 2: 檢舉不屬實",
EMP_ID int,
AFREP_DATE timestamp default current_timestamp comment "檢舉日期",
HANDLE_DATE timestamp on update current_timestamp comment"檢舉處理時間",
constraint FK_ARTICLE_REPORT_ARTICLE_ID foreign key (ARTICLE_ID) references ARTICLE (ARTICLE_ID),
constraint FK_ARTICLE_REPORT_MEM_ID foreign key (MEM_ID) references `MEMBER` (MEM_ID),
constraint FK_ARTICLE_REPORT_EMP_ID foreign key (EMP_ID) references EMP (EMP_ID)
);
insert into ARTICLE_REPORT(ARTICLE_ID, MEM_ID, AFREP_CONTENT) values
(1, 5, "垃圾文章"),
(2, 5, "疑似廣告行為"); 


-- 創建最新消息表格
create table NEWS(
NEWS_ID int not null auto_increment primary key comment "最新消息編號",
EMP_ID int not null references EMP (EMP_ID),
NEWS_TITLE varchar(255) not null comment "最新消息標題",
NEWS_CONTENT text not null comment "最新消息內容",
CREATE_TIME timestamp default current_timestamp comment "發布時間",
constraint FK_NEWS_EMP_ID foreign key (EMP_ID) references EMP (EMP_ID)
);
insert into NEWS(EMP_ID, NEWS_TITLE, NEWS_CONTENT) values
(1, "Barei開幕慶!!!全館滿千折100", "2022/12/1~2022/12/31凡在Barei消費單一訂單滿1000原現折200元!"),
(2, "寵物食品特賣會", "即期貓狗飼料一包只要30元!!!數量有限，趕快手刀結帳去!");

-- 創建 最新消息照片 表格
create table NEWS_PICTURE(
	NEWS_PICTURE_ID       int not null primary key auto_increment,
	NEWS_ID               int not null,
	NEWS_PICTURE          longblob comment '移除not null方便放入假資料'
    );
    
alter table NEWS_PICTURE add constraint FK_NEWS_PICTURE_NEWS_ID foreign key (NEWS_ID) references NEWS (NEWS_ID);

insert into NEWS_PICTURE (NEWS_ID) value (1);
insert into NEWS_PICTURE (NEWS_ID) value (2);

-- 創建 團購商品 表格
create table GROUP_BUY_ITEM(
	GBITEM_ID int not null comment '團購商品編號' primary key auto_increment,
	GBITEM_NAME varchar(40) not null comment '團購商品名稱',
	GBITEM_CONTENT text not null comment '團購商品內容',
	GBITEM_PRICE int not null comment '團購商品價格',
	GBITEM_STATUS tinyint not null comment '團購商品狀態 0: 超出團購期限下架 1:上架中 2:無庫存 3:有庫存;',
	GBITEM_STARTDATE date not null comment '團購商品上檔日期',
	GBITEM_ENDDATE date not null comment '團購商品下檔日期',
    GBITEM_TYPE int not null comment '團購商品類別'
    );
    
    INSERT INTO GROUP_BUY_ITEM (GBITEM_NAME, GBITEM_CONTENT, GBITEM_PRICE, GBITEM_STATUS, GBITEM_STARTDATE, GBITEM_ENDDATE ,GBITEM_TYPE)  VALUES
    ('【哈燒新品】UAH 貓砂盆智能伴侶-除臭專用-二代','貓砂盆',780,1,'2022-10-16','2023-12-30',11),
	('PIDAN 貓咪防砂墊 貓砂墊','貓砂墊',499,1,'2022-10-16','2023-12-30',11),
    ('Petkit 小佩 寵物智能去味器-除臭首推','去味器',790,1,'2022-10-16','2023-12-30',19),
    ('PETKIT 寵物智能去味器_濾心','去味器',229,1,'2022-10-16','2023-12-30',19),
    ('【熱銷新品】UAH 負離子寵物梳 不傷健康毛囊','寵物梳',690,1,'2022-10-16','2023-12-30',20),
    ('LED燈-照血管寵物指甲剪-隨機色','指甲剪',180,1,'2022-10-16','2023-12-30',20),
    ('【團購訂制款】吸盤式瓦楞貓抓板','貓抓板',180,1,'2022-10-16','2023-12-30',10),
    ('『爆玩新品』PIDAN 電動小雪怪-翻滾玩具','玩具',160,1,'2022-10-16','2023-12-30',10),
    ('美國CATIT 牆角磨蹭器','磨蹭器',140,1,'2022-10-16','2023-12-30',10),
    ('「日本超夯」滿月隧道 貓窩 隧道-兩色','貓隧道',649,1,'2022-10-16','2023-12-30',10),   
    ('不倒翁 漏食球 可裝飼料零食(貓用)','玩具',165,1,'2022-10-16','2023-12-30',10),    
    ('PETKIT 小佩 寵物按摩梳 神奇梳毛 按摩梳 貓咪最愛','按摩梳',165,1,'2022-10-16','2023-12-30',20),
    ('外出','摺疊碗',999,1,'2022-10-16','2023-12-30',1);      
    



-- 創建團購商品折扣表格 

create table DISCOUNT(
DISCOUNT_ID int not null auto_increment comment '折扣編號',
GBITEM_ID int not null comment '商品編號',
DISCOUNT_MINAMOUNT int not null comment '商品數量下限',
DISCOUNT_MAXAMOUNT int not null comment '商品數量上限',
DISCOUNT_PRICE int not null comment '折扣價格',
DISCOUNT_NAR varchar(255) not null comment '折扣說明',
primary key (DISCOUNT_ID,GBITEM_ID),
constraint FK_DISCOUNT_GBITEM_ID foreign key (GBITEM_ID) references GROUP_BUY_ITEM(GBITEM_ID)
);

insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(1,20,100,2260,'95折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(1,50,100,2140,'9折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(1,80,100,2020,'85折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(2,20,100,2450,'95折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(2,50,100,2320,'9折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(2,80,100,2190,'85折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(3,20,100,740,'95折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(3,50,100,700,'9折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(3,80,100,660,'85折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(4,20,100,475,'95折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(4,50,100,449,'9折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(4,80,100,425,'85折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(5,20,100,750,'95折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(5,50,100,710,'9折');
insert into DISCOUNT(GBITEM_ID,DISCOUNT_MINAMOUNT,DISCOUNT_MAXAMOUNT,DISCOUNT_PRICE,DISCOUNT_NAR) values(5,80,100,670,'85折');
-- 創建 團購團 表格
create table GROUP_BUY(
	GB_ID int not null  comment '團購團編號' primary key auto_increment,
    MEM_ID int not null comment '團購主編號',
    GBITEM_ID int not null comment '團購商品編號',
    GB_MIN int not null comment '團購商品數量低標',
    GB_AMOUNT int not null comment '目前團購商品下訂總數',
    GBSTART_DATE DATETIME not null comment '團購開始',
    GBEND_DATE DATETIME not null comment '團購結束',
    GB_STATUS tinyint not null comment '團購狀態 0:參團人數不足 1:參團人數已達低標',
    GB_PRICE int not null comment '團購價格',
    GB_NAME varchar(40) not null comment '團購名稱',
    constraint FK_GROUP_BUY_GBITEM_ID foreign key (GBITEM_ID) references GROUP_BUY_ITEM (GBITEM_ID),
	constraint FK_GROUP_BUY_MEM_ID foreign key (MEM_ID) references MEMBER (MEM_ID));
    
    INSERT INTO GROUP_BUY (MEM_ID, GBITEM_ID, GB_MIN, GB_AMOUNT, GBSTART_DATE, GBEND_DATE,GB_STATUS,GB_PRICE,GB_NAME) VALUES 
     (1,1,30,1,'2022-10-16 00:00:00','2023-12-30 23:59:59',0,10,"路易斯夢遊仙境"),
     (2,2,50,1,'2022-10-16 00:00:00','2023-12-30 23:59:59',0,11,"不適拓海就是填海"),
     (3,3,70,11,'2022-10-16 00:00:00','2023-12-30 23:59:59',1,12,"章魚哥");
    

    -- 創建 團購訂單 表格
create table GROUP_BUY_ORDER(
	GBORDER_ID int  comment '團購訂單編號' primary key auto_increment,
	GBITEM_ID int not null comment '團購商品編號',
    GB_ID int  comment '團購團編號',
    GBITEM_AMOUNT int not null comment '團購商品數量',
	GBORIGINAL_PRICE int not null comment '團購訂單原始金額',
    GB_ENDPRICE int not null comment '團購最後價格',
	GBORDER_DATE timestamp  default current_timestamp comment '訂單時間',
	GBORDER_PAYING tinyint not null comment '團購付款方式0:貨到付款, 1:ATM轉帳, 2:信用卡;',  
	GBORDER_SEND tinyint not null comment '團購送貨方式0:宅配, 1:便利商店;',
	GBORDER_STATUS tinyint not null default 0 comment '0: 等待付款中, 1: 已取消, 2: 訂單完成, 3: 準備出貨中, 4: 已出貨, 5: 未取貨，退回平台, 6.已取貨 , 7.退貨, 8.換貨;',
	GBORDER_OTHER varchar(255) comment '團購訂單備註',
	TRACKING_NUM varchar(15) comment '物流編號',
	RECEIVER_NAME varchar(100) not null comment '收件人姓名',
	RECEIVER_ADDRESS varchar(200) not null comment '收件人地址',
	RECEIVER_PHONE varchar(20) not null comment '收件人電話',
	PICKUP_TIME DATETIME  comment '領貨時間',
    constraint FK_GROUP_BUY_ORDER_GBITEM_ID foreign key (GBITEM_ID) references GROUP_BUY_ITEM (GBITEM_ID),
    constraint FK_GROUP_BUY_ORDER_GB_ID foreign key (GB_ID) references  GROUP_BUY (GB_ID));
 
    
insert into GROUP_BUY_ORDER (GBITEM_ID, GB_ID, GBITEM_AMOUNT, GBORIGINAL_PRICE, GB_ENDPRICE, GBORDER_DATE, GBORDER_PAYING, GBORDER_SEND, GBORDER_STATUS, GBORDER_OTHER, TRACKING_NUM, RECEIVER_NAME, RECEIVER_ADDRESS, RECEIVER_PHONE, PICKUP_TIME)
value (1, 1, 60, 142800, 99960 , '2022-10-11 09:10:40', 0, 1, 6, '無', 'test00001', '黃阿瑪', '桃園市桃園區甲仙路87號8樓', '0977554431', '2022-10-14 11:1:3');      
insert into GROUP_BUY_ORDER (GBITEM_ID, GB_ID, GBITEM_AMOUNT, GBORIGINAL_PRICE, GB_ENDPRICE, GBORDER_DATE, GBORDER_PAYING, GBORDER_SEND, GBORDER_STATUS, GBORDER_OTHER, TRACKING_NUM, RECEIVER_NAME, RECEIVER_ADDRESS, RECEIVER_PHONE)
value (3, 3, 100, 78000, 54600 , '2022-10-11 09:10:40', 0, 1, 0, '無', 'test00002', '灰圓醬', '桃園市桃園區田園路10號7樓', '0988511511'); 
    
    


    
    -- 創建 參團 表格
create table GROUP_JOIN(
	GB_ID int not null comment '團購團編號',
	MEM_ID int not null comment '會員編號',
    GBPAY_STATUS tinyint not null default 0 comment '團購付款狀態 0:未付款 1:已付款',
    PICKUP_STATUS tinyint not null default 0 comment '取貨狀態 0:未取貨 1:已取貨',
    DELIVER_STATUS tinyint not null default 0 comment '物流狀態 0:未出貨 1:已出貨 2:配送中 3:已送達',
    GBBUY_AMOUNT int not null comment '購買數量',
    GBBUY_PRICE int not null comment '價格',
    PRIMARY KEY (GB_ID, MEM_ID),
	constraint FK_GROUP_JOIN_GB_ID foreign key (GB_ID) references  GROUP_BUY (GB_ID),
    constraint FK_GROUP_JOIN_MEM_ID foreign key (MEM_ID) references MEMBER (MEM_ID));
    
    INSERT INTO GROUP_JOIN (GB_ID, MEM_ID, GBPAY_STATUS, PICKUP_STATUS, DELIVER_STATUS,GBBUY_AMOUNT,GBBUY_PRICE)  
    VALUES (1, 1, 1, 1, 3, 1, 200);  
	INSERT INTO GROUP_JOIN (GB_ID, MEM_ID, GBPAY_STATUS, PICKUP_STATUS, DELIVER_STATUS,GBBUY_AMOUNT,GBBUY_PRICE)
    VALUES (2, 2, 2, 2, 2, 3, 200);  
    INSERT INTO GROUP_JOIN (GB_ID, MEM_ID, GBPAY_STATUS, PICKUP_STATUS, DELIVER_STATUS,GBBUY_AMOUNT,GBBUY_PRICE)  
    VALUES (3, 3, 0, 0, 0, 5, 200);  
    

    -- 創建 團購檢舉 表格
create table GROUP_BUY_REPORT(
	GBFREP_ID int not null comment '團購檢舉編號'  primary key auto_increment,
    GBORDER_ID int not null comment '團購訂單編號',
    MEM_ID int not null comment '會員編號',
    FREP_CONTENT text  not null comment '團購檢舉內容',
    FREP_TIME timestamp  default current_timestamp on update current_timestamp not null comment '團購檢舉時間',
    FREP_STATUS tinyint not null default 0 comment '團購檢舉狀態 0:待審核 1:已審核',
    FREP_RESULT int not null default 0 comment '團購檢舉審核結果 0: 尚未審核完畢 1: 檢舉屬實 2: 檢舉不屬實',
    EMP_ID int not null comment '員工編號',
    constraint FK_GROUP_BUY_REPORT_EMP_ID foreign key (EMP_ID) references EMP (EMP_ID),
	constraint FK_GROUP_BUY_REPORT_MEM_ID foreign key (MEM_ID) references MEMBER (MEM_ID),
    constraint FK_GROUP_BUY_REPORT_GBORDER_ID foreign key (GBORDER_ID) references GROUP_BUY_ORDER (GBORDER_ID));

	INSERT INTO GROUP_BUY_REPORT (GBORDER_ID,MEM_ID, FREP_CONTENT, FREP_STATUS, FREP_RESULT, EMP_ID)  
    VALUES (1,1, 'aaa', 1, 1, 1); 
	INSERT INTO GROUP_BUY_REPORT (GBORDER_ID,MEM_ID, FREP_CONTENT, FREP_STATUS, FREP_RESULT, EMP_ID)  
    VALUES (1,2, 'bbb', 0, 0, 1); 
    INSERT INTO GROUP_BUY_REPORT (GBORDER_ID,MEM_ID, FREP_CONTENT, EMP_ID)  
    VALUES (1,1, 'ccc',1);


-- 創建 商品圖片庫 表格
create table GROUP_BUY_ITEM_PICTURE(
	GBIP_ID              int not null primary key auto_increment,
    GBITEM_ID 			 int not null comment '團購商品編號',
	GBIP_CONTENT         longblob comment '移除not null方便放入假資料'
    );
    
alter table GROUP_BUY_ITEM_PICTURE add constraint ROUP_BUY_ITEM_PICTURE_GBITEM_ID foreign key (GBITEM_ID) references GROUP_BUY_ITEM (GBITEM_ID);

insert into GROUP_BUY_ITEM_PICTURE (GBITEM_ID) value (1);
insert into GROUP_BUY_ITEM_PICTURE (GBITEM_ID) value (2);

    
    -- 創建收藏清單 FAVORITE_LIST表格

create table FAVORITE_LIST(
MEM_ID int not null comment '會員編號',
ITEM_ID int not null comment '商品編號',
FAV_TIME timestamp default current_timestamp on update current_timestamp not null comment '加入收藏時間',
primary key (MEM_ID,ITEM_ID),
constraint FK_FAVORITE_LIST_MEM_ID foreign key (MEM_ID)
references `MEMBER`(MEM_ID),
constraint FK_FAVORITE_LIST_ITEM_ID foreign key (ITEM_ID)
references ITEM(ITEM_ID) on delete cascade
);

    -- 創建論壇按讚表格 --
    
create table LIKE_HATE(
MEM_ID int not null comment '會員編號',
ARTICLE_ID int not null comment '文章編號',
LIKE_STATUS tinyint comment '按讚狀態 0:都沒按(非預設，取消時才有此狀態) 1:按讚 2:按倒讚',
LIKE_TIME timestamp default current_timestamp on update current_timestamp,
primary key(MEM_ID, ARTICLE_ID),
constraint FK_LIKE_HATE_MEM_ID foreign key (MEM_ID) references MEMBER (MEM_ID),
constraint FK_LIKE_HATE_ARTICLE_ID foreign key (ARTICLE_ID) references ARTICLE (ARTICLE_ID)
);
insert into LIKE_HATE(MEM_ID, ARTICLE_ID, LIKE_STATUS) 
values(1, 1, 2), (2, 2, 1);

-- 查詢區-- 
-- select * from member;
-- select * from notification;
-- select * from customer_service;
-- select * from member_coupon;
-- select * from qualified_doctor;
-- select * from verify_code;
-- select * from item;
-- select * from item_type;
-- select * from order_buy;
-- select * from COMMODITY_DETAILS;
-- select * from shop_review;
-- select * from item_photos;
-- select * from SHOPPING_CART; insert
-- select * from COUPON; insert
-- select * from ARTICLE;
-- select * from ARTICLE_SORTTYPE;
-- select * from ARTICLE_COMMENT;
-- select * from ARTICLE_REPORT;
-- select * from ARTICLE_IDENTITY;EMP
-- select * from NEWS;
-- select * from news_picture; insert
-- SELECT * FROM GROUP_BUY_ITEM;
-- SELECT * FROM DISCOUNT;
-- SELECT * FROM GROUP_BUY;EMP
-- SELECT * FROM GROUP_BUY_ORDER;
-- SELECT * FROM GROUP_JOIN;
-- SELECT * FROM GROUP_BUY_REPORT;
-- SELECT * FROM GROUP_BUY_ITEM_PICTURE;
-- SELECT * FROM FAVORITE_LIST;
-- SELECT * FROM EMP;
-- SELECT * FROM EFFECT;
-- SELECT * FROM LIKE_HATE;
-- drop database ba_rei;