﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRCodeResponse.aspx.cs"
    Inherits="USPDHUB.QRCodeResponse" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <script src="../../Scripts/flyers/jquery-1.7.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        var appurl = "";
        var appstore = "";

        window.onload = function () {
            var pid = 0;
            var VerticalCode = "";

            //http://uspdhub.com/QRCodeResponse.aspx?ProfileID=10319&Type=QRCode&VerticalCode=1
            //alert(pid);
            //appurl = "USPDhub://?ProfileID=" + pid + "&VerticalCode=" + VerticalCode + "&Type=QRCode";

            appurl = document.getElementById("<%=hdnAppUrl.ClientID %>").value;
            //appurl = "USPDhub://?ms=testmess";

            RedirectToStore();
            //****
            startApp()
        }
        

        var timeout;
        function preventPopup() {

            clearTimeout(timeout);
            timeout = null;
            window.removeEventListener('pagehide', preventPopup);
        }
        function RedirectToStore() {
            var uagent = navigator.userAgent.toLowerCase();
            if (uagent.search("iphone") > -1) {
                appstore = '<%=StoreUrl %>';

            }
            else if (uagent.search("android") > -1) {
                appstore = '<%=StoreUrl %>';

            }
            else if (uagent.search("windows phone") > -1) {
                appstore = '<%=StoreUrl %>';
            }
            else {
                alert("You have opened the email on an invalid device. Please open it on any of your mobile phones.");
                return false;
            }
        }
        function startApp() {

            //appurl = "LogicTreeIT://";

            var uagent = navigator.userAgent.toLowerCase();

            if (uagent.search("android") > -1) {

                window.location.assign(appurl);

                setTimeout(function () {

                    if (confirm("This app is not installed on your device. You will now be redirected to the store where you can download and install the app. Proceed?")) {

                        document.location = appstore;
                        window.location = appstore;
                    }
                }, 1);
            }
            else {
                window.location = appurl;
                $('<iframe />')
                .attr('src', appurl)
                .attr('style', 'display:none;')
                .appendTo('body');

                window.addEventListener('pagehide', preventPopup);

                timeout = setTimeout(function () {
                    if (confirm("This app is not installed on your device. You will now be redirected to the store where you can download and install the app. Proceed?")) {

                        document.location = appstore;
                    }
                }, 1);

            }

        }

      
    </script>
    <style>
        @import url(http://fonts.googleapis.com/css?family=Roboto:400,300italic,300,100italic,100,500,500italic,700,400italic,700italic,900,900italic);
        body
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto' , sans-serif;
        }
        *, h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6, p, .p, header, nav, footer, section, artical, aside, video, audio, canvas, main
        {
            margin: 0;
            padding: 0;
        }
        header, nav, footer, section, artical, aside, video, audio, canvas, main
        {
            display: block;
        }
        .app-bg
        {
            background: #EDEDED;
        }
        .app-launch
        {
            padding: 20px;
        }
        .app-content
        {
            margin-bottom: 15px;
        }
        .app-content h1
        {
            font-size: 14px;
            font-weight: 400;
            color: #459511;
        }
        .app-content span
        {
            font-size: 16px;
            font-weight: 400;
            color: #666666;
        }
        .submit-text
        {
            margin: 10px 0px;
            font-size: 14px;
            display: block;
        }
        .submit-text span
        {
            font-weight: 500;
            color: #459511;
        }
        .app-launch button
        {
            background: none;
            border: none;
        }
        .app-launch .submit
        {
            background: #4f84d9;
            border-radius: 3px;
            padding: 10px 20px;
            color: #FFFFFF;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all .2s ease-in-out;
            text-decoration: none;
            margin-top: 10px;
        }
        .app-launch .submit:hover
        {
            background: #525252;
        }
        @media (max-width:640px)
        {
            .app-launch
            {
                width: 100%;
                padding: 15px;
                margin-top: 5px;
            }
        }
    </style>
</head>
<body class="app-bg">
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="hdnAppUrl" />
    <asp:HiddenField runat="server" ID="hdnRedirectUrl" />
    </form>
</body>
</html>
