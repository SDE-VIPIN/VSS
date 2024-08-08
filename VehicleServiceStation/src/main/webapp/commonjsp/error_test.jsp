<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        #login-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .heading-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc; /* Divider between headings */
        }

        .heading-container .heading {
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s, text-decoration 0.3s;
            padding-bottom: 5px;
        }

        .heading-container .heading:focus {
            outline: none;
            color: #007bff; /* Change to your desired focus color */
        }

        .heading-container .heading:not(:last-child) {
            margin-right: 10px; /* Spacing between headings */
        }

        .input-group {
            display: none;
            text-align: left;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            border-radius: 5px;
            box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(0.95);
            box-shadow: 0px 5px 9px rgba(0, 0, 0, 0.9);
        }
        
        .heading-container .heading.active {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<% String name = null; %>
<%int len = name.length(); %>
<%=len %>)

</body>
</html>
