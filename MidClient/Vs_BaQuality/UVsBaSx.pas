{*******************************************************}
{                                                       }
{       ����ɸѡ�м�ҵ����                              }
{                                                       }
{       ��Ȩ���� (C) 2016 �人�������ҽ�����ݷ���      }
{                                                       }
{*******************************************************}

 unit UVsBaSx;

interface
    uses
   SysUtils,Classes,UVsMidStand,DB,DBClient;
   type
     TVsBaSx=class(TVsMidStand)
     public
       constructor Create;Override;
     end;
   { TVsBaSx }



implementation
 constructor TVsBaSx.Create;
begin
  inherited;
  SelectSql := '';
end;


initialization
  Classes.RegisterClass(TVsBaSx);
finalization
  Classes.UnRegisterClass(TVsBaSx);

end.
