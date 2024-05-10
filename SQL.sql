use 한빛무역;

select * from 고객; /* 고객 테이블의 모든 필드를 검색 */
select 고객번호, 주소 from 고객; /* 고객 테이블의 고객번호, 주소만 검색 */
select 도시, 지역 from 고객; /* 고객 테이블의 도시, 지역으로만 검색, 처리로직: 1. 고객 테이블의 모든 테이블 가져옴 2. 이후 도시, 지역만 남김. 3. 나머지 필드는 숨김처리 */

select * from 고객 where 지역 = "경기도"; /* 고객 테이블의 모든 필드 중 지역이 경기도에 해당되는 필드만 가져옴/ 큰따옴표 사용 X  */
select * from 고객 where 지역 = '경기도'; /* 외부에서의 지원이 작은 따옴표만 오류가 발생하지 않음 */
select * from 고객 where 지역 = '강원도';

select 고객번호, 담당자명 from 고객 where 지역='강원도'; /* 고객 테이블 필드 중 강원도에 해당되는 필드의 고객번호와 담당자명만 가져옴 */

select 고객번호, 담당자명, 마일리지 AS 포인트 from 고객; /* DB 내부에서만 대소문자 구분 X, A AS B: A를 B로 별명붙여줌(현재 SELECT 문장에서만 적용) */
select 고객번호, 담당자명, 마일리지 from 고객 where 마일리지 >= 100000; /* 마일리지가 10만 이상인 경우만 조회 */
select 고객번호, 담당자명, 도시, 마일리지 AS 포인트 from 고객 where 도시 = '서울특별시' order by 마일리지 desc; /* ORDER BY ASC : 오름차순, ORDER BY DESC : 내림차순 */

select * from 고객 order by 마일리지 desc limit 3; /* 마일리지 내림차순으로 상위 3명만 */

select distinct 도시 from 고객; /* distinct: 중복된 값 제거 */

select 25+3 as 더하기연산, 23-5 as 빼기연산, 3*5 as 곱하기연산, 23/5 as 실수나누기연산, 23 div 5 as 정수나누기연산, 23 % 5 as 나머지1, 23 mod 5 as 나머지2; 

select 23 >= 5, 23 <= 5, 23 > 22, 23 = 23, 23 != 22, 23 <> 22 as 같지않다;

select * from 고객 where 담당자직위 <> '대표이사'; /* 띄어쓰기도 인식하니 동일하도록 작성에 유의 */
select * from 고객 where 담당자직위 <> '대표 이사';

select * from 고객 where 도시 = '부산광역시' and 마일리지 < 1000; /* and는 모두 충족해야 true 반환 */

select 고객번호, 담당자명, 마일리지, 도시 from 고객 where 도시 = '부산광역시'
union /* union은 다른 테이블(select)의 같은 필드(여기서의 '고객')에서 사용 */
select 고객번호, 담당자명, 마일리지, 도시 from 고객 where 마일리지 < 1000 order by 1; /* order by절은 제일 마지막에 넣어줌 */

select 고객번호, 담당자명, 마일리지, 도시 from 고객 where 도시 = '부산광역시' or 마일리지 < 1000 order by 1;

select * from 고객 where 지역 is null;

select * from 고객 where 지역 = ''; /* 빈 문자열과 null은 다름 */

update 고객 set 지역 = null where 지역 = '';

select * from 고객 where 지역 is null; /* is null: null 값 조회 */

select 고객번호, 담당자명, 담당자직위 from 고객 where 담당자직위='영업 과장' or 담당자직위='마게팅 과장';

select 고객번호, 담당자명, 담당자직위 from 고객 where 담당자직위 in('영업과장', '마케팅 과장'); /* in(값1, 값2): or과 동일 */

select 담당자명, 마일리지 from 고객 where 마일리지 >= 100000 and 마일리지 <= 200000;

select 담당자명, 마일리지 from 고객 where 마일리지 between 100000 and 200000; /* between 초기값(이상) and 최종값(이하) */

select * from 고객 where 도시 like '%광역시' and (고객번호 like '_C%' or 고객번호 like '__C%');
/* _: 한 칸을 의미, ~%: ~로 시작하는 문자열, %~%: ~가 들어가는 문자열, %~: ~로 끝나는 문자열  */

/* 점검문제 */

/* 문제1 */
select * from 고객 where 도시='서울특별시' and 마일리지 between 15000 and 20000;

/* 문제2 */
select distinct 지역, 도시 from 고객 order by 1;

/* 문제3 */
select * from 고객 where 도시 in ('춘천시', '과천시', '광명시') and (담당자직위 like '%사원' or 담당자직위 like '%이사'); 

/* 문제4 */
select * from 고객 where not (도시 like '%광역시' or 도시 like '%특별시') order by 마일리지 desc limit 3;

/* 문제5 */
select * from 고객 where 지역 like '%도' and 담당자직위 <> '대표 이사';

/* ★ char_length(): 문자의 개수 반환, ★ length(): 문자열에 할당된 바이트 수 반환*/
select char_length('HELLO'), length('HELLO'), char_length('안녕'), length('안녕');

/* ★ concat(문자열1, 문자열2): 문자열을 연결, concat_ws(구분자, 문자열1, 문자열2, ...): 구분자와 함께 문자열 연결 */
select concat('DREAMS', 'COME', 'TRUE'), concat_ws('-', '2023', '01', '29');

/* left(문자열, 길이): 문자열의 왼쪽부터 길이만큼 문자열 반환, right(문자열, 길이): 문자열의 오른쪽부터 길이만큼 문자열 반환 */
/* ★ substr 또는 ★ substring(문자열, 시작위치, 길이): 지정한 위치로부터 길이만큼 문자열 반환 */
select left('SQL 완전정복', 3), right('SQL 완전정복', 4), substr('SQL 완전정복', 2, 5), substr('SQL 완전정복', 2);

/* substring_index(문자열, 구분자, 인덱스): 지정한 구분자를 기준으로 문자열 분리 */
select substring_index('서울시 동작구 흑석로', ' ', 2), substring_index('서울시 동작구 흑석로', ' ', -2);

/* lpad(): 왼쪽에 특정 문자를 채움, rpad(): 오른쪽에 특정 문자를 채움 */
select lpad('SQL', 10, '#'), rpad('SQL', 5, '*');

/* ★ ltrim(): 왼쪽의 공백 제거, ★ rtrim(): 오른쪽 공백 제거 */
select length(ltrim('  SQL  ')), length(rtrim('  SQL  ')), length(trim('  SQL  '));

/* ★ trim(문자열 방향 제거할_문자열 from 문자열) */
/* trim(both): 양쪽에 있는 동일 문자열을 제거, trim(leading): 왼쪽, trim(trailing): 오른쪽 문자열 제거 */
select trim(both 'abc' from 'abcSQLabcabc'), trim(leading 'abc' from 'abcSQLabcabc'), trim(trailing 'abc' from 'abcSQLabcabc');

/* field(찾을 문자열, 문자열1, 문자열2, ... ): 문자열의 위치 값을 반환, 없으면 0 반환 */
/* find_in_set(찾을 문자열, 문자열 리스트): 문자열 리스트에서 지정한 문자열을 찾아서 위치 값을 반환 */
/* ★ instr(기준 문자열, 부분 문자열), locate(부분 문자열, 기준 문자열): 기준 문자열 중 부분 문자열을 찾아 위치 값을 반환 */
select field('JAVA', 'SQL', 'JAVA', 'C'), find_in_set('JAVA', 'SQL, JAVA, C'), instr('네 인생을 살아라', '인생'), locate('인생', '네 인생을 살아라');

/* elt(찾을 문자열 위치, 문자열1, 문자열2, ...): 찾을 문자열의 위치의 값 */
select elt(2, 'SQL', 'JAVA', 'C'); 

select repeat('*', 5); /* ★ repeat(문자열, 횟수): 매개변수에 반복할 문자열과 반복할 횟수를 넣음 */

select replace('010.1234.5678', '.', '-'); /* ★ replace(문자열, 원래 문자열, 바꿀 문자열): 문자열의 일부를 다른 문자열로 변환 */

select reverse('OLLEH'); /* 문자열을 거꾸로 뒤집음 */

/* 	ceiling(숫자):  올림, floor(숫자): 내림, round(숫자): 반올림,
	round(숫자, 자릿수): 지정한 위치에서 반올림, truncate(숫자, 자릿수): 지정한 위치에서 버림 */
select ceiling(123.56), floor(123.56), round(123.56), round(123.56, 1), truncate(123.56, 1);

/* abs(숫자): 절댓값 반환, sign(숫자): 양수의 경우 1, 음수의 경우 -1 반환 */
select abs(-120), abs(120), sign(-120), sign(120);

/* mod(): 나머지, 'mod(숫자1, 숫자2)' or '숫자1 % 숫자2' or '숫자1 mod 숫자2'로 총 세 가지 방법 사용 */
select mod(203, 4), 203 % 4, 203 mod 4;

/* 	power(숫자1, 숫자2): 숫자1의 숫자2 제곱승 값 반환, sqrt(숫자): 숫자의 제곱근 값 반환
	rand(): 0과 1사이 임의의 실수 값 반환 */
select power(2, 3), sqrt(16), rand(), rand(100), round(rand() * 100);

/* now(), sysdate(): 시스템의 현재 날짜와 시간 반환, curdate(): 시스템의 현재 날짜 반환, curtime(): 시스템의 현재 시간 반환 */
select now(), sysdate(), curdate(), curtime();

/* year(): 연도, quarter(): 분기, month(): 월(숫자), day(): 일, hour(): 시, minute(): 분, second(): 초 */
select now(), year(now()), quarter(now()), month(now()), day(now()), hour(now()), minute(now()), second(now());

/* 	datediff(끝 일자, 시작 일자): 기간을 일자 기준으로 반환,  
	timestampdiff(단위, 시작 일자, 끝 일자): 기간을 지정한 단위 기준으로 반환 */
select now(), datediff('2025-12-20', now()), datediff(now(), '2025-12-20'), timestampdiff(year, now(), '2025-12-20'), timestampdiff(month, now(), '2025-12-20'), timestampdiff(day, now(), '2025-12-20');

/* 	★ adddate(날짜, 기간) 또는 adddate(날짜, interval 기간 단위): 지정한 날짜를 기준으로 그 기간만큼 더한 날짜를 반환 
	subdate(날짜, 기간) 또는 subdate(날짜, interval 기간 단위): 기간만큼 뺀 날짜를 반환 */
select now(), adddate(now(), 50), adddate(now(), interval 50 day), adddate(now(), interval 50 month), subdate(now(), interval 50 hour);

/* 	last_day(날짜): 해당 월의 마지막 일자 반환, dayofyear(날짜): 현재 연도에서 며칠이 지났는 지를 반환 
	monthname(날짜): 월을 영문으로 반환, weekday(날짜): 요일을 정수로 반환 */
select now(), last_day(now()), dayofyear(now()), monthname(now()), weekday(now());

/* cast(값 as 데이터타입), convert(값, 데이터타입): 원하는 형태로 데이터타입을 변경하여 처리하거나 확인 */
/* 문자 '1'을 부호 없는 숫자 형식, 숫자 2를 문자 형식으로 변경 */
select cast('1' as unsigned), cast(2 as char(1)), convert('1', unsigned), convert(2, char(1));

/* if(조건, 수식1, 수식2): 조건의 결과가 참이면 수식1 반환, 아니면 수식2 반환 */
select if(12500 * 450 > 5000000, '초과달성', '미달성');

/* ifnull(수식1, 수식2): 수식1이 null이 아니면 수식1의 값을 반환, null이면 수식2의 값을 반환 */
select ifnull(1, 0), ifnull(null, 0), ifnull(1/0, 'OK');

/* nullif(수식1, 수식2): 두 수식 값을 비교하여 값이 같으면 null 반환, 다르면 수식1의 값 반환 */
select nullif(12 * 10, 120), nullif(12 * 10, 1200);

/* 점검문제 */

/* 문제1 */
select 고객회사명
	, concat('**', left(고객회사명, 2)) as 고객회사명2, 전화번호
    , substr(replace(전화번호, ')', '-' ), 2) as 전화번호2 from 고객;
#고객회사명2 replace(고객회사명, '__%', '**%');
#전화번호2 replace(전화번호 from 고객, '(___)%', '___-%');
 
/* 문제2 */
/* 주문금액 = 주문수량 * 단가, 할인금액 = 주문수량 * 단가 * 할인율, 실주문금액 = 주문금액 - 할인금액 */
select *
	, truncate((주문수량 * 단가), -1) as 주문금액
    , truncate((주문수량 * 단가 * 할인율), -1) as 할인금액
    , truncate((주문수량 * 단가) - (주문수량 * 단가 * 할인율), -1) as 실주문금액 from 주문세부;

/* 문제3 */
/* 만나이: timestampdiff(year, 생일, now()), 입사일수: datediff(now(), 입사일), 500일후: adddate(입사일, interval 500 day) */
select 이름, 생일
	, timestampdiff(year, 생일, now()) as 만나이, 입사일
    , datediff(now(), 입사일) as 입사일수
    , adddate(입사일, interval 500 day) as 500일후 from 사원;

/* 문제4 */
/* 마일리지 <= 100000 'VVIP고객',  <= 10000 'VIP고객' 10000 > 일반 */
select 담당자명, 고객회사명, 도시
, if(도시 like '%특별시' or 도시 like'%광역시', '대도시', '도시') as 도시구분, 마일리지
, case when 마일리지 >= 100000 then 'VVIP고객'
	   when 마일리지 >= 10000 then 'VIP고객'
	   else '일반고객'
	   end as 마일리지구분
	   from 고객;
 
/* 문제5 */
/* 	주문년도: year(주문일), 주문분기: quarter(주문일), 주문월: month(주문일), 주문일: day(주문일),
	주문요일:weekday(주문일) , 한글요일: cast(주문일 as string)
    case weekday(주문일) when 0 then '월요일' when 1 then '화요일', ..., else '일요일' */
select 주문번호, 고객번호, 주문일
	, year(주문일) as 주문년도
    , quarter(주문일) as 주문분기
    , month(주문일) as 주문월
    , day(주문일) as 주문일
    , weekday(주문일) as 주문요일 
    , case weekday(주문일) when 0 then '월요일'
						 when 1 then '화요일'
						 when 2 then '수요일'
						 when 3 then '목요일'
						 when 4 then '금요일'
						 when 5 then '토요일'
						 else '일요일'
						 end as 한글요일
						 from 주문;

/* 문제6 */
/* 요청일보다 발송일이 7일 이상 늦은 주문내역 */
select *
	, datediff(발송일, 요청일) as 지연일수
    from 주문 where datediff(발송일, 요청일) >= 7;

