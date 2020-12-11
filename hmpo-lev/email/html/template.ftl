<#macro htmlEmailLayout>
<html>
  <head>
  <style type="text/css">
    body {
      color: #000;
      font-family: "HelveticaNeue", "Helvetica Neue", "Arial", "Helvetica", sans-serif;
    }

    p, td, li {
      font-size: 19px;
    }

    .verificationlink td {
      padding: 0;
      line-height: 1.2;
    }

    .verificationlink a {
      display: inline-block;
      padding: 10px 15px;
      text-decoration: none;
      background: #00823B;
      color: #FFFFFF;
    }

  </style>
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <#if realmName??>
    <table width="100%" bgcolor="#000000" cellspacing="0" cellpadding="15">
      <tr>
        <td>
          <font style="font-size:24px;" size="5" color="#FFFFFF"><b>
              Life Event Verification
            </b></font>
        </td>
      </tr>
    </table>
    </#if>

    <p>Hi ${user.firstName!user.username!"user"},</p>

    <#nested "text">

  </body>
</html>
</#macro>