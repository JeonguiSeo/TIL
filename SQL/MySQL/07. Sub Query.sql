USE PRACTICE;


/***************A subquery in the SELECT clause***************/

SELECT *, (SELECT GENDER FROM CUSTOMER WHERE A.MEM_NO = MEM_NO) AS GENDER
FROM  SALES AS A;

/* Check the record */
SELECT *
FROM CUSTOMER
WHERE MEM_NO = '1000970';

/* Comparison of processing speed between a sub query in the SELECT clause and a table JOIN */
/* The table JOIN is much faster than the sub query in the SELECT clause */
SELECT A.*, B.GENDER
FROM SALES AS A
	LEFT JOIN CUSTOMER AS B
		ON A.MEM_NO = B.MEM_NO;


/***************A subquery in the FROM clause***************/

SELECT *
FROM (
		SELECT MEM_NO, COUNT(ORDER_NO) AS 주문횟수
        FROM SALES
        GROUP BY MEM_NO
		) AS A;

/* The table name of the sub query must be assigned */     
/* And the column of the sub query must be assigned to use in the select clause */

            
/***************A subquery in the WHERE clause***************/

/* Query the number of orders for members signed up in 2019. */
SELECT COUNT(ORDER_NO) AS 주문횟수
FROM SALES
WHERE MEM_NO IN (SELECT  MEM_NO FROM CUSTOMER WHERE YEAR(JOIN_DATE) = 2019);

SELECT *, YEAR(JOIN_DATE)
FROM CUSTOMER;

/* Query a list */
SELECT  MEM_NO FROM CUSTOMER WHERE YEAR(JOIN_DATE) = 2019;

SELECT COUNT(ORDER_NO) AS 주문횟수
FROM SALES
WHERE MEM_NO IN ('1000001','1000002','1000004','1000005','1000006','1000010','1000011','1000012','1000013','1000014','1000015','1000019','1000020','1000021','1000022','1000023','1000024','1000025','1000026','1000027','1000045','1000046','1000047','1000048','1000055','1000056','1000057','1000058','1000059','1000060','1000061','1000062','1000066','1000067','1000068','1000069','1000070','1000071','1000072','1000073','1000074','1000075','1000076','1000077','1000078','1000079','1000088','1000089','1000090','1000091','1000092','1000093','1000094','1000095','1000096','1000097','1000098','1000099','1000100','1000101','1000105','1000106','1000107','1000108','1000109','1000110','1000111','1000112','1000113','1000131','1000132','1000133','1000134','1000135','1000136','1000137','1000138','1000149','1000150','1000151','1000152','1000153','1000154','1000155','1000156','1000157','1000158','1000159','1000160','1000161','1000162','1000163','1000164','1000165','1000169','1000170','1000185','1000186','1000187','1000188','1000189','1000190','1000207','1000208','1000209','1000210','1000211','1000212','1000213','1000214','1000215','1000216','1000217','1000218','1000219','1000220','1000221','1000222','1000223','1000224','1000225','1000226','1000227','1000228','1000229','1000230','1000231','1000232','1000233','1000243','1000244','1000245','1000246','1000247','1000256','1000258','1000260','1000262','1000274','1000275','1000276','1000277','1000278','1000279','1000280','1000281','1000282','1000283','1000284','1000285','1000286','1000287','1000288','1000289','1000290','1000291','1000292','1000293','1000294','1000295','1000297','1000299','1000301','1000303','1000305','1000316','1000317','1000318','1000319','1000320','1000321','1000322','1000323','1000324','1000325','1000336','1000337','1000338','1000339','1000340','1000341','1000343','1000345','1000347','1000349','1000351','1000352','1000353','1000354','1000355','1000356','1000357','1000358','1000359','1000360','1000366','1000367','1000368','1000369','1000370','1000376','1000377','1000378','1000379','1000380','1000381','1000382','1000383','1000384','1000385','1000415','1000416','1000417','1000418','1000419','1000420','1000421','1000422','1000423','1000424','1000425','1000426','1000427','1000428','1000429','1000430','1000431','1000432','1000433','1000434','1000435','1000436','1000437','1000438','1000439','1000440','1000441','1000442','1000502','1000503','1000504','1000505','1000506','1000507','1000508','1000509','1000510','1000520','1000521','1000522','1000523','1000524','1000525','1000526','1000527','1000528','1000529','1000530','1000531','1000532','1000533','1000534','1000535','1000536','1000537','1000538','1000539','1000540','1000541','1000542','1000543','1000544','1000545','1000546','1000547','1000548','1000549','1000550','1000551','1000552','1000553','1000554','1000555','1000556','1000557','1000558','1000559','1000560','1000561','1000562','1000577','1000578','1000579','1000580','1000581','1000582','1000583','1000584','1000585','1000586','1000587','1000588','1000589','1000590','1000591','1000592','1000593','1000594','1000595','1000596','1000597','1000598','1000599','1000600','1000601','1000602','1000603','1000604','1000605','1000606','1000607','1000608','1000609','1000610','1000611','1000612','1000613','1000614','1000615','1000637','1000638','1000639','1000640','1000641','1000642','1000643','1000644','1000645','1000648','1000649','1000650','1000651','1000652','1000653','1000654','1000655','1000671','1000672','1000673','1000674','1000675','1000676','1000679','1000680','1000681','1000682','1000683','1000684','1000685','1000686','1000690','1000691','1000692','1000693','1000694','1000695','1000696','1000697','1000703','1000704','1000705','1000706','1000707','1000708','1000709','1000710','1000711','1000719','1000720','1000721','1000722','1000723','1000724','1000725','1000726','1000727','1000728','1000729','1000730','1000731','1000732','1000733','1000734','1000735','1000736','1000759','1000760','1000761','1000779','1000780','1000781','1000819','1000820','1000821','1000822','1000823','1000824','1000825','1000826','1000836','1000837','1000838','1000839','1000840','1000841','1000842','1000843','1000844','1000845','1000846','1000847','1000848','1000849','1000850','1000851','1000852','1000853','1000854','1000855','1000856','1000865','1000880','1000881','1000882','1000883','1000884','1000885','1000886','1000887','1000896','1000897','1000898','1000907','1000908','1000909','1000910','1000911','1000912','1000913','1000914','1000915','1000916','1000917','1000918','1000919','1000920','1000929','1000930','1000931','1000932','1000933','1000934','1000935','1000936','1000937','1000938','1000939','1000940','1000941','1000942','1000943','1000944','1000948','1000949','1000950','1000951','1000952','1000953','1000954','1000955','1000956','1000957','1000958','1000959','1000960','1000961','1000962','1000963','1000970','1000971','1000972','1000973','1000974','1000975','1000976','1000977','1000986','1000987','1000988','1000989','1000990','1000991','1000992','1000993','1000994','1000995','1000996','1000997','1000998','1000999','1001000','1001001','1001002','1001003','1001004','1001005','1001006','1001007','1001060','1001073','1001074','1001075','1001076','1001077','1001078','1001087','1001096','1000003','1000007','1000008','1000009','1000016','1000017','1000018','1000028','1000029','1000030','1000031','1000032','1000033','1000034','1000035','1000036','1000037','1000038','1000039','1000040','1000041','1000042','1000043','1000044','1000049','1000050','1000051','1000052','1000053','1000054','1000063','1000064','1000065','1000080','1000081','1000082','1000083','1000084','1000085','1000086','1000087','1000102','1000103','1000104','1000114','1000115','1000116','1000117','1000118','1000119','1000120','1000121','1000122','1000123','1000124','1000125','1000126','1000127','1000128','1000129','1000130','1000139','1000140','1000141','1000142','1000143','1000144','1000145','1000146','1000147','1000148','1000166','1000167','1000168','1000171','1000172','1000173','1000174','1000175','1000176','1000177','1000178','1000179','1000180','1000181','1000182','1000183','1000184','1000191','1000192','1000193','1000194','1000195','1000196','1000197','1000198','1000199','1000200','1000201','1000202','1000203','1000204','1000205','1000206','1000234','1000235','1000236','1000237','1000238','1000239','1000240','1000241','1000242','1000248','1000249','1000250','1000251','1000252','1000253','1000254','1000255','1000257','1000259','1000261','1000263','1000264','1000265','1000266','1000267','1000268','1000269','1000270','1000271','1000272','1000273','1000296','1000298','1000300','1000302','1000304','1000306','1000307','1000308','1000309','1000310','1000311','1000312','1000313','1000314','1000315','1000326','1000327','1000328','1000329','1000330','1000331','1000332','1000333','1000334','1000335','1000342','1000344','1000346','1000348','1000350','1000361','1000362','1000363','1000364','1000365','1000371','1000372','1000373','1000374','1000375','1000386','1000387','1000388','1000389','1000390','1000391','1000392','1000393','1000394','1000395','1000396','1000397','1000398','1000399','1000400','1000401','1000402','1000403','1000404','1000405','1000406','1000407','1000408','1000409','1000410','1000411','1000412','1000413','1000414','1000443','1000444','1000445','1000446','1000447','1000448','1000449','1000450','1000451','1000452','1000453','1000454','1000455','1000456','1000457','1000458','1000459','1000460','1000461','1000462','1000463','1000464','1000465','1000466','1000467','1000468','1000469','1000470','1000471','1000472','1000473','1000474','1000475','1000476','1000477','1000478','1000479','1000480','1000481','1000482','1000483','1000484','1000485','1000486','1000487','1000488','1000489','1000490','1000491','1000492','1000493','1000494','1000495','1000496','1000497','1000498','1000499','1000500','1000501','1000511','1000512','1000513','1000514','1000515','1000516','1000517','1000518','1000519','1000563','1000564','1000565','1000566','1000567','1000568','1000569','1000570','1000571','1000572','1000573','1000574','1000575','1000576','1000616','1000617','1000618','1000619','1000620','1000621','1000622','1000623','1000624','1000625','1000626','1000627','1000628','1000629','1000630','1000631','1000632','1000633','1000634','1000635','1000636','1000646','1000647','1000656','1000657','1000658','1000659','1000660','1000661','1000662','1000663','1000664','1000665','1000666','1000667','1000668','1000669','1000670','1000677','1000678','1000687','1000688','1000689','1000698','1000699','1000700','1000701','1000702','1000712','1000713','1000714','1000715','1000716','1000717','1000718','1000737','1000738','1000739','1000740','1000741','1000742','1000743','1000744','1000745','1000746','1000747','1000748','1000749','1000750','1000751','1000752','1000753','1000754','1000755','1000756','1000757','1000758','1000762','1000763','1000764','1000765','1000766','1000767','1000768','1000769','1000770','1000771','1000772','1000773','1000774','1000775','1000776','1000777','1000778','1000782','1000783','1000784','1000785','1000786','1000787','1000788','1000789','1000790','1000791','1000792','1000793','1000794','1000795','1000796','1000797','1000798','1000799','1000800','1000801','1000802','1000803','1000804','1000805','1000806','1000807','1000808','1000809','1000810','1000811','1000812','1000813','1000814','1000815','1000816','1000817','1000818','1000827','1000828','1000829','1000830','1000831','1000832','1000833','1000834','1000835','1000857','1000858','1000859','1000860','1000861','1000862','1000863','1000864','1000866','1000867','1000868','1000869','1000870','1000871','1000872','1000873','1000874','1000875','1000876','1000877','1000878','1000879','1000888','1000889','1000890','1000891','1000892','1000893','1000894','1000895','1000899','1000900','1000901','1000902','1000903','1000904','1000905','1000906','1000921','1000922','1000923','1000924','1000925','1000926','1000927','1000928','1000945','1000946','1000947','1000964','1000965','1000966','1000967','1000968','1000969','1000978','1000979','1000980','1000981','1000982','1000983','1000984','1000985','1001008','1001009','1001010','1001011','1001012','1001013','1001014','1001015','1001016','1001017','1001018','1001019','1001020','1001021','1001022','1001023','1001024','1001025','1001026','1001027','1001028','1001029','1001030','1001031','1001032','1001033','1001034','1001035','1001036','1001037','1001038','1001039','1001040','1001041','1001042','1001043','1001044','1001045','1001046','1001047','1001048','1001049','1001050','1001051','1001052','1001053','1001054','1001055','1001056','1001057','1001058','1001059','1001061','1001062','1001063','1001064','1001065','1001066','1001067','1001068','1001069','1001070','1001071','1001072','1001079','1001080','1001081','1001082','1001083','1001084','1001085','1001086','1001088','1001089','1001090','1001091','1001092','1001093','1001094','1001095');

/* Comparison of the results between a sub query in the WHERE cluase and table JOIN */
SELECT COUNT(A.ORDER_NO) AS 주문횟수
FROM SALES AS A
	INNER JOIN  CUSTOMER AS B
		ON A.MEM_NO = B.MEM_NO
WHERE YEAR(B.JOIN_DATE) = 2019;
 
 
/***************Sub Query + JOIN***************/
/* Create a temporary table */
CREATE TEMPORARY TABLE SALES_SUB_QUERY
SELECT A.구매횟수, B.*
FROM (
		SELECT  MEM_NO, COUNT(ORDER_NO) AS 구매횟수
        FROM  SALES
		GROUP BY MEM_NO
		) AS A
	INNER JOIN CUSTOMER AS B
	ON A.MEM_NO = B.MEM_NO;

/* Query the temporary table */
SELECT * FROM SALES_SUB_QUERY;

/* Filter by GENDER = 'MAN' */
SELECT *
FROM SALES_SUB_QUERY
WHERE GENDER = 'MAN';


/* Aggregate by ADDR */
SELECT ADDR, SUM(구매횟수) AS 구매횟수
FROM SALES_SUB_QUERY
WHERE GENDER = 'MAN'
GROUP BY  ADDR;


/* Filter by the number of order less than 100 */
SELECT ADDR, SUM(구매횟수) AS 구매횟수
FROM SALES_SUB_QUERY
WHERE GENDER = 'MAN'
GROUP BY ADDR
HAVING SUM(구매횟수) < 100;


/* QUery all columns */
/* in ascending order of the number of order */
SELECT ADDR, SUM(구매횟수) AS 구매횟수
FROM SALES_SUB_QUERY
WHERE GENDER = 'MAN'
GROUP BY ADDR
HAVING SUM(구매횟수) < 100
ORDER BY SUM(구매횟수) ASC; 
 
 
/***************A sub query in the FROM clause***************/
SELECT A.구매횟수, B.*
FROM (
		SELECT MEM_NO, COUNT(ORDER_NO) AS 구매횟수
		FROM SALES
		GROUP BY MEM_NO
		) AS A
	INNER JOIN CUSTOMER AS B
		ON A.MEM_NO = B.MEM_NO;







    