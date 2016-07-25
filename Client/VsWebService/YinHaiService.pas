// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://183.203.209.72:8088/webservice/services/YinHaiService?wsdl
//  >Import : http://183.203.209.72:8088/webservice/services/YinHaiService?wsdl:0
// Encoding : UTF-8
// Version  : 1.0
// (2016-07-21 17:22:14 - - $Rev: 10138 $)
// ************************************************************************ //

unit YinHaiService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://webservice.tyqwws.yinhai.com
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : YinHaiServiceHttpBinding
  // service   : YinHaiService
  // port      : YinHaiServiceHttpPort
  // URL       : http://183.203.209.72:8088/webservice/services/YinHaiService
  // ************************************************************************ //
  YinHaiServicePortType = interface(IInvokable)
  ['{247B683E-1E03-1D50-97B7-CED793D9841E}']
    function  callTransInfoService(const in0: WideString): WideString; stdcall;
    function  callService(const in0: WideString): WideString; stdcall;
  end;

function GetYinHaiServicePortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): YinHaiServicePortType;


implementation
  uses SysUtils;

function GetYinHaiServicePortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): YinHaiServicePortType;
const
  //http://172.18.2.8:8080/webservice/services/YinHaiService?wsdl  山西内网地址
  //http://183.203.209.72:8088/webservice/services/YinHaiService?wsdl 调试地址
  defWSDL = 'http://183.203.209.72:8088/webservice/services/YinHaiService?wsdl';
  defURL  = 'http://183.203.209.72:8088/webservice/services/YinHaiService';
//  defWSDL = 'http://172.18.2.8:8080/webservice/services/YinHaiService?wsdl';
//  defURL  = 'http://172.18.2.8:8080/webservice/services/YinHaiService';
  defSvc  = 'YinHaiService';
  defPrt  = 'YinHaiServiceHttpPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as YinHaiServicePortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(YinHaiServicePortType), 'http://webservice.tyqwws.yinhai.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(YinHaiServicePortType), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(YinHaiServicePortType), ioDocument);
  InvRegistry.RegisterExternalParamName(TypeInfo(YinHaiServicePortType), 'callTransInfoService', 'out_', 'out');
  InvRegistry.RegisterExternalParamName(TypeInfo(YinHaiServicePortType), 'callService', 'out_', 'out');

end.