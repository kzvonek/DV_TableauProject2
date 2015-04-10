dfRANKREVENUE <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT COMPANY, INDUSTRY, REVENUE, rank() 
OVER (PARTITION BY INDUSTRY order by REVENUE desc) as INDUSTRY_RANK 
FROM TOPCOMPANIESNEW order by 2,3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_eaj628', PASS='orcl_eaj628', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

dfMAX <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select  COMPANY, STATE, GROWTH, last_value(max_GROWTH) 
OVER (PARTITION BY STATE order by GROWTH) max_GROWTH, last_value(max_GROWTH) 
OVER (PARTITION BY STATE order by GROWTH) - GROWTH GROWTH_diff
from
(SELECT COMPANY, INDUSTRY, GROWTH, max(GROWTH)
OVER (PARTITION BY INDUSTRY) max_GROWTH 
FROM TOPCOMPANIESNEW) 
order by 2,3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_eaj628', PASS='orcl_eaj628', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

dfnth <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT COMPANY, INDUSTRY, GROWTH, nth_value(GROWTH, 2)
OVER (PARTITION BY INDUSTRY) SECOND_GROWTH
FROM TOPCOMPANIESNEW
order by 2,3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='C##cs329e_eaj628', PASS='orcl_eaj628', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

dfcume_dist <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT COMPANY, STATE, REVENUE, cume_dist() 
OVER (PARTITION BY STATE order by REVENUE) cume_dist
from TOPCOMPANIESNEW 
order by 2,3 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='C##cs329e_eaj628', PASS='orcl_eaj628', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)
