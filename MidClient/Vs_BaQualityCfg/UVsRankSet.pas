{*******************************************************}
{                                                       }
{       �����ʿصȼ������м�ҵ����                          }
{                                                       }
{       ��Ȩ���� (C) 2016 �人�������ҽ�����ݷ���      }
{                                                       }
{*******************************************************}

unit UVsRankSet;

interface
uses
   SysUtils,Classes,UVsMidStand,DB,DBClient;

  type
    TVsRankSet=class(TVsMidStand)
    Public
      Constructor Create;Override;
    end;



implementation

{ TVsBaSyZk }

constructor TVsRankSet.Create;
begin
  inherited;
  SelectSql := '';
end;

initialization
  Classes.RegisterClass(TVsRankSet);
finalization
  classes.UnRegisterClass(TVsRankSet);

end.
