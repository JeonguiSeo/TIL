## Crawling 사용 시 참고 사항
- Website의 이용 규약 확인
- robots.txt 및 robots meta의 접근 제한 사항 준수 ([example](https://www.google.co.kr/robots.txt))
- `rel="nofollow"` 설정 시, crawler를 통한 접근 금지
- 저작권 존재 시 개인적 용도 한정 사용
- 수집된 데이터 기반 서비스 제공 시, website 및 API의 사용 규약 확인 및 준수
- 일부 site는 부하 방지를 위해 공식 archive data 제공
    - Archive data dump 미제공 시, web API 및 feed 제공 여부 확인


## Crawler 설계 시 주의 사항
- 최소 1초 이상의 sleep 설정
- 3초 이상 미응답 시 timeout 설정
- Retry 시, 약 1~3회 수준의 제한 설정 및 간격 고려
- String encoding 및 datetime format 고려
- HTML/XML parsing 시, tag 작성 오류 가능성 고려
    - HTML의 유연성으로 인해, view port는 정상 작동
- API 사용 시, JSON decode 진행




