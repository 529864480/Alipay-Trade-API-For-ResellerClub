<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
<%
' ���ܣ�֧����ҳ����תͬ��֪ͨҳ��
' �汾��3.3
' ���ڣ�2012-07-17
' ˵����
' ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
' �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���
	
' //////////////ҳ�湦��˵��//////////////
' ��ҳ����ڱ������Բ���
' �ɷ���HTML������ҳ��Ĵ��롢�̻�ҵ���߼��������
' ��ҳ�����ʹ��ASP�������ߵ��ԣ�Ҳ����ʹ��д�ı�����LogResult���е��ԣ��ú����ѱ�Ĭ�Ϲرգ���alipay_notify.asp�еĺ���VerifyReturn
' ���ýӿڵ�ע��������û����ô����ɾ������
'////////////////////////////////////////
%>

<!--#include file="class/alipay_notify.asp"-->

<%
'����ó�֪ͨ��֤���
Set objNotify = New AlipayNotify
sVerifyResult = objNotify.VerifyReturn()

If sVerifyResult Then	'��֤�ɹ�
	'*********************************************************************
	'������������̻���ҵ���߼��������
	
	'�������������ҵ���߼�����д�������´�������ο�������
    '��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�

	'�̻�������
	out_trade_no = Request.QueryString("out_trade_no")

	'֧�������׺�
	trade_no = Request.QueryString("trade_no")

	'����״̬
	trade_status = Request.QueryString("trade_status")

	
	If Request.QueryString("trade_status") = "WAIT_SELLER_SEND_GOODS" Then
	'�ж��Ƿ����̻���վ���Ѿ����������֪ͨ���صĴ���
		'���û��������������ôִ���̻���ҵ�����
		'�����������������ô��ִ���̻���ҵ�����
		Session("status")="P"
		Response.Redirect "postpayment.asp"
	ElseIf request.QueryString("trade_status") = "TRADE_FINISHED" Then
		'�жϸñʶ����Ƿ����̻���վ���Ѿ���������
			'���û���������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
			'�����������������ִ���̻���ҵ�����
			Session("status")="Y"
			Response.Redirect "postpayment.asp"
	Else
		Response.Write "trade_status="&Request.QueryString("trade_status")
	End If

	

	'�������������ҵ���߼�����д�������ϴ�������ο�������
	
	'*********************************************************************
else '��֤ʧ��
    '��Ҫ���ԣ��뿴alipay_notify.aspҳ���VerifyReturn�������ȶ�sign��mysign��ֵ�Ƿ���ȣ����߼��responseTxt��û�з���true
    response.Write "��֤ʧ��"
end if
%>
<title>֧������׼˫�ӿ�</title>
</head>
<body>
</body>
</html>