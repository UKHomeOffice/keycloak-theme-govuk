<html>
<head>
<style type="text/css">
	body {
		color: #000;
		font-family: "HelveticaNeue", "Helvetica Neue", "Arial", "Helvetica", sans-serif;
	}

	td {
		line-height: 1.2;
	}

	.button {
		border-bottom: solid 2px #003618;
	}

	.button a {
		text-decoration: none;
	}
</style>
</head>
<body text="#000000" bgcolor="#FFFFFF">
<table width="100%" bgcolor="#000000" cellspacing="0" cellpadding="15"><tr><td>
<font style="font-size:24px;" size="5" color="#FFFFFF"><b>
${realmName}
</b></font>
</td></tr></table>

${msg("passwordResetBodyHtml",link, linkExpiration, realmName)}

<table class="button" bgcolor="#00823B" cellspacing="0" cellpadding="10"><tr><td>
<a href="${link}"><font color="#FFFFFF">Reset your password</font></a>
</td></tr></table>
</body>
</html>