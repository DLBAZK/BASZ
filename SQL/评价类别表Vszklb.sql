if not exists (select 1 from sysobjects where id = object_id('Vszklb') and type = 'U')
Begin
create table Vszklb(
  dm varchar(4) not null primary key(dm),  --质控类别代码
  dmmc varchar(100),  --质控类别名称
  isChoice INT, --是否选择全部病历
  isTy int  --停用标志
)
End
go 