# Database_Programming
1.주제  
예방접종관리 데이터베이스 프로그래밍 


1-A. 프로젝트 주제  
예방접종 관리 데이터베이스 프로그래밍	병원에서 예방접종을 하게 되면 그에 따르는 정보를 저장하고 관리할 수 있는 데이터베이스 프로그래밍


1-B. 활용 방안 제시
- 어느 병원에서 누가 접종을 어떤 백신을 맞았는 지 확인할 수 있다.
- 만약 접종 후 부작용이 있을 시. 병원, 약국과 연계하여 약을 얻을 수 있다. 
- 사람 – 병원 – 약 – 회사의 정보가 연결되어 있어 이 중에서 정보가 필요할 시 원하는 정보를 한 번에 찾아볼 수 있다. 
- 병원 간 재고량을 파악하여 어느 병원이 부족한 지 남는 지 확인하여 포털(웹프로그램 등)을 통 하여 그 정보를 제공할 수 있다.  


2. ER 다이어그램
![image](https://user-images.githubusercontent.com/79445881/226107994-fe2226be-a70f-4a0a-9864-07403dddcd13.png)


3. PL/SQL
 - 1.	접종인원등록 프로시저 EnterPerson  
 - 2.	인원검증 트리거 EnterPersonVerification  
 - 3.	접종 프로세스(정보 등록) 프로시저 inoculate  
 - 4.	접종 업무시간 트리거 workingtime  
 - 5.	공급 프로세스(정보 등록) 프로시저 supply_medicine  
 - 6.	회사 재고 변화 트리거 before_supply_company_stock  
 - 7.	병원 재고 변화 트리거 after_supply_hospital_stock  
 - 8.	약 구매 프로세스 프로시저 BuyingMedicine  
 - 9.	약 정보 검색 프로시저 SearchMedicine  
 - 10. 약 등록 프로시저 NewMedicine
 
4. 이미지  
인원 등록 화면  
![image](https://user-images.githubusercontent.com/79445881/226108171-a3de7791-9351-419a-8933-a5535aaebc58.png)  

접종 등록  
![image](https://user-images.githubusercontent.com/79445881/226108213-427b8b0c-7ca3-408c-8dbc-8a902ca1280a.png)  

공급 화면  
![image](https://user-images.githubusercontent.com/79445881/226108256-0fb9ba88-ebbf-4d2f-a63b-ab9317b2dc0c.png)

약 관련 화면  
![image](https://user-images.githubusercontent.com/79445881/226108282-9cf482bf-3550-4fd1-be92-61af39fc53fb.png)  
![image](https://user-images.githubusercontent.com/79445881/226108288-a0582397-8770-4048-b4d6-0c65df546d53.png)




