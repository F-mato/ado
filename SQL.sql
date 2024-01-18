-- ticketテーブルの作成
CREATE TABLE public.ticket (
    ticketid integer NOT NULL,
    type text NOT NULL,
    price text NOT NULL,
    PRIMARY KEY (ticketid)
);

-- titleテーブルの作成
CREATE TABLE public.title (
    titleid serial NOT NULL,
    title text,
    imgpath text,
    moviepath text,
    date text,
    screenid integer,
    time1 text,
    time2 text,
    time3 text,
    time4 text,
    time5 text,
    time6 text,
    description text,
    PRIMARY KEY (titleid)
);

-- membertableテーブルの作成
CREATE TABLE public.membertable (
    memberid serial NOT NULL,
    name text NOT NULL,
    kana text NOT NULL,
    postnum text NOT NULL,
    address text NOT NULL,
    gender text NOT NULL,
    tel text NOT NULL,
    mail text NOT NULL,
    pass text NOT NULL,
    userid text NOT NULL,
    birth text,
    PRIMARY KEY (memberid),
    UNIQUE (userid),
    UNIQUE (mail)
);

-- reservetableテーブルの作成
CREATE TABLE public.reservetable (
    reserveid serial NOT NULL,
    memberid serial NOT NULL,
    titleid serial NOT NULL,
    "time" text NOT NULL,
    date text NOT NULL,
    seat text NOT NULL,
    ticketid integer ,
    total text,
    freewrite text,
    PRIMARY KEY (reserveid),
    FOREIGN KEY (memberid) REFERENCES public.membertable(memberid),
    FOREIGN KEY (ticketid) REFERENCES public.ticket(ticketid),
    FOREIGN KEY (titleid) REFERENCES public.title(titleid)
);

CREATE TABLE public.admin (
    userid TEXT PRIMARY KEY,
    pass TEXT
);

-- 例題の挿入
INSERT INTO public.ticket (ticketid, type, price) VALUES (1, '一般/車椅子', '2000');
INSERT INTO public.ticket (ticketid, type, price) VALUES (2, '4歳以上~大学生まで', '1500');
INSERT INTO public.ticket (ticketid, type, price) VALUES (3, 'シニア', '1800');