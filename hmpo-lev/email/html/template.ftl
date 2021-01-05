<#macro htmlEmailLayout>
<html>
  <head>
  <style type="text/css">
    body {
      color: #000;
      font-family: "HelveticaNeue", "Helvetica Neue", "Arial", "Helvetica", sans-serif;
      background: #FFFFFF;
    }

    #banner {
        width: 100%;
        background: #000000;
        padding: 15px;
        font-size: 24px;
        color: #FFFFFF;
        font-weight: bold;
    }

    p, li, a {
      font-size: 19px;
    }

  </style>
  </head>
  <body>
    <div id="banner">Life Event Verification</div>

    <p>Dear <#if user.firstName?? && user.lastName??>${user.firstName + " " + user.lastName}<#else>${"user"}</#if>,</p>

    <#nested "text">

  </body>
</html>
</#macro>