<#macro htmlEmailLayout>
<html>
  <head>
  <style type="text/css">
    body {
      color: #000;
      font-family: "HelveticaNeue", "Helvetica Neue", "Arial", "Helvetica", sans-serif;
    }

    p, li, a {
      font-size: 19px;
    }

  </style>
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <table width="100%" bgcolor="#000000" cellspacing="0" cellpadding="15">
      <tr><td><font style="font-size:24px;" size="5" color="#FFFFFF"><b>Life Event Verification</b></font></td></tr>
    </table>

    <p>Dear <#if user.firstName?? && user.lastName??>${user.firstName + " " + user.lastName}<#else>${"user"}</#if>,</p>

    <#nested "text">

  </body>
</html>
</#macro>
