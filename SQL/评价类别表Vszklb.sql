if not exists (select 1 from sysobjects where id = object_id('Vszklb') and type = 'U')
Begin
create table Vszklb(
  dm varchar(4) not null primary key(dm),  --�ʿ�������
  dmmc varchar(100),  --�ʿ��������
  isChoice INT, --�Ƿ�ѡ��ȫ������
  isTy int  --ͣ�ñ�־
)
End
go 