CREATE TABLE IF NOT EXISTS sessions (
    id           CHAR(72) PRIMARY KEY,
    session_data TEXT
);

CREATE TABLE IF NOT EXISTS population (
    id INTEGER PRIMARY KEY
    ,name VARCHAR(100)
    ,country VARCHAR(100)
    ,y1950 INTEGER
    ,y1960 INTEGER
    ,y1970 INTEGER
    ,y1980 INTEGER
    ,y1990 INTEGER
    ,y2000 INTEGER
    ,y2005 INTEGER
    ,area INTEGER
);

DELETE FROM population;

INSERT INTO population VALUES (1, "東京 (Tokyo)", "日本", 10428000, 15535000, 21748000, 25978000, 30243000, 30850000, 31112000, 6091);
INSERT INTO population VALUES (2, "ニューヨーク (New York)", "アメリカ合衆国", 17363000, 20548000, 23585000, 23084000, 23782000, 26476000, 27860000, 15043);
INSERT INTO population VALUES (3, "ソウル (Séoul)", "韓国", 2250000, 3705000, 7302000, 11778000, 17211000, 21097000, 22447000, 3936);
INSERT INTO population VALUES (4, "メキシコシティ (Mexico)", "メキシコ", 3643000, 5849000, 9758000, 14857000, 16189000, 19259000, 20861000, 5814);
INSERT INTO population VALUES (5, "ジャカルタ (Jakarta)", "インドネシア", 2500000, 4185000, 6069000, 8993000, 12500000, 17422000, 20087000, 1200);
INSERT INTO population VALUES (6, "マニラ (Manille)", "フィリピン", 2525000, 3621000, 5754000, 8695000, 12088000, 16490000, 18861000, 3469);
INSERT INTO population VALUES (7, "サンパウロ (São Paulo)", "ブラジル", 2292000, 4005000, 7864000, 12183000, 14794000, 17064000, 18240000, 8075);
INSERT INTO population VALUES (8, "デリー (Delhi)", "インド", 1461000, 2441000, 3812000, 6248000, 9602000, 15135000, 18215000, 843);
INSERT INTO population VALUES (9, "ムンバイ (Bombay)", "インド", 3092000, 4435000, 6437000, 9206000, 12322000, 16069000, 18066000, 690);
INSERT INTO population VALUES (10, "香港＝深圳 (Hong Kong/Shenzhen)", "香港/中国", 2237000, 3036000, 3904000, 5334000, 7316000, 13643000, 17731000, 1428);
INSERT INTO population VALUES (11, "大阪 (Osaka)", "日本", 6790000, 9661000, 12927000, 14452000, 14983000, 15039000, 15067000, 4127);
INSERT INTO population VALUES (12, "ロサンゼルス (Los Angeles)", "アメリカ合衆国", 4178000, 7157000, 9281000, 10735000, 13182000, 14020000, 14446000, 7070);
INSERT INTO population VALUES (13, "上海 (Shanghai)", "中国", 5821000, 7065000, 7950000, 8946000, 10310000, 12950000, 14345000, 2720);
INSERT INTO population VALUES (14, "コルカタ (Calcutta)", "インド", 4666000, 5815000, 7278000, 9029000, 10784000, 13041000, 14223000, 569);
INSERT INTO population VALUES (15, "カイロ (Le Caire)", "エジプト", 2509000, 3981000, 5840000, 7795000, 9940000, 11641000, 12525000, 482);
INSERT INTO population VALUES (16, "モスクワ (Moscou)", "ロシア", 5838000, 6848000, 8218000, 9523000, 10570000, 11685000, 12257000, 2000);
INSERT INTO population VALUES (17, "天津 (Tianjin)", "中国", 2419000, 3349000, 4073000, 4954000, 5804000, 9550000, 11655000, 4277);
INSERT INTO population VALUES (18, "イスタンブル (Istanbul)", "トルコ", 1040000, 1678000, 2863000, 4559000, 7234000, 10079000, 11619000, 2723);
INSERT INTO population VALUES (19, "リオデジャネイロ (Rio de Janeiro)", "ブラジル", 2817000, 4638000, 6840000, 8826000, 9862000, 10997000, 11580000, 5742);
INSERT INTO population VALUES (20, "ブエノスアイレス (Buenosu Aires)", "アルゼンチン", 5179000, 6789000, 8407000, 9921000, 11152000, 11434000, 11575000, 2353);
INSERT INTO population VALUES (21, "ダッカ (Dacca)", "バングラデシュ", 508000, 939000, 1862000, 3485000, 6175000, 9501000, 11343000, 580);
INSERT INTO population VALUES (22, "カラチ (Karachi)", "パキスタン", 1043000, 1932000, 3256000, 5000000, 7067000, 9678000, 11087000, 3527);
INSERT INTO population VALUES (23, "テヘラン (Téhéran)", "イラン", 1188000, 2235000, 3744000, 5465000, 7010000, 9211000, 10387000, 1000);
INSERT INTO population VALUES (24, "エッセン (Essen)", "ドイツ", 7808000, 9688000, 10227000, 9957000, 9905000, 10015000, 10069000, 6763);
INSERT INTO population VALUES (25, "パリ (Paris)", "フランス", 6459000, 7602000, 8721000, 9153000, 9647000, 9850000, 9928000, 3158);
