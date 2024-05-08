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