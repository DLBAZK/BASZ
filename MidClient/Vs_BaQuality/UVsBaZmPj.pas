{*******************************************************}
{                                                       }
{       ������ĩ�����м�ҵ����                          }
{                                                       }
{       ��Ȩ���� (C) 2016 �人�������ҽ�����ݷ���      }
{                                                       }
{*******************************************************}

unit UVsBaZmPj;

interface
   uses
   SysUtils,Classes,UVsMidStand,DB,DBClient;
   
  type
    TVsBaZmPj=class(TVsMidStand)
      Public
      Constructor Create;Override;
    end;
implementation

{ TVsBaZmPj }

constructor TVsBaZmPj.Create;
begin
  inherited;
  SelectSql :='';
end;

initialization
  Classes.RegisterClass(TVsBaZmPj);
finalization
  Classes.UnRegisterClass(TVsBaZmPj);

end.
