create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

--묵지적 방법
insert into author 
values(1, '박경리', '토지 작가');

--명시적 방법
insert into author(author_id, author_name)
values(2, '박경리');

/*
--묵시적 방법 오류상황
insert into author
values(2, '이문열', );
*/


--명시적 방법
insert into author(author_id, author_name)
values(2,'박경리');

--명시적 오류상황
insert into author(author_id, author_desc)
values(3, '나혼자 산다 출연');

update author
set author_name = '기안84',
    author_desc = '나혼자산다 출연 웹툰작가'
where author_id = 1;

update author
set author_name = '기안84',
    author_desc = '나혼자산다 출연 웹툰작가';

update author
set author_name = '이문열'
where author_id = 1;

delete from author
where author_id = 1;

delete from author
where author_id =2;

delete from author
where author_id =3;

select *
from author;

insert into author
values(SEQ_AUTHOR_ID.nextval, '이문열', '경북 영양');

insert into author
values(SEQ_AUTHOR_ID.nextval, '박경리', '경북 통영');

insert into author
values(SEQ_AUTHOR_ID.nextval, '유시민', '17대 국회의원');

insert into author
values(SEQ_AUTHOR_ID.nextval, '기안84', '나혼자 산다');


--번호표 기계 --> 시퀀스
--시퀀스 만들기
create sequence seq_author_id
increment by 1
start with 1;

--시퀀스 삭제
drop sequence seq_author_id;

--시퀀스 조회
select * from user_sequences;

--현재 시퀀스 조회
select seq_author_id.currval -- 현재번호
from dual;

--다음 시퀀스 조회 > 무조건 번호 1 증가
select seq_author_id.nextval -- 강제실행
from dual;

