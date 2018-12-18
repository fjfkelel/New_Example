create table company( --회사 계정
    company_no        int                                  --회사 계정  번호
    , company_id      varchar2(20)    not null unique      --회사 계정 아이디
    , pwd             varchar2(20)    not null             --회사 계정 암호
    , company_name    varchar2(50)    not null unique      --회사명
    , primary key(company_no)
);

insert into company values(1, 'Annlap', 'ann1151', '안랩');
insert into company values(2, 'CQI', 'cqi283', '시큐아이');
insert into company values(3, 'Wins', 'wins382', '윈즈');


create table code_report( --보고서 종류
    report_code        int                                  --보고서 종류 코드
    , report_name      varchar2(30)  not null unique     --보고서 종류 이름
    , primary key(report_code)
);

insert into code_report values (1, '지출 보고서');
insert into code_report values (2, '영업 보고서');
insert into code_report values (3, '주간 업무보고서');
insert into code_report values (4, '회의 보고서');
insert into code_report values (5, '근태 보고서');
insert into code_report values (6, '제안 보고서');


create table company_report( --회사별 보고서
    company_re_no       int                                 --회사별 보고서 선택 번호
    , company_no        int                                 --회사 계정  번호
    , report_code       int                                  --보고서 종류 코드
    , primary key(company_re_no)
    , foreign key(company_no) references company(company_no)
    , foreign key(report_code) references code_report(report_code)
);

insert into company_report values (1, 1, 1);
insert into company_report values (2, 1, 2);
insert into company_report values (3, 1, 3);
insert into company_report values (4, 1, 4);
insert into company_report values (5, 2, 1);
insert into company_report values (6, 2, 2);
insert into company_report values (7, 2, 3);
insert into company_report values (8, 2, 4);
insert into company_report values (9, 3, 1);
insert into company_report values (10, 3, 2);
insert into company_report values (11, 3, 3);
insert into company_report values (12, 3, 4);


create table code_jikup( --직급
    jikup_code          int                                --직급 코드
    ,jikup_name          varchar(20)   not null unique      --직급명
    , primary key(jikup_code)
);

insert into code_jikup values (1, '사원');
insert into code_jikup values (2, '주임');
insert into code_jikup values (3, '대리');
insert into code_jikup values (4, '과장');
insert into code_jikup values (5, '팀장');
insert into code_jikup values (6, '부장');
insert into code_jikup values (7, '상무');
insert into code_jikup values (8, '전무');
insert into code_jikup values (9, '사장');


create table employee( -- 회사별 직원
    emp_no        int                               --회사별 직원  계정  번호
    , emp_name    varchar2(30)      not null             --회사별 직원명
    , jikup            int          not null                     --직급코드
    , emp_id      varchar2(20)      not null unique      --회사별 직원 계정 아이디
    , pwd             varchar2(20)  not null             --회사별 직원 계정 암호
    , company_no    int             not null      --회사 계정 번호
    , company_emp_no   int          not null     --회사내의 결제 라인 차수
    , primary key(emp_no)
    , foreign key(jikup) references code_jikup(jikup_code)
    , foreign key(company_no) references company(company_no)
);


insert into employee values (1, '김남욱', 4, 'namuk30', 'nam1130', 1, 1);
insert into employee values (2, '임용혁', 5, 'imyh25', 'yongh1225', 1, 2);
insert into employee values (3, '장재석', 6, 'jangjs29', 'jeas2129', 1, 3);
insert into employee values (4, '안홍구', 7, 'annhg28', 'hongg2228', 1, 4);
insert into employee values (5, '박호준', 5, 'parkhj94', 'hojun3125', 2, 1);
insert into employee values (6, '민순기', 6, 'soon5258', 'minkind3294', 2, 2);
insert into employee values (7, '박지선', 7, 'jiseon494', 'parkji1423', 2, 3);
insert into employee values (8, '정하나', 8, 'jungone23', 'hana2394', 2, 4);
insert into employee values (9, '박다정', 6, 'pkind2285', 'dajeong27', 3, 1);
insert into employee values (10, '서혜선', 7, 'west1900', 'seon0019', 3, 2);
insert into employee values (11, '전은지', 8, 'master404', 'eunji9425', 3, 3);
insert into employee values (12, '정혜원', 9, 'jungking1221', 'onelov0921', 3, 4);

select * from company;
select * from code_report;
select * from company_report;
select * from code_jikup;
select * from employee;

drop table company;
drop table code_report;
drop table company_report;
drop table code_jikup;
drop table employee;

commit;