{*******************************************************}
{                                                       }
{       ������ҳ�ʿ���ϸ��¼�м�ҵ����                      }
{                                                       }
{       ��Ȩ���� (C) 2016 �人�������ҽ�����ݷ���      }
{                                                       }
{*******************************************************}

unit UVsZkDetail;

interface
   uses
   SysUtils,Classes,UVsMidStand,DB,DBClient;

   type
     TVsZkDetail=class(TVsMidStand)
      Public
      Constructor Create;Override;
     end;
implementation

{ TVsZkDetail }

constructor TVsZkDetail.Create;
begin
  inherited;
  SelectSql := '';

end;

initialization
  Classes.RegisterClass(TVsZkDetail);
finalization
  Classes.UnRegisterClass(TVsZkDetail);
end.
