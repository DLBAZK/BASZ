{*******************************************************}
{                                                       }
{       ������ҳ�ʿ��м�ҵ����                          }
{                                                       }
{       ��Ȩ���� (C) 2016 �人�������ҽ�����ݷ���      }
{                                                       }
{*******************************************************}

unit UVsBaSyZk;

interface
uses
   SysUtils,Classes,UVsMidStand,DB,DBClient;

  type
    TVsBaSyZk=class(TVsMidStand)
    Public
      Constructor Create;Override;
    end;



implementation

{ TVsBaSyZk }

constructor TVsBaSyZk.Create;
begin
  inherited;
  SelectSql := '';
end;

initialization
  Classes.RegisterClass(TVsBaSyZk);
finalization
  classes.UnRegisterClass(TVsBaSyZk);

end.
