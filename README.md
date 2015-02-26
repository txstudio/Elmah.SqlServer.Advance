# Elmah.SqlServer.Advance
Elmah 錯誤紀錄資料庫擴充版本

此為修改 Elmah.SqlServer 提供的資料庫物件指令碼
https://www.nuget.org/packages/elmah.sqlserver/

只要依照 Elmah.Sqlserver 套件內容設定好應用程式
再使用此指令碼建立相關的資料庫物件就可以使用


[延伸項目]
儲存目標因月份的單數與雙數而目標資料表有所不同
可使用排程方式將在每個月份的第一天將前一個月份資料表內容進行 TRUNCATE

可將要 TRUNCATE 資料表匯出成文字檔作存查
將文字檔壓縮可以達到更好的節省空間效果

因資料庫為儲存紀錄用，可以考慮將資料庫復原模式修改為「簡單(SIMPLE)」
在儲存時就不會將紀錄寫入交易紀錄檔案 (*.ldf)
此復原模式(SIMPLE) 的資料庫將無法透過交易紀錄來還原特定時間的資料庫內容
